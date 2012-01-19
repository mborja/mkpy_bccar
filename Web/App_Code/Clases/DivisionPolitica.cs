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
/// Summary description for DivisionPolitica
/// </summary>
public class DivisionPolitica
{
    ConexionDatos cd = new ConexionDatos();

	public DivisionPolitica()
	{
	}

    public DataTable obtenerPorPaisID(int paisID)
    {
        DataTable dt = new DataTable("ListaDivisiones");
        SqlDataAdapter da = new SqlDataAdapter();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            da = new SqlDataAdapter("SP_DIVPOLITICA_OBTENER_POR_PAIS", cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
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

    public String actualizar(int divisionID, bool estado, SqlCommand cmd)
    {
        String resultado = "success";
        SqlCommand cmdLocal = new SqlCommand();
        cmdLocal = cmd;
        try
        {
            cmdLocal = new SqlCommand("SP_DIVPOLITICA_ACTUALIZAR_ESTADO", cmd.Connection);
            cmdLocal.CommandType = CommandType.StoredProcedure;
            cmdLocal.Transaction = cmd.Transaction;
            //cmd.Transaction = cn.BeginTransaction();

            cmdLocal.Parameters.Add("@divisionID", SqlDbType.Int).Value = divisionID;
            cmdLocal.Parameters.Add("@estado", SqlDbType.Bit).Value = estado;

            cmdLocal.ExecuteNonQuery();
            //cmd.Transaction.Commit();
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0", ex); //ASP.NET 2.0.50727.0
            resultado = ex.Message;
            //cmd.Transaction.Rollback();
        }
        finally
        {
            //cn.Close();
        }

        return resultado;
    }
}
