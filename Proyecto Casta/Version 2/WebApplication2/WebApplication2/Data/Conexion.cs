using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace WebApplication2.Data
{
    public class Conexion
    {
        public readonly string cadena = ConfigurationManager.ConnectionStrings["cadenaSQL"].ToString();

        public string GetConexion()
        {
            return cadena;
        }
    }
}