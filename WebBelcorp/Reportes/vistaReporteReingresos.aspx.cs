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

public partial class Reportes_vistaReporteReingresos : System.Web.UI.Page
{
    private ReingresoBL reingresoBL = new ReingresoBL();
    private ConnectionBL connectionBL = new ConnectionBL();

    protected void Page_Load(object sender, EventArgs e)
    {
        //a
    }
    protected void gvReingreso_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerDetalle")
        {
            //String incorporacionID = gvIncorporaciones.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            //String gerenteID = gvReingreso.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            String regionCodigo = gvReingreso.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            String zonaCodigo = gvReingreso.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text;

            bool estadoVerificado = Convert.ToBoolean(gvReingreso.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text);
            int intEstadoVerificado = (estadoVerificado) ? 1 : 0;

            Response.Redirect("vistaReporteDetalleReingresos.aspx?estadoVerificado=" + intEstadoVerificado + "&regionCodigo=" + regionCodigo + "&zonaCodigo=" + zonaCodigo, false);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
    }
    protected void gvReingreso_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //e.Row.Cells[0].Visible = false;
        e.Row.Cells[4].Visible = false;
        //e.Row.Cells[6].Visible = false;
    }

    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        ReingresoBE r = new ReingresoBE();
        r.zonaCodigo = (txtZonaCodigo.Text.Trim().Length == 0) ? null : txtZonaCodigo.Text;
        r.regionCodigo = (txtRegionCodigo.Text.Trim().Length == 0) ? null : txtRegionCodigo.Text;
        r.estadoVerificadoInt = Convert.ToInt32(ddlEstadoVerificado.SelectedValue);

        try
        {
            List<ReingresoBE> listado = new List<ReingresoBE>();
            listado = reingresoBL.obtenerPorZonaRegion(r);

            gvReingreso.DataSource = listado;
            gvReingreso.DataBind();
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
    protected void gvReingreso_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        
        gvReingreso.PageIndex = e.NewPageIndex;
        gvReingreso.DataBind();
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
            rpt.Load(Server.MapPath("../CrystalReports/crReporteReingreso.rpt"));
            rpt.SetDatabaseLogon("", "", ".", db_databaseName);
            rpt.SetParameterValue("@regionCodigo", regionCodigo);
            rpt.SetParameterValue("@zonaCodigo", zonaCodigo);
            if (Convert.ToInt32(ddlEstadoVerificado.SelectedValue) > 1)
            {
                rpt.SetParameterValue("@estadoVerificiado", Convert.DBNull);
            }
            else
            {
                rpt.SetParameterValue("@estadoVerificiado", Convert.ToBoolean(Convert.ToInt32(ddlEstadoVerificado.SelectedValue)));
            }
            rpt.ExportToHttpResponse(ExportFormatType.Excel, Response, true, "Reporte_reingresos_" + DateFormatter.getTimestamp(DateTime.Now));

            /*
                rpt.ExportToHttpResponse(ExportFormatType.Excel, Response, true, "Prueba_ExcelNormal");
                //rpt.ExportToHttpResponse(ExportFormatType.ExcelRecord, Response, true, "Prueba_ExcelRecord");
             */
        }
        catch (Exception ex)
        {
            Log.lanzarError(ex);
            //System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }
}
