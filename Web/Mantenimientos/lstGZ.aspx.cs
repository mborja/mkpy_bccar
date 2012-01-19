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


public partial class lstGZ : System.Web.UI.Page
{

 protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("upd") == "1")
                lblMsj.Text = "Los datos se actualizaron correctamente.";
        }


        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                int i = Convert.ToInt16(e.CommandArgument);// - (GvFormaPago.PageIndex * GvFormaPago.PageSize);
                string idGerenteZona = Convert.ToString(GridView2.DataKeys[i].Value);
                Response.Redirect("mantGerenteZona.aspx?idGerenteZona=" + idGerenteZona + "&met=E", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("mantGerenteZona.aspx?met=I", true);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void Button3_Click1(object sender, EventArgs e)
        {/*
            if (txtNombre.Text == "" && txtRegion.Text  == "" && txtZona.Text == "")
            {
                lblMsj.Text = "Debe llenar al menos uno de los campos para Buscar";
                GridView2.Visible = false;
            }
            else
            {
                lblMsj.Text = "";
                GridView2.Visible = true;
            }*/
        }
     
}

