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
        public static SqlConnection Conectar()
        {
            SqlConnection tap = new SqlConnection("SERVER=localhost;DATABASE=tesys_tap;Integrated security=true");
            tap.Open();
            return tap;
        }
    }
}
