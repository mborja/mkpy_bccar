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

public partial class ws_sw2 : System.Web.UI.Page 
{
        
    ConexionDatos con = new ConexionDatos();

    protected void Page_Load(object sender, EventArgs e)
    {
        String APPID, IDPAIS, PIN, IMSI;

        APPID = Request.QueryString.Get("APPID");
        IDPAIS = Request.QueryString.Get("IDPAIS");
        PIN = Request.QueryString.Get("PIN");
        IMSI = Request.QueryString.Get("IMSI");


         try
        {
            String sqlUsuario =
                "SELECT     Tablas.idTablas, Tablas.Descripcion "+
                " FROM         Tablas INNER JOIN " +
                "  TipoTabla ON Tablas.TipoTabla_idTipoTabla = TipoTabla.idTipoTabla " +
                " where Tablas.Pais_idPais = '"+ IDPAIS +"' and TipoTabla.idTipoTabla = '5' "+
                " and Tablas.estado = 'true' ";
            DataTable dtsUsuario = new DataTable();
            dtsUsuario = con.AccesoDatos(sqlUsuario);
             int size = dtsUsuario.Rows.Count ;
             //if (size != 0)
             //{
             //    lblResultado.Text = "";
             //    for (int i = 0; i < size; i++)
             //    {
             //        lblResultado.Text += Convert.ToString(dtsUsuario.Rows[i][0]);
             //        lblResultado.Text += con.separador() + dtsUsuario.Rows[i][1] + " <br/>";
             //    }
             //}
             //else
             //    lblResultado.Text = "sin datos";

             Response.Clear();
             Response.Buffer = true;
             Response.AddHeader("Content-type","text/xml");
             Response.AddHeader("charset","iso-8859-1");
             Response.Write("<?xml version=" + (char)34 + "1.0" + (char)34 + "?> ");
             //Response.Write("<XML>");
             Response.Write("<R>");
                 for (int i = 0; i < size; i++)
                 {
                   
                    Response.Write("<A>");
                    Response.Write(Convert.ToString(dtsUsuario.Rows[i][0]));
                    Response.Write("|");
                    Response.Write(Convert.ToString(dtsUsuario.Rows[i][1]));
                    Response.Write("</A>");
                    
                 }
                 Response.Write("</R>");
            //Response.Write("</XML>");
               
             

         }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("sw2, error tb.Tablas ", ex);
           
        }
    }

    
    public void getSS() { 
    }
}

