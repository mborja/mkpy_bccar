using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data.SqlClient;

public partial class Mantenimientos_MantenerUsuario : System.Web.UI.Page
{
    ConexionDatos cd = new ConexionDatos();

    protected void Page_Load(object sender, EventArgs e)
    {
        //usuarioID
        //if (Request.QueryString.Get("ins") == "1")
        if (Request.QueryString.Get("met") == "E")
        {
            FormView1.ChangeMode(FormViewMode.Edit);
            BindFormView(Request.QueryString.Get("usuarioID"));
        }
    }

    private void BindFormView(String usuarioID)
    {
        /*
         Dim da As New SqlDataAdapter("SELECT * FROM TB_PROVEEDOR WHERE COD_PRV = @codigo", cn)
        With da
            .SelectCommand.Parameters.Add("@codigo", SqlDbType.Char, 4).Value = codigo
        End With

        Dim dt As New DataTable
        da.Fill(dt)
        Return dt
         */
        SqlConnection cn = new SqlConnection(cd.getConnectionString());
        SqlDataAdapter da = new SqlDataAdapter();
        String sqlQuery = "SELECT u.id, u.idtablaperfil, u.idpais, u.codigo, u.clave, u.nombre, u.estado FROM Usuario u WITH (NOLOCK) WHERE u.id = @usuarioID;";
        try
        {
            cn.Open();
            DataSet ds = new DataSet();
            da = new SqlDataAdapter(sqlQuery, cn);
            da.SelectCommand.Parameters.Add("@usuarioID", SqlDbType.Int).Value = usuarioID;
            da.Fill(ds);

            FormView1.DataSource = ds;
            FormView1.DataBind();
        }
        catch (Exception ex)
        {
            // event logger
        }
        finally
        {
            cn.Close();
        }
    }
}
