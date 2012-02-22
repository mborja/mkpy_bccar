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
/// Summary description for GerenteZona
/// </summary>
public class GerenteZona
{
    ConexionDatos cd = new ConexionDatos();

	public GerenteZona()
	{
	}

    public DataTable obtener(String nombres, String regionCodigo, String zonaCodigo)
    {
        DataTable dt = new DataTable("ListadoGerentes");
        SqlDataAdapter da = new SqlDataAdapter();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            da = new SqlDataAdapter("SP_GERENTEZONA_OBTENER", cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            da.SelectCommand.Parameters.Add("@nombres", SqlDbType.VarChar, 30).Value = nombres;
            da.SelectCommand.Parameters.Add("@regionCodigo", SqlDbType.VarChar, 2).Value = regionCodigo;
            da.SelectCommand.Parameters.Add("@zonaCodgo", SqlDbType.VarChar, 6).Value = zonaCodigo;

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

    public DataTable cargar(int gerenteID)
    {
        DataTable dt = new DataTable("Gerente");
        SqlDataAdapter da = new SqlDataAdapter();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            da = new SqlDataAdapter("SP_GERENTEZONA_CARGAR", cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@gerenteID", SqlDbType.Int).Value = gerenteID;
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
    
    public String actualizar(int gerenteID, String pin, String imsi, bool estado)
    {
        String resultado = "success";

        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            cmd = new SqlCommand("SP_GERENTEZONA_ACTUALIZAR", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Transaction = cn.BeginTransaction();

            cmd.Parameters.Add("@gerenteID", SqlDbType.Int).Value = gerenteID;
            cmd.Parameters.Add("@pin", SqlDbType.VarChar, 20).Value = pin;
            cmd.Parameters.Add("@imsi", SqlDbType.VarChar, 20).Value = imsi;
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
