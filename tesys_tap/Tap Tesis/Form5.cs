using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace almacen_inventario
{
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
            this.Opacity = 0.7;
        }

        public string fecha { get; set; }
        public string articulo { get; set; }
        public string categoria { get; set; }
        public string precio { get; set; }  
        public string arkhana { get; set; }
        public string lblResultado { get; set; }   

        private void button1_Click(object sender, EventArgs e)
        {
            Random random = new Random(DateTime.Now.Millisecond);
            fecha = DateTime.Now.ToString();
            string nandoMO = random.ToString();
            int numeroEntero = random.Next(111101);
            precio = numeroEntero.ToString();
            Console.WriteLine("wea que no sirve de nada: " + nandoMO);
            articulo = textBox1.Text;
            categoria = textBox2.Text;
            string cadenaConexion = "SERVER=localhost;DATABASE=tesys_tap;Integrated security=true";
            SqlConnection conexion = new SqlConnection(cadenaConexion);
            conexion.Open();

            string sentenciaSql = "INSERT INTO Entradas (CODIGO,ARTICULO, FECHA , CANTIDAD) VALUES (@wea ,@Articulo, @Fecha, @Categoria)";

            SqlCommand comando = new SqlCommand(sentenciaSql, conexion);
            comando.Parameters.AddWithValue("@Fecha", fecha);
            comando.Parameters.AddWithValue("@Articulo", articulo);
            comando.Parameters.AddWithValue("@Categoria", categoria);
            comando.Parameters.AddWithValue("@wea", precio);
            // comando.Parameters.AddWithValue("@Precio", precio);

            comando.ExecuteNonQuery();
            conexion.Close();
            if (decimal.TryParse(valorCOMPRA.Text, out decimal numero) && decimal.TryParse(txtNumero.Text, out decimal porcentaje))
            {
                string kkkkkk = "SERVER=localhost;DATABASE=tesys_tap;Integrated security=true";
                decimal resultado = numero * (porcentaje / 100);
                SqlConnection kkkk = new SqlConnection(kkkkkk);
                lblResultado = resultado.ToString();
                decimal Katsuragi = resultado + numero;
                arkhana = Katsuragi.ToString();
                string yugimoto = "INSERT INTO REGISTRO DE PRODUCTOS (CODIGO,PRODUCTO, PRECIO_VENTA) VALUES (@wea ,@Articulo, @Fecha)";
                kkkk.Open();
                SqlCommand kisei = new SqlCommand(yugimoto, kkkk);
                kisei.Parameters.AddWithValue("@Fecha", arkhana);
                kisei.Parameters.AddWithValue("@Articulo", articulo);
                kisei.Parameters.AddWithValue("@Categoria", categoria);
                kisei.Parameters.AddWithValue("@wea", precio);
                //kisei.ExecuteNonQuery();
                kkkk.Close();
            }
            else
            {
                MessageBox.Show("Ingresa números válidos");
            }
            string WASHIKUMAJILAKELJAMN = "0";
            string kkkkkkkk = "SERVER=localhost;DATABASE=tesys_tap;Integrated security=true";
            SqlConnection kkkkkkkkkkkkkkkk = new SqlConnection(kkkkkkkk);
            kkkkkkkkkkkkkkkk.Open();

            string kk = "INSERT INTO PRODUCTOS (CODIGO,ARTICULO, ENTRADAS , SALIDAS, STOCK) VALUES (@wea ,@Articulo, @Categoria, @Fecha, @Categoria )";

            SqlCommand kkk = new SqlCommand(kk, kkkkkkkkkkkkkkkk);
            kkk.Parameters.AddWithValue("@Fecha", WASHIKUMAJILAKELJAMN);
            kkk.Parameters.AddWithValue("@Articulo", articulo);
            kkk.Parameters.AddWithValue("@Categoria", categoria);
            kkk.Parameters.AddWithValue("@wea", precio);
            kkk.ExecuteNonQuery();
            kkkkkkkkkkkkkkkk.Close();


            
            string kkkkkkkkKkkkkkkkkkkkkkk = "SERVER=localhost;DATABASE=tesys_tap;Integrated security=true";
            SqlConnection kkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkk = new SqlConnection(kkkkkkkkKkkkkkkkkkkkkkk);
            kkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkk.Open();

            string kkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkk = "INSERT INTO Salidas (CODIGO,ARTICULO, FECHA , CANTIDAD) VALUES (@wea ,@Articulo, @Fecha, @Categoria)";

            SqlCommand kkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkk = new SqlCommand(kkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkk, kkkkkkkkkkkkkkkk);
            kkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkk.Parameters.AddWithValue("@Fecha", fecha);
            kkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkk.Parameters.AddWithValue("@Articulo", articulo);
            kkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkk.Parameters.AddWithValue("@Categoria", categoria);
            kkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkkkk.Parameters.AddWithValue("@wea", precio);
            string unused_variable;
            string mandalawea;
            kkkkkkkkkkkkkkkkkkkkkkkkKkkkkkkkkkkkkkk.Close();
            unused_variable = "SERVER=localhost;DATABASE=tesys_tap;Integrated security=true";
            SqlConnection kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk = new SqlConnection(kkkkkkkkKkkkkkkkkkkkkkk);
            kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.Open();
            mandalawea = "el error esta en que no puedo hacer que el programa escriba en la: ";
            string variablemala = "INSERT INTO Entradas (CODIGO,ARTICULO, FECHA , CANTIDAD) VALUES (@wea ,@Articulo, @Fecha, @Categoria)";
            Console.WriteLine(mandalawea + variablemala);
            SqlCommand kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk = new SqlCommand(unused_variable, kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk);
            kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.Parameters.AddWithValue("@Fecha", fecha);
            kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.Parameters.AddWithValue("@Articulo", articulo);
            kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.Parameters.AddWithValue("@Categoria", categoria);
            kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.Parameters.AddWithValue("@wea", precio);
            // comando.Parameters.AddWithValue("@Precio", precio);

            //comando.ExecuteNonQuery();
            kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk.Close();

            MessageBox.Show("Se agrego a la Base de Datos");
            
        }
    }
}
