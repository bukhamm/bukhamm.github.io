using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace almacen_inventario
{
    public partial class inventario : Form
    {
        Conexion vendo_donuts_donuts_donuts_vendo_donuts = new Conexion();
        public inventario()
        {
            InitializeComponent();
        }
        public string articulo { get; set; }
        public int precio { get; set; } 
        public string categoria { get; set; }
        public string wea { get; set; }
        public string fecha { get; set; }
        public string codigo { get; set; }

        // Asegúrate de tener un control TextBox llamado textBox1 en tu formulario

        // Manejador de evento Load del formulario
        private void Form1_Load(object sender, EventArgs e)
        {
            textBox1.Text = DateTime.Now.ToString();
        }


        private void CodigoInservible_Click(object sender, EventArgs e)
        {
            ARTICULO.Text = articulo;
            CAATEGORIA.Text = categoria;
            PRECIO.Text = wea;
            precio = Convert.ToInt32(wea);
            vendo_donuts_donuts_donuts_vendo_donuts.homero_parece_que_hay_alguien_ahi_en_el_agua____________________________________no_debe_ser_nada_moe(codigo, articulo, precio, fecha);

        }

        private void button1_Click(object sender, EventArgs e)
        {

            fecha = DateTime.Now.ToString(); //Date-san
            ARTICULO.Text = articulo;
            CAATEGORIA.Text = categoria;
            PRECIO.Text = wea;
            precio = Convert.ToInt32(wea);
            //Hacer en C# que inserte en la base de datos tabla productos string fecha, string articulo, string categoria, int precio
            string cadenaConexion = "SERVER=localhost;DATABASE=tesys_tap;Integrated security=true";
            SqlConnection conexion = new SqlConnection(cadenaConexion);
            conexion.Open();

            string sentenciaSql = "INSERT INTO Productos (Fecha, Articulo, Categoria, Precio) VALUES (@Fecha, @Articulo, @Categoria, @Precio)";

            SqlCommand comando = new SqlCommand(sentenciaSql, conexion);
            comando.Parameters.AddWithValue("@Fecha", fecha);
            comando.Parameters.AddWithValue("@Articulo", articulo);
            comando.Parameters.AddWithValue("@Categoria", categoria);
            comando.Parameters.AddWithValue("@Precio", precio);

            comando.ExecuteNonQuery();

            conexion.Close();
        }

        private void bSelFicheroCSV_Click(object sender, EventArgs e)
        {

        }

        private void btLeerCSV_Click(object sender, EventArgs e)
        {

        }

        //Carga un fichero CSV en un DataGridView
        private void CargarDatosCSV(string ficheroCSV, char separador,
            bool primeraLineaTitulo, string separadorCampos)
        {
            dbTabla.DataSource = null;
            dbTabla.Rows.Clear();

            DataTable tablaDatos = new DataTable();
            string[] lineas = File.ReadAllLines(ficheroCSV, Encoding.Default);

            if (lineas.Length > 0)
            {
                //Si la primea línea contiene el título  
                string[] etiquetaTitulosFinal;
                if (primeraLineaTitulo)
                {
                    string primelaLinea = lineas[0];
                    string[] etiquetaTitulos = primelaLinea.Split(separador);
                    List<string> lista = new List<string>();
                    foreach (string campoActual in etiquetaTitulos)
                    {
                        string valor = campoActual;
                        // Quitamos el posible carácter de inicio y fin de valor
                        if (separadorCampos != "")
                        {
                            valor = valor.TrimEnd(Convert.ToChar(separadorCampos));
                            valor = valor.TrimStart(Convert.ToChar(separadorCampos));
                        }
                        tablaDatos.Columns.Add(new DataColumn(valor));
                        lista.Add(valor);
                    }
                    etiquetaTitulosFinal = lista.ToArray();
                }
                else
                {
                    string primelaLinea = lineas[0];
                    string[] etiquetaTitulos = primelaLinea.Split(separador);
                    int numero = 0;
                    List<string> lista = new List<string>();
                    foreach (string campoActual in etiquetaTitulos)
                    {
                        string valor = "C" + Convert.ToString(numero);
                        // Quitamos el posible carácter de inicio y fin de valor
                        if (separadorCampos != "")
                        {
                            valor = valor.TrimEnd(Convert.ToChar(separadorCampos));
                            valor = valor.TrimStart(Convert.ToChar(separadorCampos));
                        }

                        tablaDatos.Columns.Add(new DataColumn(valor));
                        lista.Add(valor);
                        numero++;
                    }
                    etiquetaTitulosFinal = lista.ToArray();
                }

                //Resto de filas de datos
                int inicioFila = 0;
                if (primeraLineaTitulo)
                    inicioFila = 1;

                for (int i = inicioFila; i < lineas.Length; i++)
                {
                    string[] filasDatos = lineas[i].Split(separador);
                    DataRow dataGridS = tablaDatos.NewRow();
                    int columnIndex = 0;
                    foreach (string campoActual in etiquetaTitulosFinal)
                    {
                        string valor = filasDatos[columnIndex++];
                        // Quitamos el posible carácter de inicio y fin de valor
                        if (separadorCampos != "")
                        {
                            valor = valor.TrimEnd(Convert.ToChar(separadorCampos));
                            valor = valor.TrimStart(Convert.ToChar(separadorCampos));
                        }
                        dataGridS[campoActual] = valor;
                    }
                    tablaDatos.Rows.Add(dataGridS);
                }
            }
            if (tablaDatos.Rows.Count > 0)
            {
                dbTabla.DataSource = tablaDatos;
            }
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            System.Diagnostics.Process.Start("https://proyectoa.com");
        }

        private void btSelFicheroExportarCSV_Click(object sender, EventArgs e)
        {
            SaveFileDialog dlFicheroCSV = new SaveFileDialog();
            dlFicheroCSV.Title = "Exportar fichero CSV...";
            //dlFicheroCSV.InitialDirectory = @"C:\";
            dlFicheroCSV.Filter = "Ficheros de texto y CSV (*.txt, *.csv)|*.txt;*.csv|" +
                "Ficheros de texto (*.txt)|*.txt|" +
                "Ficheros CSV (*.csv)|*.csv|" +
                "Todos los ficheros (*.*)|*.*";
            dlFicheroCSV.FilterIndex = 1;
            dlFicheroCSV.OverwritePrompt = true;
            if (dlFicheroCSV.ShowDialog() == DialogResult.OK)
            {
                txtFicheroExportarCSV.Text = dlFicheroCSV.FileName;
            }
        }

        private void btExportarCSV_Click(object sender, EventArgs e)
        {
            string caracterSeparadorCampos = txtSeparadorExportar.Text;
            if (txtFicheroExportarCSV.Text == "" || caracterSeparadorCampos == "")
            {
                MessageBox.Show("Debe indicar el fichero CSV en el que se exportará " +
                    "la información, así como el separador a usar.", "Exportar a CSV...",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtFicheroExportarCSV.Focus();
            }
            else
            {
                string caracterSeparadorValores = txtSeparadorValoresExportar.Text;
                if (Directory.Exists(Path.GetDirectoryName(txtFicheroExportarCSV.Text)))
                {
                    StringBuilder csvMemoria = new StringBuilder();

                    //para los títulos de las columnas, encabezado
                    for (int i = 0; i < dbTabla.Columns.Count; i++)
                    {
                        if (i == dbTabla.Columns.Count - 1)
                        {
                            csvMemoria.Append(String.Format(caracterSeparadorValores + "{0}" +
                                caracterSeparadorValores,
                                dbTabla.Columns[i].HeaderText));
                        }
                        else
                        {
                            csvMemoria.Append(String.Format(caracterSeparadorValores + "{0}" +
                                caracterSeparadorValores + caracterSeparadorCampos,
                                dbTabla.Columns[i].HeaderText));
                        }
                    }
                    csvMemoria.AppendLine();

                    for (int m = 0; m < dbTabla.Rows.Count; m++)
                    {
                        for (int n = 0; n < dbTabla.Columns.Count; n++)
                        {
                            //si es la última columna no poner el separador
                            if (n == dbTabla.Columns.Count - 1)
                            {
                                csvMemoria.Append(String.Format(caracterSeparadorValores + "{0}" +
                                    caracterSeparadorValores,
                                     dbTabla.Rows[m].Cells[n].Value));
                            }
                            else
                            {
                                csvMemoria.Append(String.Format(caracterSeparadorValores + "{0}" +
                                    caracterSeparadorValores + caracterSeparadorCampos,
                                    dbTabla.Rows[m].Cells[n].Value));
                            }
                        }
                        csvMemoria.AppendLine();
                    }
                    try
                    {
                    //    System.IO.StreamWriter sw =
                          //  new System.IO.StreamWriter(txtFicheroExportarCSV.Text, false,
                         //      System.Text.Encoding.Default);
                      //  sw.Write(csvMemoria.ToString(), Encoding.Default);
                        this.Close();
                        MessageBox.Show("Se ha exportado el contenido del grid al fichero CSV correctamente.",
                            "Exportado a fichero CSV...",
                            MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message.ToString(), "Error al exportar CSV...",
                            MessageBoxButtons.OK, MessageBoxIcon.Error);
                       // txtFicheroExportarCSV.Focus();
                    }
                }
                else
                {
                    MessageBox.Show("La carpeta indicada para el fichero de exportación CSV no existe.",
                        "Exportar a fichero CSV...",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void bSelFicheroCSV_Click_1(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void inventario_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'tesys_tapDataSet8.UTILIDADES' Puede moverla o quitarla según sea necesario.
            this.uTILIDADESTableAdapter.Fill(this.tesys_tapDataSet8.UTILIDADES);

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }
    }
}

