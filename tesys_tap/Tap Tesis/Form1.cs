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
using almacen_inventario;
using System.Data.SqlClient;
using System.Reflection.Emit;
using Newtonsoft.Json;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Window;

namespace Instalador_de_la_Traduccion_Yakuza_6
{
    public partial class Form1 : Form
    {
        private List<string> urls; // Lista de URLs de los archivos a descargar
        private int currentDownloadIndex; // Índice del archivo actualmente descargado
        private object frmTransparentForm;

        public Form1()
        {
            InitializeComponent();
            this.TransparencyKey = BackColor;
            NombreJuego = "Yakuza Kiwami 2";
            Steam = "Steam"; //BLUS (USA)
            Gamepass = "Gamepass"; //BLES (Europe)
            //label3.Text = Steam;
            //label4.Text = Gamepass;
            directorio = ""; //Directorio del Juego en Formato Carpeta:
            label1.Text = directorio;
            urls = new List<string>();
            urls.Add("https://yakuzaps3traduccion.000webhostapp.com/wea.par"); //Gampass > "yakuza.dds" > Archivo1
            urls.Add("https://yakuzaps3traduccion.000webhostapp.com/majimomos.yk2");//Steam > "db.par" > Archivo2
            urls.Add("https://yakuzaps3traduccion.000webhostapp.com/fontgamepass.dds");//Gampass > "yakuza_italic.dds" > Archivo3
            urls.Add("https://yakuzaps3traduccion.000webhostapp.com/fontgamepass_italic.dds");//Steam .exe parchado > Archivo4
            // Agrega las URL de los archivos que deseas descargar
            this.BackColor = Color.Blue;
            // Make the background color of form display transparently.
            this.Opacity = 0.7;
            currentDownloadIndex = 0;
        }
        private List<Dialogo> dialogos = new List<Dialogo>();
        public void MakeSeeThru()
        {
            string gracias, mer;
            gracias = "adios";
            mer = "eh adios";
            Console.Write(gracias);
            Console.Write(mer);
        }

        public string ps3_folder { get; set; }
        public System.Drawing.Color TransparencyKey { get; set; }
        public string NombreJuego { get; set; }
        public string Steam { get; set; }
        public string Gamepass { get; set; }
        public string directorio { get; set; }
        public string Hola_Conejo_Viajero { get; set; }
        public int yakuzear { get; set; }


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



        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            region_game = "BLUS30494";
            //backup: string destino = $"C:\\Users\\sebas\\Desktop\\po\\Aarshivo{currentDownloadIndex + 1}.yk2"; // Ruta de destino donde se guardará el archivo
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            region_game = "BLES00834";
            string myfile = @"leeme.txt";

            // Overwriting to the above existing file
            using (StreamWriter sw = File.CreateText(myfile))
            {
                sw.WriteLine("En la version de Gamepass hay letras como ¡,¿,í entre otras que van a tener separacion");
                sw.WriteLine("Esto pasa por que no nos deja manipular el .exe para parcharlo y arreglar ese problema");
                sw.WriteLine("Saluda Atte.");
                sw.WriteLine("                                       Traducciones Majimomos.");
            }
        }

        private void Dead_Souls_Installer()
        {

        }

        private void Client_DownloadProgressChanged(object sender, DownloadProgressChangedEventArgs e)
        {
            // Mostrar el progreso de la descarga en una ProgressBar
            progressBar.Value = e.ProgressPercentage;
            label2.Text = "Descargando Archivos de la Traduccion...";
        }

        private void Client_DownloadFileCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
        {
            // Mostrar un mensaje cuando se complete la descarga del archivo actual
            //MessageBox.Show($"Descarga del archivo {currentDownloadIndex + 1} completada.");
            label2.Text = "Se ha Descargado uno de los Archivos de la Traduccion";
            currentDownloadIndex++;

            if (currentDownloadIndex < urls.Count)
            {
                // Descargar el siguiente archivo
                //btnDownload_Click(null, null);
            }
            else
            {
                // Se completó la descarga de todos los archivos
                //MessageBox.Show("Descarga de todos los archivos completada.");
                label2.Text = "Se han descargado todos los archivos de la traduccion";
                string archivoRuta = $"{ps3_folder}\\Aarshivo1.yk2";
                string nuevoNombre = "yakuza.dds";
                File.Delete($"{ps3_folder}\\data\\db.par");
                // Verificar si el archivo existe
                if (File.Exists(archivoRuta))
                {
                    string directorio = Path.GetDirectoryName(archivoRuta); //El "directorio" es sacado de "archivoRuta"
                    string nuevoRuta = Path.Combine(directorio, nuevoNombre);

                    // Renombrar el archivo
                    File.Move(archivoRuta, nuevoRuta);

                    //label2.Text = "La Traduccion de " + NombreJuego + " Se ha Instalado de forma Exitosa";
                    label2.Text = "Instalando Traduccion... 19%";
                }
                else
                {
                    label2.Text = "Ha ocurrido un error al Instalar la Traduccion de " + NombreJuego;
                }
                //Esta listo para que 
                //Xules lo testee
                string archivoRuta1 = $"{ps3_folder}\\YakuzaKiwami2.exe";
                string nuevoNombre1 = "YakuzaKiwami2.exe";

                // Verificar si el archivo existe
                if (File.Exists(archivoRuta))
                {
                    string directorio1 = Path.GetDirectoryName(archivoRuta1); //El "directorio" es sacado de "archivoRuta"
                    string nuevoRuta1 = Path.Combine(directorio1, nuevoNombre1);

                    // Renombrar el archivo
                    File.Move(archivoRuta1, nuevoRuta1);

                    //label2.Text = "La Traduccion de " + NombreJuego + " Se ha Instalado de forma Exitosa";
                    label2.Text = "Instalando Traduccion... 50%";
                }
                else
                {
                    label2.Text = "Ha ocurrido un error al Instalar la Traduccion de " + NombreJuego;
                }

                string kisei = $"{ps3_folder}\\YakuzaKiwami1.exe";
                string katai = "db.par";

                // Verificar si el archivo existe
                if (File.Exists(kisei))
                {
                    string haruka = Path.GetDirectoryName(kisei); //El "directorio" es sacado de "archivoRuta"
                    string majima = Path.Combine(haruka, katai);
                    string weademierda = $"{ps3_folder}\\data\\db.par";
                    // Renombrar el archivo
                    File.Delete(weademierda);
                    File.Move(kisei, majima);

                    //label2.Text = "La Traduccion de " + NombreJuego + " Se ha Instalado de forma Exitosa";
                    label2.Text = "Instalando Traduccion... 82%";
                }
                else
                {
                    label2.Text = "Ha ocurrido un error al Instalar la Traduccion de " + NombreJuego;
                }

                string Alike = $"{ps3_folder}\\YakuzaKiwami4.exe";
                string Anike = "yakuza_italic.dds";

                // Verificar si el archivo existe
                if (File.Exists(Alike))
                {
                    string Aniki = Path.GetDirectoryName(Alike); //El "directorio" es sacado de "archivoRuta"
                    string EsMiAniki = Path.Combine(Aniki, Anike);

                    // Renombrar el archivo
                    //File.Delete(Alike);
                    File.Move(Alike, EsMiAniki);

                    //label2.Text = "La Traduccion de " + NombreJuego + " Se ha Instalado de forma Exitosa";
                    label2.Text = "Instalando Traduccion... 100%";
                }
                else
                {
                    label2.Text = "Ha ocurrido un error al Instalar la Traduccion de " + NombreJuego;
                }
                //Ahora se movera la traduccion al lugar que corrresponde

                string archivoOrigen = $"{ps3_folder}\\db.par";
                string directorioDestino = $"{ps3_folder}\\data";

                // Verificar si el archivo existe
                if (File.Exists(archivoOrigen))
                {
                    // Crear el directorio de destino si no existe
                    if (!Directory.Exists(directorioDestino))
                    {
                        Directory.CreateDirectory(directorioDestino);
                    }

                    string nombreArchivo = Path.GetFileName(archivoOrigen);
                    string rutaDestino = Path.Combine(directorioDestino, nombreArchivo);

                    // Mover el archivo al directorio de destino
                    File.Move(archivoOrigen, rutaDestino);

                    label2.Text = "Finalizando Instalacion...";
                }
                else
                {
                    label2.Text = "Ha fallado la Instalacion de la Traduccion";
                }
                File.Delete($"{ps3_folder}\\YakuzaKiwami4.exe");
                File.Delete($"{ps3_folder}\\YakuzaKiwami3.exe");
                File.Delete($"{ps3_folder}\\YakuzaKiwami1.exe");
                label2.Text = "Se ha completado con exito la instalacion";

            }
        }

        private void tesystapDataSet1BindingSource_CurrentChanged(object sender, EventArgs e)
        {
            this.TransparencyKey = Color.Crimson;
            this.BackColor = Color.Crimson;
            Hola_Conejo_Viajero = "Voy a Guardar tu Pocision";
        }

        private void UnUsed_code()
        {

            // TODO: esta línea de código carga datos en la tabla 'tesys_tapDataSet3.Salidas' Puede moverla o quitarla según sea necesario.
            this.salidasTableAdapter.Fill(this.tesys_tapDataSet3.Salidas);
            // TODO: esta línea de código carga datos en la tabla 'tesys_tapDataSet2.PRODUCTOS' Puede moverla o quitarla según sea necesario.
            this.pRODUCTOSTableAdapter.Fill(this.tesys_tapDataSet2.PRODUCTOS);
            // TODO: esta línea de código carga datos en la tabla 'tesys_tapDataSet1.Entradas' Puede moverla o quitarla según sea necesario.
            this.entradasTableAdapter.Fill(this.tesys_tapDataSet1.Entradas);

            Form5 tap = new Form5();
            MakeSeeThru();
            tap.Show();

            Form3 wea = new Form3();

            wea.Show();

            inventario weol = new inventario();

            weol.Show();

            ps3_folder_path.Text = region_game;

            //Se crea el comando de la instalacion:

            // Crea la consulta SQL para leer los datos
            string query = "SELECT Nombre, Precio, Stock, Categoria FROM Productos";
            // using (SqlCommand command = new SqlCommand(query, Conexion))
            // {
            Conexion.Conectar();
            // }
            // Crea un objeto SqlDataReader para leer los datos
            using (SqlDataReader reader = Command.ExecuteReader())
            {
                // Crea una DataTable para almacenar los datos leídos
                DataTable dataTable = new DataTable();
                dataTable.Load(reader);

                // Asigna la DataTable como origen de datos del DataGridView
                dataGridView1.DataSource = dataTable;
            }

            // Creating a file
            string myfile = @"file.bat";

            // Overwriting to the above existing file
            using (StreamWriter sw = File.CreateText(myfile))
            {
                sw.WriteLine("@echo off");
                sw.WriteLine("color 0a");
                sw.WriteLine("echo Se ha creado la carpeta " + query + " en su Escritorio");
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

            if (urls.Count > 0)
            {
                string url = urls[currentDownloadIndex];
                string destino = $"{ps3_folder}\\YakuzaKiwami{currentDownloadIndex + 1}.exe"; // Ruta de destino donde se guardará el archivo

                WebClient client = new WebClient();

                // Agregar un manejador de eventos para mostrar el progreso de la descarga
                client.DownloadProgressChanged += Client_DownloadProgressChanged;

                // Agregar un manejador de eventos para iniciar la descarga del siguiente archivo cuando se complete la descarga actual
                client.DownloadFileCompleted += Client_DownloadFileCompleted;

                // Descargar el archivo en segundo plano
                client.DownloadFileAsync(new Uri(url), destino);
            }

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            _ = yakuzear == 1;
            if (yakuzear == 4)
            {
                UnUsed_code();
            }
            else
            {
                Hola_Conejo_Viajero = ", voy a guardar tu posicion";
            }


        }

        private void inventarioToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void productosToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void utilidadToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void utilidadesToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView3_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void AgregarMSGyakuza()
        {
            // Wea que hice para que no sirva para nada... Sere weon?
        }

        private void AgregarMSG()
        {
            {
                // Lógica para seleccionar un archivo .msg y agregarlo a la lista
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "Archivos MSG (*.msg)|*.msg|Todos los archivos (*.*)|*.*";

                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    string contenido = File.ReadAllText(openFileDialog.FileName);
                    dialogos.Add(new Dialogo { Texto = contenido });

                    // Puedes mostrar el texto en algún control visual si lo deseas
                    Console.WriteLine(contenido);
                }



            }
        }

        private void ConvertirAJson()
        {
            {
                // Lógica para convertir la lista de diálogos a JSON
                string json = JsonConvert.SerializeObject(dialogos, Formatting.Indented);
                File.WriteAllText("output.json", json);
            }
        }

        private static void ConvertirAMSG()
        {
            {
                // Lógica para convertir el JSON nuevamente a archivos .msg
                string json = File.ReadAllText("output.json");
                List<Dialogo> dialogosDesdeJson = JsonConvert.DeserializeObject<List<Dialogo>>(json);

                foreach (var dialogo in dialogosDesdeJson)
                {
                    // Lógica para revertir la transformación y escribir el contenido a archivos .msg
                    string contenido = dialogo.Texto;
                    // Puedes implementar la lógica de reemplazo de caracteres aquí


                    File.WriteAllText($"output_{DateTime.Now.Ticks}.msg", contenido);
                }
            }



        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Archivos MSG (*.msg)|*.msg|Todos los archivos (*.*)|*.*";

            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                string contenido = File.ReadAllText(openFileDialog.FileName);
                string[] dialogoSeparado = contenido.Split('\u0000');
                dialogos.Add(new Dialogo { Texto = dialogoSeparado[1] });
            }
        }



        private void button2_Click(object sender, EventArgs e)
        {
            string[] dialogosSeparados = new string[dialogos.Count * 2];
            for (int i = 0; i < dialogos.Count; i++)
            {
                dialogosSeparados[i * 2] = i.ToString();
                dialogosSeparados[i * 2 + 1] = JsonConvert.SerializeObject(dialogos[i]);
            }

            string json = JsonConvert.SerializeObject(dialogosSeparados, Formatting.Indented);
            File.WriteAllText("wea.json", json);
        }

        private void button3_Click(object sender, EventArgs e)
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
    }
}
