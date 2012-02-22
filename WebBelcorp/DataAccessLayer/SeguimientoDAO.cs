using System;
using System.Collections.Generic;
using System.Text;

using EntityLayer;
using System.Data;
using System.Data.SqlClient;
using UtilityLayer;

namespace DataAccessLayer
{
    public class SeguimientoDAO
    {

        private ConnectionDAO connection;

        public SeguimientoDAO()
        {
            connection = new ConnectionDAO();
        }

        public List<SeguimientoBE> obtenerPorParametros(SeguimientoBE seguimientoBE)
        {
            List<SeguimientoBE> listado = new List<SeguimientoBE>();

            DataTable dt = new DataTable("ListadoSeguimientosConsultoras");
            SqlDataAdapter da = new SqlDataAdapter();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                da = new SqlDataAdapter("usp_bel_seguimiento_obtener", cn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                da.SelectCommand.Parameters.Add("@regionCodigo", SqlDbType.Char, 2).Value = seguimientoBE.regionCodigo;
                da.SelectCommand.Parameters.Add("@zonaCodigo", SqlDbType.Char, 6).Value = seguimientoBE.ZonaCodigo;

                da.SelectCommand.Parameters.Add("@fechaInscripcionIni", SqlDbType.SmallDateTime).Value = (seguimientoBE.FechaIngresoIni==null || seguimientoBE.FechaIngresoIni.Length == 0) ? Convert.DBNull : Convert.ToDateTime(seguimientoBE.FechaIngresoIni);
                da.SelectCommand.Parameters.Add("@fechaInscripcionFin", SqlDbType.SmallDateTime).Value = (seguimientoBE.FechaIngresoFin==null || seguimientoBE.FechaIngresoFin.Length == 0) ? Convert.DBNull : Convert.ToDateTime(seguimientoBE.FechaIngresoFin);
                
                da.SelectCommand.Parameters.Add("@campanhaInscripcion", SqlDbType.VarChar, 6).Value = seguimientoBE.Campanha;
                da.SelectCommand.Parameters.Add("@numeroDocumento", SqlDbType.VarChar, 18).Value = seguimientoBE.documentoNumero;
                da.SelectCommand.Parameters.Add("@consultoraCodigo", SqlDbType.VarChar, 15).Value = seguimientoBE.ConsultoraCodigo;
                da.SelectCommand.Parameters.Add("@apellidoPaterno", SqlDbType.VarChar, 30).Value = seguimientoBE.apellidoPaterno;
                da.SelectCommand.Parameters.Add("@apellidoMaterno", SqlDbType.VarChar, 30).Value = seguimientoBE.apellidoMaterno;
                da.SelectCommand.Parameters.Add("@nombres", SqlDbType.VarChar, 30).Value = seguimientoBE.nombres;

                //da.SelectCommand.Parameters.Add("@modoGrabacion", SqlDbType.Bit).Value = (incorporacionBE.ModoGrabacionInt > 1) ? Convert.DBNull : Convert.ToBoolean(incorporacionBE.ModoGrabacionInt);
                da.SelectCommand.Parameters.Add("@estadoVerificado", SqlDbType.Bit).Value = (seguimientoBE.estadoVerificadoInt > 1) ? Convert.DBNull : Convert.ToBoolean(seguimientoBE.estadoVerificadoInt);

                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    SeguimientoBE ic;

                    for (int j = 0; j < dt.Rows.Count; j++)
                    {
                        ic = new SeguimientoBE();

                        ic.SeguimientoID = Convert.ToInt32(dt.Rows[j]["seguimientoID"]);
                        ic.consultoraID = Convert.ToInt32(dt.Rows[j]["consultoraID"]);
                        ic.regionCodigo = Convert.ToString(dt.Rows[j]["region"]).Trim();
                        ic.ZonaCodigo = Convert.ToString(dt.Rows[j]["zona"]).Trim();
                        //ic.fechaRegistro = Convert.ToString(dt.Rows[j]["fechaIncorporacion"]).Trim();
                        ic.FechaIngreso = DateFormatter.getShortTime(Convert.ToDateTime(dt.Rows[j]["fechaIncorporacion"]));
                        ic.Campanha = Convert.ToString(dt.Rows[j]["campanhaInscripcion"]).Trim();
                        ic.documentoNumero = Convert.ToString(dt.Rows[j]["numeroDocumento"]).Trim();
                        ic.apellidoPaterno = Convert.ToString(dt.Rows[j]["apellidoPaterno"]).Trim();
                        ic.apellidoMaterno = Convert.ToString(dt.Rows[j]["apellidoMaterno"]).Trim();
                        ic.nombres = Convert.ToString(dt.Rows[j]["nombres"]).Trim();
                        ic.ConsultoraCodigo = Convert.ToString(dt.Rows[j]["consultoraCodigo"]).Trim();
                        ic.EstadoVerificado = Convert.ToBoolean(dt.Rows[j]["estadoVerificado"]);
                        //ic.estadoActivo = Convert.ToBoolean(dt.Rows[j]["estadoActivo"]);
                        //ic.tipo = Convert.ToChar(dt.Rows[j]["tipo"]);

                        listado.Add(ic);
                    }
                }
            }
            catch (Exception ex)
            {
                /*
                 EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0", ex); //ASP.NET 2.0.50727.0
            dt = null;
                 */
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

        public List<SeguimientoBE> obtenerPorZonaRegion(SeguimientoBE seguimientoBE)
        {
            List<SeguimientoBE> listado = new List<SeguimientoBE>();

            DataTable dt = new DataTable("ListadoSeguimientoPorZonaRegion");
            SqlDataAdapter da = new SqlDataAdapter();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                da = new SqlDataAdapter("usp_bel_seguimiento_obtener_por_region_zona", cn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                da.SelectCommand.Parameters.Add("@regionCodigo", SqlDbType.VarChar, 2).Value = seguimientoBE.regionCodigo;
                da.SelectCommand.Parameters.Add("@zonaCodigo", SqlDbType.VarChar, 6).Value = seguimientoBE.ZonaCodigo;

                if (seguimientoBE.estadoVerificadoInt > 1)
                    da.SelectCommand.Parameters.Add("@estadoVerificiado", SqlDbType.Bit).Value = DBNull.Value;
                else
                    da.SelectCommand.Parameters.Add("@estadoVerificiado", SqlDbType.Bit).Value = Convert.ToBoolean(seguimientoBE.estadoVerificadoInt);

                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    SeguimientoBE r;
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        r = new SeguimientoBE();

                        //r.GerenteZonaID = Convert.ToInt32(dt.Rows[i]["gerenteID"]);
                        r.regionCodigo = Convert.ToString(dt.Rows[i]["regionCodigo"]).Trim();
                        r.ZonaCodigo = Convert.ToString(dt.Rows[i]["zonaCodigo"]).Trim();
                        //r.EstadoVerificado = Convert.ToBoolean(dt.Rows[i]["estadoVerificado"]);
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

        public String ws_registroSeguimiento(SeguimientoBE s, String appID)
        {
            String resultado = "";
            SqlCommand cmd = new SqlCommand();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                cmd = new SqlCommand("SP_WS_REGISTRO_SEGUIMIENTO", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Transaction = cn.BeginTransaction();

                cmd.Parameters.Add("@APPID", SqlDbType.VarChar, 19).Value = appID;
                cmd.Parameters.Add("@IDPAIS", SqlDbType.Int).Value = s.PaisID;
                cmd.Parameters.Add("@PIN", SqlDbType.VarChar, 20).Value = s.Pin;
                cmd.Parameters.Add("@IMSI", SqlDbType.VarChar, 20).Value = s.Imsi;
                cmd.Parameters.Add("@CODIGOZONA", SqlDbType.VarChar, 6).Value = s.ZonaCodigo;
                cmd.Parameters.Add("@CAMPANHA", SqlDbType.VarChar, 20).Value = s.Campanha;
                cmd.Parameters.Add("@FECHA", SqlDbType.VarChar, 12).Value = s.Fecha;
                cmd.Parameters.Add("@CODIGOCONSULTORA", SqlDbType.VarChar, 20).Value = s.ConsultoraCodigo;

                cmd.Parameters.Add("@NRODOC", SqlDbType.VarChar, 20).Value = s.documentoNumero;

                cmd.Parameters.Add("@OBSERVACION", SqlDbType.VarChar, 200).Value = s.Observacion;
                cmd.Parameters.Add("@FECHA_INGRESO", SqlDbType.VarChar, 12).Value = s.FechaIngreso;
                cmd.Parameters.Add("@RECORD_PIN", SqlDbType.VarChar, 20).Value = s.RecordPin;
                cmd.Parameters.Add("@RECORD_IMSI", SqlDbType.VarChar, 20).Value = s.RecordImsi;
                cmd.Parameters.Add("@RECORD_LONGITUD", SqlDbType.VarChar, 20).Value = s.RecordLongitud;
                cmd.Parameters.Add("@RECORD_LATITUD", SqlDbType.VarChar, 20).Value = s.RecordLatitud;
                cmd.Parameters.Add("@RECORD_MARGEN", SqlDbType.VarChar, 9).Value = s.RecordMargen;
                cmd.Parameters.Add("@RECORD_NROSATELITES", SqlDbType.Int).Value = Convert.ToInt32(s.RecordNumeroSatelites);
                cmd.Parameters.Add("@RECORD_OBSERVACION", SqlDbType.VarChar, 200).Value = s.RecordObservacion;
                cmd.Parameters.Add("@RECORD_FECHAVISITA", SqlDbType.VarChar, 20).Value = s.RecordFechaVisita;

                /*
                int result = cmd.ExecuteNonQuery();
                resultado = resultado.ToString() + "|";
                cmd.Transaction.Commit();
                */
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    resultado = reader.GetString(0) + reader.GetString(1);
                }

                reader.Close();

                cmd = new SqlCommand("SELECT max(id) from tb_seguimiento", cn);
                s.SeguimientoID = Convert.ToInt32(cmd.ExecuteScalar());

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
                    cmd = new SqlCommand("SP_SEGUIMIENTO_VERIFICAR", cn);
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
