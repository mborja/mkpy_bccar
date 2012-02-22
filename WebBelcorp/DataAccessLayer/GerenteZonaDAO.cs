using System;
using System.Collections.Generic;
using System.Text;

using EntityLayer;
using System.Data;
using System.Data.SqlClient;
using UtilityLayer;

namespace DataAccessLayer
{
    public class GerenteZonaDAO
    {
        private ConnectionDAO connection;

        public GerenteZonaDAO()
        {
            connection = new ConnectionDAO();
        }

        public String crear(GerenteZonaBE gerenteZonaBE)
        {
            String resultado = "success";
            SqlCommand cmd = new SqlCommand();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                cmd = new SqlCommand("usp_bel_gerentezona_crear", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Transaction = cn.BeginTransaction();

                cmd.Parameters.Add("@paisID", SqlDbType.Int).Value = gerenteZonaBE.paisID;
                cmd.Parameters.Add("@regionCodigo", SqlDbType.VarChar, 2).Value = (gerenteZonaBE.regionCodigo != null) ? gerenteZonaBE.regionCodigo : "";
                cmd.Parameters.Add("@zonaCodigo", SqlDbType.VarChar, 6).Value = (gerenteZonaBE.zonaCodigo != null) ? gerenteZonaBE.zonaCodigo : "";
                cmd.Parameters.Add("@seccionCodigo", SqlDbType.VarChar, 2).Value = (gerenteZonaBE.seccionCodigo != null) ? gerenteZonaBE.seccionCodigo : "";
                cmd.Parameters.Add("@territorioCodigo", SqlDbType.VarChar, 2).Value = (gerenteZonaBE.territorioCodigo != null) ? gerenteZonaBE.territorioCodigo : "";
                cmd.Parameters.Add("@companhiaCodigo", SqlDbType.VarChar, 2).Value = (gerenteZonaBE.companiaCodigo != null) ? gerenteZonaBE.companiaCodigo : "";
                cmd.Parameters.Add("@consultoraCodigo", SqlDbType.VarChar, 15).Value = (gerenteZonaBE.consultoraCodigo != null) ? gerenteZonaBE.consultoraCodigo : "";
                cmd.Parameters.Add("@pasarped", SqlDbType.VarChar, 2).Value = (gerenteZonaBE.pasarped != null) ? gerenteZonaBE.pasarped : "";
                cmd.Parameters.Add("@motivoRetiro", SqlDbType.VarChar, 2).Value = (gerenteZonaBE.motivoRetiro != null) ? gerenteZonaBE.motivoRetiro : "";
                cmd.Parameters.Add("@apellidoPaterno", SqlDbType.VarChar, 30).Value = (gerenteZonaBE.apellidoPaterno != null) ? gerenteZonaBE.apellidoPaterno : "";
                cmd.Parameters.Add("@apellidoMaterno", SqlDbType.VarChar, 30).Value = (gerenteZonaBE.apellidoMaterno != null) ? gerenteZonaBE.apellidoMaterno : "";
                cmd.Parameters.Add("@nombres", SqlDbType.VarChar, 30).Value = (gerenteZonaBE.nombres != null) ? gerenteZonaBE.nombres : "";
                cmd.Parameters.Add("@documentoNumero", SqlDbType.VarChar, 18).Value = (gerenteZonaBE.numeroDocumento != null) ? gerenteZonaBE.numeroDocumento : "";
                cmd.Parameters.Add("@telefono", SqlDbType.VarChar, 15).Value = (gerenteZonaBE.telefono != null) ? gerenteZonaBE.telefono : "";
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 40).Value = (gerenteZonaBE.email != null) ? gerenteZonaBE.email : "";
                cmd.Parameters.Add("@pin", SqlDbType.VarChar, 20).Value = (gerenteZonaBE.pin != null) ? gerenteZonaBE.pin : "";
                cmd.Parameters.Add("@imsi", SqlDbType.VarChar, 20).Value = (gerenteZonaBE.imsi != null) ? gerenteZonaBE.imsi : "";
                cmd.Parameters.Add("@estadoActivo", SqlDbType.Bit).Value = gerenteZonaBE.estadoActivo;

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
