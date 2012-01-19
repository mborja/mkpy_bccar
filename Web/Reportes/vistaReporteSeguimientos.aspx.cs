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

using BusinessLayer;
using EntityLayer;
using UtilityLayer;

using CrystalDecisions.CrystalReports.Engine;
using System.Collections.Generic;
using CrystalDecisions.Shared;

public partial class Reportes_vistaReporteSeguimientos : System.Web.UI.Page
{
    private SeguimientoBL seguimientoBL = new SeguimientoBL();
    private ConnectionBL connectionBL = new ConnectionBL();

    protected void Page_Load(object sender, EventArgs e)
    {
        //a
    }
    protected void gvSeguimiento_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerDetalle")
        {
            String regionCodigo = gvSeguimiento.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text;
            String zonaCodigo = gvSeguimiento.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text;

            Response.Redirect("vistaReporteDetalleSeguimientos.aspx?regionCodigo=" + regionCodigo + "&zonaCodigo=" + zonaCodigo, false);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
    }
    protected void gvSeguimiento_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
    }

    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        SeguimientoBE r = new SeguimientoBE();
        r.ZonaCodigo = (txtZonaCodigo.Text.Trim().Length == 0) ? null : txtZonaCodigo.Text;
        r.regionCodigo = (txtRegionCodigo.Text.Trim().Length == 0) ? null : txtRegionCodigo.Text;
        r.estadoVerificadoInt = 2; //Convert.ToInt32(ddlEstadoVerificado.SelectedValue);

        try
        {
            List<SeguimientoBE> listado = new List<SeguimientoBE>();
            listado = seguimientoBL.obtenerPorZonaRegion(r);

            gvSeguimiento.DataSource = listado;
            gvSeguimiento.DataBind();
            if (listado.Count == 0)
            {
                cmdExportarExcel.Enabled = false;
                divMensaje.InnerHtml = "<div id=\"error\">No se encontraron coincidencias.</div>";
            }
            else
            {
                cmdExportarExcel.Enabled = true;
                divMensaje.InnerHtml = "";
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvSeguimiento_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        gvSeguimiento.PageIndex = e.NewPageIndex;
        gvSeguimiento.DataBind();
    }
    protected void cmdExportarExcel_Click(object sender, EventArgs e)
    {
        String regionCodigo = txtRegionCodigo.Text;
        String zonaCodigo = txtZonaCodigo.Text;

        try
        {
            String db_databaseName = connectionBL.getDataBaseName();
            String db_serverName = connectionBL.getServerName();
            String db_userID = connectionBL.getUserID();
            String db_password = connectionBL.getPassword();

            ReportDocument rpt = new ReportDocument();
            rpt.Load(Server.MapPath("../CrystalReports/crReporteSeguimiento.rpt"));
            rpt.SetDatabaseLogon("", "", ".", db_databaseName);
            rpt.SetParameterValue("@regionCodigo", regionCodigo);
            rpt.SetParameterValue("@zonaCodigo", zonaCodigo);
            rpt.SetParameterValue("@estadoVerificiado", Convert.DBNull);
            rpt.ExportToHttpResponse(ExportFormatType.Excel, Response, true, "Reporte_seguimientos_" + DateFormatter.getTimestamp(DateTime.Now));

            /*
                rpt.ExportToHttpResponse(ExportFormatType.Excel, Response, true, "Prueba_ExcelNormal");
                //rpt.ExportToHttpResponse(ExportFormatType.ExcelRecord, Response, true, "Prueba_ExcelRecord");
             */
        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }
}
