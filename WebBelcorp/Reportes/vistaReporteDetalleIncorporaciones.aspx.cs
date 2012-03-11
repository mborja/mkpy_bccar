using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Globalization;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using BusinessLayer;
using EntityLayer;
using UtilityLayer;
using System.Collections.Generic;

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

public partial class HistorialCrediticio_vistaIncorporaciones : System.Web.UI.Page
{
    private IncorporacionBL incorporacionBL = new IncorporacionBL();
    private ConnectionBL connectionBL = new ConnectionBL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblPaisTipoDocumento.Text = Convert.ToString(Session["paisTipoDocumento"]);

            String gerenteID = Request.QueryString.Get("gerenteID");
            String regionCodigo = Request.QueryString.Get("regionCodigo");
            String zonaCodigo = Request.QueryString.Get("zonaCodigo");
            int modoGrabacion = Convert.ToInt32(Request.QueryString.Get("modoGrabacion"));
            int estadoVerificado = Convert.ToInt32(Request.QueryString.Get("estadoVerificado"));
            

            if (gerenteID != null && regionCodigo != null && zonaCodigo != null && estadoVerificado != null)
            {
                lblRegionCodigo.Text = regionCodigo;
                lblZonaCodigo.Text = zonaCodigo;

                if (estadoVerificado == 1)
                    ddlEstadoVerificado.SelectedIndex = 1;
                else
                    ddlEstadoVerificado.SelectedIndex = 2;

                if (modoGrabacion == 0)
                    ddlModoGrabacion.SelectedIndex = 1;
                else
                    ddlModoGrabacion.SelectedIndex = 2;

                IncorporacionBE incorporacionBE = new IncorporacionBE();
                //incorporacionBL.obtenerPorParametros(regionCodigo, zonaCodigo, null, null, null, null, null, null, null, estadoVerificado, 2);
                incorporacionBE.fechaRegistro = "";
                incorporacionBE.fecRegIni="";
                incorporacionBE.fecRegFin = "";
                incorporacionBE.RegionCodigo = regionCodigo;
                incorporacionBE.ZonaCodigo = zonaCodigo;
                incorporacionBE.ModoGrabacionInt = modoGrabacion;
                incorporacionBE.EstadoVerificadoInt = estadoVerificado;

                List<IncorporacionConsultaBE> listado = new List<IncorporacionConsultaBE>();
                listado = incorporacionBL.obtenerPorParametros(incorporacionBE);
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
        }
    }

    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        //obtenerPorParametros(String , String , String , String , bool )
        //String regionCodigo = txtRegion.Text;
        //String zonaCodigo = txtZona.Text;
        String regionCodigo = lblRegionCodigo.Text;
        String zonaCodigo = lblZonaCodigo.Text;
        //
        String fechaInscripcionIni = txtFechaInscripcionIni.Text;
        String fechaInscripcionFin = txtFechaInscripcionFin.Text;
        String campanhaInscripcion = txtCampaniaInscripcion.Text;
        String numeroDocumento = txtDocumentoIdentidad.Text;
        String consultoraCodigo = txtCodigoConsultora.Text;
        String apellidoPaterno = txtApellidoPaterno.Text;
        String apellidoMaterno = txtApellidoMaterno.Text;
        String nombres = txtNombres.Text;
        int estadoVerificado = Convert.ToInt32(ddlEstadoVerificado.SelectedValue);
        int modoGrabacion = Convert.ToInt32(ddlModoGrabacion.SelectedValue);

        try
        {
            IncorporacionBE incorporacionBE = new IncorporacionBE();
            incorporacionBE.RegionCodigo = regionCodigo;
            incorporacionBE.ZonaCodigo = zonaCodigo;
            incorporacionBE.fechaRegistro = fechaInscripcionIni;
            incorporacionBE.fecRegIni = fechaInscripcionIni;
            incorporacionBE.fecRegFin = fechaInscripcionFin;
            incorporacionBE.CampanhaInscripcion = campanhaInscripcion;
            incorporacionBE.numeroDocumento = numeroDocumento;
            incorporacionBE.ConsultoraCodigo = consultoraCodigo;
            incorporacionBE.apellidoPaterno = apellidoPaterno;
            incorporacionBE.apellidoMaterno = apellidoMaterno;
            incorporacionBE.nombres = nombres;
            incorporacionBE.EstadoVerificadoInt = estadoVerificado;
            incorporacionBE.ModoGrabacionInt = modoGrabacion;
            //apellidoPaterno, apellidoMaterno, nombres, estadoVerificado, modoGrabacion);
            //incorporacionBL.obtenerPorParametros(regionCodigo, zonaCodigo, fechaInscripcion, campanhaInscripcion, numeroDocumento, consultoraCodigo, apellidoPaterno, apellidoMaterno, nombres, estadoVerificado, modoGrabacion);

            List<IncorporacionConsultaBE> listado = new List<IncorporacionConsultaBE>();
            listado = incorporacionBL.obtenerPorParametros(incorporacionBE);
            
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
            System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }

    protected void gvIncorporaciones_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
        e.Row.Cells[1].Visible = false;
    }

    protected void gvIncorporaciones_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "generatePDFView")
        {
            String incorporacionID = gvIncorporaciones.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            String consultoraID = gvIncorporaciones.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text;

            try
            {
                String db_databaseName = connectionBL.getDataBaseName();
                String db_serverName = connectionBL.getServerName();
                String db_userID = connectionBL.getUserID();
                String db_password = connectionBL.getPassword();

                ReportDocument rpt = new ReportDocument();
                rpt.Load(Server.MapPath("../CrystalReports/rcSolicitudCredito.rpt"));
                rpt.SetDatabaseLogon("", "", ".", db_databaseName);
                //rpt.SetDatabaseLogon(db_userID, db_password, db_serverName, db_databaseName);
                rpt.SetParameterValue("@incorporacionID", Convert.ToInt32(incorporacionID));

                rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "solicitud_de_credito_" + DateFormatter.getTimestamp(DateTime.Now));

            }
            catch (Exception ex)
            {
                //System.Windows.Forms.MessageBox.Show(ex.Message);
            }
        }
    }

    protected void cmdExportarExcel_Click(object sender, EventArgs e)
    {
        String regionCodigo = lblRegionCodigo.Text;
        String zonaCodigo = lblZonaCodigo.Text;
        String fechaInscripcion = txtFechaInscripcionIni.Text;
        String fechaInscripcionIni = txtFechaInscripcionIni.Text;
        String fechaInscripcionFin = txtFechaInscripcionFin.Text;
        String campanhaInscripcion = txtCampaniaInscripcion.Text;
        String documentoNumero = txtDocumentoIdentidad.Text;
        String consultoraCodigo = txtCodigoConsultora.Text;
        String apellidoPaterno = txtApellidoPaterno.Text;
        String apellidoMaterno = txtApellidoMaterno.Text;
        String nombres = txtNombres.Text;

        DateTime dtProjectStartDate = new DateTime();
        DateTime dtFecRegIni = new DateTime(2000,01,01);
        DateTime dtFecRegFin = DateTime.Today;
        CultureInfo culture = new CultureInfo("en-GB");
        if (fechaInscripcionIni.Length > 0)
        {
            try
            {
                dtProjectStartDate = Convert.ToDateTime(fechaInscripcion, culture);
                dtFecRegIni = Convert.ToDateTime(fechaInscripcionIni, culture);
                dtFecRegFin = Convert.ToDateTime(fechaInscripcionFin, culture);
            }
            catch (Exception ex)
            {
                dtProjectStartDate = DateTime.Now;

            }
        }
       

        int intEstadoVerificado = Convert.ToInt32(ddlEstadoVerificado.SelectedValue);
        int intModoGrabacion = Convert.ToInt32(ddlModoGrabacion.SelectedValue);

        try
        {
            String db_databaseName = connectionBL.getDataBaseName();
            String db_serverName = connectionBL.getServerName();
            String db_userID = connectionBL.getUserID();
            String db_password = connectionBL.getPassword();
            
            ReportDocument rpt = new ReportDocument();
            rpt.Load(Server.MapPath("../CrystalReports/crReporteIncorporacionDetalle.rpt"));
            rpt.SetDatabaseLogon("", "", ".", db_databaseName);
            rpt.SetParameterValue("@regionCodigo", regionCodigo);
            rpt.SetParameterValue("@zonaCodigo", zonaCodigo);
            rpt.SetParameterValue("@fechaInscripcion", dtProjectStartDate.ToShortDateString() ); 
            rpt.SetParameterValue("@fecRegIni", dtFecRegIni.ToShortDateString());
            rpt.SetParameterValue("@fecRegFin", dtFecRegFin.ToShortDateString());
            rpt.SetParameterValue("@campanhaInscripcion", campanhaInscripcion);
            rpt.SetParameterValue("@numeroDocumento", documentoNumero);
            rpt.SetParameterValue("@consultoraCodigo", consultoraCodigo);
            rpt.SetParameterValue("@apellidoPaterno", apellidoPaterno);
            rpt.SetParameterValue("@apellidoMaterno", apellidoMaterno);
            rpt.SetParameterValue("@nombres", nombres);

            if (Convert.ToInt32(ddlEstadoVerificado.SelectedValue) == 2)
                rpt.SetParameterValue("@estadoVerificado", Convert.DBNull);
            else
                rpt.SetParameterValue("@estadoVerificado", Convert.ToBoolean(Convert.ToInt32(ddlEstadoVerificado.SelectedValue)));

            if (Convert.ToInt32(ddlModoGrabacion.SelectedValue) == 2)
                rpt.SetParameterValue("@modoGrabacion", Convert.DBNull);
            else
                rpt.SetParameterValue("@modoGrabacion", Convert.ToBoolean(Convert.ToInt32(ddlModoGrabacion.SelectedValue)));

            rpt.ExportToHttpResponse(ExportFormatType.Excel, Response, true, "reporte_detalle_incorporaciones_" + DateFormatter.getTimestamp(DateTime.Now));
            
        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }
}
