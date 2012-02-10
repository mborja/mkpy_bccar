using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Reportes_Seguimientos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnExportar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Exportar")
            {
                  if (GridView1.Rows.Count > 0 && GridView1.Visible == true ){
                //try{
                    lblMsj.Text = "";
                    StringBuilder sb = new StringBuilder();
                    StringWriter sw = new StringWriter(sb);
                    HtmlTextWriter htw = new HtmlTextWriter(sw);

                    Page page = new Page();
                    HtmlForm form = new HtmlForm();

                    GridView1.EnableViewState = false;
                    // Deshabilitar la validación de eventos, sólo asp.net 2
                    page.EnableEventValidation = false;
                    // Realiza las inicializaciones de la instancia de la clase Page que requieran los diseñadores RAD.
                    page.DesignerInitialize();
                    page.Controls.Add(form);
                    form.Controls.Add(GridView1);
                    page.RenderControl(htw);
                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("Content-Disposition", "attachment;filename=Evaluaciones.xls");
                    Response.Charset = "UTF-8";
                    Response.ContentEncoding = Encoding.Default;
                    Response.Write(sb.ToString());
                    Response.End();
                  }
             else
             {
                 //lblMsj.Text = "la tabla no contiene datos para exportar...";
             }
                //}
                //catch (Exception ex)
                //{
                //    EventLogger ev = new EventLogger();
                //    ev.Save("Seguimiento, export excel ", ex);
                //}
        }
    }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Detalle")
            {

                try
                {
                    //int i = Convert.ToInt16(e.CommandArgument);// - (GvFormaPago.PageIndex * GvFormaPago.PageSize);
                    //string seguimiento = Convert.ToString(GridView1.DataKeys[i].Value);

         

                    string region = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[0].ToString();
                    string zona = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[1].ToString();
                    string _estado = GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[2].ToString();

                    int estado = 0;
                    if (_estado.Equals("True"))
                        estado = 1;

                    Response.Redirect("SeguimientoDetalle.aspx?ps=" + Session["paisId"].ToString() + "&rn=" + region + "&za=" + zona + "&eo=" + estado, false);


                    //Response.Redirect("SeguimientoDetalle.aspx?id=" + seguimiento, false);
                }
                catch (Exception ex)
                {
                    EventLogger ev = new EventLogger();
                    ev.Save("Seguimiento, RowCommand ", ex);
                }

            }
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            lblMsj.Text = "";
            GridView1.Visible = true;
        }
}

