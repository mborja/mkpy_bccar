using System;
using System.Data;
using System.Configuration;
using System.Linq;

using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Correo
/// </summary>
public class Correo
{
    ConexionDatos cd = new ConexionDatos();
    
	public Correo()
	{
	}

    public DataTable obtener(String nombres, String email, int operacionID, int paisID)
    {
        DataTable dt = new DataTable("ListadoCorreos");
        SqlDataAdapter da = new SqlDataAdapter();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            da = new SqlDataAdapter("SP_CORREO_OBTENER_POR_PAIS", cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            da.SelectCommand.Parameters.Add("@nombres", SqlDbType.VarChar, 30).Value = nombres;
            da.SelectCommand.Parameters.Add("@email", SqlDbType.VarChar, 40).Value = email;
            da.SelectCommand.Parameters.Add("@operacionID", SqlDbType.Int).Value = operacionID;
            da.SelectCommand.Parameters.Add("@paisID", SqlDbType.Int).Value = paisID;

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

    public DataTable cargar(int correoID)
    {
        DataTable dt = new DataTable("Correo");
        SqlDataAdapter da = new SqlDataAdapter();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            da = new SqlDataAdapter("SP_CORREO_CARGAR", cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@correoID", SqlDbType.Int).Value = correoID;
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

    public String crear(int paisID, int operacionID, String apellidoPaterno, String apellidoMaterno, String nombres, String numeroDocumento, String email, bool estado)
    {
        String resultado = "success";

        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            cmd = new SqlCommand("SP_CORREO_CREAR", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Transaction = cn.BeginTransaction();

            cmd.Parameters.Add("@paisID", SqlDbType.Int).Value = paisID;
            cmd.Parameters.Add("@tablaID", SqlDbType.Int).Value = operacionID;
            cmd.Parameters.Add("@apellidoPaterno", SqlDbType.VarChar, 30).Value = apellidoPaterno;
            cmd.Parameters.Add("@apellidoMaterno", SqlDbType.VarChar, 30).Value = apellidoMaterno;
            cmd.Parameters.Add("@nombres", SqlDbType.VarChar, 30).Value = nombres;
            cmd.Parameters.Add("@numeroDocumento", SqlDbType.Char, 18).Value = numeroDocumento;
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 40).Value = email;
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

    public String actualizar(int correoID, int operacionID, String apellidoPaterno, String apellidoMaterno, String nombres, String nrodoc, String email, bool estado)
    {
        String resultado = "success";

        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            cmd = new SqlCommand("SP_CORREO_ACTUALIZAR", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Transaction = cn.BeginTransaction();

            cmd.Parameters.Add("@correoID", SqlDbType.Int).Value = correoID;
            cmd.Parameters.Add("@operacionID", SqlDbType.Int).Value = operacionID;
            cmd.Parameters.Add("@apellidoPaterno", SqlDbType.VarChar, 30).Value = apellidoPaterno;
            cmd.Parameters.Add("@apellidoMaterno", SqlDbType.VarChar, 30).Value = apellidoMaterno;
            cmd.Parameters.Add("@nombres", SqlDbType.VarChar, 30).Value = nombres;
            cmd.Parameters.Add("@numeroDocumento", SqlDbType.Char, 18).Value = nrodoc;
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 40).Value = email;
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
