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

public partial class ws_sw1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String APPID, IDPAIS, PIN, IMSI, ZONA;

        APPID = Request.QueryString.Get("APPID");
        IDPAIS = Request.QueryString.Get("IDPAIS");
        PIN = Request.QueryString.Get("PIN");
        IMSI = Request.QueryString.Get("IMSI");
        ZONA = Request.QueryString.Get("ZONA");


    //    try
    //    {
    //        String sqlUsuario =
    //            "SELECT     Usuario.Clave, Usuario.Codigo, Usuario.Nombre, Pais.Nombre AS Pais " +
    //            "FROM         Pais INNER JOIN Usuario ON Pais.idPais = Usuario.Pais_idPais" +
    //            "  where Codigo like '" + Usuario + "' and Clave like '" + Contrasena + "' and " +
    //            " Pais_idPais = " + pais;
    //        DataTable dtsUsuario = new DataTable();
    //        dtsUsuario = con.AccesoDatos(sqlUsuario);
    //        //int codEmpresa = Convert.ToInt32();

    //        if (dtsUsuario.Rows.Count == 1)
    //        {
    //            Session["usuarioNombre"] = dtsUsuario.Rows[0][2];
    //            Session["paisNombre"] = dtsUsuario.Rows[0][3];
    //            FormsAuthentication.RedirectFromLoginPage
    //            (Usuario, false);
    //            return true;
    //        }
    //        return false;
    //    }
    //    catch (Exception ex)
    //    {
    //        EventLogger ev = new EventLogger();
    //        ev.Save("LoginCorrecto ", ex);
    //        return false;
    //    }
    }
}
