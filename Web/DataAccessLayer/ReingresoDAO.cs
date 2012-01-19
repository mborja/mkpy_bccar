using System;
using System.Collections.Generic;
using System.Text;
using System.Globalization;

using EntityLayer;
using UtilityLayer;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class ReingresoDAO
    {
        private ConnectionDAO connection;

        public ReingresoDAO()
        {
            connection = new ConnectionDAO();
        }

        public List<ReingresoBE> obtenerPorParametros(ReingresoBE reingresoBE)
        {
            List<ReingresoBE> listado = new List<ReingresoBE>();

            DataTable dt = new DataTable("ListadoReingresos");
            SqlDataAdapter da = new SqlDataAdapter();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                da = new SqlDataAdapter("usp_bel_reingreso_obtener", cn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                //String regionCodigo, String zonaCodigo, String fechaReingreso, String campanhaInscripcion, String campanhaFacturacion, String numeroDocumento, String consultoraCodigo, String apellidoPaterno, String apellidoMaterno, String nombres, bool estado
                
                da.SelectCommand.Parameters.Add("@regionCodigo", SqlDbType.VarChar, 2).Value = reingresoBE.regionCodigo;
                da.SelectCommand.Parameters.Add("@zonaCodigo", SqlDbType.VarChar, 6).Value = reingresoBE.zonaCodigo;


                DateTime fechaProcesada = new DateTime();
                CultureInfo culture = new CultureInfo("en-GB");
                if (reingresoBE.recFechaReingreso != null)
                {
                    if (reingresoBE.recFechaReingreso.Length > 0)
                    {
                        try
                        {
                            fechaProcesada = Convert.ToDateTime(reingresoBE.recFechaReingreso, culture);
                        }
                        catch (Exception ex)
                        {
                            fechaProcesada = DateTime.Now;
                        }
                    }
                    da.SelectCommand.Parameters.Add("@fechaReingreso", SqlDbType.SmallDateTime).Value = (reingresoBE.recFechaReingreso.Length == 0) ? Convert.DBNull : fechaProcesada;

                }else{
                    da.SelectCommand.Parameters.Add("@fechaReingreso", SqlDbType.SmallDateTime).Value = Convert.DBNull;
                   
                }
                

                da.SelectCommand.Parameters.Add("@campanhaInscripcion", SqlDbType.VarChar, 6).Value = reingresoBE.campanhaInscripcion;
                da.SelectCommand.Parameters.Add("@campanhaFacturacion", SqlDbType.VarChar, 6).Value = reingresoBE.campanhaPrimeraCompra;
                da.SelectCommand.Parameters.Add("@documentoNumero", SqlDbType.VarChar, 18).Value = reingresoBE.documentoNumero;
                da.SelectCommand.Parameters.Add("@consultoraCodigo", SqlDbType.VarChar, 15).Value = reingresoBE.consultoraCodigo;
                da.SelectCommand.Parameters.Add("@apellidoPaterno", SqlDbType.VarChar, 30).Value = reingresoBE.apellidoPaterno;
                da.SelectCommand.Parameters.Add("@apellidoMaterno", SqlDbType.VarChar, 30).Value = reingresoBE.apellidoMaterno;
                da.SelectCommand.Parameters.Add("@nombres", SqlDbType.VarChar, 30).Value = reingresoBE.nombres;

                if (reingresoBE.estadoVerificadoInt > 1)
                    da.SelectCommand.Parameters.Add("@estadoVerificado", SqlDbType.Bit).Value = DBNull.Value;
                else
                    da.SelectCommand.Parameters.Add("@estadoVerificado", SqlDbType.Bit).Value = Convert.ToBoolean(reingresoBE.estadoVerificadoInt);

                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    ReingresoBE r;
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        r = new ReingresoBE();

                        r.reingresoID = Convert.ToInt32(dt.Rows[i]["reingresoID"]);
                        r.regionCodigo = Convert.ToString(dt.Rows[i]["regionCodigo"]).Trim();
                        r.zonaCodigo = Convert.ToString(dt.Rows[i]["zonaCodigo"]).Trim();
                        if (dt.Rows[i]["fechaReingreso"].Equals(DBNull.Value))
                        {
                            r.Fecha = "";
                        }else{
                            r.Fecha = DateFormatter.getShortTime(Convert.ToDateTime(dt.Rows[i]["fechaReingreso"])); //Convert.ToString(dt.Rows[i]["fechaReingreso"]).Trim();
                        }
                        //r.recFechaReingreso = DateFormatter.getShortTime(Convert.ToDateTime(dt.Rows[i]["fechaReingreso"]));
                        r.campanhaInscripcion = Convert.ToString(dt.Rows[i]["campanhaInscripcion"]).Trim();
                        r.campanhaPrimeraCompra = Convert.ToString(dt.Rows[i]["campanhaPrimeraCompra"]).Trim();
                        r.documentoNumero = Convert.ToString(dt.Rows[i]["documentoNumero"]).Trim();
                        r.consultoraCodigo = Convert.ToString(dt.Rows[i]["consultoraCodigo"]).Trim();
                        r.apellidoPaterno = Convert.ToString(dt.Rows[i]["apellidoPaterno"]).Trim();
                        r.apellidoMaterno = Convert.ToString(dt.Rows[i]["apellidoMaterno"]).Trim();
                        r.nombres = Convert.ToString(dt.Rows[i]["nombres"]).Trim();
                        r.estadoActivo = Convert.ToBoolean(dt.Rows[i]["estadoActivo"]);
                        r.estadoVerificado = Convert.ToBoolean(dt.Rows[i]["estadoVerificado"]);
                        r.estadoVerificadoString = (r.estadoVerificado) ? "Si" : "No";
                        listado.Add(r);
                    }
                }
            }
            catch (Exception ex)
            {
                listado = null;
            }
            finally
            {
                da.Dispose();
                dt.Dispose();

                cn.Close();
                cn.Dispose();
            }

            return listado;
        }

        public List<ReingresoBE> obtenerPorZonaRegion(ReingresoBE reingresoBE)
        {
            List<ReingresoBE> listado = new List<ReingresoBE>();

            DataTable dt = new DataTable("ListadoReingresosPorZonaRegion");
            SqlDataAdapter da = new SqlDataAdapter();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                da = new SqlDataAdapter("usp_bel_reingreso_obtener_por_region_zona", cn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                da.SelectCommand.Parameters.Add("@regionCodigo", SqlDbType.VarChar, 2).Value = reingresoBE.regionCodigo;
                da.SelectCommand.Parameters.Add("@zonaCodigo", SqlDbType.VarChar, 6).Value = reingresoBE.zonaCodigo;
                
                if (reingresoBE.estadoVerificadoInt > 1)
                    da.SelectCommand.Parameters.Add("@estadoVerificiado", SqlDbType.Bit).Value = DBNull.Value;
                else
                    da.SelectCommand.Parameters.Add("@estadoVerificiado", SqlDbType.Bit).Value = Convert.ToBoolean(reingresoBE.estadoVerificadoInt);

                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    ReingresoBE r;
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        r = new ReingresoBE();

                        //r.gerenteZonaID = Convert.ToInt32(dt.Rows[i]["gerenteID"]);
                        r.regionCodigo = Convert.ToString(dt.Rows[i]["regionCodigo"]).Trim();
                        r.zonaCodigo = Convert.ToString(dt.Rows[i]["zonaCodigo"]).Trim();
                        r.estadoVerificado = Convert.ToBoolean(dt.Rows[i]["estadoVerificado"]);
                        r.estadoVerificadoString = (r.estadoVerificado) ? "Si" : "No";
                        r.cantidad = Convert.ToInt32(dt.Rows[i]["cantidad"]);
                        listado.Add(r);
                    }
                }
            }
            catch (Exception ex)
            {
                listado = null;
            }
            finally
            {
                da.Dispose();
                dt.Dispose();

                cn.Close();
                cn.Dispose();
            }

            return listado;
        }

        public String ws_registroReingreso(ReingresoBE r, String appID)
        {
            String resultado = "";
            SqlCommand cmd = new SqlCommand();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                cmd = new SqlCommand("SP_WS_REGISTRO_REINGRESO", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Transaction = cn.BeginTransaction();

                cmd.Parameters.Add("@APPID", SqlDbType.VarChar, 19).Value = appID;
                cmd.Parameters.Add("@IDPAIS", SqlDbType.Int).Value = r.paisID;
                cmd.Parameters.Add("@PIN", SqlDbType.VarChar, 20).Value = r.Pin;
                cmd.Parameters.Add("@IMSI", SqlDbType.VarChar, 20).Value = r.Imsi;
                cmd.Parameters.Add("@CODIGOZONA", SqlDbType.VarChar, 6).Value = r.zonaCodigo;
                cmd.Parameters.Add("@CAMPANHA", SqlDbType.VarChar, 6).Value = r.Campanha;
                cmd.Parameters.Add("@FECHA", SqlDbType.VarChar, 12).Value = r.Fecha;
                cmd.Parameters.Add("@CODIGOCONSULTORA", SqlDbType.VarChar, 15).Value = r.consultoraCodigo;
                cmd.Parameters.Add("@NOMBRES", SqlDbType.VarChar, 30).Value = r.nombres;
                cmd.Parameters.Add("@APELLIDOPATERNO", SqlDbType.VarChar, 30).Value = r.apellidoPaterno;
                cmd.Parameters.Add("@APELLIDOMATERNO", SqlDbType.VarChar, 30).Value = r.apellidoMaterno;
                cmd.Parameters.Add("@NRODOCUMENTO", SqlDbType.Char, 18).Value = r.documentoNumero;
                cmd.Parameters.Add("@RECORD_PIN", SqlDbType.VarChar, 20).Value = r.recPin;
                cmd.Parameters.Add("@RECORD_IMSI", SqlDbType.VarChar, 20).Value = r.recImsi;
                cmd.Parameters.Add("@RECORD_LONGITUD", SqlDbType.VarChar, 20).Value = r.recLongitud;
                cmd.Parameters.Add("@RECORD_LATITUD", SqlDbType.VarChar, 20).Value = r.recLatitud;
                cmd.Parameters.Add("@RECORD_MARGEN", SqlDbType.VarChar, 9).Value = r.recMargen;
                cmd.Parameters.Add("@RECORD_NROSATELITES", SqlDbType.Int).Value = r.recNumeroSatelites;
                cmd.Parameters.Add("@RECORD_OBSERVACION", SqlDbType.VarChar, 200).Value = r.recObservacion;
                cmd.Parameters.Add("@RECORD_FECHAVISITA", SqlDbType.VarChar, 12).Value = r.recFechaVisita;

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    resultado = reader.GetString(0) + reader.GetString(1);
                }
                
                reader.Close();

                cmd = new SqlCommand("SELECT max(id) from tb_reingreso", cn);
                r.reingresoID = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (Exception ex)
            {
                resultado = "0|" + ex.Message;
                //cmd.Transaction.Rollback();
            }
            finally
            {
                cn.Close();
                cmd.Dispose();
                cn.Dispose();
            }

            return resultado;
        }

        public Boolean registraVerificacion(int id)
        {
            Boolean resultado = false;
            try
            {
                SqlCommand cmd = new SqlCommand();
                SqlConnection cn = new SqlConnection(connection.getConnectionString());

                try
                {
                    cn.Open();
                    cmd = new SqlCommand("SP_REINGRESO_VERIFICAR", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                    cmd.ExecuteNonQuery();

                    resultado = true;
                }
                catch (Exception ex)
                {
                    //
                    resultado = false;
                }
                finally
                {
                    cn.Close();
                    cmd.Dispose();
                    cn.Dispose();
                }
                return resultado;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    
    }


}
