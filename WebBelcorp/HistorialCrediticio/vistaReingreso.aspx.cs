using System;
using System.Collections;
using System.Configuration;
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

using System.Configuration;
using System.Web.Configuration;

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

public partial class HistorialCrediticio_vistaReingreso : System.Web.UI.Page
{
    private ReingresoBL reingresoBL = new ReingresoBL();
    List<ReingresoBE> listado;

    private ReingresoBL reingresosBL = new ReingresoBL();
    private ConnectionBL connectionBL = new ConnectionBL();

    protected void Page_Load(object sender, EventArgs e)
    {
        lblPaisDocumentoTipo.Text = Convert.ToString(Session["paisTipoDocumento"]);
    }

    private void fillElements()
    {
        ReingresoBE r = new ReingresoBE();
        r.regionCodigo = (txtRegion.Text.Trim().Length == 0) ? null : txtRegion.Text.Trim();
        r.zonaCodigo = (txtZona.Text.Trim().Length == 0) ? null : txtZona.Text.Trim();
        
        //r.recFechaReingreso = (txtFechaReingreso.Text.Trim().Length == 0) ? null : txtFechaReingreso.Text.Trim();
        r.recFechaReingresoIni = txtFechaReingresoIni.Text;
        r.recFechaReingresoFin = txtFechaReingresoFin.Text;
        
        r.campanhaInscripcion = (txtCampanhaInscripcion.Text.Trim().Length == 0) ? null : txtCampanhaInscripcion.Text.Trim();
        r.campanhaPrimeraCompra = (txtCampanhaFacturacion.Text.Trim().Length == 0) ? null : txtCampanhaFacturacion.Text.Trim();
        r.documentoNumero = (txtDocumentoIdentidad.Text.Trim().Length == 0) ? null : txtDocumentoIdentidad.Text.Trim();
        r.consultoraCodigo = (txtConsultoraCodigo.Text.Trim().Length == 0) ? null : txtConsultoraCodigo.Text.Trim();
        r.apellidoPaterno = (txtApellidoPaterno.Text.Trim().Length == 0) ? null : txtApellidoPaterno.Text.Trim();
        r.apellidoMaterno = (txtApellidoMaterno.Text.Trim().Length == 0) ? null : txtApellidoMaterno.Text.Trim();
        r.nombres = (txtNombres.Text.Trim().Length == 0) ? null : txtNombres.Text.Trim();

        r.estadoVerificadoInt = Convert.ToInt32(ddlEstadoVerificado.SelectedValue);
        if (r.estadoVerificadoInt < 2)
            r.estadoVerificado = Convert.ToBoolean(Convert.ToInt32(ddlEstadoVerificado.SelectedValue));

        try
        {
            listado = new List<ReingresoBE>();
            listado = reingresoBL.obtenerPorParametros(r);

        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }

    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        fillElements();
        gvReingreso.DataSource = listado;
        gvReingreso.DataBind();
        if (listado == null || listado.Count == 0)
        {
            divMensaje.InnerHtml = "<div id=\"error\">No se encontraron coincidencias.</div>";
        }
        else
        {
            divMensaje.InnerHtml = "";
        }
    }

    protected void gvReingreso_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
        e.Row.Cells[12].Visible = false;
    }

    protected void gvReingreso_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvReingreso.PageIndex = e.NewPageIndex;
        gvReingreso.DataBind();
    }

    protected void cmdGuardar_Click(object sender, EventArgs e)
    {
        String reingresoID;
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

        if (usuariosmtp != "" && clavesmtp != "")
        {
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
        String cuenta = "";

        foreach (DataRow fila in dtCorreo.Rows)
        {
            cuenta = fila["email"].Equals(DBNull.Value) ? "" : fila["email"].ToString();
            if (cuenta != "")
            {
                Mensaje.To.Add(cuenta);
            }
        }


        n = gvReingreso.Rows.Count;
        for (i = 0; i < n; i++)
        {
            if (((CheckBox)gvReingreso.Rows[i].Cells[11].Controls[1]).Checked != ((CheckBox)gvReingreso.Rows[i].Cells[12].Controls[1]).Checked)
            {
                reingresoBL.registraVerificacion(int.Parse(gvReingreso.Rows[i].Cells[0].Text));
                try
                {
                    GerenteZona gz = new GerenteZona();
                    String gzregion = gvReingreso.Rows[i].Cells[1].Text;
                    String gzzona = gvReingreso.Rows[i].Cells[2].Text;
                    DataTable dtgz = gz.obtener("", gzregion, gzzona);
                    foreach (DataRow drgz in dtgz.Rows)
                    {
                        Mensaje.To.Add(drgz["email"].ToString());
                    }
                    reingresoID = gvReingreso.Rows[i].Cells[0].Text;
                    consultoraID = gvReingreso.Rows[i].Cells[1].Text;
                    Anexo = new Attachment(rutaAnexo(reingresoID, consultoraID));
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

    protected void gvReingreso_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "generatePDFView")
        {
            String reingresoID = gvReingreso.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            String consultoraID = gvReingreso.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text;

            try
            {
                String db_databaseName = connectionBL.getDataBaseName();
                String db_serverName = connectionBL.getServerName();
                String db_userID = connectionBL.getUserID();
                String db_password = connectionBL.getPassword();

                ReportDocument rpt = new ReportDocument();
                rpt.Load(Server.MapPath("../CrystalReports/crReingreso.rpt"));
                rpt.SetDatabaseLogon("", "", ".", db_databaseName);
                rpt.SetParameterValue("@reingresoID", Convert.ToInt32(reingresoID));
                rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Reingreso_" + DateFormatter.getTimestamp(DateTime.Now));

            }
            catch (Exception ex)
            {
                Log.lanzarError(ex);
            }
        }
    }

    protected string rutaAnexo(String reingresoID, String consultoraID)
    {

        string nombre = "C:\\Reportes\\Seguimientos_" + DateFormatter.getTimestamp(DateTime.Now) + ".pdf";

        String db_databaseName = connectionBL.getDataBaseName();
        String db_serverName = connectionBL.getServerName();
        String db_userID = connectionBL.getUserID();
        String db_password = connectionBL.getPassword();


        ReportDocument rpt = new ReportDocument();
        rpt.Load(Server.MapPath("../CrystalReports/crReingreso.rpt"));
        rpt.SetDatabaseLogon("", "", ".", db_databaseName);
        rpt.SetParameterValue("@consultoraID", Convert.ToInt32(reingresoID));
        rpt.ExportToDisk(ExportFormatType.PortableDocFormat, nombre);

        return nombre;

    }

}
