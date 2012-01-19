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

public partial class HistorialCrediticio_vistaSeguimientos : System.Web.UI.Page
{
    private SeguimientoBL seguimientoBL = new SeguimientoBL();
    private ConnectionBL connectionBL = new ConnectionBL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblPaisTipoDocumento.Text = Convert.ToString(Session["paisTipoDocumento"]);

            //String gerenteID = Request.QueryString.Get("gerenteID");
            String regionCodigo = Request.QueryString.Get("regionCodigo");
            String zonaCodigo = Request.QueryString.Get("zonaCodigo");
            int estadoVerificado = 2; // Convert.ToInt32(Request.QueryString.Get("estadoVerificado"));

            if (regionCodigo != null && zonaCodigo != null )
            {
                lblRegionCodigo.Text = regionCodigo;
                lblZonaCodigo.Text = zonaCodigo;


                SeguimientoBE seguimientoBE = new SeguimientoBE();
                //incorporacionBL.obtenerPorParametros(regionCodigo, zonaCodigo, null, null, null, null, null, null, null, estadoVerificado, 2);
                seguimientoBE.FechaIngreso = "";
                seguimientoBE.regionCodigo = regionCodigo;
                seguimientoBE.ZonaCodigo = zonaCodigo;
                //seguimientoBE.ModoGrabacionInt = 2;
                seguimientoBE.estadoVerificadoInt = estadoVerificado;

                List<SeguimientoBE> listado = new List<SeguimientoBE>();
                listado = seguimientoBL.obtenerPorParametros(seguimientoBE);
                gvSeguimientos.DataSource = listado;
                gvSeguimientos.DataBind();
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
        String fechaInscripcion = txtFechaInscripcion.Text;
        String campanhaInscripcion = txtCampaniaInscripcion.Text;
        String numeroDocumento = txtDocumentoIdentidad.Text;
        String consultoraCodigo = txtCodigoConsultora.Text;
        String apellidoPaterno = txtApellidoPaterno.Text;
        String apellidoMaterno = txtApellidoMaterno.Text;
        String nombres = txtNombres.Text;
        int estadoVerificado = 2; // Convert.ToInt32(ddlEstadoVerificado.SelectedValue);
        //int modoGrabacion = Convert.ToInt32(ddlModoGrabacion.SelectedValue);

        try
        {
            SeguimientoBE seguimientoBE = new SeguimientoBE();
            seguimientoBE.regionCodigo = regionCodigo;
            seguimientoBE.ZonaCodigo = zonaCodigo;
            seguimientoBE.FechaIngreso = fechaInscripcion;
            seguimientoBE.Campanha = campanhaInscripcion;
            seguimientoBE.documentoNumero = numeroDocumento;
            seguimientoBE.ConsultoraCodigo = consultoraCodigo;
            seguimientoBE.apellidoPaterno = apellidoPaterno;
            seguimientoBE.apellidoMaterno = apellidoMaterno;
            seguimientoBE.nombres = nombres;
            seguimientoBE.estadoVerificadoInt = estadoVerificado;

            List<SeguimientoBE> listado = new List<SeguimientoBE>();
            listado = seguimientoBL.obtenerPorParametros(seguimientoBE);

            gvSeguimientos.DataSource = listado;
            gvSeguimientos.DataBind();
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

    protected void gvSeguimientos_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
        e.Row.Cells[1].Visible = false;
    }

    protected void gvSeguimientos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "generatePDFView")
        {
            String seguimientoID = gvSeguimientos.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            String consultoraCodigo = gvSeguimientos.Rows[Convert.ToInt32(e.CommandArgument)].Cells[5].Text;

            try
            {
                String db_databaseName = connectionBL.getDataBaseName();
                String db_serverName = connectionBL.getServerName();
                String db_userID = connectionBL.getUserID();
                String db_password = connectionBL.getPassword();

                ReportDocument rpt = new ReportDocument();
                rpt.Load(Server.MapPath("../CrystalReports/crSeguimiento.rpt"));
                rpt.SetDatabaseLogon("", "", ".", db_databaseName);
                rpt.SetParameterValue("@consultoraCodigo", Convert.ToInt32(consultoraCodigo));

                rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Seguimientos_" + DateFormatter.getTimestamp(DateTime.Now));

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
        String fechaInscripcion = txtFechaInscripcion.Text;
        String campanhaInscripcion = txtCampaniaInscripcion.Text;
        String documentoNumero = txtDocumentoIdentidad.Text;
        String consultoraCodigo = txtCodigoConsultora.Text;
        String apellidoPaterno = txtApellidoPaterno.Text;
        String apellidoMaterno = txtApellidoMaterno.Text;
        String nombres = txtNombres.Text;

        int intEstadoVerificado = 2; // Convert.ToInt32(ddlEstadoVerificado.SelectedValue);
        //int intModoGrabacion = Convert.ToInt32(ddlModoGrabacion.SelectedValue);

        try
        {
            String db_databaseName = connectionBL.getDataBaseName();
            String db_serverName = connectionBL.getServerName();
            String db_userID = connectionBL.getUserID();
            String db_password = connectionBL.getPassword();
            
            ReportDocument rpt = new ReportDocument();
            rpt.Load(Server.MapPath("../CrystalReports/crReporteSeguimientoDetalle.rpt"));
            rpt.SetDatabaseLogon("", "", ".", db_databaseName);
            rpt.SetParameterValue("@regionCodigo", regionCodigo);
            rpt.SetParameterValue("@zonaCodigo", zonaCodigo);
            rpt.SetParameterValue("@fechaInscripcion", Convert.DBNull); // < por ahora null
            rpt.SetParameterValue("@campanhaInscripcion", campanhaInscripcion);
            rpt.SetParameterValue("@numeroDocumento", documentoNumero);
            rpt.SetParameterValue("@consultoraCodigo", consultoraCodigo);
            rpt.SetParameterValue("@apellidoPaterno", apellidoPaterno);
            rpt.SetParameterValue("@apellidoMaterno", apellidoMaterno);
            rpt.SetParameterValue("@nombres", nombres);

            if (intEstadoVerificado == 2)
                rpt.SetParameterValue("@estadoVerificado", Convert.DBNull);
            else
                rpt.SetParameterValue("@estadoVerificado", Convert.ToBoolean(intEstadoVerificado));

            rpt.ExportToHttpResponse(ExportFormatType.Excel, Response, true, "reporte_detalle_seguimientos_" + DateFormatter.getTimestamp(DateTime.Now));
            
        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show(ex.Message);
        }
    }
}
