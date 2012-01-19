using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Configuration;

/// <summary>
/// Summary description for Log
/// </summary>
public class Log
{
    public Log()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static int lanzarError(Exception ex)
    {

        StringBuilder errorInfo = new StringBuilder();

        //obtenemos la traza del error
        System.Diagnostics.StackTrace trace = new System.Diagnostics.StackTrace(ex, true);

        //creamos un contenido que incluiremos en el log del error
        errorInfo.Append("\n" + "Método local: " + ex.TargetSite.ToString() + "\n");
        errorInfo.Append("Código: " + ex.Source + "\n");
        errorInfo.Append("Mensaje de Error: " + ex.Message + "\n");
        errorInfo.Append("Traza de la Pila: " + ex.StackTrace + "\n");
        errorInfo.Append("*******************************************************************" + "\n");
        errorInfo.Append("*******************************************************************" + "\n");
        errorInfo.Append("Excepción:" + ex.ToString());
        errorInfo.Append("*******************************************************************" + "\n");
        errorInfo.Append("*******************************************************************" + "\n");

        //añadimos información adicional (Es necesario cargar el .pbd de la aplicación)
        errorInfo.Append("Método:" + trace.GetFrame(0).GetMethod().Name + "\n");
        errorInfo.Append("Linea:" + trace.GetFrame(0).GetFileLineNumber().ToString() + "\n");
        errorInfo.Append("Columna:" + trace.GetFrame(0).GetFileColumnNumber().ToString() + "\n");

        //obtenemos el nombre del fichero añadiendo un sufijo
        string nombreFichero = obtenerNombreFichero("CAUGH_EX");

        //escribimos en el fichero del log
        if (escribirFichero(errorInfo.ToString(), nombreFichero) == -1)
        {
            return -1;
        }
        else
        {
            return 1;
        }

    }

    public static int lanzarError(HttpContext ctx)
    {
        //Deberemos pasar información de la sesión desde nuestra aplicación
        //HttpContext ctx = HttpContext.Current;

        //obtenemos le ultimo error ocurrido
        Exception exception = ctx.Server.GetLastError();
        StringBuilder errorInfo = new StringBuilder();

        //obtenemos la traza del error
        System.Diagnostics.StackTrace trace = new System.Diagnostics.StackTrace(exception, true);

        //creamos un contenido que incluiremos en el log del error
        errorInfo.Append("\n" + "Página del Error contexto: " + ctx.Request.Url.ToString() + "\n");
        errorInfo.Append("Código: " + exception.Source + "\n");
        errorInfo.Append("Mensaje de Error: " + exception.Message + "\n");
        errorInfo.Append("Traza de la Pila: " + exception.StackTrace + "\n");
        errorInfo.Append("*******************************************************************" + "\n");
        errorInfo.Append("*******************************************************************" + "\n");
        errorInfo.Append("Excepción:" + exception.ToString());
        errorInfo.Append("*******************************************************************" + "\n");
        errorInfo.Append("*******************************************************************" + "\n");

        //añadimos información adicional (Es necesario cargar el .pbd de la aplicación)
        errorInfo.Append("Método:" + trace.GetFrame(0).GetMethod().Name + "\n");
        errorInfo.Append("Linea:" + trace.GetFrame(0).GetFileLineNumber().ToString() + "\n");
        errorInfo.Append("Columna:" + trace.GetFrame(0).GetFileColumnNumber().ToString() + "\n");

        //obtenemos el nombre del fichero añadiendo un sufijo
        string nombreFichero = obtenerNombreFichero("UNCAUGH_EX");

        //escribimos en el fichero del log
        if (escribirFichero(errorInfo.ToString(), nombreFichero) == -1)
        {
            return -1;
        }
        else
        {
            return 1;
        }

    }

    protected static string obtenerNombreFichero(string sufijo)
    {
        string fecError = "";
        string codError = "";
        DateTime Now = System.DateTime.Now;
        //DateTimeFormatInfo dfi = new DateTimeFormatInfo();

        //establecemos el formato que tendrá la fecha incluida en el nombre
        //dfi.FullDateTimePattern = "dd-MM-yyyy_HHmmss";

        fecError = String.Format("{0:dd-MM-yyyy_hh.mm.ss}", Now);

        codError = fecError + "_" + sufijo;

        string nombreFichero = "Error_" + codError + ".txt";

        return nombreFichero;

    }

    protected static int escribirFichero(string texto, string nombreFichero)
    {

        //obtenemos la ruta donde crearemos el log. Podemos enviarla desde nuestra aplicación
        string ruta = ConfigurationSettings.AppSettings.Get("errorPath") + "\\errores\\";

        //controlamos que existe la ruta y si no la creamos
        if (!System.IO.Directory.Exists(ruta))
        {
            System.IO.Directory.CreateDirectory(ruta);
        }

        //creamos el flujo de salida para escribir
        System.IO.StreamWriter sw = new System.IO.StreamWriter(ruta + nombreFichero, false);

        try
        {
            //intentamos escribir en el fichero
            sw.Write(texto);
            sw.Flush();
            return 1;
        }
        catch (Exception ex)
        {
            return -1;
        }
        finally
        {
            sw.Close();
        }

    }


}
