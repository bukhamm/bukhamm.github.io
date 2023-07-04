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
            this.Opacity = 0.7;
        }
        public string precio_compra { get; set; }
        public decimal wea { get; set; }
        decimal porcentaje {  get; set; }
        public string utilidad { get; set; } 
        public string precio_venta { get; set; }
        public decimal Katsuragi { get; set; }  
        public string precio_utilidad { get; set; }
        private void Form3_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'tesys_tapDataSet.Productos' Puede moverla o quitarla según sea necesario.
           // this.productosTableAdapter.Fill(this.tesys_tapDataSet.Productos);

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox1.Text = precio_compra;
            txtNumero.Text = utilidad;
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
            lblResultado.Text = prueba;
            int numero = 500;
            decimal porcentaje = 0.4m;

            decimal resultado = numero * porcentaje;

            Console.WriteLine(resultado);
        }

        private void WeaMalHecha_Click(object sender, EventArgs e)
        {
            if (decimal.TryParse(txtNumero.Text, out decimal numero))
            {
                porcentaje = numero * 0.01m; // Calcula el porcentaje dividendo por 100

                string basura = porcentaje.ToString("P2"); // Muestra el resultado como porcentaje en el Label

                string precio = textBox1.Text;
                int yecta = Convert.ToInt32(precio);
                decimal valorPrecio = Convert.ToDecimal(precio);
                Console.Write(valorPrecio + yecta);
                Console.WriteLine(basura);
                wea = numero * 0.01m;
                decimal calcilo = (valorPrecio * wea);
                lblResultado.Text += calcilo.ToString();
                decimal chantipanturila = calcilo + valorPrecio;
                textBox3.Text = chantipanturila.ToString();

            }
            else
            {
                MessageBox.Show("Ingresa un número válido");
            }
        }

        private void CodigoQueNoSirve_Click(object sender, EventArgs e)
        {
            decimal yawa, kaky;
            textBox1.Text = precio_compra;
            txtNumero.Text = utilidad;
            yawa = Convert.ToDecimal(precio_compra);
            kaky = Convert.ToDecimal(utilidad);
            decimal adevererchy = (yawa * kaky);
            lblResultado.Text = adevererchy.ToString();
        }



        private void contabilizacion_Click(object sender, EventArgs e)
        {

            if (decimal.TryParse(textBox1.Text, out decimal numero) && decimal.TryParse(txtNumero.Text, out decimal porcentaje))
            {
                decimal resultado = numero * (porcentaje / 100);

                lblResultado.Text = resultado.ToString();
                Katsuragi = resultado + numero;
                textBox3.Text = Katsuragi.ToString();
            }
            else
            {
                MessageBox.Show("Ingresa números válidos en 'Precio Compra' y '% Utilidad'");
            }


        }

        private void basura_click(object sender, EventArgs e) {

            int CalculoPrecio, CalculoUtilidad, ValorFinal;
            textBox1.Text = precio_compra;
            txtNumero.Text = utilidad;
            CalculoPrecio = Convert.ToInt32(precio_compra);
            CalculoUtilidad = Convert.ToInt32(utilidad);
            int total = CalculoPrecio + CalculoUtilidad;
            string CalculoBasura = Convert.ToString(total);
            textBox3.Text = CalculoBasura;
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
