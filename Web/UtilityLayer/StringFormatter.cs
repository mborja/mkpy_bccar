using System;
using System.Collections.Generic;
using System.Text;

namespace UtilityLayer
{
    public class StringFormatter
    {
        /**
         * Método que devuelve una cadena sin primera y última letra.
         * Sirve para recortar parámetros como: "02" en: 02
         */
        public static String removeFirstAndLastCharacter(String chain)
        {
            return chain.Substring(1, chain.Length - 2).Trim() ;
        }

        /**
         * Método que devuelve el código asignado en DB para los paises
         * (Se recomienda utilizar el que brinda belcorp ya que es GLOBAL (mal diseño de DB)
         */
        public static int convertCountryIsoToNumber(String countryIsoID)
        {
            // Estos datos son estáticos en DB, pero podría hacerse en el DAO para que sea dinámico (Consumo de recursos en consultas)
            int countryIDNumber = 0;

            switch (countryIsoID)
            {
                case "DO":
                    countryIDNumber = 8;
                    break;
                case "PR":
                    countryIDNumber = 7;
                    break;

            }

            return countryIDNumber;
        }
    }
}
