using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;
using System.IO;
using almacen_inventario;

namespace Instalador_de_la_Traduccion_Yakuza_6
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        // para crear el archivo
        void GenerarTXT()
        {
            string rutaCompleta = @" D:\mi archivo.txt";
            string texto = "HOLA MUNDO ";

            using (StreamWriter mylogs = File.AppendText(rutaCompleta))         //se crea el archivo
            {

                //se adiciona alguna información y la fecha


                DateTime dateTime = new DateTime();
                dateTime = DateTime.Now;
                string strDate = Convert.ToDateTime(dateTime).ToString("yyMMdd");

                mylogs.WriteLine(texto + strDate);

                mylogs.Close();


            }
        }

        // para escribir en el archivo
        void AdicionarInfoAlTxt()
        {
            string rutaCompleta = @" D:\mi archivo.txt";
            string texto = "HOLA DE NUEVO";

            using (StreamWriter file = new StreamWriter(rutaCompleta, true))
            {
                file.WriteLine(texto); //se agrega información al documento

                file.Close();
            }
        }

        // para leer la información el archivo
        void LeerInfoTxt()
        {
            string rutaCompleta = @" D:\mi archivo.txt";

            string line = "";
            using (StreamReader file = new StreamReader(rutaCompleta))
            {
                while ((line = file.ReadLine()) != null)                //Leer linea por linea
                {
                    Console.WriteLine(line);
                }

                // OTRA FORMA DE LEER TODO EL ARCHIVO

                line = file.ReadToEnd();

                Console.WriteLine(line);

                //file.close();


            }

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void GoToFormProductos_Click(object sender, EventArgs e)
        {
            Productos tap = new Productos();

            tap.Show();
            
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form1 tap = new Form1();

            tap.Show();
            //Conexion.Conectar();
            //MessageBox.Show("Se ha conectado a la Base de Datos");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form3 tap = new Form3();

            tap.Show();
        }
    }
}
