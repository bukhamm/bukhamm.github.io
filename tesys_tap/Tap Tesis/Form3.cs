//Cuesta conectar esto a la Base de Datos po'
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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }
        public string precio_compra { get; set; }
        public string utilidad { get; set; } 
        public string precio_venta { get; set; }
        public string precio_utilidad { get; set; }
        private void Form3_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'tesys_tapDataSet.Productos' Puede moverla o quitarla según sea necesario.
           // this.productosTableAdapter.Fill(this.tesys_tapDataSet.Productos);

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox1.Text = precio_compra;
            textBox2.Text = utilidad;
            int precio = Convert.ToInt32(precio_compra);
            float utility = Convert.ToInt32(utilidad);
            float porcent = utility / 100;
            float utilidadValor = (precio * porcent) + precio;
            float Utilidad = precio * porcent;
            precio_venta = Convert.ToString(utilidadValor);
            precio_utilidad = Convert.ToString(Utilidad);
            string basura1 = precio_utilidad;
            string basura2 = precio_venta;
            Console.WriteLine(basura2 + basura1);
            double test = (500 * 0.5);
            double test2 = 50 / 100;
            double test3 = (500 * test2);
            double test4 = (test + test2 + test3);
            string prueba = Convert.ToString(test4);
            textBox4.Text = prueba;
        }

        private void contabilizacion_Click(object sender, EventArgs e)
        {
            
            
        }
    }

    internal class Command
    {
        internal static SqlDataReader ExecuteReader()
        {
            throw new NotImplementedException();
        }



    }
}
