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


public partial class lstPaises : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("upd") == "1")
                lblMsj.Text = "Los datos se actualizaron correctamente.";
            if (Request.QueryString.Get("ins") == "1")
                lblMsj.Text = "El país se agregó correctamente.";
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                int i = Convert.ToInt16(e.CommandArgument);// - (GvFormaPago.PageIndex * GvFormaPago.PageSize);
                string idPais = Convert.ToString(GridView3.DataKeys[i].Value);
                Response.Redirect("mantPais.aspx?idPais=" + idPais + "&met=E", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Response.Redirect("mantPais.aspx?met=I", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
         //   lblMsj.Text = "";
         //   GridView3.Visible = true;
           
        }
    }

