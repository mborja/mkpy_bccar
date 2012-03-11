using System;
using System.Collections;
using System.Configuration;
using System.Web.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Net;
using System.Net.Mail;

using BusinessLayer;
using EntityLayer;
using UtilityLayer;
using System.Collections.Generic;

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

public partial class HistorialCrediticio_vistaIncorporaciones : System.Web.UI.Page
{
    IncorporacionBL incorporacionBL = new IncorporacionBL();
    SeguimientoBL seguimientoBL = new SeguimientoBL();
    ConnectionBL connectionBL = new ConnectionBL();
    List<IncorporacionConsultaBE> listado;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void cmdGuardar_Click(object sender, EventArgs e)
    {
        String incorporacionID;
        String consultoraID;
        String usuariosmtp = "", clavesmtp = "", hostsmtp = "", emailorigen = "";
        int i, n;
        int puertosmtp = 25;
        Correo correo = new Correo();
        SmtpClient smtp = new SmtpClient();
        MailMessage Mensaje = new MailMessage();
        Attachment Anexo;

        usuariosmtp = ConfigurationManager.AppSettings["usuariosmtp"];
        clavesmtp = ConfigurationManager.AppSettings["clavesmtp"];
        puertosmtp = Convert.ToInt32(ConfigurationManager.AppSettings["puertosmtpssl"]); ;
        hostsmtp = ConfigurationManager.AppSettings["hostsmtp"];
        emailorigen = ConfigurationManager.AppSettings["emailorigen"];

        if (usuariosmtp!="" && clavesmtp!=""){
           smtp.Credentials = new NetworkCredential(usuariosmtp, clavesmtp);
           smtp.EnableSsl = true;
        }
        smtp.Port = puertosmtp;
        smtp.Host = hostsmtp;
        
        Mensaje.Subject = "Nueva Incorporación";
        Mensaje.Body = "Se ha verificado la incorporacion de nuevas consultoras";
        Mensaje.From = new MailAddress(emailorigen);
        Mensaje.To.Clear();

        DataTable dtCorreo = new DataTable();
        dtCorreo = correo.obtener("", "", 36, Convert.ToInt32(Session["paisID"]));
        String cuenta ="";

        foreach( DataRow fila in dtCorreo.Rows){
            cuenta = fila["email"].Equals(DBNull.Value) ? "" : fila["email"].ToString();
            if (cuenta!="") {
               Mensaje.To.Add(cuenta);
            }
        }
        try
        {
            n = gvIncorporaciones.Rows.Count;
            for (i = 0; i < n; i++)
            {
                if (((CheckBox)gvIncorporaciones.Rows[i].Cells[11].Controls[1]).Checked != ((CheckBox)gvIncorporaciones.Rows[i].Cells[12].Controls[1]).Checked)
                {
                    incorporacionBL.registraVerificacion(int.Parse(gvIncorporaciones.Rows[i].Cells[0].Text));
                    try
                    {
                        GerenteZona gz = new GerenteZona();
                        String gzregion = gvIncorporaciones.Rows[i].Cells[2].Text;
                        String gzzona = gvIncorporaciones.Rows[i].Cells[3].Text;
                        DataTable dtgz = gz.obtener("", gzregion, gzzona);
                        foreach (DataRow drgz in dtgz.Rows)
                        {
                            Mensaje.To.Add(drgz["email"].ToString());
                        }
                        incorporacionID = gvIncorporaciones.Rows[i].Cells[0].Text;
                        consultoraID = gvIncorporaciones.Rows[i].Cells[1].Text;
                        Anexo = new Attachment(rutaAnexo(incorporacionID, consultoraID));
                        Mensaje.Attachments.Add(Anexo);

                        smtp.Send(Mensaje);
                    }
                    catch (Exception ex)
                    {
                        Log.lanzarError(ex);
                    }
                }
            }

            cmdBuscar_Click(sender, e);
            divMensaje.InnerHtml = "<div id=\"success\">Grabado con exito.</div>";

        }
        catch (Exception ex)
        {
            Log.lanzarError(ex);
        }
        finally
        {
            correo = null;
            smtp = null;
            Mensaje = null;
        }
    }

    private void fillElements()
    {
        IncorporacionBE incorporacionBE = new IncorporacionBE();
        incorporacionBE.RegionCodigo = txtRegion.Text;
        incorporacionBE.ZonaCodigo = txtZona.Text;
        incorporacionBE.fechaRegistro = txtFechaIniInscripcion.Text;
        incorporacionBE.fecRegIni = txtFechaIniInscripcion.Text;
        incorporacionBE.fecRegFin = txtFechaFinInscripcion.Text;
        incorporacionBE.CampanhaInscripcion = txtCampaniaInscripcion.Text;
        incorporacionBE.numeroDocumento = txtDocumentoIdentidad.Text;
        incorporacionBE.ConsultoraCodigo = txtCodigoConsultora.Text;
        incorporacionBE.apellidoPaterno = txtApellidoPaterno.Text;
        incorporacionBE.apellidoMaterno = txtApellidoMaterno.Text;
        incorporacionBE.nombres = txtNombres.Text;
        incorporacionBE.ModoGrabacionInt = 0; // Esto siempre será 0 en este formulario 0:Real 1:Borrador
        incorporacionBE.EstadoVerificadoInt = Convert.ToInt32(ddlEstadoActivo.SelectedValue);

        try
        {
            listado = new List<IncorporacionConsultaBE>();
            listado = incorporacionBL.obtenerPorParametros(incorporacionBE);

        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show(ex.Message);
        }

    }

    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            fillElements();
            gvIncorporaciones.DataSource = listado;
            gvIncorporaciones.DataBind();
            if (listado.Count == 0)
            {
                divMensaje.InnerHtml = "<div id=\"error\">No se encontraron coincidencias.</div>";
            }
            else
            {
                divMensaje.InnerHtml = "";
            }

        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }

    protected void gvIncorporaciones_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
        e.Row.Cells[1].Visible = false;
        e.Row.Cells[12].Visible = false;
    }

    protected void gvIncorporaciones_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "generatePDFView")
        {
            String incorporacionID = gvIncorporaciones.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            String consultoraID = gvIncorporaciones.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text;

            String db_databaseName = connectionBL.getDataBaseName();
            String db_serverName = connectionBL.getServerName();
            String db_userID = connectionBL.getUserID();
            String db_password = connectionBL.getPassword();

            ReportDocument rpt = new ReportDocument();
            rpt.Load(Server.MapPath("../CrystalReports/rcSolicitudCredito.rpt"));
            rpt.SetDatabaseLogon("", "", ".", db_databaseName);
            rpt.SetParameterValue("@incorporacionID", Convert.ToInt32(incorporacionID));

            rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "solicitud_de_credito_" + DateFormatter.getTimestamp(DateTime.Now));

        }
    }

    protected string rutaAnexo(String incorporacionID, String consultoraID)
    {

        string nombre = "C:\\Reportes\\solicitud_de_credito_" + DateFormatter.getTimestamp(DateTime.Now) + ".pdf";

        String db_databaseName = connectionBL.getDataBaseName();
        String db_serverName = connectionBL.getServerName();
        String db_userID = connectionBL.getUserID();
        String db_password = connectionBL.getPassword();

        ReportDocument rpt = new ReportDocument();
        rpt.Load(Server.MapPath("../CrystalReports/rcSolicitudCredito.rpt"));
        rpt.SetDatabaseLogon("", "", ".", db_databaseName);
        rpt.SetParameterValue("@incorporacionID", Convert.ToInt32(incorporacionID));
        rpt.ExportToDisk(ExportFormatType.PortableDocFormat, nombre);
        return nombre;    
    }


    protected void gvIncorporaciones_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow )
        {
            // Display the company name in italics.
            //int ultimo = e.Row.Cells.Count-1;
            if (e.Row.Cells[7].Text!="&nbsp;") e.Row.Cells[11].Enabled = false;

        }

    }
}
