using System;
using System.Collections.Generic;
using System.Text;

namespace UtilityLayer
{
    public class DateFormatter
    {
        public static String getShortTime(DateTime date)
        {
            return date.ToShortDateString();
        }

        public static String getTimestamp(DateTime value)
        {
            return value.ToString("yyyyMMddHHmmssffff");
        }

        /**
         * Método que recibe una cadena como parámetro (yyyymmdd) y la retorna (dd/mm/yyyy)
         */
        public static String getStringDate(String strDate)
        {
            return strDate.Substring(6, 2) + "/" + strDate.Substring(4, 2) + "/" + strDate.Substring(0, 4);
        }
    }
}
