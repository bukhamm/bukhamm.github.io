using System;
using System.Collections.Generic;
using System.IO;
using System.Windows.Forms;
using Newtonsoft.Json;

namespace TuProyecto
{
    public partial class TuFormulario : Form
    {
        private List<Dialogo> dialogos = new List<Dialogo>();

        public TuFormulario()
        {
            InitializeComponent();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Archivos MSG (*.msg)|*.msg|Todos los archivos (*.*)|*.*";

            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                string contenido = File.ReadAllText(openFileDialog.FileName);
                string[] partes = contenido.Split('\u0000');

                for (int i = 0; i < partes.Length; i++)
                {
                    dialogos.Add(new Dialogo { Numero = i.ToString(), Texto = partes[i] });
                }
            }
        }

        private void btnToJson_Click(object sender, EventArgs e)
        {

            string[] dialogosSeparados = new string[dialogos.Count * 2];
            for (int i = 0; i < dialogos.Count; i++)
            {
                dialogosSeparados[i * 2] = i.ToString();
                dialogosSeparados[i * 2 + 1] = JsonConvert.SerializeObject(dialogos[i]);
            }

            string json = JsonConvert.SerializeObject(dialogosSeparados, Formatting.Indented);
            File.WriteAllText("output.json", json);
        }

        private void btnToMSG_Click(object sender, EventArgs e)
        {
            string json = File.ReadAllText("wea.json");
            string[] dialogosSeparados = JsonConvert.DeserializeObject<string[]>(json);

            for (int i = 0; i < dialogosSeparados.Length; i += 2)
            {
                string contenido = JsonConvert.DeserializeObject<Dialogo>(dialogosSeparados[i + 1]).Texto;
                contenido = contenido.Replace("ñ", "0").Replace("á", "a").Replace("é", "e").Replace("í", "i").Replace("ó", "o").Replace("ú", "u");
                File.WriteAllText($"output_{dialogosSeparados[i]}.msg", contenido);


            }
        }

        public class Dialogo
        {
            public string Numero { get; set; }
            public string Texto { get; set; }
        }
    }
}


