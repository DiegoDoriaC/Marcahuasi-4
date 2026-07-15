using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppMarcahuasi.Utils
{
    public static class Parametros
    {
        private static string _userLogin = "";

        public static string UserLogin
        {
            get { return _userLogin; }
            set { _userLogin = value; }
        }

        public static string Correlativo
        {
            get { return "C4-" + DateTime.Now.ToString("yy"); }
        }

        public static readonly string NumeroCaja = "CAJA - 04";
        public static readonly int PrecioEstudiante = 10;
        public static readonly int PrecioNacional = 15;
        public static readonly int PrecioInternacional = 25;
    }
}