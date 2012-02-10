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
using System.Collections.Generic;

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

public partial class Reportes_vistaReporteIncorporaciones : System.Web.UI.Page
{
    private IncorporacionBL incorporacionBL = new IncorporacionBL();
    private ConnectionBL connectionBL = new ConnectionBL();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvIncorporaciones_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //e.Row.Cells[0].Visible = false;
        e.Row.Cells[5].Visible = false;
        e.Row.Cells[6].Visible = false;
    }

    protected void gvIncorporaciones_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "VerDetalle")
        {
            //String incorporacionID = gvIncorporaciones.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            String gerenteID = ""; // gvIncorporaciones.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            String regionCodigo = gvIncorporaciones.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            String zonaCodigo = gvIncorporaciones.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text;
            bool modoGrabacion = Convert.ToBoolean(gvIncorporaciones.Rows[Convert.ToInt32(e.CommandArgument)].Cells[5].Text);
            int intModoGrabacion = (modoGrabacion) ? 1 : 0;
            bool estadoVerificado = Convert.ToBoolean(gvIncorporaciones.Rows[Convert.ToInt32(e.CommandArgument)].Cells[6].Text);
            int intEstadoVerificado = (estadoVerificado) ? 1 : 0;

            Response.Redirect("vistaReporteDetalleIncorporaciones.aspx?gerenteID=" + gerenteID + "&regionCodigo=" + regionCodigo + "&zonaCodigo=" + zonaCodigo + "&estadoVerificado=" + intEstadoVerificado + "&modoGrabacion=" + intModoGrabacion, false);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
    }

    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        String regionCodigo = txtRegion.Text;
        String zonaCodigo = txtZona.Text;

        try
        {
            List<IncorporacionConsultaBE> listado = new List<IncorporacionConsultaBE>();
            listado = incorporacionBL.obtenerPorZonaRegion(zonaCodigo, regionCodigo, Convert.ToInt32(ddlModoGrabacion.SelectedValue), Convert.ToInt32(ddlEstadoVerificado.SelectedValue));

            gvIncorporaciones.DataSource = listado;
            gvIncorporaciones.DataBind();
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
            System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }
    protected void cmdExportarExcel_Click(object sender, EventArgs e)
    {
        String regionCodigo = txtRegion.Text;
        String zonaCodigo = txtZona.Text;

        try
        {
            String db_databaseName = connectionBL.getDataBaseName();
            String db_serverName = connectionBL.getServerName();
            String db_userID = connectionBL.getUserID();
            String db_password = connectionBL.getPassword();

            ReportDocument rpt = new ReportDocument();
            rpt.Load(Server.MapPath("../CrystalReports/crReporteIncorporacion.rpt"));
            rpt.SetDatabaseLogon("", "", ".", db_databaseName);
            rpt.SetParameterValue("@regionCodigo", regionCodigo);
            rpt.SetParameterValue("@zonaCodigo", zonaCodigo);
            if ( Convert.ToInt32(ddlModoGrabacion.SelectedValue) > 1 ) 
            {
                rpt.SetParameterValue("@modoGrabacion", Convert.DBNull);
            } else {
                rpt.SetParameterValue("@modoGrabacion", Convert.ToBoolean(Convert.ToInt32(ddlModoGrabacion.SelectedValue)));
            }

            if (Convert.ToInt32(ddlEstadoVerificado.SelectedValue) > 1)
            {
                rpt.SetParameterValue("@estadoVerifica", Convert.DBNull);
            } else {
                rpt.SetParameterValue("@estadoVerifica", Convert.ToBoolean(Convert.ToInt32(ddlEstadoVerificado.SelectedValue)));
            }

            rpt.ExportToHttpResponse(ExportFormatType.Excel, Response, true, "Reporte_incorporaciones_" + DateFormatter.getTimestamp(DateTime.Now));

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
