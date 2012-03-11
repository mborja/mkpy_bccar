using System;
using System.Collections.Generic;
using System.Text;
using System.Globalization;

using EntityLayer;
using System.Data;
using System.Data.SqlClient;
using UtilityLayer;


namespace DataAccessLayer
{
    public class IncorporacionDAO
    {
        ConnectionDAO connection;

        public IncorporacionDAO()
        {
            connection = new ConnectionDAO();
        }

        public List<IncorporacionConsultaBE> obtenerPorParametros(IncorporacionBE incorporacionBE)
        {
            List<IncorporacionConsultaBE> listado = new List<IncorporacionConsultaBE>();

            DataTable dt = new DataTable("ListadoIncorporacionesConsultoras");
            SqlDataAdapter da = new SqlDataAdapter();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                da = new SqlDataAdapter("usp_bel_incorporacion_obtener", cn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add("@regionCodigo", SqlDbType.Char, 2).Value = incorporacionBE.RegionCodigo;
                da.SelectCommand.Parameters.Add("@zonaCodigo", SqlDbType.Char, 6).Value = incorporacionBE.ZonaCodigo;

                DateTime dtProjectStartDate = new DateTime();
                DateTime dtFecRegIni = new DateTime();
                DateTime dtFecRegFin = new DateTime();
                CultureInfo culture = new CultureInfo("en-GB");
                if ( incorporacionBE.fechaRegistro.Length > 0) 
                {
                    try
                    {
                        dtProjectStartDate = Convert.ToDateTime(incorporacionBE.fechaRegistro, culture);
                        dtFecRegIni = Convert.ToDateTime(incorporacionBE.fecRegIni, culture);
                        dtFecRegFin = Convert.ToDateTime(incorporacionBE.fecRegFin, culture);
                    }                
                    catch (Exception ex) 
                    {
                        dtProjectStartDate = DateTime.Now;
                    }
                }

                da.SelectCommand.Parameters.Add("@fechaInscripcion", SqlDbType.SmallDateTime).Value = (incorporacionBE.fechaRegistro.Length == 0) ? Convert.DBNull : dtProjectStartDate;
                da.SelectCommand.Parameters.Add("@fecRegIni", SqlDbType.SmallDateTime).Value = (incorporacionBE.fecRegIni.Length == 0) ? Convert.DBNull : dtFecRegIni;
                da.SelectCommand.Parameters.Add("@fecRegFin", SqlDbType.SmallDateTime).Value = (incorporacionBE.fecRegFin.Length == 0) ? Convert.DBNull : dtFecRegFin;
                da.SelectCommand.Parameters.Add("@campanhaInscripcion", SqlDbType.VarChar, 6).Value = incorporacionBE.CampanhaInscripcion;
                da.SelectCommand.Parameters.Add("@numeroDocumento", SqlDbType.VarChar, 18).Value = incorporacionBE.numeroDocumento;
                da.SelectCommand.Parameters.Add("@consultoraCodigo", SqlDbType.VarChar, 15).Value = incorporacionBE.ConsultoraCodigo;
                da.SelectCommand.Parameters.Add("@apellidoPaterno", SqlDbType.VarChar, 30).Value = incorporacionBE.apellidoPaterno;
                da.SelectCommand.Parameters.Add("@apellidoMaterno", SqlDbType.VarChar, 30).Value = incorporacionBE.apellidoMaterno;
                da.SelectCommand.Parameters.Add("@nombres", SqlDbType.VarChar, 30).Value = incorporacionBE.nombres;
                da.SelectCommand.Parameters.Add("@modoGrabacion", SqlDbType.Bit).Value = Convert.ToBoolean(incorporacionBE.ModoGrabacionInt);
                da.SelectCommand.Parameters.Add("@estadoVerificado", SqlDbType.Bit).Value = (incorporacionBE.EstadoVerificadoInt > 1) ? Convert.DBNull : Convert.ToBoolean(incorporacionBE.EstadoVerificadoInt);
                
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    IncorporacionConsultaBE ic;

                    for (int j = 0; j < dt.Rows.Count; j++)
                    {
                        ic = new IncorporacionConsultaBE();

                        ic.incorporacionID = Convert.ToInt32(dt.Rows[j]["incorporacionID"]);
                        ic.consultoraID = (DBNull.Value.Equals(dt.Rows[j]["consultoraID"])) ? 0 : Convert.ToInt32(dt.Rows[j]["consultoraID"]);
                        ic.regionCodigo = Convert.ToString(dt.Rows[j]["region"]).Trim();
                        ic.zonaCodigo = Convert.ToString(dt.Rows[j]["zona"]).Trim();
                        //ic.fechaRegistro = Convert.ToString(dt.Rows[j]["fechaIncorporacion"]).Trim();
                        ic.fechaRegistro = Convert.ToString(dt.Rows[j]["fechaIncorporacion"]); //DateFormatter.getShortTime(Convert.ToDateTime(dt.Rows[j]["fechaIncorporacion"]));
                        ic.campanhaInscripcion = (DBNull.Value.Equals(dt.Rows[j]["campanhaInscripcion"])) ? "" : Convert.ToString(dt.Rows[j]["campanhaInscripcion"]).Trim();
                        ic.numeroDocumento = Convert.ToString(dt.Rows[j]["numeroDocumento"]).Trim();
                        ic.apellidoPaterno = Convert.ToString(dt.Rows[j]["apellidoPaterno"]).Trim();
                        ic.apellidoMaterno = Convert.ToString(dt.Rows[j]["apellidoMaterno"]).Trim();
                        ic.nombres = Convert.ToString(dt.Rows[j]["nombres"]).Trim();
                        ic.consultoraCodigo = (DBNull.Value.Equals(dt.Rows[j]["consultoraCodigo"])) ? "" : Convert.ToString(dt.Rows[j]["consultoraCodigo"]).Trim();
                        ic.estadoVerificado = Convert.ToBoolean(dt.Rows[j]["estadoVerificado"]);
                        ic.estadoActivo = Convert.ToBoolean(dt.Rows[j]["estadoActivo"]);
                        ic.tipo = Convert.ToChar(dt.Rows[j]["tipo"]);
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

        public List<IncorporacionConsultaBE> obtenerPorZonaRegion(String zonaCodigo, String regionCodigo, int modoGrabacion, int estadoVerificado)
        {
            List<IncorporacionConsultaBE> listado = new List<IncorporacionConsultaBE>();

            DataTable dt = new DataTable("ListadoIncorporacionesPorGerenteZona");
            SqlDataAdapter da = new SqlDataAdapter();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                da = new SqlDataAdapter("usp_bel_incorporacion_obtener_por_region_zona", cn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                da.SelectCommand.Parameters.Add("@regionCodigo", SqlDbType.VarChar, 2).Value = regionCodigo;
                da.SelectCommand.Parameters.Add("@zonaCodigo", SqlDbType.VarChar, 6).Value = zonaCodigo;

                if (modoGrabacion > 1)
                    da.SelectCommand.Parameters.Add("@modoGrabacion", SqlDbType.Bit).Value = DBNull.Value;
                else
                    da.SelectCommand.Parameters.Add("@modoGrabacion", SqlDbType.Bit).Value = Convert.ToBoolean(modoGrabacion);

                if (estadoVerificado > 1)
                    da.SelectCommand.Parameters.Add("@estadoVerifica", SqlDbType.Bit).Value = DBNull.Value;
                else
                    da.SelectCommand.Parameters.Add("@estadoVerifica", SqlDbType.Bit).Value = Convert.ToBoolean(estadoVerificado);
                
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    IncorporacionConsultaBE ic;

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        ic = new IncorporacionConsultaBE();

                        //ic.gerenteID = Convert.ToInt32(dt.Rows[i]["gerenteID"]);
                        ic.regionCodigo = Convert.ToString(dt.Rows[i]["regionCodigo"]).Trim();
                        ic.zonaCodigo = Convert.ToString(dt.Rows[i]["zonaCodigo"]).Trim();
                        ic.modoGrabacion = Convert.ToBoolean(dt.Rows[i]["modoGrabacion"]);
                        ic.modoGrabacionString = (ic.modoGrabacion) ? "Borrador" : "Real";
                        ic.estadoVerificado = Convert.ToBoolean(dt.Rows[i]["estadoVerifica"]);
                        ic.estadoVerificadoString = (ic.estadoVerificado) ? "Si" : "No";
                        ic.cantidad = Convert.ToInt32(dt.Rows[i]["cantidad"]);

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

        public String ws_registroIncorporacion(IncorporacionBE i, String appID)
        {
            String resultado = "";
            SqlCommand cmd = new SqlCommand();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                cmd = new SqlCommand("SP_WS_REGISTRO_INCORPORACION", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Transaction = cn.BeginTransaction();

                //cmd.Parameters.Add("@paisID", SqlDbType.Int).Value = gerenteZonaBE.paisID;
                cmd.Parameters.Add("@APPID", SqlDbType.Char, 19).Value = appID;
                cmd.Parameters.Add("@IDPAIS", SqlDbType.Int).Value = i.paisID;
                cmd.Parameters.Add("@PIN", SqlDbType.VarChar, 20).Value = i.Pin;
                cmd.Parameters.Add("@IMSI", SqlDbType.VarChar, 20).Value = i.Imsi;
                cmd.Parameters.Add("@CODIGOZONA", SqlDbType.VarChar, 8).Value = i.ZonaCodigo;
                cmd.Parameters.Add("@CODIGOTERRITORIO", SqlDbType.VarChar, 3).Value = i.territorioCodigo;
                cmd.Parameters.Add("@CODIGOCONSULTORARECOMIENDA", SqlDbType.VarChar, 15).Value = i.consultoraRecomendadoraCodigo;
                cmd.Parameters.Add("@FECHA", SqlDbType.VarChar, 12).Value = i.fechaRegistro;
                cmd.Parameters.Add("@PRIMERNOMBRE", SqlDbType.VarChar, 30).Value = i.PrimerNombre;
                cmd.Parameters.Add("@SEGUNDONOMBRE", SqlDbType.VarChar, 30).Value = i.SegundoNombre;
                cmd.Parameters.Add("@APELLIDOPATERNO", SqlDbType.VarChar, 30).Value = i.apellidoPaterno;
                cmd.Parameters.Add("@APELLIDOMATERNO", SqlDbType.VarChar, 30).Value = i.apellidoMaterno;
                cmd.Parameters.Add("@NRODOCUMENTO", SqlDbType.VarChar, 18).Value = i.numeroDocumento;
                cmd.Parameters.Add("@TELEFONOCASA", SqlDbType.VarChar, 15).Value = i.telefonoCasa;
                cmd.Parameters.Add("@TELEFONOCELULAR", SqlDbType.VarChar, 15).Value = i.telefonoCelular;
                cmd.Parameters.Add("@CORREOELECTRONICO", SqlDbType.VarChar, 40).Value = i.email;
                cmd.Parameters.Add("@IDCONTACTO", SqlDbType.Int).Value = i.tablaContactoID;
                cmd.Parameters.Add("@IDOTRAMARCA", SqlDbType.Int).Value = i.tablaOtraMarcaID;
                cmd.Parameters.Add("@IDESTADOCIVIL", SqlDbType.Int).Value = i.tablaEstadoCivilID;
                cmd.Parameters.Add("@IDNIVELEDUCATIVO", SqlDbType.Int).Value = i.tablaNivelEducativoID;
                cmd.Parameters.Add("@FECHANACIMIENTO", SqlDbType.VarChar, 12).Value = i.fechaNacimiento;
                cmd.Parameters.Add("@SOLICITANTE_DIRECCION", SqlDbType.VarChar, 100).Value = i.solicitudDireccion;
                cmd.Parameters.Add("@SOLICITANTE_CODIGOPOSTAL", SqlDbType.VarChar, 10).Value = i.solicitudCodigoPostal;
                cmd.Parameters.Add("@SOLICITANTE_REFERENCIA", SqlDbType.VarChar, 100).Value = i.solicitudReferencia;
                cmd.Parameters.Add("@SOLICITANTE_DIVISIONPOLITICA1", SqlDbType.VarChar, 50).Value = i.solicitudDivisionPolitica1;
                cmd.Parameters.Add("@SOLICITANTE_DIVISIONPOLITICA2", SqlDbType.VarChar, 50).Value = i.solicitudDivisionPolitica2;
                cmd.Parameters.Add("@ENTREGA_DIRECCION", SqlDbType.VarChar, 100).Value = i.entregaDireccion;
                cmd.Parameters.Add("@ENTREGA_CODIGOPOSTAL", SqlDbType.VarChar, 10).Value = i.entregaCodigoPostal;
                cmd.Parameters.Add("@ENTREGA_REFERENCIA", SqlDbType.VarChar, 100).Value = i.entregaReferencia;
                cmd.Parameters.Add("@ENTREGA_DIVISIONPOLITICA", SqlDbType.VarChar, 50).Value = i.entregaDivisionPolitica;
                cmd.Parameters.Add("@REFFAM_NOMBRES", SqlDbType.VarChar, 30).Value = i.referenciaFamiliarNombres;
                cmd.Parameters.Add("@REFFAM_APELLIDOPATERNO", SqlDbType.VarChar, 30).Value = i.referenciaFamiliarApellidoPaterno;
                cmd.Parameters.Add("@REFFAM_APELLIDOMATERNO", SqlDbType.VarChar, 30).Value = i.referenciaFamiliarApellidoMaterno;
                cmd.Parameters.Add("@REFFAM_DIRECCION", SqlDbType.VarChar, 100).Value = i.referenciaFamiliarDireccion;
                cmd.Parameters.Add("@REFFAM_TELEFONO", SqlDbType.VarChar, 15).Value = i.referenciaFamiliarTelefono;
                cmd.Parameters.Add("@REFFAM_CELULAR", SqlDbType.VarChar, 15).Value = i.referenciaFamiliarCelular;
                cmd.Parameters.Add("@REFFAM_IDVINCULO", SqlDbType.Int).Value = i.tablaReferenciaFamiliarTipoVinculoID;
                cmd.Parameters.Add("@REFNOFAM_NOMBRES", SqlDbType.VarChar, 30).Value = i.referenciaNoFamiliarNombres;
                cmd.Parameters.Add("@REFNOFAM_APELLIDOPATERNO", SqlDbType.VarChar, 30).Value = i.referenciaNoFamiliarApellidoPaterno;
                cmd.Parameters.Add("@REFNOFAM_APELLIDOMATERNO", SqlDbType.VarChar, 30).Value = i.referenciaNoFamiliarApellidoMaterno;
                cmd.Parameters.Add("@REFNOFAM_DIRECCION", SqlDbType.VarChar, 100).Value = i.referenciaNoFamiliarDireccion;
                cmd.Parameters.Add("@REFNOFAM_TELEFONO", SqlDbType.VarChar, 15).Value = i.referenciaNoFamiliarTelefono;
                cmd.Parameters.Add("@REFNOFAM_CELULAR", SqlDbType.VarChar, 15).Value = i.referenciaNoFamiliarCelular;
                cmd.Parameters.Add("@REFNOFAM_IDVINCULO", SqlDbType.Int).Value = i.tablaReferenciaNoFamiliarTipoVinculoID;
                cmd.Parameters.Add("@ADICIONAL_PROFESION", SqlDbType.VarChar, 100).Value = i.adicionalProfesion;
                cmd.Parameters.Add("@ADICIONAL_LUGARTRABAJO", SqlDbType.VarChar, 50).Value = i.adicionalLugarTrabajo;
                cmd.Parameters.Add("@ADICIONAL_TELEFONOTRABAJO", SqlDbType.VarChar, 15).Value = i.adicionalTelefonoTrabajo;
                cmd.Parameters.Add("@ADICIONAL_HORAVISITA", SqlDbType.VarChar, 4).Value = i.adicionalHoraVisita;
                cmd.Parameters.Add("@ADICIONAL_NROHIJOS", SqlDbType.Int).Value = i.adicionalNumeroHijos;
                cmd.Parameters.Add("@ADICIONAL_NROINFANTES", SqlDbType.Int).Value = i.adicionalNumeroInfantes;
                cmd.Parameters.Add("@ADICIONAL_NROESCOLARES", SqlDbType.Int).Value = i.adicionalNumeroEscolares;
                cmd.Parameters.Add("@ADICIONAL_NRONIVELSUPERIOR", SqlDbType.Int).Value = i.adicionalNumeroNivelSuperior;
                cmd.Parameters.Add("@ADICIONAL_NROADULTOS", SqlDbType.Int).Value = i.adicionalNumeroAdultos;
                cmd.Parameters.Add("@RECORD_PIN", SqlDbType.VarChar, 20).Value = i.recPin;
                cmd.Parameters.Add("@RECORD_IMSI", SqlDbType.VarChar, 20).Value = i.recIMSI;
                cmd.Parameters.Add("@RECORD_LONGITUD", SqlDbType.VarChar, 20).Value = i.recLongitud;
                cmd.Parameters.Add("@RECORD_LATITUD", SqlDbType.VarChar, 20).Value = i.recLatitud;
                cmd.Parameters.Add("@RECORD_MARGEN", SqlDbType.VarChar, 9).Value = i.recMargen;
                cmd.Parameters.Add("@RECORD_NROSATELITES", SqlDbType.Int).Value = i.recNumeroSatelites;
                cmd.Parameters.Add("@RECORD_OBSERVACION", SqlDbType.VarChar, 200).Value = i.recObservacion;
                cmd.Parameters.Add("@RECORD_FECHAVISITA", SqlDbType.VarChar, 12).Value = i.recFechaVisita;
                cmd.Parameters.Add("@TIPOGRABACION", SqlDbType.VarChar,1).Value = i.modoGrabacion;
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
                if (resultado.Split('|')[0] == "1")
                {
                    cmd = new SqlCommand("SELECT max(id) from tb_incorporacion", cn);
                    i.incorporacionID = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (Exception ex)
            {
                resultado = "0|0|" + ex.Message;
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
                    cmd = new SqlCommand("SP_INCORPORACION_VERIFICAR", cn);
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

        public List<IncorporacionConsultaBE> obtenerPorId(int Id)
        {
            List<IncorporacionConsultaBE> listado = new List<IncorporacionConsultaBE>();

            DataTable dt = new DataTable("ListadoIncorporacionesConsultoras");
            SqlDataAdapter da = new SqlDataAdapter();
            SqlConnection cn = new SqlConnection(connection.getConnectionString());

            try
            {
                cn.Open();
                da = new SqlDataAdapter("usp_bel_incorporacion_obtener_porID", cn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add("@incorporacionID", SqlDbType.Char, 2).Value = Id;
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    IncorporacionConsultaBE ic;

                    for (int j = 0; j < dt.Rows.Count; j++)
                    {
                        ic = new IncorporacionConsultaBE();

                        ic.incorporacionID = Convert.ToInt32(dt.Rows[j]["incorporacionID"]);
                        ic.consultoraID = (DBNull.Value.Equals(dt.Rows[j]["consultoraID"])) ? 0 : Convert.ToInt32(dt.Rows[j]["consultoraID"]);
                        ic.regionCodigo = Convert.ToString(dt.Rows[j]["region"]).Trim();
                        ic.zonaCodigo = Convert.ToString(dt.Rows[j]["zona"]).Trim();
                        //ic.fechaRegistro = Convert.ToString(dt.Rows[j]["fechaIncorporacion"]).Trim();
                        ic.fechaRegistro = Convert.ToString(dt.Rows[j]["fechaIncorporacion"]); //DateFormatter.getShortTime(Convert.ToDateTime(dt.Rows[j]["fechaIncorporacion"]));
                        ic.campanhaInscripcion = (DBNull.Value.Equals(dt.Rows[j]["campanhaInscripcion"])) ? "" : Convert.ToString(dt.Rows[j]["campanhaInscripcion"]).Trim();
                        ic.numeroDocumento = Convert.ToString(dt.Rows[j]["numeroDocumento"]).Trim();
                        ic.apellidoPaterno = Convert.ToString(dt.Rows[j]["apellidoPaterno"]).Trim();
                        ic.apellidoMaterno = Convert.ToString(dt.Rows[j]["apellidoMaterno"]).Trim();
                        ic.nombres = Convert.ToString(dt.Rows[j]["nombres"]).Trim();
                        ic.consultoraCodigo = (DBNull.Value.Equals(dt.Rows[j]["consultoraCodigo"])) ? "" : Convert.ToString(dt.Rows[j]["consultoraCodigo"]).Trim();
                        ic.estadoVerificado = Convert.ToBoolean(dt.Rows[j]["estadoVerificado"]);
                        ic.estadoActivo = Convert.ToBoolean(dt.Rows[j]["estadoActivo"]);
                        ic.tipo = Convert.ToChar(dt.Rows[j]["tipo"]);

                        listado.Add(ic);
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


    }
}
