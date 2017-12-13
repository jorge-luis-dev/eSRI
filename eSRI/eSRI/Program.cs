using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace eSRI
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            String anio;
            String mes;
            if (args.Length == 2)
            {
                anio=args[0];
                mes=args[1];
            }
            else
            {
                System.DateTime moment = DateTime.Now; ;
                int year = moment.Year;
                int month = moment.Month;

                anio = year.ToString();
                mes = month.ToString();
            }
            Application.Run(new Main(anio,mes));
        }
    }
}
