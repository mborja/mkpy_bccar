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
using System.IO;
using System.Text;

//using CrystalDecisions.CrystalReports.Engine;
//using CrystalDecisions.Shared;

public partial class Reportes_Evaluaciones : System.Web.UI.Page
{

    ConexionDatos con = new ConexionDatos();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Detalle")
        {
            try
            {
                //int i = Convert.ToInt16(e.CommandArgument);// - (GvFormaPago.PageIndex * GvFormaPago.PageSize);
                //string gerenteId = Convert.ToString(GridView1.DataKeys[i].Value);


                string region = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[0].ToString();
                string zona = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[1].ToString();
                string grabacion = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[2].ToString();
                string _estado = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[3].ToString();

                int estado = 0;
                if (_estado.Equals("True"))
                    estado = 1;
                
                Response.Redirect("EvaluacionesDetalle.aspx?ps=" + Session["paisId"].ToString() + "&rn=" + region + "&za=" + zona + "&gn=" + grabacion + "&eo=" + estado, false);
            }
            catch (Exception ex)
            {
                EventLogger ev = new EventLogger();
                ev.Save("Evaluaciones, RowCommand ", ex);
            }
        }
    }

    protected void btnExportar_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "Exportar")
        {
            if (GridView1.Rows.Count > 0 && GridView1.Visible == true )
            {
                /*
                try
                {
                    String db_database = con.getDataBaseName();
                    String db_server = con.getServerName();
                    String db_uid = con.getUserID();
                    String db_pwd = con.getPassword();

                    int abc = (Int32)Session["paisId"];
                    
                    ReportDocument rpt = new ReportDocument();

                    //System.Windows.Forms.MessageBox.Show("Región: " + txtRegion.Text);
                    //System.Windows.Forms.MessageBox.Show("Modo: " + ddlModo.SelectedValue);

                    rpt.Load(Server.MapPath("crIncorporaciones_sp.rpt"));
                    rpt.SetDatabaseLogon(con.getUserID(), con.getPassword(), con.getServerName(), con.getDataBaseName());
                    rpt.SetParameterValue("@IDPAIS", (Int32)Session["paisId"]);
                    rpt.SetParameterValue("@paisID", (Int32)Session["paisId"]);
                    rpt.SetParameterValue("@REGION", txtRegion.Text);
                    rpt.SetParameterValue("@ZONA", txtZona.Text);
                    rpt.SetParameterValue("@GRAB", ddlModo.SelectedValue);
                    rpt.SetParameterValue("@ESTADO", ddlEstado.SelectedValue);

                    rpt.ExportToHttpResponse(ExportFormatType.Excel, Response, true, "Prueba_ExcelNormal");
                    //rpt.ExportToHttpResponse(ExportFormatType.ExcelRecord, Response, true, "Prueba_ExcelRecord");
                    
                }
                catch (Exception ex)
                {
                    System.Windows.Forms.MessageBox.Show(ex.Message);
                }
                */
            }
            else {
                lblMsj.Text = "la tabla no contiene datos para exportar..."; 
            }
        }
    }


    protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        lblMsj.Text = "";
        GridView1.Visible = true;
    }
}

