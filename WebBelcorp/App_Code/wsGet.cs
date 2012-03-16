using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Xml;
using Root.Reports;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Web.Configuration;

using BusinessLayer;
using EntityLayer;
using UtilityLayer;
using System.Collections.Generic;

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

/// <summary>
/// web services para la conexion con los BBs
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]

[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class wsGet : System.Web.Services.WebService
{

    private IncorporacionBL incorporacionBL;
    private SeguimientoBL seguimientoBL;
    private ReingresoBL reingresoBL;

    ConexionDatos con = new ConexionDatos();
    string xmlCabecera = "<?xml version=\"1.0\" encoding=\"iso-8859-1\" ?>";
    public wsGet()
    {
        incorporacionBL = new IncorporacionBL();
        seguimientoBL = new SeguimientoBL();
        reingresoBL = new ReingresoBL();
    }


    //APPID 0xcc76ecb46671657aL

    /***
     * 
     * METODOS GET
     * 
     ***/

    [WebMethod]
    public XmlDocument Validacion(string APPID, int IDPAIS, string PIN, string IMSI, string ZONA)
    {
        if (APPID.Equals(con.APPID()))
        {
            string sql = "EXEC [SP_WS_VALIDACION] '" + APPID + "','" + IDPAIS + "','" + PIN + "','" + IMSI + "','" + ZONA + "'";
            DataTable dt = con.AccesoDatos(sql);

            if (Convert.ToString(dt.Rows[0][0]).Equals("0|"))
            {
                string resultado = Convert.ToString(dt.Rows[0][1]);
                return crearXml(resultado);
            }
            else
            {
                return cargarData(dt);
            }
        }
        else
        {
            string resultado = "0|No existe el código APPID";
            return crearXml(resultado);
        }
    }

    [WebMethod]
    public XmlDocument getContacto(string APPID, int IDPAIS, string PIN, string IMSI)
    {
        if (APPID.Equals(con.APPID()))
        {
            string sql = "EXEC SP_WS_LISTADO_CONTACTO '" + APPID + "','" + IDPAIS + "','" + PIN + "','" + IMSI + "'";
            DataTable dt = con.AccesoDatos(sql);

            if (Convert.ToString(dt.Rows[0][0]).Equals("0|"))
            {
                string resultado = Convert.ToString(dt.Rows[0][1]);
                return crearXml(resultado);
            }
            else
            {
                return cargarData(dt);
            }
        }
        else
        {
            string resultado = "0|No existe el código APPID";
            return crearXml(resultado);
        }
    }

    [WebMethod]
    public XmlDocument getOtraMarca(string APPID, int IDPAIS, string PIN, string IMSI)
    {
        if (APPID.Equals(con.APPID()))
        {
            string sql = "EXEC SP_WS_LISTADO_OTRA_MARCA '" + APPID + "','" + IDPAIS + "','" + PIN + "','" + IMSI + "'";
            DataTable dt = con.AccesoDatos(sql);

            if (Convert.ToString(dt.Rows[0][0]).Equals("0|"))
            {
                string resultado = Convert.ToString(dt.Rows[0][1]);
                return crearXml(resultado);
            }
            else
            {
                return cargarData(dt);
            }
        }
        else
        {
            string resultado = "0|No existe el código APPID";
            return crearXml(resultado);
        }
    }

    [WebMethod]
    public XmlDocument getTipoDocumento(string APPID, int IDPAIS, string PIN, string IMSI)
    {
        if (APPID.Equals(con.APPID()))
        {
            string sql = "EXEC SP_WS_LISTADO_DOC_IDENTIDAD '" + APPID + "','" + IDPAIS + "','" + PIN + "','" + IMSI + "'";
            DataTable dt = con.AccesoDatos(sql);

            if (Convert.ToString(dt.Rows[0][0]).Equals("0|"))
            {
                string resultado = Convert.ToString(dt.Rows[0][1]);
                return crearXml(resultado);
            }
            else
            {
                return cargarData(dt);
            }
        }
        else
        {
            string resultado = "0|No existe el código APPID";
            return crearXml(resultado);
        }
    }

    [WebMethod]
    public XmlDocument getEstadoCivil(string APPID, int IDPAIS, string PIN, string IMSI)
    {
        if (APPID.Equals(con.APPID()))
        {
            string sql = "EXEC SP_WS_LISTADO_ESTADO_CIVIL '" + APPID + "','" + IDPAIS + "','" + PIN + "','" + IMSI + "'";
            DataTable dt = con.AccesoDatos(sql);

            if (Convert.ToString(dt.Rows[0][0]).Equals("0|"))
            {
                string resultado = Convert.ToString(dt.Rows[0][1]);
                return crearXml(resultado);
            }
            else
            {
                return cargarData(dt);
            }
        }
        else
        {
            string resultado = "0|No existe el código APPID";
            return crearXml(resultado);
        }
    }

    [WebMethod]
    public XmlDocument getNivelEducativo(string APPID, int IDPAIS, string PIN, string IMSI)
    {
        if (APPID.Equals(con.APPID()))
        {
            string sql = "EXEC SP_WS_LISTADO_NIVEL_EDUCATIVO '" + APPID + "','" + IDPAIS + "','" + PIN + "','" + IMSI + "'";
            DataTable dt = con.AccesoDatos(sql);

            if (Convert.ToString(dt.Rows[0][0]).Equals("0|"))
            {
                string resultado = Convert.ToString(dt.Rows[0][1]);
                return crearXml(resultado);
            }
            else
            {
                return cargarData(dt);
            }
        }
        else
        {
            string resultado = "0|No existe el código APPID";
            return crearXml(resultado);
        }
    }

    [WebMethod]
    public XmlDocument getVinculo(string APPID, int IDPAIS, string PIN, string IMSI)
    {
        if (APPID.Equals(con.APPID()))
        {
            string sql = "EXEC SP_WS_LISTADO_VINCULO '" + APPID + "','" + IDPAIS + "','" + PIN + "','" + IMSI + "'";
            DataTable dt = con.AccesoDatos(sql);

            if (Convert.ToString(dt.Rows[0][0]).Equals("0|"))
            {
                string resultado = Convert.ToString(dt.Rows[0][1]);
                return crearXml(resultado);
            }
            else
            {
                return cargarData(dt);
            }
        }
        else
        {
            string resultado = "0|No existe el código APPID";
            return crearXml(resultado);
        }
    }


    [WebMethod]
    public XmlDocument getDivPolitica(string APPID, int IDPAIS, string PIN, string IMSI)
    {
        if (APPID.Equals(con.APPID()))
        {
            string sql = "EXEC usp_bel_ws_listado_divpolitica '" + APPID + "','" + IDPAIS + "','" + PIN + "','" + IMSI + "'";
            DataTable dt = con.AccesoDatos(sql);

            if (Convert.ToString(dt.Rows[0][0]).Equals("0|"))
            {
                string resultado = Convert.ToString(dt.Rows[0][1]);
                return crearXml(resultado);
            }
            else
            {
                return cargarData(dt);
            }
        }
        else
        {
            string resultado = "0|No existe el código APPID";
            return crearXml(resultado);
        }
    }

    [WebMethod]
    public XmlDocument RegistroIncorporacion
    (
        string APPID,
            string IDPAIS,
            string PIN,
            string IMSI,
            string CODIGOZONA,
            string FECHA,
            string TIPOGRABACION,
            string CODIGOTERRITORIO,
            string IDCONTACTO,
            string CODIGOCONSULTORARECOMIENDA,
            string APELLIDOPATERNO,
            string APELLIDOMATERNO,
            string PRIMERNOMBRE,
            string SEGUNDONOMBRE,
            string FECHANACIMIENTO,
            string NRODOCUMENTO,
            string TELEFONOCASA,
            string TELEFONOCELULAR,
            string CORREOELECTRONICO,
            string SOLICITANTE_DIRECCION,
            string SOLICITANTE_REFERENCIA,
            string SOLICITANTE_CODIGOPOSTAL,
            string SOLICITANTE_DIVISIONPOLITICA1,
            string SOLICITANTE_DIVISIONPOLITICA2,
            string IDESTADOCIVIL,
            string IDNIVELEDUCATIVO,
            string IDOTRAMARCA,
            string REFFAM_NOMBRES,
            string REFFAM_APELLIDOPATERNO,
            string REFFAM_APELLIDOMATERNO,
            string REFFAM_DIRECCION,
            string REFFAM_TELEFONO,
            string REFFAM_CELULAR,
            string REFFAM_IDVINCULO,
            string REFNOFAM_NOMBRES,
            string REFNOFAM_APELLIDOPATERNO,
            string REFNOFAM_APELLIDOMATERNO,
            string REFNOFAM_DIRECCION,
            string REFNOFAM_TELEFONO,
            string REFNOFAM_CELULAR,
            string REFNOFAM_IDVINCULO,
            string ENTREGA_DIRECCION,
            string ENTREGA_DIVISIONPOLITICA,
            string ENTREGA_CODIGOPOSTAL,
            string ENTREGA_REFERENCIA,
            string RECORD_FECHAVISITA,
            string RECORD_OBSERVACION,
            string RECORD_PIN,
            string RECORD_IMSI,
            string RECORD_LONGITUD,
            string RECORD_LATITUD,
            string RECORD_MARGEN,
            string RECORD_NROSATELITES,
            string ADICIONAL_PROFESION,
            string ADICIONAL_LUGARTRABAJO,
            string ADICIONAL_TELEFONOTRABAJO,
            string ADICIONAL_HORAVISITA,
            string ADICIONAL_NROHIJOS,
            string ADICIONAL_NROINFANTES,
            string ADICIONAL_NROESCOLARES,
            string ADICIONAL_NRONIVELSUPERIOR,
            string ADICIONAL_NROADULTOS
        )
    {
        string resultado = "";

        if (APPID.Equals(con.APPID()))
        {
            //resultado = con.AccesoDatosIngreso(sql);
            IncorporacionBE iBE = new IncorporacionBE();
            iBE.paisID = Convert.ToInt32(IDPAIS);
            iBE.Pin = PIN;
            iBE.Imsi = IMSI;
            iBE.ZonaCodigo = CODIGOZONA;
            iBE.territorioCodigo = CODIGOTERRITORIO;
            iBE.consultoraRecomendadoraCodigo = CODIGOCONSULTORARECOMIENDA;
            iBE.fechaRegistro = FECHA; // <<< revisar
            iBE.PrimerNombre = PRIMERNOMBRE;
            iBE.SegundoNombre = SEGUNDONOMBRE;
            iBE.apellidoPaterno = APELLIDOPATERNO;
            iBE.apellidoMaterno = APELLIDOMATERNO;
            iBE.numeroDocumento = NRODOCUMENTO;
            iBE.telefonoCasa = TELEFONOCASA;
            iBE.telefonoCelular = TELEFONOCELULAR;
            iBE.email = CORREOELECTRONICO;
            iBE.tablaContactoID = Convert.ToInt32(IDCONTACTO);
            iBE.tablaOtraMarcaID = Convert.ToInt32(IDOTRAMARCA);
            iBE.tablaEstadoCivilID = Convert.ToInt32(IDESTADOCIVIL);
            iBE.tablaNivelEducativoID = Convert.ToInt32(IDNIVELEDUCATIVO);
            iBE.fechaNacimiento = FECHANACIMIENTO;
            iBE.solicitudDireccion = SOLICITANTE_DIRECCION;
            iBE.solicitudCodigoPostal = SOLICITANTE_CODIGOPOSTAL;
            iBE.solicitudReferencia = SOLICITANTE_REFERENCIA;
            iBE.solicitudDivisionPolitica1 = SOLICITANTE_DIVISIONPOLITICA1;
            iBE.solicitudDivisionPolitica2 = SOLICITANTE_DIVISIONPOLITICA2;
            iBE.entregaDireccion = ENTREGA_DIRECCION;
            iBE.entregaCodigoPostal = ENTREGA_CODIGOPOSTAL;
            iBE.entregaReferencia = ENTREGA_REFERENCIA;
            iBE.entregaDivisionPolitica = ENTREGA_DIVISIONPOLITICA;
            iBE.referenciaFamiliarNombres = REFFAM_NOMBRES;
            iBE.referenciaFamiliarApellidoPaterno = REFFAM_APELLIDOPATERNO;
            iBE.referenciaFamiliarApellidoMaterno = REFFAM_APELLIDOMATERNO;
            iBE.referenciaFamiliarDireccion = REFFAM_DIRECCION;
            iBE.referenciaFamiliarTelefono = REFFAM_TELEFONO;
            iBE.referenciaFamiliarCelular = REFFAM_CELULAR;
            iBE.tablaReferenciaFamiliarTipoVinculoID = Convert.ToInt32(REFFAM_IDVINCULO);
            iBE.referenciaNoFamiliarNombres = REFNOFAM_NOMBRES;
            iBE.referenciaNoFamiliarApellidoPaterno = REFNOFAM_APELLIDOPATERNO;
            iBE.referenciaNoFamiliarApellidoMaterno = REFNOFAM_APELLIDOMATERNO;
            iBE.referenciaNoFamiliarDireccion = REFNOFAM_DIRECCION;
            iBE.referenciaNoFamiliarTelefono = REFNOFAM_TELEFONO;
            iBE.referenciaNoFamiliarCelular = REFNOFAM_CELULAR;
            iBE.tablaReferenciaNoFamiliarTipoVinculoID = Convert.ToInt32(REFNOFAM_IDVINCULO);
            iBE.adicionalProfesion = ADICIONAL_PROFESION;
            iBE.adicionalLugarTrabajo = ADICIONAL_LUGARTRABAJO;
            iBE.adicionalTelefonoTrabajo = ADICIONAL_TELEFONOTRABAJO;
            iBE.adicionalHoraVisita = ADICIONAL_HORAVISITA;
            iBE.adicionalNumeroHijos = Convert.ToInt32(ADICIONAL_NROHIJOS);
            iBE.adicionalNumeroInfantes = Convert.ToInt32(ADICIONAL_NROINFANTES);
            iBE.adicionalNumeroEscolares = Convert.ToInt32(ADICIONAL_NROESCOLARES);
            iBE.adicionalNumeroNivelSuperior = Convert.ToInt32(ADICIONAL_NRONIVELSUPERIOR);
            iBE.adicionalNumeroAdultos = Convert.ToInt32(ADICIONAL_NROADULTOS);
            iBE.recPin = RECORD_PIN;
            iBE.recIMSI = RECORD_IMSI;
            iBE.recLongitud = RECORD_LONGITUD;
            iBE.recLatitud = RECORD_LATITUD;
            iBE.recMargen = RECORD_MARGEN;
            iBE.recNumeroSatelites = Convert.ToInt32(RECORD_NROSATELITES);
            iBE.recObservacion = RECORD_OBSERVACION;
            iBE.recFechaVisita = RECORD_FECHAVISITA;
            iBE.modoGrabacion = TIPOGRABACION;
            
            try {
                resultado = incorporacionBL.ws_registroIncorporacion(iBE, APPID);
                if (resultado.Split('|')[0] == "1") enviaCorreoIncorporacion(iBE);
            }
            catch (Exception ex) {
                Log.lanzarError(ex);
                resultado = "100|" + ex.Message;
            }

        }
        else
            resultado = "101|No existe el código APPID";

        return crearXml(resultado);
    }

    [WebMethod]
    public XmlDocument RegistroReingreso
        (
        string APPID,
        string IDPAIS,
        string PIN,
        string IMSI,
        string CODIGOZONA,
        string CAMPANHA,
        string FECHA,
        string CODIGOCONSULTORA,
        string NOMBRES,
        string APELLIDOPATERNO,
        string APELLIDOMATERNO,
        string NRODOCUMENTO,
        string TELEFONO1,
        string TELEFONO2,
        string RECORD_FECHAVISITA,
        string RECORD_OBSERVACION,
        string RECORD_PIN,
        string RECORD_IMSI,
        string RECORD_LONGITUD,
        string RECORD_LATITUD,
        string RECORD_MARGEN,
        string RECORD_NROSATELITES
        )
    {

        string resultado = "";

        if (APPID.Equals(con.APPID()))
        {
            ReingresoBE r = new ReingresoBE();

            r.paisID = Convert.ToInt32(IDPAIS);
            r.Pin = PIN;
            r.Imsi = IMSI;
            r.zonaCodigo = CODIGOZONA;
            r.Campanha = CAMPANHA;
            r.Fecha = FECHA;
            r.consultoraCodigo = CODIGOCONSULTORA;
            r.nombres = NOMBRES;
            r.apellidoPaterno = APELLIDOPATERNO;
            r.apellidoMaterno = APELLIDOMATERNO;
            r.documentoNumero = NRODOCUMENTO;
            r.telefono1 = TELEFONO1;
            r.telefono2 = TELEFONO2;
            r.recPin = RECORD_PIN;
            r.recImsi = RECORD_IMSI;
            r.recLongitud = RECORD_LONGITUD;
            r.recLatitud = RECORD_LATITUD;
            r.recMargen = RECORD_MARGEN;
            r.recNumeroSatelites = Convert.ToInt32(RECORD_NROSATELITES);
            r.recObservacion = RECORD_OBSERVACION;
            r.recFechaVisita = RECORD_FECHAVISITA;

            try
            {
                resultado = reingresoBL.ws_registroReingreso(r, APPID);
                if(resultado.Split('|')[0]=="1") enviaCorreoReingreso(r);
            }
            catch (Exception ex)
            {
                Log.lanzarError(ex);
                resultado = "100|"+ ex.Message;
            }

        }
        else
            resultado = "101|No existe el código APPID";
        return crearXml(resultado);
    }

    [WebMethod]
    public XmlDocument RegistroSeguimiento
        (
        string APPID,
        string IDPAIS,
        string PIN,
        string IMSI,
        string CODIGOZONA,
        string CAMPANHA,
        string FECHA,
        string OBSERVACION,
        string NRODOC,
        string CODIGO_CONSULTORA,
        string FECHA_INGRESO,
        string RECORD_FECHAVISITA,
        string RECORD_OBSERVACION,
        string RECORD_PIN,
        string RECORD_IMSI,
        string RECORD_LONGITUD,
        string RECORD_LATITUD,
        string RECORD_MARGEN,
        string RECORD_NROSATELITES
        )
    {

        string resultado = "";

        if (APPID.Equals(con.APPID()))
        {
            SeguimientoBE s = new SeguimientoBE();
            s.PaisID = Convert.ToInt32(IDPAIS);
            s.Pin = PIN;
            s.Imsi = IMSI;
            s.ZonaCodigo = CODIGOZONA;
            s.Campanha = CAMPANHA;
            s.Fecha = FECHA;
            s.ConsultoraCodigo = CODIGO_CONSULTORA;
            s.documentoNumero = NRODOC;
            s.Observacion = OBSERVACION;
            s.FechaIngreso = FECHA_INGRESO;
            s.RecordPin = RECORD_PIN;
            s.RecordImsi = RECORD_IMSI;
            s.RecordLongitud = RECORD_LONGITUD;
            s.RecordLatitud = RECORD_LATITUD;
            s.RecordMargen = RECORD_MARGEN;
            s.RecordNumeroSatelites = RECORD_NROSATELITES;
            s.RecordObservacion = RECORD_OBSERVACION;
            s.RecordFechaVisita = RECORD_FECHAVISITA;

            try
            {
                resultado = seguimientoBL.ws_registroSeguimiento(s, APPID);
                if (resultado.Split('|')[0] == "1") enviaCorreoSeguimiento(s);
            }
            catch (Exception ex)
            {
                Log.lanzarError(ex);
                resultado = "100|" + ex.Message;
            }


        }
        else
            resultado = "101|No existe el código APPID";
        return crearXml(resultado);
    }

    private XmlDocument cargarData(DataTable dt)
    {
        XmlDocument document2 = new XmlDocument();

        string Resultado = "";
        try
        {
            int rowSize = dt.Rows.Count;
            for (int i = 0; i < rowSize; i++)
            {
                Resultado += "<A>";
                int colSize = dt.Columns.Count;
                for (int c = 0; c < colSize; c++)
                {
                    Resultado += Convert.ToString(dt.Rows[i][c]);
                    if (c != colSize - 1)
                        Resultado += "|";
                }
                Resultado += "</A>";
            }
            document2.LoadXml(xmlCabecera + "<R>" + Resultado + "</R>");
            return document2;
        }
        catch (Exception e)
        {
            document2.LoadXml(xmlCabecera + "<R/>");
            return document2;
        }
    }

    private XmlDocument crearXml(String resultado)
    {
        XmlDocument document = new XmlDocument();
        string Contenido = "<A> " + resultado + " </A>";
        document.LoadXml(xmlCabecera + "<R>" + Contenido + "</R>");
        return document;
    }

    public void enviaCorreoIncorporacion(IncorporacionBE iBE)
    {
        String usuariosmtp = "", clavesmtp = "", hostsmtp = "", emailorigen = "";
        int puertosmtp = 25;
        Correo correo = new Correo();
        SmtpClient smtp = new SmtpClient();
        MailMessage Mensaje = new MailMessage();
        Attachment Anexo;

        try
        {

            usuariosmtp = ConfigurationManager.AppSettings["usuariosmtp"];
            clavesmtp = ConfigurationManager.AppSettings["clavesmtp"];
            puertosmtp = Convert.ToInt32(ConfigurationManager.AppSettings["puertosmtpssl"]); ;
            hostsmtp = ConfigurationManager.AppSettings["hostsmtp"];
            emailorigen = ConfigurationManager.AppSettings["emailorigen"];

            if (usuariosmtp != "" && clavesmtp != "")
            {
                smtp.Credentials = new NetworkCredential(usuariosmtp, clavesmtp);
                smtp.EnableSsl = true;
            }

            smtp.Port = puertosmtp;
            smtp.Host = hostsmtp;
            Mensaje.Subject = "Nueva Incorporación";
            Mensaje.Body = "Se ingresado un nueva consultora";
            Mensaje.From = new MailAddress(emailorigen);
            Mensaje.To.Clear();

            DataTable dtCorreo = new DataTable();
            dtCorreo = correo.obtener("", "", 36, iBE.paisID);
            String cuenta = "";

            foreach (DataRow fila in dtCorreo.Rows)
            {
                cuenta = fila["email"].Equals(DBNull.Value) ? "" : fila["email"].ToString();
                if (cuenta != "")
                {
                    Mensaje.To.Add(cuenta);
                }
            }


            IncorporacionBL incorporacionBL = new IncorporacionBL();
            String gzregion = iBE.ZonaCodigo.Substring(0, 2);
            String gzzona = iBE.ZonaCodigo.Substring(2, 4);

            GerenteZona gz = new GerenteZona();
            DataTable dtgz = gz.obtener("", gzregion, gzzona);
            foreach (DataRow drgz in dtgz.Rows)
            {
                Mensaje.To.Add(drgz["email"].ToString());
            }
            Anexo = new Attachment(rutaAnexoIncorporacion(iBE.incorporacionID));
            Mensaje.Attachments.Add(Anexo);

            smtp.Send(Mensaje);
        }
        catch (Exception ex)
        {
            Log.lanzarError(ex);
        }
        finally { 
        
        }
 

        correo = null;
        smtp = null;
        Mensaje = null;
    }


    public void enviaCorreoReingreso(ReingresoBE r)
    {
        String usuariosmtp = "", clavesmtp = "", hostsmtp = "", emailorigen = "";
        int puertosmtp = 25;
        Correo correo = new Correo();
        SmtpClient smtp = new SmtpClient();
        MailMessage Mensaje = new MailMessage();
        Attachment Anexo;

        try
        {

            usuariosmtp = ConfigurationManager.AppSettings["usuariosmtp"];
            clavesmtp = ConfigurationManager.AppSettings["clavesmtp"];
            puertosmtp = Convert.ToInt32(ConfigurationManager.AppSettings["puertosmtpssl"]); ;
            hostsmtp = ConfigurationManager.AppSettings["hostsmtp"];
            emailorigen = ConfigurationManager.AppSettings["emailorigen"];

            if (usuariosmtp != "" && clavesmtp != "")
            {
                smtp.Credentials = new NetworkCredential(usuariosmtp, clavesmtp);
                smtp.EnableSsl = true;
            }

            smtp.Port = puertosmtp;
            smtp.Host = hostsmtp;
            Mensaje.Subject = "Nuevo Reingreso";
            Mensaje.Body = "Se ha ingresado un reingreso de consultora";
            Mensaje.From = new MailAddress(emailorigen);
            Mensaje.To.Clear();

            DataTable dtCorreo = new DataTable();
            dtCorreo = correo.obtener("", "", 38, r.paisID);
            String cuenta = "";

            foreach (DataRow fila in dtCorreo.Rows)
            {
                cuenta = fila["email"].Equals(DBNull.Value) ? "" : fila["email"].ToString();
                if (cuenta != "")
                {
                    Mensaje.To.Add(cuenta);
                }
            }

            String gzregion = r.zonaCodigo.Substring(0, 2);
            String gzzona = r.zonaCodigo.Substring(2, 4);

            GerenteZona gz = new GerenteZona();
            DataTable dtgz = gz.obtener("", gzregion, gzzona);
            foreach (DataRow drgz in dtgz.Rows)
            {
                Mensaje.To.Add(drgz["email"].ToString());
            }
            Anexo = new Attachment(rutaAnexoReingreso(r.reingresoID));
            Mensaje.Attachments.Add(Anexo);

            smtp.Send(Mensaje);
        }
        catch (Exception ex)
        {
            Log.lanzarError(ex);
        }
        finally
        {

        }


        correo = null;
        smtp = null;
        Mensaje = null;
    }

    public void enviaCorreoSeguimiento(SeguimientoBE s)
    {
        String usuariosmtp = "", clavesmtp = "", hostsmtp = "", emailorigen = "";
        int puertosmtp = 25;
        Correo correo = new Correo();
        SmtpClient smtp = new SmtpClient();
        MailMessage Mensaje = new MailMessage();
        Attachment Anexo;

        try
        {
            usuariosmtp = ConfigurationManager.AppSettings["usuariosmtp"];
            clavesmtp = ConfigurationManager.AppSettings["clavesmtp"];
            puertosmtp = Convert.ToInt32(ConfigurationManager.AppSettings["puertosmtpssl"]); ;
            hostsmtp = ConfigurationManager.AppSettings["hostsmtp"];
            emailorigen = ConfigurationManager.AppSettings["emailorigen"];

            if (usuariosmtp != "" && clavesmtp != "")
            {
                smtp.Credentials = new NetworkCredential(usuariosmtp, clavesmtp);
                smtp.EnableSsl = true;
            }

            smtp.Port = puertosmtp;
            smtp.Host = hostsmtp;
            Mensaje.Subject = "Nuevo Seguimiento";
            Mensaje.Body = "Se ha ingresado un nuevo seguimiento a una consultora";
            Mensaje.From = new MailAddress(emailorigen);
            Mensaje.To.Clear();

            DataTable dtCorreo = new DataTable();
            dtCorreo = correo.obtener("", "", 37, s.PaisID);
            String cuenta = "";

            foreach (DataRow fila in dtCorreo.Rows)
            {
                cuenta = fila["email"].Equals(DBNull.Value) ? "" : fila["email"].ToString();
                if (cuenta != "")
                {
                    Mensaje.To.Add(cuenta);
                }
            }

            String gzregion = s.ZonaCodigo.Substring(0, 2);
            String gzzona = s.ZonaCodigo.Substring(2, 4);

            GerenteZona gz = new GerenteZona();
            DataTable dtgz = gz.obtener("", gzregion, gzzona);
            foreach (DataRow drgz in dtgz.Rows)
            {
                Mensaje.To.Add(drgz["email"].ToString());
            }
            Anexo = new Attachment(rutaAnexoSeguimiento(s.ConsultoraCodigo));
            Mensaje.Attachments.Add(Anexo);

            smtp.Send(Mensaje);
        }
        catch (Exception ex)
        {
            Log.lanzarError(ex);
        }
        finally
        {

        }

        correo = null;
        smtp = null;
        Mensaje = null;
    }


    public void enviaCorreo(string idPais, string usr, string pwd, string correoGZ, string archivo)
    {
        string rutaArchivo = (@"C:\Bcaribe\" + archivo + ".pdf");
        string smtpServer = "smtp.gmail.com";
        MailMessage correo = new MailMessage();
        correo.From = new MailAddress("belcorpcaribe@gmail.com");
        correo.To.Add(correoGZ);
        DataTable dtTaccion = tipoAccion(idPais);
        for (int i = 0; i < dtTaccion.Rows.Count; i++)
        {
            correo.Bcc.Add(dtTaccion.Rows[i][0].ToString());
        }
        // correo.Bcc.Add(); // enviar mensajes ocultos
        correo.Subject = "PDF-NUEVAS";
        correo.Body = "FYI";
        Attachment attachment = new Attachment(rutaArchivo); //create the attachment
        correo.Attachments.Add(attachment);	//add the attachment
        // correo.BodyEncoding = 
        correo.Priority = MailPriority.Normal;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = smtpServer;
        smtp.Port = 587;
        smtp.UseDefaultCredentials = false;
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtp.EnableSsl = true;
        smtp.Timeout = 900000;
        smtp.Credentials = new System.Net.NetworkCredential(usr, pwd);
        try
        {
            smtp.Send(correo);
            correo.Dispose();
            if (File.Exists(rutaArchivo))
            {
                File.Delete(rutaArchivo);
            }

            //LabelError.Text = "Mensaje enviado satisfactoriamente";
        }
        catch (Exception ex)
        {
            // "error : "+ ex ;
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0", ex);
            //LabelError.Text = "ERROR: " + ex.Message;
        }

    }

    private DataTable tipoAccion(string idPais)
    {
        string sql = "SELECT email FROM TipoAccion WHERE idpais = " + idPais;
        DataTable dtTaccion = con.AccesoDatos(sql);
        return dtTaccion;
    }

    private string crearPdf
        (
        string APPID,
        string PIN,
        string IMSI,
        string ZONA,
        string CAMPAÑA,
        string IDPAIS,
        string IDOTRASMARCAS,
        string IDNIVELEDUCATIVO,
        string IDESTADOCIVIL,
        string IDTIPOCONTACTO,
        string IDTIPODOCUMENTO,
        string CODIGOTERRITORIO,
        string CODIGOCONSULTORARECOMIENDA,
        string APELLIDOPATERNO,
        string APELLIDOMATERNO,
        string PRIMERNOMBRE,
        string SEGUNDONOMBRE,
        string FECHANACIMIENTO,
        string NRODOCUMENTO,
        string RECORD_LONG,
        string RECORD_LAT,
        string MARGEN,
        string satelites,
        string VERIFICADO,
        string TIPOACCION,
        string TELEFONOCASA,
        string TELEFONOCELULAR,
        string CORREOELEC,
        string NOTIENECORREO,
        string SOLICITANTE_DIRECCION,
        string SOLICITANTE_REFERENCIA,
        string SOLICITANTE_CPOSTAL,
        string SOLICITANTE_PUEBLO,
        string SOLICITANTE_ESTADO,
        string SOLICITANTE_MUNICIPIO,
        string SOLICITANTE_CIUDAD,
        string SOLICITANTE_PROVINCIA,
        string REFFAM_NOMBRES,
        string REFFAM_APELLIDOPATERNO,
        string REFFAM_APELLIDOMATERNO,
        string REFFAM_DIRECCION,
        string REFFAM_TELEFONO,
        string REFFAM_CELULAR,
        string REFFAM_IDTIPOVINCULO,
        string REFNOFAM_NOMBRES,
        string REFNOFAM_APELLIDOPATERNO,
        string REFNOFAM_APELLIDOMATERNO,
        string REFNOFAM_DIRECCION,
        string REFNOFAM_TELEFONO,
        string REFNOFAM_CELULAR,
        string REFNOFAM_IDTIPOVINCULO,
        string ENTREGA_DIRECCION,
        string ENTREGA_PUEBLO,
        string ENTREGA_CPOSTAL,
        string ENTREGA_REFERENCIA,
        string RECORD_IMSI,
        string RECORD_PIN,
        string RECORD_OBSERVACION,
        string RECORD_FECHAVISITA
        )
    {

        int m = 30;//margen
        Report report = new Report(new PdfFormatter());
        FontDef fd = new FontDef(report, "Helvetica");
        FontProp fp1 = new FontPropMM(fd, 2, System.Drawing.Color.Black);
        FontProp fp2 = new FontPropMM(fd, 2, System.Drawing.Color.Black);
        fp2.bBold = true;
        FontProp fp_Title = new FontPropMM(fd, 4);
        Root.Reports.Page page = new Root.Reports.Page(report);
        fp_Title.bBold = true;
        Double rX = 60;
        Double rY = 20;
        Double rYTemp, rYContinue;
        Double rYcopy = rY;
        //centrado al medio del dpdf
        page.AddCB_MM(10, new RepString(fp_Title, "Solicitud de Credito"));
        rY += fp_Title.rLineFeedMM;

        page.AddMM(rX, rY, new RepString(fp1, "Código territorial:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, CODIGOTERRITORIO));
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Año:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, "falta año")); //falta de donde sacar año
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "CAMP."));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, CAMPAÑA));
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Código consultora que recomienda:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, CODIGOCONSULTORARECOMIENDA));
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Consultora que recomienda :"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, "falta nombre consultora")); //falta obtener nombre consultora recomienda
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Selección Premio:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, "falta sacar premio")); //falta de donde sacar premio
        // rY += fp.rLineFeedMM;

        rX = 20;
        rY += 10;
        rYTemp = rY;
        page.AddMM(rX, rY, new RepString(fp1, "Primer Apellido:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, APELLIDOPATERNO));
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Primer Nombre:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, PRIMERNOMBRE));
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Fecha nacimiento:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, FECHANACIMIENTO));
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Estado civil:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, IDESTADOCIVIL));
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Nivel Educativo :"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, IDNIVELEDUCATIVO));
        rY += fp1.rLineFeedMM;
        //page.AddMM(rX, rY, new RepString(fp, "Selección Premio:"));
        //page.AddRightMM(rX + 80, rY, new RepInt32(fp, 0, "$#;($#);Zero"));
        //rYContinue = rY;

        rX += 90;
        rY = rYTemp;
        page.AddMM(rX, rY, new RepString(fp1, "Segundo apellido:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, APELLIDOMATERNO));
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Segundo Nombre:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, SEGUNDONOMBRE));
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Doc de identidad:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, IDTIPODOCUMENTO));
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Número:"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, NRODOCUMENTO));
        rY += fp1.rLineFeedMM;
        page.AddMM(rX, rY, new RepString(fp1, "Vendes otras Marcas :"));
        page.AddRightMM(rX + 80, rY, new RepString(fp2, IDOTRASMARCAS));
        rY += fp1.rLineFeedMM;
        //page.AddMM(rX, rY, new RepString(fp, "Selección Premio:"));
        //page.AddRightMM(rX + 80, rY, new RepInt32(fp, 0, "$#;($#);Zero"));

        string archivo = "sc" + DateTime.Now.Second + DateTime.Now.Millisecond;
        report.Save(@"C:\Bcaribe\" + archivo + ".pdf");

        return archivo;
        // RT.ViewPDF(report, "MiInforme.pdf");
    }

    protected string rutaAnexoIncorporacion(int incorporacionID)
    {
        ConnectionBL connectionBL = new ConnectionBL();

        string nombre = "C:\\Reportes\\solicitud_de_credito_" + DateFormatter.getTimestamp(DateTime.Now) + ".pdf";

        String db_databaseName = connectionBL.getDataBaseName();
        String db_serverName = connectionBL.getServerName();
        String db_userID = connectionBL.getUserID();
        String db_password = connectionBL.getPassword();

        ReportDocument rpt = new ReportDocument();
        rpt.Load(Server.MapPath("../CrystalReports/rcSolicitudCredito.rpt"));
        rpt.SetDatabaseLogon("", "", ".", db_databaseName);
        rpt.SetParameterValue("@incorporacionID", incorporacionID);


        rpt.ExportToDisk(ExportFormatType.PortableDocFormat, nombre);

        return nombre;

    }

    protected string rutaAnexoReingreso(int reingresoID)
    {
        ConnectionBL connectionBL = new ConnectionBL();

        string nombre = "C:\\Reportes\\Reingreso_" + DateFormatter.getTimestamp(DateTime.Now) + ".pdf";

        String db_databaseName = connectionBL.getDataBaseName();
        String db_serverName = connectionBL.getServerName();
        String db_userID = connectionBL.getUserID();
        String db_password = connectionBL.getPassword();


        ReportDocument rpt = new ReportDocument();
        rpt.Load(Server.MapPath("../CrystalReports/crReingreso.rpt"));
        rpt.SetDatabaseLogon("", "", ".", db_databaseName);
        rpt.SetParameterValue("@reingresoID", reingresoID);
        rpt.ExportToDisk(ExportFormatType.PortableDocFormat, nombre);

        return nombre;

    }

     protected string rutaAnexoSeguimiento(String ConsultoraCodigo)
     {
         ConnectionBL connectionBL = new ConnectionBL();

         string nombre = "C:\\Reportes\\Seguimiento_" + DateFormatter.getTimestamp(DateTime.Now) + ".pdf";

         String db_databaseName = connectionBL.getDataBaseName();
         String db_serverName = connectionBL.getServerName();
         String db_userID = connectionBL.getUserID();
         String db_password = connectionBL.getPassword();


         ReportDocument rpt = new ReportDocument();
         rpt.Load(Server.MapPath("../CrystalReports/crSeguimiento.rpt"));
         rpt.SetDatabaseLogon("", "", ".", db_databaseName);
         rpt.SetParameterValue("@ConsultoraCodigo", Convert.ToInt32(ConsultoraCodigo));
         rpt.ExportToDisk(ExportFormatType.PortableDocFormat, nombre);

         return nombre;

     }

}