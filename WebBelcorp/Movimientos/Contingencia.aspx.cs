using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Net;
using System.Net.Mail;

using EntityLayer;
using BusinessLayer;
using UtilityLayer;
using System.Text.RegularExpressions;

public partial class Movimientos_Contingencia : System.Web.UI.Page
{
    private IncorporacionBL incorporacionBL;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UploadBtn_Click(object sender, EventArgs e)
    {
        String result = "";
        Boolean algunarchivo = false;

        if (fuIncorporacion.HasFile)
        {
            algunarchivo = true;
            result = procesaUpload(fuIncorporacion, MakipurayConstant.PROCESS_TYPE_CONSULTANT);
        }
        if (fuSeguimiento.HasFile)
        {
            //result = procesaUpload(fuIncorporacion, MakipurayConstant.PROCESS_TYPE_CONSULTANT);
            algunarchivo = true;
            divMensaje.InnerHtml = "<div id=\"error\"> Error en el formato de carga de Seguimiento.</div>";
        }
        if (fuReingreso.HasFile)
        {
            algunarchivo = true;
            divMensaje.InnerHtml = "<div id=\"error\"> Error en el formato de carga de Reingreso. </div>";
        }

        if(!algunarchivo)
        {
            divMensaje.InnerHtml = "<div id=\"error\">Tiene que seleccionar por lo menos un archivo a cargar.</div>";
        }

    }

     private String procesaUpload(FileUpload fileUpload, int tipoProceso)
    {
        int fileLen = fileUpload.PostedFile.ContentLength;
        
        System.Text.Encoding encoding = System.Text.Encoding.ASCII;
        String strContenido = "";
        String[] strListado;
        String result = "";
        int cuenta = 0;
        try
        {
            byte[] input = fileUpload.FileBytes;
            strContenido = Convert.ToString(encoding.GetString(input));
            strListado = Regex.Split(strContenido, "\r\n");

            // Consultora
            if (tipoProceso == MakipurayConstant.PROCESS_TYPE_CONSULTANT)
            {
                
                foreach (String lista in strListado)
                {
                    cuenta++;
                    ConsultoraBE c = new ConsultoraBE();
                    IncorporacionBL incorporacionBL = new IncorporacionBL();
                    String[] strValues = lista.Split('|');
                    string resultado = "";

                    /*
                    c.paisID = StringFormatter.convertCountryIsoToNumber(StringFormatter.removeFirstAndLastCharacter(strValues[0]));
                    c.companiaCodigo = (isAnEmptyChain(strValues[1])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[1]); 
                    c.codigo = (isAnEmptyChain(strValues[2])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[2]);
                    c.numeroDocumento = (isAnEmptyChain(strValues[3])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[3]);
                    */

                    
                    IncorporacionBE iBE = new IncorporacionBE();
                    String APPID = (isAnEmptyChain(strValues[0])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[0]);
                    iBE.paisID = Convert.ToInt32(strValues[1]);

                    iBE.Pin = strValues[2];
                    iBE.Imsi = strValues[3];
                    iBE.ZonaCodigo = strValues[4];
                    iBE.CampanhaInscripcion = strValues[5];
                    iBE.fechaRegistro = strValues[6];
                    iBE.ModoGrabacionInt = Convert.ToInt32(strValues[7]);

                    iBE.territorioCodigo = strValues[8];
                    iBE.tablaContactoID = (isAnEmptyChain(strValues[9])) ? 0 : Convert.ToInt32(strValues[9]);
                    iBE.consultoraRecomendadoraCodigo = strValues[10];

                    iBE.apellidoPaterno = strValues[11];
                    iBE.apellidoMaterno = strValues[12];
                    iBE.PrimerNombre = strValues[13];
                    iBE.SegundoNombre = strValues[14];

                    iBE.fechaNacimiento = strValues[15];
                    //En iBE no hay tipo de documento
                    iBE.numeroDocumento = strValues[17];
                    iBE.telefonoCasa = strValues[18];
                    iBE.telefonoCelular = strValues[19];
                    iBE.email = strValues[20];
                    //En iBE no hay flag tiene documento
                    iBE.solicitudDireccion = strValues[22];
                    iBE.solicitudReferencia = strValues[23];
                    iBE.solicitudCodigoPostal = strValues[24];

                    iBE.solicitudDivisionPolitica1 = strValues[25] + " " + strValues[26];
                    iBE.solicitudDivisionPolitica2 = strValues[27] + " " + strValues[28] + " " + strValues[29];

                    iBE.tablaEstadoCivilID = (isAnEmptyChain(strValues[30])) ? 0 : Convert.ToInt32(strValues[30]);
                    iBE.tablaNivelEducativoID = (isAnEmptyChain(strValues[31])) ? 0 : Convert.ToInt32(strValues[31]);
                    iBE.tablaOtraMarcaID = (isAnEmptyChain(strValues[32])) ? 0 : Convert.ToInt64(strValues[32]);

                    iBE.referenciaFamiliarNombres = strValues[33];
                    iBE.referenciaFamiliarApellidoPaterno = strValues[34];
                    iBE.referenciaFamiliarApellidoMaterno = strValues[35];
                    iBE.referenciaFamiliarDireccion = strValues[36];
                    iBE.referenciaFamiliarTelefono = strValues[37];
                    iBE.referenciaFamiliarCelular = strValues[38];
                    iBE.tablaReferenciaFamiliarTipoVinculoID = (isAnEmptyChain(strValues[39])) ? 0 : Convert.ToInt32(strValues[39]);

                    iBE.referenciaNoFamiliarNombres = strValues[40];
                    iBE.referenciaNoFamiliarApellidoPaterno = strValues[41];
                    iBE.referenciaNoFamiliarApellidoMaterno = strValues[42];
                    iBE.referenciaNoFamiliarDireccion = strValues[43];
                    iBE.referenciaNoFamiliarTelefono = strValues[44];
                    iBE.referenciaNoFamiliarCelular = strValues[45];
                    iBE.tablaReferenciaNoFamiliarTipoVinculoID = (isAnEmptyChain(strValues[46])) ? 0 : Convert.ToInt32(strValues[46]);

                    iBE.entregaDireccion = strValues[47];
                    iBE.entregaDivisionPolitica = strValues[48];
                    iBE.entregaCodigoPostal = strValues[49];
                    //
                    iBE.entregaReferencia = strValues[51];
                    iBE.adicionalLugarTrabajo = strValues[52];
                    iBE.adicionalHoraVisita = strValues[53];
                    iBE.adicionalProfesion = "";
                    iBE.adicionalTelefonoTrabajo = "";
                    iBE.adicionalNumeroHijos = (isAnEmptyChain(strValues[48])) ? 0 : Convert.ToInt32(strValues[54]);
                    iBE.adicionalNumeroInfantes = (isAnEmptyChain(strValues[49])) ? 0 : Convert.ToInt32(strValues[55]);
                    iBE.adicionalNumeroEscolares = (isAnEmptyChain(strValues[50])) ? 0 : Convert.ToInt32(strValues[56]);
                    iBE.adicionalNumeroNivelSuperior = (isAnEmptyChain(strValues[51])) ? 0 : Convert.ToInt32(strValues[57]);
                    iBE.adicionalNumeroAdultos = (isAnEmptyChain(strValues[52])) ? 0 : Convert.ToInt32(strValues[58]);

                    iBE.recFechaVisita = strValues[59];
                    iBE.recObservacion = strValues[60];
                    iBE.recPin = strValues[61];
                    iBE.recIMSI = strValues[62];
                    iBE.recLongitud = strValues[63];
                    iBE.recLatitud = strValues[64];
                    iBE.recMargen = strValues[66];
                    iBE.recNumeroSatelites = (isAnEmptyChain(strValues[66])) ? 0 : Convert.ToInt32(strValues[66]);

                    /*
                    iBE.adicionalTelefonoTrabajo = strValues[46];
                    iBE.modoGrabacion = Convert.ToBoolean( (isAnEmptyChain(strValues[61])) ? 0 : Convert.ToInt32(strValues[61]) );
                    */
                    resultado = incorporacionBL.ws_registroIncorporacion(iBE, APPID);

                    if (resultado.Split('|')[0] == "0")
                    {
                        //divMensaje.InnerHtml = "<div id=\"error\">" + resultado.Split('|')[1] + "</div>";
                        divMensaje.InnerHtml = "<div id=\"error\"> Error en el formato de carga de Incorporación. </div>";
                    }
                    else {
                        divMensaje.InnerHtml = "<div id=\"info\"> Se cargó registro de incorporación</div>";
                    }

                    try
                    {
                        enviaCorreo();
                    }
                    catch (Exception ex)
                    {
                        Log.lanzarError(ex);
                    }
                      
                }
            }
        }
        catch (Exception ex)
        {
            Log.lanzarError(ex);
        }
        return result;
    }

     private bool isAnEmptyChain(String chain)
     {
         Boolean resultado = false;
         if(chain.Length == 0){
            resultado = true;
         }else{                      
             if(chain.ToLower() == "null"){
                resultado = true;
             }
         }

         return resultado;
     }

     public void enviaCorreo()
     {
         String log = "";
         Correo correo = new Correo();
         SmtpClient smtp = new SmtpClient();
         MailMessage Mensaje = new MailMessage();
         Attachment Anexo;

         String usuariosmtp = "", clavesmtp = "", hostsmtp = "", emailorigen = "";
         int puertosmtp = 25;

         usuariosmtp = ConfigurationManager.AppSettings["usuariosmtp"];
         clavesmtp = ConfigurationManager.AppSettings["clavesmtp"];
         puertosmtp = Convert.ToInt32(ConfigurationManager.AppSettings["puertosmtpssl"]); ;
         hostsmtp = ConfigurationManager.AppSettings["hostsmtp"];
         emailorigen = ConfigurationManager.AppSettings["emailorigen"];

         smtp.Credentials = new NetworkCredential(usuariosmtp, clavesmtp);
         smtp.Port = puertosmtp;
         smtp.Host = hostsmtp;
         smtp.EnableSsl = false;
         Mensaje.Subject = "Nueva Incorporación";
         Mensaje.Body = "Se ha verificado la incorporacion de una nueva consultora";
         Mensaje.From = new MailAddress(emailorigen);
         Mensaje.To.Clear();
         //Anexo = new Attachment("attach.doc");
         //Mensaje.Attachments.Add(Anexo);

         DataTable dtCorreo = new DataTable();
         dtCorreo = correo.obtener("", "", 36, Convert.ToInt32(Session["paisID"]));
         String cuenta = "";

         foreach (DataRow fila in dtCorreo.Rows)
         {
             cuenta = fila["email"].Equals(DBNull.Value) ? "" : fila["email"].ToString();
             if (cuenta != "")
             {
                 Mensaje.To.Add(cuenta);
             }
         }

         try
         {
             smtp.Send(Mensaje);
         }
         catch (Exception ex)
         {
             log = ex.Message;
         }
     }

}
