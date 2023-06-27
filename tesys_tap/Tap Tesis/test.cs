using Instalador_de_la_Traduccion_Yakuza_6;
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
    public partial class test : Form
    {
        public test()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form3 tap = new Form3();

            tap.Show();
        }

        private void test_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'tesys_tapDataSet4.REGISTRO_DE_PRODUCTOS' Puede moverla o quitarla según sea necesario.
            this.rEGISTRO_DE_PRODUCTOSTableAdapter.Fill(this.tesys_tapDataSet4.REGISTRO_DE_PRODUCTOS);

        }
    }
}
