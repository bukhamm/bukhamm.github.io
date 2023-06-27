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
           
        }

        public int postre_trencito { get; set; }
        public string categoria_postres { get; set; }
        public int precio_trencito { get; set; }

        private void CodigoSinUso_Click (object sender, EventArgs e)
        {
            //Postre Trencito #Producto1
            postre_trencito = 4;//Ira en la Base de Datos
            precio_trencito = 590;//Ira en la Base de Datos
            string trencito_precio = precio_trencito.ToString();
            string trencito_postre = postre_trencito.ToString();
            stock.Text = trencito_postre; //Stock de Postres Trencito
            categoria_postres = "Postres";//Ira en la Base de Datos
            category1.Text = categoria_postres; //Categoria de Postres Trencito
            label4.Text = "$" + trencito_precio;
            //---------------------------------------------------
        }

        private void Productos_Load(object sender, EventArgs e)
        {
            
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            //MSG TO JSON FILE:
            /*
             
             {
               "MSG Text": {
               "0": {
            "ubyte Unused": 0
            "int32 ShitBytePointer": 121153
            "String": "Dialogo1"
            "Ref Node[0]": 65536
            "Ref Node[1]": "Speaker"
            "Ref Node[2]": 198912
            "Ref Node[3]": "pause in text"
    },
    "1": {
            "ubyte Unused"
            "int32 ShitBytePointer"
            "String": "Dialogo1"
            "Ref Node[0]": 65536
            "Ref Node[1]": "Speaker"
            "Ref Node[2]": 198912
            "Ref Node[3]": "pause in text"
    },
    "2": {
            "ubyte Unused"
            "int32 ShitBytePointer"
            "String": "Dialogo1"
            "Ref Node[0]": 65536
            "Ref Node[1]": "Speaker"
            "Ref Node[2]": 198912
            "Ref Node[3]": "pause in text"
    },
    "3": {
            "ubyte Unused"
            "int32 ShitBytePointer"
            "String": "Dialogo1"
            "Ref Node[0]": 65536
            "Ref Node[1]": "Speaker"
            "Ref Node[2]": 198912
            "Ref Node[3]": "pause in text"
    },
    "4": {
            "ubyte Unused"
            "int32 ShitBytePointer"
            "String": "Dialogo1"
            "Ref Node[0]": 65536
            "Ref Node[1]": "Speaker"
            "Ref Node[2]": 198912
            "Ref Node[3]": "pause in text"
    },
    "5": {
            "ubyte Unused"
            "int32 ShitBytePointer"
            "String": "Dialogo1"
            "Ref Node[0]": 65536
            "Ref Node[1]": "Speaker"
            "Ref Node[2]": 198912
            "Ref Node[3]": "pause in text"
    },
    "6": {
            "ubyte Unused"
            "int32 ShitBytePointer"
            "String": "Dialogo1"
            "Ref Node[0]": 65536
            "Ref Node[1]": "Speaker"
            "Ref Node[2]": 198912
            "Ref Node[3]": "pause in text"
    },
    "7": {
            "ubyte Unused"
            "int32 ShitBytePointer"
            "String": "Dialogo1"
            "Ref Node[0]": 65536
            "Ref Node[1]": "Speaker"
            "Ref Node[2]": 198912
            "Ref Node[3]": "pause in text"
    }
       }
          }


            */
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
    }
}
