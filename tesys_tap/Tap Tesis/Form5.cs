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

namespace almacen_inventario
{
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
        }

        public string fecha { get; set; }
        public string articulo { get; set; }
        public string categoria { get; set; }
        public string precio { get; set; }  

        private void button1_Click(object sender, EventArgs e)
        {
            Random random = new Random(DateTime.Now.Millisecond);
            fecha = DateTime.Now.ToString();
            string nandoMO = random.ToString();
            int numeroEntero = random.Next(101);
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
        }
    }
}
