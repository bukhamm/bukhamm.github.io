using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

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
            toikaketa = new SqlCommand("Insert into juguetes(nombre_juguete,franquicia_juguete,precio_juguete,usuario,cantidad) values('" + name_toy + "','" + saga_name + "','" + prise_buy + "','" + weon + "','"  + "')");
            toikaketa.ExecuteNonQuery();
            return me_da_una_por_favor;
        }
    }
}
