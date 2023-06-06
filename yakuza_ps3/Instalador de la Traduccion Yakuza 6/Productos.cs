using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Instalador_de_la_Traduccion_Yakuza_6
{
    public partial class Productos : Form
    {
        public Productos()
        {
            InitializeComponent();
            //Postre Trencito #Producto1
            postre_trencito = 4;
            string trencito_postre = postre_trencito.ToString();
            //---------------------------------------------------
        }

        public int postre_trencito { get; set; }

        private void Productos_Load(object sender, EventArgs e)
        {
            
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
