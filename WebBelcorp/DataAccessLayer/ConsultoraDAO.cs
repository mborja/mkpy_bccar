using System;
using System.Collections.Generic;
using System.Text;

using EntityLayer;
using System.Data;
using System.Data.SqlClient;
using UtilityLayer;

namespace DataAccessLayer
{
    public class ConsultoraDAO
    {
        private ConnectionDAO connection;

        public ConsultoraDAO()
        {
            connection = new ConnectionDAO();
        }

        public String crear(ConsultoraBE consultoraBE)
        {
            String resultado = "success";
            SqlCommand cmd = new SqlCommand();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                cmd = new SqlCommand("usp_bel_consultora_crear", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Transaction = cn.BeginTransaction();

                cmd.Parameters.Add("@paisID", SqlDbType.Int).Value = consultoraBE.paisID;
                cmd.Parameters.Add("@campanhaInscripcion", SqlDbType.VarChar, 6).Value = (consultoraBE.campanhaInscripcion != null) ? consultoraBE.campanhaInscripcion : "";
                cmd.Parameters.Add("@campanhaPrimeraCompra", SqlDbType.VarChar, 6).Value = (consultoraBE.campanhaPrico != null) ? consultoraBE.campanhaPrico : "";
                cmd.Parameters.Add("@regionCodigo", SqlDbType.VarChar, 2).Value = (consultoraBE.regionCodigo != null) ? consultoraBE.regionCodigo : "";
                cmd.Parameters.Add("@zonaCodigo", SqlDbType.VarChar, 6).Value = (consultoraBE.zonaCodigo != null) ? consultoraBE.zonaCodigo : "";
                cmd.Parameters.Add("@seccionCodigo", SqlDbType.VarChar, 2).Value = (consultoraBE.seccionCodigo != null) ? consultoraBE.seccionCodigo : "";
                cmd.Parameters.Add("@territorioCodigo", SqlDbType.VarChar, 2).Value = (consultoraBE.territorioCodigo != null) ? consultoraBE.territorioCodigo : "";
                cmd.Parameters.Add("@companhiaCodigo", SqlDbType.VarChar, 2).Value = (consultoraBE.companiaCodigo != null) ? consultoraBE.companiaCodigo : "";
                cmd.Parameters.Add("@pasarped", SqlDbType.VarChar, 2).Value = (consultoraBE.pasarped != null) ? consultoraBE.pasarped : "";
                cmd.Parameters.Add("@motivoRetiro", SqlDbType.VarChar, 2).Value = (consultoraBE.motivoRetiro != null) ? consultoraBE.motivoRetiro : "";
                cmd.Parameters.Add("@codigo", SqlDbType.VarChar, 15).Value = (consultoraBE.codigo != null) ? consultoraBE.codigo : "";
                cmd.Parameters.Add("@apellidoPaterno", SqlDbType.VarChar, 30).Value = (consultoraBE.apellidoPaterno != null) ? consultoraBE.apellidoPaterno : "";
                cmd.Parameters.Add("@apellidoMaterno", SqlDbType.VarChar, 30).Value = (consultoraBE.apellidoMaterno != null) ? consultoraBE.apellidoMaterno : "";
                cmd.Parameters.Add("@nombres", SqlDbType.VarChar, 30).Value = (consultoraBE.nombres != null) ? consultoraBE.nombres : "";
                cmd.Parameters.Add("@numeroDocumento", SqlDbType.VarChar, 18).Value = (consultoraBE.numeroDocumento != null) ? consultoraBE.numeroDocumento : "";
                cmd.Parameters.Add("@telefono1", SqlDbType.VarChar, 15).Value = (consultoraBE.telefono1 != null) ? consultoraBE.telefono1 : "";
                cmd.Parameters.Add("@telefono2", SqlDbType.VarChar, 15).Value = (consultoraBE.telefono2 != null) ? consultoraBE.telefono2 : "";
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 40).Value = (consultoraBE.email != null) ? consultoraBE.email : "";
                cmd.Parameters.Add("@estadoActivo", SqlDbType.Bit).Value = consultoraBE.estadoActivo;

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
