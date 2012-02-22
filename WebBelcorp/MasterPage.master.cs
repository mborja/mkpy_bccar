using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public partial class MasterPage : System.Web.UI.MasterPage
{

        protected void Page_Load(object sender, EventArgs e)
        {
           // Context.Request.Browser.Adapters.Clear();
            lblUser.Text = Session["usuarioNombre"].ToString();
            cargarPais();
            cargarMenu(Session["rolNombre"].ToString());
  
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            //
            menuReportes.Visible = false;
            menuAdmin.Visible = false;
            menuVerifica.Visible = false;

            Response.Redirect("Login.aspx");
        }

        public void cargarPais() 
        {
            imgpais.Src = (Convert.ToString(Session["paisRutaImagen"]));
        }

        public void cargarMenu(string rol) 
        {
            if (rol.Equals("Administrador"))
            {
                menuAdmin.Visible = true;
            }
            else if (rol.Equals("Reporteador"))
            {
                menuReportes.Visible = true;
            }
            else if (rol.Equals("Verificador"))
            {
                menuVerifica.Visible = true;
            }
        }
 
}
