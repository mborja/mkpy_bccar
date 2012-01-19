using System;
using System.Data;
using System.Configuration;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data.SqlClient;

/// <summary>
/// Summary description for Usuario
/// </summary>
public class Usuario
{
    ConexionDatos cd = new ConexionDatos();

	public Usuario()
	{
	}

    public DataTable obtener(int paisID, String usuarioNombres, int perfilID, String estado)
    {
        DataTable dt = new DataTable("ListadoUsuarios");
        SqlDataAdapter da = new SqlDataAdapter();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            da = new SqlDataAdapter("usp_bel_usuario_obtener", cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            da.SelectCommand.Parameters.Add("@paisID", SqlDbType.Int).Value = paisID;
            da.SelectCommand.Parameters.Add("@nombres", SqlDbType.VarChar, 99).Value = usuarioNombres;
            da.SelectCommand.Parameters.Add("@perfil", SqlDbType.Int).Value = perfilID;

            if (estado.Equals("0"))
                da.SelectCommand.Parameters.Add("@estado", SqlDbType.Bit).Value = DBNull.Value;
            else
                da.SelectCommand.Parameters.Add("@estado", SqlDbType.Bit).Value = estado;
            da.Fill(dt);
            
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0", ex); //ASP.NET 2.0.50727.0
            dt = null;
        }
        finally
        {
            cn.Close();
        }

        return dt;
    }

    public DataTable cargar(int usuarioID)
    {
        DataTable dt = new DataTable("Usuario");
        SqlDataAdapter da = new SqlDataAdapter();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            da = new SqlDataAdapter("SP_USUARIO_CARGAR", cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@usuarioID", SqlDbType.Int).Value = usuarioID;
            da.Fill(dt);
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0", ex); //ASP.NET 2.0.50727.0
            dt = null;
        }
        finally
        {
            cn.Close();
        }

        return dt;
    }

    public String crear(int paisID, int perfilID, String usuario, String clave, String nombres, bool estado)
    {
        String resultado = "success";

        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            cmd = new SqlCommand("SP_USUARIO_CREAR", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Transaction = cn.BeginTransaction();

            cmd.Parameters.Add("@paisID", SqlDbType.Int).Value = paisID;
            cmd.Parameters.Add("@perfilID", SqlDbType.Int).Value = perfilID;
            cmd.Parameters.Add("@usuario", SqlDbType.VarChar, 15).Value = usuario;
            cmd.Parameters.Add("@clave", SqlDbType.VarChar, 15).Value = clave;
            cmd.Parameters.Add("@nombres", SqlDbType.VarChar, 99).Value = nombres;
            cmd.Parameters.Add("@estado", SqlDbType.Bit).Value = estado;

            cmd.ExecuteNonQuery();
            cmd.Transaction.Commit();
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0", ex); //ASP.NET 2.0.50727.0
            resultado = ex.Message;
            cmd.Transaction.Rollback();
        }
        finally
        {
            cn.Close();
        }

        return resultado;
    }

    public String actualizar(int usuarioID, int perfilID, String nombres, bool estado)
    {
        String resultado = "success";

        SqlCommand cmd = new SqlCommand();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            cmd = new SqlCommand("SP_USUARIO_ACTUALIZAR", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Transaction = cn.BeginTransaction();

            cmd.Parameters.Add("@usuarioID", SqlDbType.Int).Value = usuarioID;
            cmd.Parameters.Add("@perfilID", SqlDbType.Int).Value = perfilID;
            cmd.Parameters.Add("@nombres", SqlDbType.VarChar, 99).Value = nombres;
            cmd.Parameters.Add("@estado", SqlDbType.Bit).Value = estado;

            cmd.ExecuteNonQuery();
            cmd.Transaction.Commit();
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0", ex); //ASP.NET 2.0.50727.0
            resultado = ex.Message;
            cmd.Transaction.Rollback();
        }
        finally
        {
            cn.Close();
        }

        return resultado;
    }
}
