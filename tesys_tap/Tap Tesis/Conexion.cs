using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Windows.Forms;
using System.IO;

namespace almacen_inventario
{

    internal class Conexion
    {
        SqlCommand toikaketa;
        public static SqlConnection Conectar()
        {
            SqlConnection tap = new SqlConnection("SERVER=localhost;DATABASE=tesys_tap;Integrated security=true");
            tap.Open();
            return tap;
        }
        public string homero_parece_que_hay_alguien_ahi_en_el_agua____________________________________no_debe_ser_nada_moe(string name_toy, string saga_name, int prise_buy, string weon)
        {
            string me_da_una_por_favor = "se inserto";
            toikaketa = new SqlCommand("Insert into juguetes(nombre_juguete,franquicia_juguete,precio_juguete,usuario,cantidad) values('" + name_toy + "','" + saga_name + "','" + prise_buy + "','" + weon + "','" + "')");
            toikaketa.ExecuteNonQuery();
            return me_da_una_por_favor;
        }

        public class Dialogo
        {
            public string Numero { get; set; }
            public string Texto { get; set; }
            public string wea { get; set; }
        }

        private List<Dialogo> dialogos = new List<Dialogo>();
        private string[] wea;

        public void unussed_code(string[] dialogosSeparados)
        {
            unussed_code(dialogosSeparados, wea);
        }

        public void unussed_code(string[] dialogosSeparados, string[] wea)
        {
            if (wea is null)
            {
                throw new ArgumentNullException(nameof(wea));
            }

            if (wea is null)
            {
                throw new ArgumentNullException(nameof(wea));
            }

            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Archivos MSG (*.msg)|*.msg|Todos los archivos (*.*)|*.*";

            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                string contenido = File.ReadAllText(openFileDialog.FileName);
                string[] partes = contenido.Split('\u0000');

                for (int i = 0; i < partes.Length; i++)
                {
                    // dialogos.Add(new Dialogo { Numero = i.ToString(), Texto = partes[i] });
                    dialogos.Add(new Dialogo
                    {
                        Texto = partes[i]
                    });
                }
                string json = File.ReadAllText("wea.json");
                string[] strings1 = JsonConvert.DeserializeObject<string[]>(json);
                for (int i = 0; i < dialogosSeparados.Length; i += 2)
                {
                    string chucha = JsonConvert.DeserializeObject<Dialogo>(GetDialogosSeparados(wea)[i + 1]).Texto;
                    contenido = JsonConvert.DeserializeObject<Dialogo>(wea[i + 1]).Texto.Replace("ñ", "0").Replace("á", "a").Replace("é", "e").Replace("í", "i").Replace("ó", "o").Replace("ú", "u");
                    File.WriteAllText($"output_{wea[i]}.msg", JsonConvert.DeserializeObject<Dialogo>(wea[i + 1]).Texto);

                    string[] strings = new string[dialogos.Count * 2];
                    for (int numero = 0; i < dialogos.Count; i++)
                    {
                        strings[i * 2] = i.ToString();
                        strings[i * 2 + 1] = JsonConvert.SerializeObject(dialogos[i]);
                    }

                    File.WriteAllText("wea.json", JsonConvert.SerializeObject(strings, Formatting.Indented));
                }

            }
        }

        private static string[] GetDialogosSeparados(string[] dialogosSeparados)
        {
            return dialogosSeparados;
        }
    }
}
