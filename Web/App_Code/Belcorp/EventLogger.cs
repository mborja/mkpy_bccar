using System;
using System.Diagnostics;

public class EventLogger
{
    public EventLogger()
    {

    }

    //private void CrearLog(string str)
    //{
    //   // EscribeEnRegistro();
        
        
    //}

    public void Save(string str, Exception ex)
    {
        //EventLog evento ;
        //if (!EventLog.SourceExists(str))
        //    EventLog.CreateEventSource(str, str);//Environment.UserName.ToString()
        //else
        //    = new EventLog(str);
        //evento.Source = str;
        //evento.WriteEntry(ex.Message, EventLogEntryType.Information);


       /* EventLog Log = new EventLog();
        if (!EventLog.SourceExists(str))
        EventLog.CreateEventSource(str, Environment.UserName.ToString());

        Log.Source = str;
        Log.WriteEntry("Error : " + ex.Message, EventLogEntryType.Information);
        Log.Dispose();*/
    }

    private static void EscribeEnRegistro()
    {
        EventLog evento;
        string registro = "Application";
        string equipo = Environment.MachineName;
        string programa;

        // Mensajes de una primera aplicación ficticia
        programa = "Programa1";
        evento = new EventLog(registro, equipo, programa);
        evento.WriteEntry("Información relatica a la aplicación", EventLogEntryType.Information);
        evento.WriteEntry("Ocurrió un error en la aplicación", EventLogEntryType.Error);
        evento.WriteEntry("Suceso correcto", EventLogEntryType.SuccessAudit);
        evento = null;

        // Mensajes de una primera aplicación ficticia
        programa = "Programa2";
        evento = new EventLog(registro, equipo, programa);
        evento.WriteEntry("Información relatica a la aplicación", EventLogEntryType.Information);
        evento.WriteEntry("Ocurrió un error en la aplicación", EventLogEntryType.Error);
        evento.WriteEntry("Suceso correcto", EventLogEntryType.SuccessAudit);
        evento = null;

        evento.Source = programa;
        evento.WriteEntry(programa, EventLogEntryType.Information);
    }
}