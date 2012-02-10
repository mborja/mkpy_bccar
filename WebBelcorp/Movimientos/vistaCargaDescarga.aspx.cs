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

using BusinessLayer;
using EntityLayer;
using UtilityLayer;
using System.Text.RegularExpressions;

public partial class Movimientos_vistaCargaDescarga : System.Web.UI.Page
{
    private GerenteZonaBL gerenteZonaBL = new GerenteZonaBL();
    private ConsultoraBL consultoraBL = new ConsultoraBL();
    private FacturacionBL facturacionBL = new FacturacionBL();
    ConexionDatos con = new ConexionDatos();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cmdCargar_Click(object sender, EventArgs e)
    {
        String result = "";
        if (fileUploadConsultora.HasFile || fileUploadGerenteZona.HasFile || fileUploadCampania.HasFile || fileUploadCronogramaFacturacion.HasFile)
        {
        }
        else
        {
            divMensaje.InnerHtml = "<div id=\"error\">Tiene que seleccionar por lo menos un archivo a cargar.</div>";
            return;
        }

        if (fileUploadConsultora.HasFile)
        {
            result = procesaUpload(fileUploadConsultora, MakipurayConstant.PROCESS_TYPE_CONSULTANT);
        }

        if (fileUploadGerenteZona.HasFile)
        {
            result = procesaUpload(fileUploadGerenteZona, MakipurayConstant.PROCESS_TYPE_ZONE_MANAGER);
        }

        if (fileUploadCampania.HasFile)
        {
            result = procesaUpload(fileUploadCampania, MakipurayConstant.PROCESS_TYPE_CAMPAIGN);
        }

        if (fileUploadCronogramaFacturacion.HasFile)
        {
            result = procesaUpload(fileUploadCronogramaFacturacion, MakipurayConstant.PROCESS_TYPE_BILLING_SCHEDULE);
        }

        if (result == "")
        {
            divMensaje.InnerHtml = "<div id=\"info\">Los archivos se subieron correctamente.</div>";
        }
        else
        {
            divMensaje.InnerHtml = "<div id=\"error\">Se produjeron errores al cargar los archivos " + result + ".</div>";
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
                cuenta = 0;
                foreach (String lista in strListado)
                {
                    cuenta++;
                    try
                    {
                        ConsultoraBE c = new ConsultoraBE();
                        String[] strValues = lista.Split(',');

                        c.paisID = StringFormatter.convertCountryIsoToNumber(StringFormatter.removeFirstAndLastCharacter(strValues[0]));
                        c.companiaCodigo = (isAnEmptyChain(strValues[1])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[1]); ;
                        c.codigo = (isAnEmptyChain(strValues[2])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[2]);
                        c.numeroDocumento = (isAnEmptyChain(strValues[3])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[3]);

                        c.apellidoPaterno = (isAnEmptyChain(strValues[4])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[4]);
                        c.apellidoMaterno = (isAnEmptyChain(strValues[5])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[5]);
                        c.nombres = (isAnEmptyChain(strValues[6])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[6]);

                        c.telefono1 = (isAnEmptyChain(strValues[7])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[7]);
                        c.telefono2 = (isAnEmptyChain(strValues[8])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[8]);
                        c.email = (isAnEmptyChain(strValues[9])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[9]);
                        c.pasarped = (isAnEmptyChain(strValues[10])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[10]);
                        c.motivoRetiro = (isAnEmptyChain(strValues[11])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[11]);
                        c.regionCodigo = (isAnEmptyChain(strValues[12])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[12]);
                        c.zonaCodigo = (isAnEmptyChain(strValues[13])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[13]);
                        c.seccionCodigo = (isAnEmptyChain(strValues[14])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[14]);
                        c.territorioCodigo = (isAnEmptyChain(strValues[15])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[15]);
                        c.campanhaInscripcion = (isAnEmptyChain(strValues[16])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[16]);
                        c.campanhaPrico = (isAnEmptyChain(strValues[17])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[17]);
                        c.estadoActivo = (isAnEmptyChain(strValues[18])) ? false : Convert.ToBoolean(Convert.ToInt32(StringFormatter.removeFirstAndLastCharacter(strValues[18])));

                        String message = consultoraBL.crear(c);
                        if (message != "success")
                        {
                            result = result + "<br>" + "Regitro no procesado(" + cuenta.ToString() + ") : " + message;
                        }
                    }
                    catch (Exception ex) {
                        result = result + "<br>" + "Regitro no procesado(" + cuenta.ToString() + ")";
                        Log.lanzarError(ex);
                    }
                }
            }

            // Gerente de Zona
            if (tipoProceso == MakipurayConstant.PROCESS_TYPE_ZONE_MANAGER)
            {
                cuenta = 1;
                foreach (String c in strListado)
                {
                    cuenta++;
                    try
                    {
                        GerenteZonaBE gz = new GerenteZonaBE();
                        String[] strValues = c.Split(',');
                        
                        gz.paisID = StringFormatter.convertCountryIsoToNumber(StringFormatter.removeFirstAndLastCharacter(strValues[0]));
                        gz.companiaCodigo = (isAnEmptyChain(strValues[1])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[1]);
                        gz.consultoraCodigo = (isAnEmptyChain(strValues[2])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[2]);
                        gz.numeroDocumento = (isAnEmptyChain(strValues[3])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[3]);
                        gz.nombres = (isAnEmptyChain(strValues[4])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[4]);
                        gz.regionCodigo = (isAnEmptyChain(strValues[5])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[5]);
                        gz.zonaCodigo = (isAnEmptyChain(strValues[6])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[6]);
                        gz.seccionCodigo = (isAnEmptyChain(strValues[7])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[7]);
                        gz.territorioCodigo = (isAnEmptyChain(strValues[8])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[8]);
                        gz.telefono = (isAnEmptyChain(strValues[9])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[9]);
                        gz.email = (isAnEmptyChain(strValues[10])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[10]);
                        gz.pasarped = (isAnEmptyChain(strValues[11])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[11]);
                        gz.motivoRetiro = (isAnEmptyChain(strValues[12])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[12]);
                        gz.estadoActivo = (isAnEmptyChain(strValues[13])) ? false : Convert.ToBoolean(Convert.ToInt32(StringFormatter.removeFirstAndLastCharacter(strValues[13])));

                        String message = gerenteZonaBL.crear(gz);
                        if (message != "success")
                        {
                            result = result + "<br>" + "Regitro no procesado(" + cuenta.ToString() + ") : " + message;
                        }
                    }
                    catch (Exception ex)
                    {
                        result = result + "<br>" + "Regitro no procesado(" + cuenta.ToString() + ")";
                        Log.lanzarError(ex);
                    }

                }
            }

            // Campaña
            if (tipoProceso == MakipurayConstant.PROCESS_TYPE_CAMPAIGN)
            {
                foreach (String lista in strListado)
                {
                    
                }
            }

            // Campaña de Facturación
            if (tipoProceso == MakipurayConstant.PROCESS_TYPE_BILLING_SCHEDULE)
            {
                foreach (String lista in strListado)
                {
                    FacturacionBE f = new FacturacionBE();
                    String[] strValues = lista.Split(',');

                    f.PaisID = StringFormatter.convertCountryIsoToNumber(StringFormatter.removeFirstAndLastCharacter(strValues[0]));
                    f.CompanhiaCodigo = (isAnEmptyChain(strValues[1])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[1]);
                    f.Campanha = (isAnEmptyChain(strValues[2])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[2]);
                    f.RegionCodigo = (isAnEmptyChain(strValues[3])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[3]);
                    f.ZonaCodigo = (isAnEmptyChain(strValues[4])) ? null : StringFormatter.removeFirstAndLastCharacter(strValues[4]);
                    f.Fecha = (isAnEmptyChain(strValues[5])) ? null : DateFormatter.getStringDate(StringFormatter.removeFirstAndLastCharacter(strValues[5]));
                    f.EstadoActivo = true;

                    String message = facturacionBL.crear(f);
                    if (message != "success")
                    {
                        result = result + "<br> Campaña de facturación>: " + message;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            String message = ex.Message;
            result = result + "<br> Excepción general ( fila " + Convert.ToString(cuenta) + " del archivo) : " + message ;
            //System.Windows.Forms.MessageBox.Show(ex.Message);
        }
        return result;
    }

    private bool isAnEmptyChain(String chain)
    {
        // Se considera tamaño de 2, debido a que si la cadena está vacía estará conformada por 4 caracteres (\"\")
        return (chain.Length == 2) ? true : false;
    }
    protected void cmdDescargar_Click(object sender, EventArgs e)
    {
        string sSQL;
        //TODO: obtener de la session el nro del pais, Session["paisId"].ToString()
        sSQL = "EXEC usp_bel_descarga_sc @IDPAIS=7";
        string resultado = ""; //"\"";
        if (Page.IsPostBack)
        {
            DataTable dt = new DataTable();
            dt = con.AccesoDatos(sSQL);
            int rowSize = dt.Rows.Count;
            int colSize = dt.Columns.Count;
            ArrayList longitud = new ArrayList();
            String dato;
            for (int r = 0; r < rowSize; r++)
            {
                for (int c = 0; c < colSize; c++)
                {
                   dato = Convert.ToString(dt.Rows[r][c]);
                    resultado += "\"" + dato + "\"";
                    if (c != colSize - 1)
                    {
                        resultado += ",";
                    }
                }
                resultado += Environment.NewLine;
            }
            resultado += Environment.NewLine;
            byte[] nombre = null;
            nombre = System.Text.Encoding.Default.GetBytes(resultado);
            Response.ClearContent();
            //Response.ContentType = "text/plain";
            //Response.ContentType = "application/plain";
            //Response.ContentType = "application/octet-stream";
            Response.AddHeader("content-disposition", "attachment; filename=SOLCREDI.txt");
            Response.AddHeader("charset", "windows-1252");
            Response.BinaryWrite(nombre);
            Response.End();
        }
    }
}
