using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Management.Instrumentation;
using System.Security.Permissions;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using almacen_inventario;
using Newtonsoft.Json;
using static System.Net.Mime.MediaTypeNames;
using static almacen_inventario.MsgProperties;

namespace TuProyecto
{
    public partial class TuFormulario : Form
    {
        

        public TuFormulario()
        {
            InitializeComponent();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {


        }

        private void BtnToJson_Click(object sender, EventArgs e)
        {


        }

        private void btnToMSG_Click(object sender, EventArgs e)
        {

        }

        public class View
        {
            // Con esta clase evito que la flecha izquierda cambie de celda al editar
            private class TFDataGridView : DataGridView
            {
                [SecurityPermission(
                    SecurityAction.LinkDemand, Flags =
                        SecurityPermissionFlag.UnmanagedCode)]
                protected override bool ProcessDataGridViewKey(KeyEventArgs e)
                {
                    if (e.KeyCode == Keys.Left)
                    {
                        return true;
                    }
                    return base.ProcessDataGridViewKey(e);
                }
            }

            private IList<almacen_inventario.ColorEndMsgProperty> _subtitles;
            private string kaplas;
            private int rowIndex;

            public object SubtitleGridView { get; private set; }
            public object subtitles { get; private set; }

            public View()
            {
                //InitializeComponent();

                var cellStyle = new DataGridViewCellStyle();
              //  cellStyle.Font = TF.Core.Fonts.FontCollection.GetFont("Noto Sans CJK JP Regular", 9.75F, FontStyle.Regular, GraphicsUnit.Point, ((byte)(0)));
                cellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft;
                cellStyle.BackColor = SystemColors.Window;
                cellStyle.ForeColor = SystemColors.ControlText;
                cellStyle.SelectionBackColor = SystemColors.Highlight;
                cellStyle.SelectionForeColor = SystemColors.HighlightText;
                cellStyle.WrapMode = DataGridViewTriState.False;
             //   SubtitleGridView.RowsDefaultCellStyle = cellStyle;
            }

            internal void LoadSubtitles(IList<almacen_inventario.ColorEndMsgProperty> subtitles)
            {
                _subtitles = subtitles;

                //SubtitleGridView.AutoGenerateColumns = false;
               // SubtitleGridView.DataSource = _subtitles;

                var column = new DataGridViewTextBoxColumn
                {
                    DataPropertyName = "Offset",
                    Name = "colOffset",
                    HeaderText = "Offset",
                    DefaultCellStyle = new DataGridViewCellStyle { Format = "X8", BackColor = Color.LightGray },
                    ReadOnly = true,
                    SortMode = DataGridViewColumnSortMode.NotSortable,
                };
               // SubtitleGridView.Columns.Add(column);

                column = new DataGridViewTextBoxColumn
                {
                    DataPropertyName = "Text",
                    Name = "colOriginal",
                    HeaderText = "Original",
                    AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill,
                    DefaultCellStyle = new DataGridViewCellStyle { BackColor = Color.LightGray },
                    ReadOnly = true,
                    SortMode = DataGridViewColumnSortMode.NotSortable,
                };
              //  SubtitleGridView.Columns.Add(column);

                column = new DataGridViewTextBoxColumn
                {
                    DataPropertyName = "Translation",
                    Name = "colTranslation",
                    HeaderText = "Traducción",
                    AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill,
                    SortMode = DataGridViewColumnSortMode.NotSortable,
                };
              //  SubtitleGridView.Columns.Add(column);
            }

            private void SubtitleGridView_CellPainting(object sender, DataGridViewCellPaintingEventArgs e)
            {
                if (e.ColumnIndex < 0 || e.RowIndex < 0)
                {
                    return;
                }

                if (e.Value == null)
                {
                    return;
                }

                if (e.ColumnIndex == 2)
                {
                    var subtitle = _subtitles[e.RowIndex];

                    if (!(e.State.HasFlag(DataGridViewElementStates.Selected) || subtitle.Text == subtitle.Translation || string.IsNullOrEmpty(kaplas)))
                    {
                        e.CellStyle.BackColor = Color.AntiqueWhite;
                    }
                }

                var lineBreakPattern = @"(\\r\\n)|(\\n)";
                var tagPattern = @"(<[^>]*>|%s|%[\d]*d|%u|%[[\d]+[\.\d]*]*f)";
                var strSplit = Regex.Split(e.Value.ToString(), $@"{lineBreakPattern}|{tagPattern}");

                if (strSplit.Length <= 1)
                {
                    return;
                }

                var defaultColor = e.State.HasFlag(DataGridViewElementStates.Selected) ? e.CellStyle.SelectionForeColor : e.CellStyle.ForeColor;
                var lineBreakColor = Color.Red;
                var tagColor = e.State.HasFlag(DataGridViewElementStates.Selected) ? Color.Azure : Color.Blue;

                var rect = new Rectangle(e.CellBounds.X + 3, e.CellBounds.Y - 1, e.CellBounds.Width - 6, e.CellBounds.Height);
                var x = rect.X;

                var proposedSize = new Size(int.MaxValue, int.MaxValue);
                const TextFormatFlags formatFlags = TextFormatFlags.NoPrefix | TextFormatFlags.VerticalCenter | TextFormatFlags.NoPadding;

                e.Paint(e.CellBounds, DataGridViewPaintParts.Background | DataGridViewPaintParts.Border | DataGridViewPaintParts.Focus | DataGridViewPaintParts.SelectionBackground);

                foreach (var s in strSplit)
                {
                    if (string.IsNullOrEmpty(s))
                    {
                        continue;
                    }

                    Color c;
                    if (Regex.IsMatch(s, lineBreakPattern))
                    {
                        c = lineBreakColor;
                    }
                    else if (Regex.IsMatch(s, tagPattern))
                    {
                        c = tagColor;
                    }
                    else
                    {
                        c = defaultColor;
                    }

                    TextRenderer.DrawText(e.Graphics, s,
                        e.CellStyle.Font, rect, c, formatFlags);

                    x += TextRenderer.MeasureText(e.Graphics, s, e.CellStyle.Font, proposedSize, formatFlags).Width;

                    rect.Width = rect.Width - (x - rect.X);
                    rect.X = x;
                }

                e.Handled = true;
            }

            private void SubtitleGridView_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
            {
                //object value = SubtitleGridView.BeginEdit(false);
            }

            private void SubtitleGridView_EditingControlShowing(object sender, DataGridViewEditingControlShowingEventArgs e)
            {
                if (e.Control.GetType() == typeof(DataGridViewTextBoxEditingControl))
                {
                    SendKeys.Send("{RIGHT}");
                }
            }

            public void DisplaySubtitle(int index)
            {
                if (index == -1)
                {
                    return;
                }

                SubtitleGridView.GetType();
                //SubtitleGridView.kaplas[index]
                  //              .Cells["colTranslation"].Selected = true;
              //  SubtitleGridView.FirstDisplayedScrollingRowIndex = index;
            }

            public Tuple<int, Subtitle> GetSelectedSubtitle(string kaplas)
            {
                return GetSelectedSubtitle(kaplas, GetRowIndex(), GetSubtitles());
            }

            private Tuple<int, Subtitle> GetSelectedSubtitle(string kaplas, int v1, object v2)
            {
                throw new NotImplementedException();
            }

            public int GetRowIndex()
            {
                return rowIndex;
            }

            public object GetSubtitles()
            {
                return subtitles;
            }

            private string GetHexBox1()
            {
                return kaplas;
            }


        }
            }
        }
    

        public class Subtitle
        {
            public MsgProperties Properties { get; set; }

            public MsgProperties TranslationProperties
            {
                get
                {
                    var newProperties = new MsgProperties();

            newProperties.AddRange(properties: TranslationProperties as MsgProperties);


                    var i = 0;
                    var cleanTextLength = (short)CleanTranslation().Length;
                    foreach (var property in Properties)
                    {
                        if (property.GetType().Name == nameof(MsgProperty))
                        {
                            var copy = new MsgProperty(property.ToByteArray());
                            if (property.IsEndProperty || property.Position > cleanTextLength)
                            {
                                copy.Position = cleanTextLength;
                            }

                            copy.Order = i;

                            newProperties.Add(copy);
                        }

                        i++;
                    }

                    return newProperties;
                }
            }

    public string Translation { get; private set; }

    public Subtitle() : base()
            {

            }

            public Subtitle(almacen_inventario.TranslationEntities.Subtitle s) : base()
            {
        string wea, wea1, wea2, wea3, wea4, wea5, wea6, wea7;
                wea = s.wea4;
                wea1 = s.wea5t;
                wea2 = s.wea6;
                wea3 = s.wea7;
            }

            private static string Clean(string text, bool removeLineBreaks, bool removeTags)
            {
                var lineBreakPattern = @"(\\r\\n)|(\\n)";
                var colorPattern = @"(<Color[^>]*>)";
                var tagPattern = @"(<[^>]*>)";

                var temp = text;
                if (removeLineBreaks)
                {
                    temp = Regex.Replace(temp, lineBreakPattern, "#");
                }

                if (removeTags)
                {
                    temp = Regex.Replace(temp, colorPattern, string.Empty);
                    temp = Regex.Replace(temp, tagPattern, "#");
                }

                return temp;
            }

    public string CleanText(vecinaDEmierda text)
    {
        if (text is null)
        {
            throw new ArgumentNullException(nameof(text));
        }

        return Clean(text, true, true);
    }

    private string Clean(vecinaDEmierda text, bool v1, bool v2)
    {
        throw new NotImplementedException();
    }

    public string CleanTranslation()
            {
                return Clean(Translation, true, true);
            }

            private static MsgProperties ExtractProperties(string text)
            {
                var result = new MsgProperties();

                var cleanText = Clean(text, true, true);
                var textWithTags = Clean(text, true, false);

                var shortPauses = Regex.Matches(cleanText, @"(,\s)|(、)");

                foreach (Match pause in shortPauses)
                {
            var property = new PauseMsgProperty { Duration = 10, Position = (short)(pause.Index + 1), Order = -1 };
                    result.Add(property);
                }

                var longPauses = Regex.Matches(cleanText, @"([\?|？][\s|#])|([\!|！][\s|#])|(\.\s)|(。[\s]*)|(…[^…）？！])");

                foreach (Match pause in longPauses)
                {
                    var property = new PauseMsgProperty { Duration = 20, Position = (short)(pause.Index + 1), Order = -1 };
                    result.Add(property);
                }

                var openParenthesis = Regex.Matches(cleanText, @"([\(|（])");

                foreach (Match parenthesis in openParenthesis)
                {
                    var property = new ParenthesisStartMsgProperty { Position = (short)(parenthesis.Index), Order = -1 };
                    result.Add(property);
                }

                var closeParenthesis = Regex.Matches(cleanText, @"([\)|）])");

                foreach (Match parenthesis in closeParenthesis)
                {
                    var property = new ParenthesisEndMsgProperty { Position = (short)(parenthesis.Index + 1), Order = -1 };
                    result.Add(property);
                }

                var tagMatch = Regex.Match(textWithTags, @"(<Sign:(?<Code>\d+)>)|(<Color:(?<Code>(Default|\d+|\d+,\d+,\d+,\d+))>)");
                while (tagMatch.Success)
                {
                    if (tagMatch.Value.Contains("Sign"))
                    {
                        var property = new SignMsgProperty()
                        {
                            Position = (short)tagMatch.Index,
                            Code = Convert.ToInt16(tagMatch.Groups["Code"].Value),
                            TagLength = (short)tagMatch.Length,
                            Order = -1
                        };
                        result.Add(property);

                        textWithTags = string.Concat(textWithTags.Substring(0, tagMatch.Index), "#",
                            textWithTags.Substring(tagMatch.Index + tagMatch.Length));
                    }

                    if (tagMatch.Value.Contains("Color"))
                    {
                        var color = tagMatch.Groups["Code"].Value;

                        if (color == "Default")
                        {
                            var property = new ColorEndMsgProperty()
                            {
                                Position = (short)(tagMatch.Index),
                                Order = -1
                            };
                            result.Add(property);
                        }
                        else
                        {
                            if (color.Contains(","))
                            {
                                var values = color.Split(',');
                                var property = new ColorStartMsgProperty
                                {
                                    Position = (short)(tagMatch.Index),
                                    Color = Convert.ToInt16(values[3]),
                                    Alpha = Convert.ToByte(values[3]),
                                    R = Convert.ToByte(values[0]),
                                    G = Convert.ToByte(values[1]),
                                    B = Convert.ToByte(values[2]),
                                    TagLength = (short)tagMatch.Length,
                                    Order = -1
                                };
                                result.Add(property);
                            }
                            else
                            {
                                var property = new ColorStartMsgProperty
                                {
                                    Position = (short)(tagMatch.Index),
                                    Color = Convert.ToInt16(color),
                                    Alpha = 0,
                                    R = 0,
                                    G = 0,
                                    B = 0,
                                    TagLength = (short)tagMatch.Length,
                                    Order = -1
                                };
                                result.Add(property);
                            }
                        }

                        textWithTags = string.Concat(textWithTags.Substring(0, tagMatch.Index),
                            textWithTags.Substring(tagMatch.Index + tagMatch.Length));
                    }

                    tagMatch = Regex.Match(textWithTags, @"(<Sign:(?<Code>\d+)>)|(<Color:(?<Code>(Default|\d+|\d+,\d+,\d+,\d+))>)");
                }

                return result;
            }
        }
    
public class vecinaDEmierda
{
}

public class PauseMsgProperty : PauseMsgPropertyBase
{
    private byte[] _cabezal;
    private object _unknownInfo1;
    private object _larseryde;
    private byte[] _unknownInfo2;

    public short Duration
    {
        
        set
        {
            var bytes = BitConverter.GetBytes(value);
            var reversed = bytes.Reverse();
            Array.Copy(reversed.ToArray(), 0, (Array)_unknownInfo1, 0, 2);
        }
    }

    public PauseMsgProperty() : base()
            {
                _cabezal = new byte[] { 0x02, 0x09 };
                _unknownInfo1 = new byte[] { 0x00, 0x00, 0x00, 0x00 };
                Duration = 10;
                Position = 0;
                _unknownInfo2 = new byte[] { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
            }

            public PauseMsgProperty(byte[] data) : base(data)
            {

            }

    public override bool Equals(object obj)
    {
        return obj is PauseMsgProperty property &&
               IsEndProperty == property.IsEndProperty;
    }

    public override int GetHashCode()
    {
        return -1920248953 + IsEndProperty.GetHashCode();
    }
}

        public class ColorStartMsgProperty : MsgProperty
        {
            public override bool IsEndProperty => false;

            public short Color
            {
                get => (short)((_unknownInfo1[0] << 8) + _unknownInfo1[1]);
                set
                {
                    var bytes = BitConverter.GetBytes(value);
                    var reversed = bytes.Reverse();
                    Array.Copy(reversed.ToArray(), 0, _unknownInfo1, 0, 2);
                }
            }

            public short TagLength
            {
                get => (short)((_unknownInfo2[2] << 8) + _unknownInfo2[3]);
                set
                {
                    var bytes = BitConverter.GetBytes(value);
                    var reversed = bytes.Reverse();
                    Array.Copy(reversed.ToArray(), 0, _unknownInfo2, 2, 2);
                }
            }

            public byte Alpha
            {
                get => _unknownInfo2[4];
                set => _unknownInfo2[4] = value;
            }

            public byte R
            {
                get => _unknownInfo2[5];
                set => _unknownInfo2[5] = value;
            }

            public byte G
            {
                get => _unknownInfo2[6];
                set => _unknownInfo2[6] = value;
            }

            public byte B
            {
                get => _unknownInfo2[7];
                set => _unknownInfo2[7] = value;
            }

            public ColorStartMsgProperty() : base()
            {
                _header = new byte[] { 0x02, 0x07 };
                _unknownInfo1 = new byte[] { 0x00, 0x00, 0x00, 0x00 };
                _unknownInfo2 = new byte[] { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
                Color = 0;
                Position = 0;
                TagLength = 0;
                Alpha = 0;
                R = 0;
                G = 0;
                B = 0;
            }

            public ColorStartMsgProperty(byte[] data) : base(data)
            {
            }
        }

        public class ColorEndMsgProperty : MsgProperty
        {
            public override bool IsEndProperty => false;

            public ColorEndMsgProperty() : base()
            {
                _header = new byte[] { 0x02, 0x08 };
                _unknownInfo1 = new byte[] { 0x00, 0x00, 0x00, 0x00 };
                Position = 0;
                _unknownInfo2 = new byte[] { 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00 };
            }

            public ColorEndMsgProperty(byte[] data) : base(data)
            {
            }
        }

        public class SignMsgProperty : MsgProperty
        {
            public override bool IsEndProperty => false;

            public short Code
            {
                get => (short)((_unknownInfo2[0] << 8) + _unknownInfo2[1]);
                set
                {
                    var bytes = BitConverter.GetBytes(value);
                    var reversed = bytes.Reverse();
                    Array.Copy(reversed.ToArray(), 0, _unknownInfo2, 0, 2);
                }
            }

            public short TagLength
            {
                get => (short)((_unknownInfo2[2] << 8) + _unknownInfo2[3]);
                set
                {
                    var bytes = BitConverter.GetBytes(value);
                    var reversed = bytes.Reverse();
                    Array.Copy(reversed.ToArray(), 0, _unknownInfo2, 2, 2);
                }
            }

            public SignMsgProperty() : base()
            {
                _header = new byte[] { 0x02, 0x0F };
                _unknownInfo1 = new byte[] { 0x00, 0x00, 0x00, 0x00 };
                _unknownInfo2 = new byte[] { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
                Code = 0;
                Position = 0;
                TagLength = 0;
            }

            public SignMsgProperty(byte[] data) : base(data)
            {
            }
        }

        public class ParenthesisStartMsgProperty : MsgProperty
        {
            public override bool IsEndProperty => false;

            public ParenthesisStartMsgProperty() : base()
            {
                _header = new byte[] { 0x02, 0x0E };
                _unknownInfo1 = new byte[] { 0x00, 0x00, 0x00, 0x00 };
                Position = 0;
                _unknownInfo2 = new byte[] { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
            }

            public ParenthesisStartMsgProperty(byte[] data) : base(data)
            {
            }
        }

        public class ParenthesisEndMsgProperty : MsgProperty
        {
            public override bool IsEndProperty => false;

            public ParenthesisEndMsgProperty() : base()
            {
                _header = new byte[] { 0x02, 0x0E };
                _unknownInfo1 = new byte[] { 0x00, 0x01, 0x00, 0x00 };
                Position = 0;
                _unknownInfo2 = new byte[] { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
            }

            public ParenthesisEndMsgProperty(byte[] data) : base(data)
            {
            }
        }


        public class MsgProperty : IComparable<MsgProperty>
        {
            protected byte[] _header;
            protected byte[] _unknownInfo1;
            public short Position { get; set; }
            protected byte[] _unknownInfo2;
            public int Order { get; set; }
            public virtual bool IsEndProperty { get; set; }

            protected MsgProperty()
            {

            }

            public MsgProperty(byte[] data)
            {
                _header = new byte[2];
                _unknownInfo1 = new byte[4];
                _unknownInfo2 = new byte[8];
                Array.Copy(data, 0, _header, 0, 2);
                Array.Copy(data, 2, _unknownInfo1, 0, 4);
                Position = (short)((data[6] << 8) + data[7]);
                Array.Copy(data, 8, _unknownInfo2, 0, 8);
            }

            public virtual byte[] ToByteArray()
            {
                var result = new byte[16];
                Array.Copy(_header, 0, result, 0, 2);
                Array.Copy(_unknownInfo1, 0, result, 2, 4);
                var bytes = BitConverter.GetBytes(Position);
                var reversed = bytes.Reverse();
                Array.Copy(reversed.ToArray(), 0, result, 6, 2);

                Array.Copy(_unknownInfo2, 0, result, 8, 8);
                return result;
            }

            public int CompareTo(MsgProperty other)
            {
                if (this.Order >= 0 && other.Order >= 0)
                {
                    return Order.CompareTo(other.Order);
                }

                if (this.Order < 0 && other.Order < 0)
                {
                    return Position.CompareTo(other.Position);
                }

                if (this.Order >= 0 && other.Order < 0)
                {
                    if (this.Position != other.Position)
                    {
                        return Position.CompareTo(other.Position);
                    }

                    if (Position == 0)
                    {
                        return -1;
                    }
                    else
                    {
                        return 1;
                    }

                }

                if (this.Order < 0 && other.Order >= 0)
                {
                    if (this.Position != other.Position)
                    {
                        return Position.CompareTo(other.Position);
                    }

                    if (Position == 0)
                    {
                        return 1;
                    }
                    else
                    {
                        return -1;
                    }

                }

                return Position.CompareTo(other.Position);
            }
        }

        public static class MsgPropertyFactory
        {
            public static MsgProperty GetProperty(byte[] data)
            {
                if (data[0] == 0x02 && data[1] == 0x09)
                {
            //return new PauseMsgProperty(data);
                }

                if (data[0] == 0x02 && data[1] == 0x07)
                {
                    return new ColorStartMsgProperty(data);
                }

                if (data[0] == 0x02 && data[1] == 0x08)
                {
                    return new ColorEndMsgProperty(data);
                }

                if (data[0] == 0x02 && data[1] == 0x0E)
                {
                    if (data[3] == 0)
                    {
                        return new ParenthesisStartMsgProperty(data);
                    }

                    if (data[3] == 1)
                    {
                        return new ParenthesisEndMsgProperty(data);
                    }

                    return new MsgProperty(data);
                }

                if (data[0] == 0x02 && data[1] == 0x0F)
                {
                    return new SignMsgProperty(data);
                }

                return new MsgProperty(data);
            }
        }

        public class MsgProperties : IEnumerable<MsgProperty>
        {
            private readonly List<MsgProperty> Properties;

            public MsgProperties()
            {
                Properties = new List<MsgProperty>();
            }

            public MsgProperties(byte[] data) : this()
            {
                var propertyCount = data.Length / 16;

                for (var i = 0; i < propertyCount; i++)
                {
                    var current = new byte[16];
                    Array.Copy(data, i * 16, current, 0, 16);
                    var property = MsgPropertyFactory.GetProperty(current);
                    Properties.Add(property);
                }
            }

            public byte[] ToByteArray()
            {
                Properties.Sort();

                var result = new byte[16 * Properties.Count];

                for (var i = 0; i < Properties.Count; i++)
                {
                    Array.Copy(Properties[i].ToByteArray(), 0, result, i * 16, 16);
                }

                return result;
            }

            public IEnumerator<MsgProperty> GetEnumerator()
            {
                return Properties.GetEnumerator();
            }

            public void Add(MsgProperty property)
            {
                Properties.Add(property);
            }

            public void AddRange(IEnumerable<MsgProperty> properties)
            {
                Properties.AddRange(properties);
            }

            IEnumerator IEnumerable.GetEnumerator()
            {
                return GetEnumerator();
            }

    internal void Add(PauseMsgProperty property)
    {
        throw new NotImplementedException();
    }

    public int Count => Properties.Count;
        }
    }

        public class File
        {
    public override LineEnding LineEnding
    {
        get
        {
            return new LineEnding
            {
                RealLineEnding = "\r\n",
                ShownLineEnding = "\\r\\n",
                PoLineEnding = "\n",
                ScintillaLineEnding = ScintillaLineEndings.ToString(),
            };
        }
    }

    public object ScintillaLineEndings { get; private set; }

    public File(string gameName, string path, string changesFolder, System.Text.Encoding encoding) : base(gameName, path, changesFolder, encoding)
            {
            }

#if DEBUG
            private View _msgView;
            public override void Open(DockPanel panel)
            {
                _msgView = new View();

                _subtitles = GetSubtitles();
                _msgView.LoadSubtitles(_subtitles.Where(x => !string.IsNullOrEmpty(x.Text)).ToList());
                _msgView.Show(panel, DockState.Document);
            }
#endif
            protected override IList<TF.Core.TranslationEntities.Subtitle> GetSubtitles()
            {
                var result = new List<TF.Core.TranslationEntities.Subtitle>();

                using (var fs = new FileStream(Path, FileMode.Open))
                using (var input = new ExtendedBinaryReader(fs, FileEncoding, Endianness.BigEndian))
                {
                    input.Skip(3);
                    var count = input.ReadByte();
                    input.Skip(4);
                    var pointer1 = input.ReadInt32();
                    var countPointer1 = input.ReadInt16();

                    var numTalkers = input.ReadInt16();
                    var pointerTalkers = input.ReadInt32();
                    var pointerRemainder = input.ReadInt32();

                    for (var i = 0; i < count; i++)
                    {
                        input.Skip(4);
                        var groupOffset = input.ReadInt32();
                        input.Skip(1);
                        var stringCount = input.ReadByte();
                        input.Skip(6);

                        var subs = ReadSubtitles(input, groupOffset, stringCount);

                        if (subs.Count > 0)
                        {
                            result.AddRange(subs);
                        }
                    }

                    if (pointerTalkers > 0 && result.Count > 0)
                    {
                        input.Seek(pointerTalkers, SeekOrigin.Begin);
                        for (var i = 0; i < numTalkers; i++)
                        {
                            var offset = input.ReadInt32();
                            var subtitle = ReadSubtitle(input, offset, true);
                            if (subtitle != null)
                            {
                                subtitle.PropertyChanged += SubtitlePropertyChanged;
                                result.Add(subtitle);
                            }
                        }
                    }
                }

                LoadChanges(result);

                return result;
            }

            private IList<Subtitle> ReadSubtitles(ExtendedBinaryReader input, long groupOffset, int count)
            {
                var result = new List<Subtitle>();

                var returnPos = input.Position;

                input.Seek(groupOffset, SeekOrigin.Begin);

                for (var i = 0; i < count; i++)
                {
                    var strLength = input.ReadInt16();
                    var propCount = input.ReadByte();
                    var zero = input.ReadByte();
                    var strOffset = input.ReadInt32();
                    var propOffset = input.ReadInt32();

                    var sub = ReadSubtitle(input, strOffset, true);
                    if (sub != null)
                    {
                        var subtitle = new Subtitle(sub);
                        subtitle.PropertyChanged += SubtitlePropertyChanged;

                        var stringCharCount = subtitle.CleanText(Text).Length;
                        subtitle.Properties = ReadProperties(input, propOffset, propCount);
                        foreach (var property in subtitle.Properties)
                        {
                            if (property.Position == stringCharCount)
                            {
                                property.IsEndProperty = true;
                            }
                        }

                        result.Add(subtitle);
                    }
                }

                input.Seek(returnPos, SeekOrigin.Begin);

                return result;
            }

            protected override TF.Core.TranslationEntities.Subtitle ReadSubtitle(ExtendedBinaryReader input, long offset, bool returnToPos)
            {
                var subtitle = base.ReadSubtitle(input, offset, returnToPos);

                if (subtitle.Offset == 0)
                {
                    subtitle = null;
                }

                return subtitle;
            }

            private MsgProperties ReadProperties(ExtendedBinaryReader input, int offset, int count)
            {
                var pos = input.Position;
                input.Seek(offset, SeekOrigin.Begin);
                var data = input.ReadBytes(16 * count);
                input.Seek(pos, SeekOrigin.Begin);

                var result = new MsgProperties(data);
                return result;
            }

            public override void Rebuild(string outputFolder)
            {
                var outputPath = System.IO.Path.Combine(outputFolder, RelativePath);
                Directory.CreateDirectory(System.IO.Path.GetDirectoryName(outputPath));

                var subtitles = GetSubtitles();

                using (var fsInput = new FileStream(Path, FileMode.Open))
                using (var input = new ExtendedBinaryReader(fsInput, FileEncoding, Endianness.BigEndian))
                using (var fsOutput = new FileStream(outputPath, FileMode.Create))
                using (var output = new ExtendedBinaryWriter(fsOutput, FileEncoding, Endianness.BigEndian))
                {
                    output.Write(input.ReadBytes(3));
                    var count = input.ReadByte();
                    output.Write(count);
                    output.Write(input.ReadBytes(4));
                    var inputPointer1 = input.ReadInt32();
                    var inputCountPointer1 = input.ReadInt16();

                    var dataPointer1 = new byte[inputCountPointer1 * 16];
                    if (inputCountPointer1 > 0)
                    {
                        input.Seek(inputPointer1, SeekOrigin.Begin);
                        dataPointer1 = input.ReadBytes(inputCountPointer1 * 16);
                        input.Seek(14, SeekOrigin.Begin);
                    }

                    output.Write(0); // Si no es 0, ya lo rellenaré luego
                    output.Write(inputCountPointer1);

                    var numTalkers = input.ReadInt16();
                    output.Write(numTalkers);

                    var inputPointerTalkers = input.ReadInt32();
                    output.Write(0); // Si no es 0, ya lo rellenaré luego

                    var inputPointerRemainder = input.ReadInt32();
                    output.Write(0); // Si no es 0, ya lo rellenaré luego

                    using (var unknownMemoryStream = new MemoryStream())
                    using (var outputUnknown = new ExtendedBinaryWriter(unknownMemoryStream, FileEncoding, Endianness.BigEndian))
                    using (var propertiesMemoryStream = new MemoryStream())
                    using (var outputProperties = new ExtendedBinaryWriter(propertiesMemoryStream, FileEncoding, Endianness.BigEndian))
                    using (var stringsMemoryStream = new MemoryStream())
                    using (var outputStrings = new ExtendedBinaryWriter(stringsMemoryStream, FileEncoding, Endianness.BigEndian))
                    {
                        var stringLengths = new List<short>();
                        var stringOffsets = new List<int>();
                        var propertiesCount = new List<byte>();
                        var propertiesOffsets = new List<int>();
                        var unknownOffsets = new List<int>();

                        var unknownSectionOffset = 0;
                        var strOffset = 0;
                        var propOffset = 0;
                        var totalStrCount = 0;
                        for (var i = 0; i < count; i++)
                        {
                            input.Seek(0x18 + i * 0x10, SeekOrigin.Begin);

                            var unknownOffset = input.ReadInt32();
                            output.Write(0); // Si no es 0, ya lo rellenaré luego

                            var groupOffset = input.ReadInt32();
                            output.Write(groupOffset);
                            var unknownCount = input.ReadByte();
                            output.Write(unknownCount);

                            var stringCount = input.ReadByte();
                            output.Write(stringCount);
                            totalStrCount += stringCount;
                            output.Write(input.ReadBytes(6));

                            if (unknownOffset != 0)
                            {
                                var returnPos = input.Position;
                                input.Seek(unknownOffset, SeekOrigin.Begin);
                                outputUnknown.Write(input.ReadBytes(unknownCount * 12));
                                unknownOffsets.Add(unknownSectionOffset);
                                unknownSectionOffset = (int)outputUnknown.Position;
                                input.Seek(returnPos, SeekOrigin.Begin);
                            }
                            else
                            {
                                unknownOffsets.Add(-1);
                            }

                            input.Seek(groupOffset, SeekOrigin.Begin);

                            for (var j = 0; j < stringCount; j++)
                            {
                                var inputStringLength = input.ReadInt16();
                                var inputPropertiesCount = input.ReadByte();
                                var zero = input.ReadByte();
                                var inputStringOffset = input.ReadInt32();
                                var inputPropertiesOffset = input.ReadInt32();

                                if (inputStringLength == 0)
                                {
                                    stringLengths.Add(0);
                                    propertiesCount.Add(inputPropertiesCount);
                                    stringOffsets.Add(strOffset);
                                    propertiesOffsets.Add(propOffset);

                                    outputStrings.WriteString(string.Empty);
                                    strOffset = (int)outputStrings.Position;

                                    var ret = input.Position;
                                    input.Seek(inputPropertiesOffset, SeekOrigin.Begin);
                                    var prop = input.ReadBytes(inputPropertiesCount * 16);
                                    input.Seek(ret, SeekOrigin.Begin);

                                    outputProperties.Write(prop);
                                    propOffset = (int)outputProperties.Position;
                                }
                                else
                                {
                                    var sub = (Subtitle)subtitles.First(x => x.Offset == inputStringOffset);

                                    stringLengths.Add((short)FileEncoding.GetByteCount(sub.Translation));
                                    propertiesCount.Add((byte)sub.TranslationProperties.Count);
                                    stringOffsets.Add(strOffset);
                                    propertiesOffsets.Add(propOffset);

                                    outputStrings.WriteString(sub.Translation);
                                    strOffset = (int)outputStrings.Position;
                                    outputProperties.Write(sub.TranslationProperties.ToByteArray());
                                    propOffset = (int)outputProperties.Position;
                                }

                            }
                        }

                        var unknownBytes = unknownMemoryStream.ToArray();
                        var propertiesBytes = propertiesMemoryStream.ToArray();
                        var stringsBytes = stringsMemoryStream.ToArray();

                        var propBase = (int)output.Position + totalStrCount * 12;
                        var unknownBase = propBase + propertiesBytes.Length;
                        var strBase = unknownBase + unknownBytes.Length;

                        var outputReturnPos = output.Position;
                        for (var i = 0; i < count; i++)
                        {
                            output.Seek(0x18 + i * 0x10, SeekOrigin.Begin);
                            if (unknownOffsets[i] >= 0)
                            {
                                output.Write(unknownOffsets[i] + unknownBase);
                            }
                        }

                        output.Seek(outputReturnPos, SeekOrigin.Begin);

                        for (var i = 0; i < totalStrCount; i++)
                        {
                            output.Write(stringLengths[i]);
                            output.Write(propertiesCount[i]);
                            output.Write((byte)0);
                            output.Write(stringOffsets[i] + strBase);
                            output.Write(propertiesOffsets[i] + propBase);
                        }

                        output.Write(propertiesBytes);
                        if (unknownBytes.Length > 0)
                        {
                            output.Write(unknownBytes);
                        }
                        output.Write(stringsBytes);
                        output.WritePadding(4);
                    }

                    if (inputPointer1 > 0)
                    {
                        var outputPointer1 = (int)output.Position;
                        output.Seek(8, SeekOrigin.Begin);
                        output.Write(outputPointer1);
                        output.Seek(outputPointer1, SeekOrigin.Begin);
                        output.Write(dataPointer1);
                    }

                    if (inputPointerTalkers > 0)
                    {
                        var outputPointerTalkers = (int)output.Position;
                        output.Seek(16, SeekOrigin.Begin);
                        output.Write(outputPointerTalkers);
                        output.Seek(outputPointerTalkers, SeekOrigin.Begin);

                        input.Seek(inputPointerTalkers, SeekOrigin.Begin);

                        using (var stringsMemoryStream = new MemoryStream())
                        using (var outputStrings =
                            new ExtendedBinaryWriter(stringsMemoryStream, FileEncoding, Endianness.BigEndian))
                        {
                            var baseOffset = (int)output.Position + numTalkers * 4;
                            var strOffset = baseOffset;
                            for (var i = 0; i < numTalkers; i++)
                            {
                                var offset = input.ReadInt32();
                                var sub = subtitles.FirstOrDefault(x => x.Offset == offset);
                                output.Write(strOffset);
                                if (sub != null)
                                {
                                    outputStrings.WriteString(sub.Translation);
                                }
                                else
                                {
                                    outputStrings.WriteString(string.Empty);
                                }


                                strOffset = baseOffset + (int)outputStrings.Position;
                            }

                            output.Write(stringsMemoryStream.ToArray());
                        }
                    }

                    if (inputPointerRemainder > 0)
                    {
                        var outputPointerRemainder = (int)output.Position;
                        output.Seek(20, SeekOrigin.Begin);
                        output.Write(outputPointerRemainder);
                        output.Seek(outputPointerRemainder, SeekOrigin.Begin);

                        input.Seek(inputPointerRemainder, SeekOrigin.Begin);
                        var data = input.ReadBytes((int)(input.Length - inputPointerRemainder));
                        output.Write(data);
                    }
                }
            }

    public override bool Equals(object obj)
    {
        return obj is File file &&
               EqualityComparer<LineEnding>.Default.Equals(LineEnding, file.LineEnding);
    }
}
    



