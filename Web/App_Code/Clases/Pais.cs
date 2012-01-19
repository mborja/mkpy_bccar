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
/// Summary description for Pais
/// </summary>
public class Pais
{
    ConexionDatos cd = new ConexionDatos();

	public Pais()
	{
	}

    public DataTable obtener(String nomenclatura, String nombre, String mayoriaEdad)
    {
        DataTable dt = new DataTable("ListadoPaises");
        SqlDataAdapter da = new SqlDataAdapter();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            da = new SqlDataAdapter("SP_PAIS_OBTENER", cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            da.SelectCommand.Parameters.Add("@nomenclatura", SqlDbType.VarChar, 2).Value = nomenclatura;
            da.SelectCommand.Parameters.Add("@nombre", SqlDbType.VarChar, 200).Value = nombre;
            if (mayoriaEdad.Length > 0)
                da.SelectCommand.Parameters.Add("@mayoriaEdad", SqlDbType.Int).Value = Convert.ToInt32(mayoriaEdad);
            else
                da.SelectCommand.Parameters.Add("@mayoriaEdad", SqlDbType.Int).Value = DBNull.Value;

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

    public DataTable cargar(int paisID)
    {
        DataTable dt = new DataTable("Pais");
        SqlDataAdapter da = new SqlDataAdapter();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            da = new SqlDataAdapter("SP_PAIS_CARGAR", cn);
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

    public DataTable obtenerNombres()
    {
        DataTable dt = new DataTable("PaisNombres");
        SqlDataAdapter da = new SqlDataAdapter();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            da = new SqlDataAdapter("SP_PAIS_OBTENER_NOMBRES", cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
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

    public String actualizar(int paisID, String nomenclatura, int medad, bool seguimientoBB, bool reingresoBB, bool adicionalSC, bool gpsBB, bool verificadoIncorp, bool estado, DataTable dtDivPolitica, int caducidad)
    {
        String resultado = "success";

        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand cmd = new SqlCommand();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());

        try
        {
            cn.Open();
            cmd = new SqlCommand("SP_PAIS_ACTUALIZAR", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Transaction = cn.BeginTransaction();

            cmd.Parameters.Add("@paisID", SqlDbType.Int).Value = paisID;
            cmd.Parameters.Add("@nomenclatura", SqlDbType.Char, 2).Value = nomenclatura;
            cmd.Parameters.Add("@medad", SqlDbType.Int).Value = medad;
            cmd.Parameters.Add("@seguimientoBB", SqlDbType.Bit).Value = seguimientoBB;
            cmd.Parameters.Add("@reingresoBB", SqlDbType.Bit).Value = reingresoBB;
            cmd.Parameters.Add("@adicionalSC", SqlDbType.Bit).Value = adicionalSC;
            cmd.Parameters.Add("@gpsBB", SqlDbType.Bit).Value = gpsBB;
            cmd.Parameters.Add("@verificadoIncorp", SqlDbType.Bit).Value = verificadoIncorp;
            cmd.Parameters.Add("@estado", SqlDbType.Bit).Value = estado;
            cmd.Parameters.Add("@caducidad", SqlDbType.Int).Value = caducidad;

            cmd.ExecuteNonQuery();

            if (dtDivPolitica != null)
            {
                DivisionPolitica dp = new DivisionPolitica();

                for (int i = 0; i < dtDivPolitica.Rows.Count; i++)
                {
                    int divisionID = Convert.ToInt32(dtDivPolitica.Rows[i]["divisionID"]);
                    bool estadoDP = Convert.ToBoolean(dtDivPolitica.Rows[i]["estado"]);
                    resultado = dp.actualizar(divisionID, estadoDP, cmd);

                    if (!resultado.Equals("success"))
                    {
                        cmd.Transaction.Rollback();
                        cn.Close();
                        return resultado;
                    }
                }
            }
            
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
