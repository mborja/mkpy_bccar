using System;
using System.Collections;
using System.Configuration;
using System.Globalization;
using System.Data;

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

public partial class HistorialCrediticio_vistaReingresos : System.Web.UI.Page
{
    private ReingresoBL reingresosBL = new ReingresoBL();
    private ConnectionBL connectionBL = new ConnectionBL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblPaisTipoDocumento.Text = Convert.ToString(Session["paisTipoDocumento"]);

            //String gerenteID = Request.QueryString.Get("gerenteID");
            String regionCodigo = Request.QueryString.Get("regionCodigo");
            String zonaCodigo = Request.QueryString.Get("zonaCodigo");
            int estadoVerificado = Convert.ToInt32(Request.QueryString.Get("estadoVerificado"));

            if (regionCodigo != null && zonaCodigo != null )
            {
                lblRegionCodigo.Text = regionCodigo;
                lblZonaCodigo.Text = zonaCodigo;

                if (estadoVerificado == 1)
                    ddlEstadoVerificado.SelectedIndex = 1;
                else
                    ddlEstadoVerificado.SelectedIndex = 2;

                ReingresoBE reingresoBE = new ReingresoBE();
                //incorporacionBL.obtenerPorParametros(regionCodigo, zonaCodigo, null, null, null, null, null, null, null, estadoVerificado, 2);
                //reingresoBE.Fecha = "";
                reingresoBE.regionCodigo = regionCodigo;
                reingresoBE.zonaCodigo = zonaCodigo;
                reingresoBE.estadoVerificadoInt = estadoVerificado;
                reingresoBE.recFechaReingresoIni="";
                reingresoBE.recFechaReingresoFin = "";

                List<ReingresoBE> listado = new List<ReingresoBE>();
                listado = reingresosBL.obtenerPorParametros(reingresoBE);
                gvReingresos.DataSource = listado;
                gvReingresos.DataBind();
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

        try
        {
            ReingresoBE reingresoBE = new ReingresoBE();
            reingresoBE.regionCodigo = regionCodigo;
            reingresoBE.zonaCodigo = zonaCodigo;
            reingresoBE.recFechaReingresoIni = fechaInscripcionIni;
            reingresoBE.recFechaReingresoFin = fechaInscripcionFin;
            reingresoBE.campanhaInscripcion = campanhaInscripcion;
            reingresoBE.documentoNumero = numeroDocumento;
            reingresoBE.consultoraCodigo = consultoraCodigo;
            reingresoBE.apellidoPaterno = apellidoPaterno;
            reingresoBE.apellidoMaterno = apellidoMaterno;
            reingresoBE.nombres = nombres;
            reingresoBE.estadoVerificadoInt = estadoVerificado;

            List<ReingresoBE> listado = new List<ReingresoBE>();
            listado = reingresosBL.obtenerPorParametros(reingresoBE);

            gvReingresos.DataSource = listado;
            gvReingresos.DataBind();
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

    protected void gvReingresos_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
        e.Row.Cells[1].Visible = false;
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
        DateTime dtFecRegIni = new DateTime(2000, 01, 01);
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

        try
        {
            String db_databaseName = connectionBL.getDataBaseName();
            String db_serverName = connectionBL.getServerName();
            String db_userID = connectionBL.getUserID();
            String db_password = connectionBL.getPassword();
            
            ReportDocument rpt = new ReportDocument();
            rpt.Load(Server.MapPath("../CrystalReports/crReporteReingresoDetalle.rpt"));
            rpt.SetDatabaseLogon("", "", ".", db_databaseName);
            rpt.SetParameterValue("@regionCodigo", regionCodigo);
            rpt.SetParameterValue("@zonaCodigo", zonaCodigo);
            rpt.SetParameterValue("@fechaReingreso", Convert.DBNull); // < por ahora null
            rpt.SetParameterValue("@fechaReingresoini", dtFecRegIni.ToShortDateString()); // < por ahora null
            rpt.SetParameterValue("@fechaReingresofin", dtFecRegFin.ToShortDateString()); // < por ahora null
            rpt.SetParameterValue("@campanhaInscripcion", campanhaInscripcion);
            rpt.SetParameterValue("@campanhaFacturacion", Convert.DBNull);
            rpt.SetParameterValue("@documentoNumero", documentoNumero);
            rpt.SetParameterValue("@consultoraCodigo", consultoraCodigo);
            rpt.SetParameterValue("@apellidoPaterno", apellidoPaterno);
            rpt.SetParameterValue("@apellidoMaterno", apellidoMaterno);
            rpt.SetParameterValue("@nombres", nombres);
            if (Convert.ToInt32(ddlEstadoVerificado.SelectedValue) > 1)
            {
                rpt.SetParameterValue("@estadoVerificado", Convert.DBNull);
            }
            else
            {
                rpt.SetParameterValue("@estadoVerificado", Convert.ToBoolean(Convert.ToInt32(ddlEstadoVerificado.SelectedValue)));
            }

            rpt.ExportToHttpResponse(ExportFormatType.Excel, Response, true, "reporte_detalle_reingreso_" + DateFormatter.getTimestamp(DateTime.Now));
            
        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }

    protected void gvReingresos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "generatePDFView")
        {
            String reingresoID = gvReingresos.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            String consultoraID = gvReingresos.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text;

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
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
        }
    }
}
