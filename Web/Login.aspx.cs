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

using System.Data.SqlClient;

using System.IO;

public partial class Login : System.Web.UI.Page
{
    ConexionDatos cd = new ConexionDatos();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private bool LoginCorrecto(string usuario, string clave, string pais)
    {
        SqlConnection cn = new SqlConnection(cd.getConnectionString());
        SqlDataAdapter da = new SqlDataAdapter();

        try
        {
            cn.Open();
            da = new SqlDataAdapter("usp_bel_usuario_autenticar", cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            
            da.SelectCommand.Parameters.Add("@nombreusuario", SqlDbType.VarChar, 15).Value = usuario;
            da.SelectCommand.Parameters.Add("@clave", SqlDbType.VarChar, 15).Value = clave;
            da.SelectCommand.Parameters.Add("@paisID", SqlDbType.Int).Value = int.Parse(pais);
            
            /*
            da.SelectCommand.Parameters.Add("@nombreusuario", SqlDbType.VarChar, 15).Value = "natsume" ;
            da.SelectCommand.Parameters.Add("@clave", SqlDbType.VarChar, 15).Value = "nat";
            da.SelectCommand.Parameters.Add("@paisID", SqlDbType.Int).Value = int.Parse("8");
            */
            //
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count == 1)
            {
                // Si encontró exactamente UN resultado
                int usuarioID = (Int32)dt.Rows[0]["usuarioID"];
                int paisID = (Int32)dt.Rows[0]["paisID"];
                String paisNombre = (String)dt.Rows[0]["paisNombre"];
                String paisRutaImagen = (String)dt.Rows[0]["paisRutaImagen"];
                String paisTipoDocumento = Convert.ToString(dt.Rows[0]["paisTipoDocumento"]); 
                int perfilID = (Int32)dt.Rows[0]["perfilID"];
                String perfilDescripcion = (String)dt.Rows[0]["perfilDescripcion"];
                String usuarioNombre = (String)dt.Rows[0]["usuarioNombre"];
                bool estado = (bool)dt.Rows[0]["estado"];
                String usuarioNombres = (String)dt.Rows[0]["usuarioNombres"];

                // Se escriben los parámetros en sesión
                Session["usuarioNombre"] = usuarioNombres; // set user_names instead of username(login name)
                Session["paisNombre"] = paisNombre;
                Session["rolNombre"] = perfilDescripcion;
                Session["paisID"] = paisID;
                Session["paisRutaImagen"] = paisRutaImagen;
                Session["paisTipoDocumento"] = paisTipoDocumento;

                FormsAuthenticationTicket ticket;
                String cookie;
                HttpCookie httpCookie;
                ticket = new FormsAuthenticationTicket(1, usuarioNombres, DateTime.Now, DateTime.Now.AddMinutes(30), false, perfilDescripcion);
                cookie = FormsAuthentication.Encrypt(ticket);
                httpCookie = new HttpCookie(FormsAuthentication.FormsCookieName, cookie);
                Page.Response.Cookies.Add(httpCookie);
                return true;
            }

            return false;
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0", ex); //ASP.NET 2.0.50727.0
            return false;
        }
        finally
        {
            cn.Close();
        }
    }


    protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
    {
        try
        {
            DropDownList ddlPais = ((DropDownList)(Login1.FindControl("ddlPais")));

            bool Autenticado = false;
            Autenticado = LoginCorrecto(Login1.UserName, Login1.Password, ddlPais.SelectedValue);
            e.Authenticated = Autenticado;
            if (Autenticado)
            {
                Response.Redirect("Inicio.aspx?ctry=" + Session["paisID"].ToString());
            }
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0", ex);
        }
    }



    protected void LoginButton_Click(object sender, EventArgs e)
    {

    }

}


