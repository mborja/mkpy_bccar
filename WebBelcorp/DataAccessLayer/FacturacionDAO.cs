using System;
using System.Collections.Generic;
using System.Text;

using EntityLayer;
using System.Data;
using System.Data.SqlClient;
using UtilityLayer;

namespace DataAccessLayer
{
    public class FacturacionDAO
    {
        private ConnectionDAO connection;

        public FacturacionDAO()
        {
            connection = new ConnectionDAO();
        }

        public String crear(FacturacionBE facturacionBE)
        {
            String resultado = "success";
            SqlCommand cmd = new SqlCommand();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                cmd = new SqlCommand("usp_bel_facturacion_crear", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Transaction = cn.BeginTransaction();

                cmd.Parameters.Add("@paisID", SqlDbType.Int).Value = facturacionBE.PaisID;
                cmd.Parameters.Add("@campanha", SqlDbType.VarChar, 6).Value = facturacionBE.Campanha;

                cmd.Parameters.Add("@companhiaCodigo", SqlDbType.VarChar, 2).Value = facturacionBE.CompanhiaCodigo;
                cmd.Parameters.Add("@regionCodigo", SqlDbType.VarChar, 2).Value = facturacionBE.RegionCodigo;
                cmd.Parameters.Add("@zonaCodigo", SqlDbType.VarChar, 6).Value = facturacionBE.ZonaCodigo;
                cmd.Parameters.Add("@fecha", SqlDbType.SmallDateTime).Value = Convert.ToDateTime(facturacionBE.Fecha);
                cmd.Parameters.Add("@estadoActivo", SqlDbType.VarChar, 6).Value = facturacionBE.EstadoActivo;

                cmd.ExecuteNonQuery();
                cmd.Transaction.Commit();
            }
            catch (Exception ex)
            {
                resultado = ex.Message;
                cmd.Transaction.Rollback();
            }
            finally
            {
                cn.Close();
                cmd.Dispose();
                cn.Dispose();
            }

            return resultado;
        }
    }
}
