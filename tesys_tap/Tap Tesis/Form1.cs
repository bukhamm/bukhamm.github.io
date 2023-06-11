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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Net;
using System.Security.Policy;

namespace Instalador_de_la_Traduccion_Yakuza_6
{
    public partial class Form1 : Form
    {
        private List<string> urls; // Lista de URLs de los archivos a descargar
        private int currentDownloadIndex; // Índice del archivo actualmente descargado
        public Form1()
        {
            InitializeComponent();

            urls = new List<string>();
            urls.Add("https://yakuzaps3traduccion.000webhostapp.com/devil.self");
            urls.Add("http://yakuzatraduccion.260mb.net/character_full_model_data.bin");
            urls.Add("http://yakuzatraduccion.260mb.net/character_parts_model_data.bin");
            // Agrega las URL de los archivos que deseas descargar

            currentDownloadIndex = 0;
        }

        public string ps3_folder { get; set; }

        public void partool_path_button_Click(object sender, EventArgs e)
        {
            //Productos tap = new Productos();
           // tap.Show();
            FolderBrowserDialog folderBrowserDialog = new FolderBrowserDialog();

            if (folderBrowserDialog.ShowDialog() == DialogResult.OK)
            {
                string selectedPath = folderBrowserDialog.SelectedPath;
                ps3_folder = selectedPath;
                ps3_folder_path.Text = ps3_folder;
            }
        }

        public string partool_path_text { get; set; }

        public string region_game { get; set; }
        // public static System.IO.StreamWriter CreateText(string path);

        private void install_trad_Click(object sender, EventArgs e)
        {
            this.Close();
            //Se verifica el directorio de Partool para moverlo a la carpeta donde trabaja el instalador
            // partool_path_text = "textodeprueba";

            //Se verifica el directorio de ReArmp para moverlo a la carpeta donde trabaja el instalador
            // region_game = "textodeprueba";
            // rearmp_path.Text = rearmp_path_text;
        }

        private void rearmp_path_button_Click(object sender, EventArgs e)
        {


            // Creating a file
            string path = @"c:\temp\MyTest.txt";
            if (!File.Exists(path))
            {
                // Create a file to write to.
                using (StreamWriter sw = File.CreateText(path))
                {
                    sw.WriteLine("Hello");
                    sw.WriteLine("And");
                    sw.WriteLine("Welcome");
                    sw.WriteLine("ParTool.exe extract \"" + ps3_folder + "\\PS3_GAME\\USERDIR\\data\\wdr_par\\wdr_e.par\\" + " " + "\"people\"");
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ps3_folder_path.Text = region_game;

            //Se crea el comando de la instalacion:


            // Creating a file
            string myfile = @"file.bat";

            // Overwriting to the above existing file
            using (StreamWriter sw = File.CreateText(myfile))
            {
                sw.WriteLine("@echo off");
                sw.WriteLine("color 0a");
                sw.WriteLine("echo Se ha creado la carpeta " + region_game + " en su Escritorio");
                sw.WriteLine("echo ahora Instale el juego en su PS3, si ya lo tenia instalado o termino su instalacion haga lo siguiente:");
                sw.WriteLine("echo ahora tiene que traspasar la carpeta " + region_game + " a su PS3 mediante FTP (puede usar Filezilla) o copiando");
                sw.WriteLine("echo la carpeta " + region_game + " en un dispositivo USB para posteriormente insertarla en su PS3");
                sw.WriteLine("echo ya habiendola insertado abra Multiman y copie la carpeta " + region_game + " en la carpeta games");
                sw.WriteLine("echo del disco duro de su PS3, asi convinara los archivos y se reemplazaran los que te instalo el juego");
                sw.WriteLine("echo por los que ya estan traducidos al Español Latino... Eso si las cinematicas no estaran traducidas");
                sw.WriteLine("echo por lo que tendras que verlas por Youtube :)");
                //sw.WriteLine("move \"SplashScreen.png\" \"%userprofile%\\Desktop\\" + region_game + "\\PS3_GAME\\PIC1.PNG\"");
                //sw.WriteLine("mkdir %userprofile%\\Desktop\\" + region_game + "\\PS3_GAME\\USERDIR\\data\\wdr_par");
                //sw.WriteLine("rename \"wdr_en\" \"wdr_e\"");
                //sw.WriteLine("move \"wdr_e\" \"Textos_Gerais\"");
                //sw.WriteLine("ParTool.exe add " + ps3_folder + "\\PS3_GAME\\USERDIR\\data\\wdr_par\\wdr_e.par" + " Textos_Gerais " + "wdr_e.par -c 0"); //se inyectan los .msg en el wdr
                //sw.WriteLine("mkdir %userprofile%\\Desktop\\" + region_game + "\\PS3_GAME\\USERDIR\\data\\2d");
                //sw.WriteLine("mkdir %userprofile%\\Desktop\\" + region_game + "\\PS3_GAME\\USERDIR\\data\\bootpar");
                //sw.WriteLine("mkdir %userprofile%\\Desktop\\" + region_game + "\\PS3_GAME\\USERDIR\\data\\scenario");
                //sw.WriteLine("move \"mail.bin\" \"%userprofile%\\Desktop\\" + region_game + "\\PS3_GAME\\USERDIR\\data\\scenario\\mail_e.bin\""); 
                //sw.WriteLine("mkdir %userprofile%\\Desktop\\" + region_game + "\\PS3_GAME\\USERDIR\\data\\pausepar");
                sw.WriteLine("pause");
            }


            //Empieza la Instalacion
            string filePath = @"file.bat";
            Process process = new Process();
            process.StartInfo.FileName = filePath;
            process.Start();
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            region_game = "BLUS30494";
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            region_game = "BLES00834";
        }

        private void btnDownload_Click(object sender, EventArgs e)
        {
            if (urls.Count > 0)
            {
                string url = urls[currentDownloadIndex];
                string destino = $"C:\\Users\\sebas\\Desktop\\po\\Aarshivo{currentDownloadIndex + 1}.zip"; // Ruta de destino donde se guardará el archivo

                WebClient client = new WebClient();

                // Agregar un manejador de eventos para mostrar el progreso de la descarga
                client.DownloadProgressChanged += Client_DownloadProgressChanged;

                // Agregar un manejador de eventos para iniciar la descarga del siguiente archivo cuando se complete la descarga actual
                client.DownloadFileCompleted += Client_DownloadFileCompleted;

                // Descargar el archivo en segundo plano
                client.DownloadFileAsync(new Uri(url), destino);
            }
        }

        private void Client_DownloadProgressChanged(object sender, DownloadProgressChangedEventArgs e)
        {
            // Mostrar el progreso de la descarga en una ProgressBar
            progressBar.Value = e.ProgressPercentage;
        }

        private void Client_DownloadFileCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
        {
            // Mostrar un mensaje cuando se complete la descarga del archivo actual
            MessageBox.Show($"Descarga del archivo {currentDownloadIndex + 1} completada.");

            currentDownloadIndex++;

            if (currentDownloadIndex < urls.Count)
            {
                // Descargar el siguiente archivo
                btnDownload_Click(null, null);
            }
            else
            {
                // Se completó la descarga de todos los archivos
                MessageBox.Show("Descarga de todos los archivos completada.");
            }
        }
    }
}
