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
using System.Security.Principal;

public partial class lstusuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Get("upd") == "1")
            lblMsj.Text = "Los datos se actualizaron correctamente.";
        if (Request.QueryString.Get("ins") == "1")
            lblMsj.Text = "El usuario se agregó correctamente.";
    }

    protected void OnRowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
    }

    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editar")
        {
            String usuarioID = GridView2.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;

            Response.Redirect("mantUsuarios.aspx?met=E&usuarioID=" + usuarioID, true);
            //Response.Redirect("MantenerUsuario.aspx", true);

            //int i = Convert.ToInt16(e.CommandArgument);// - (GvFormaPago.PageIndex * GvFormaPago.PageSize);
            //string idUsuario = Convert.ToString(GridView2.DataKeys[i].Value);
            //System.Windows.Forms.MessageBox.Show("userID: " + idUsuario);
            //Response.Redirect("mantUsuarios.aspx?idUsuario=" + idUsuario + "&met=E", true);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("mantUsuarios.aspx?met=I", true);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //if (txtnombre.Text == "" && txtusuario.Text == "")
        //{
        //    lblMsj.Text = "Debe llenar al menos uno de los campos para Buscar";
        //    GridView2.Visible = false;
        //}
        //else
        //{
        
            lblMsj.Text = "";
            GridView2.Visible = true;
         

        //}
        
    }
}

