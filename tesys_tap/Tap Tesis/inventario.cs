using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
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

        private void button1_Click(object sender, EventArgs e)
        {
            
            ARTICULO.Text = articulo;
            CAATEGORIA.Text = categoria;
            PRECIO.Text = wea;
             precio=   Convert.ToInt32(wea);
            vendo_donuts_donuts_donuts_vendo_donuts.homero_parece_que_hay_alguien_ahi_en_el_agua____________________________________no_debe_ser_nada_moe(articulo, wea, categoria, fecha, codigo);
        }
    }
}
