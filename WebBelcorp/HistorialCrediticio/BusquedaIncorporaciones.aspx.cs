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
using System.IO;
using System.Text;
using Root.Reports;
using System.Drawing;

public partial class Movimientos_GestionCobros : System.Web.UI.Page
{
    ConexionDatos con = new ConexionDatos();
    private bool tableCopied = false;
    private DataTable originalDataTable;

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
            if (!tableCopied)
            {
  
                originalDataTable = ((DataRowView)e.Row.DataItem).Row.Table.Copy();
                ViewState["originalValuesDataTable"] = originalDataTable;
                tableCopied = true;
            }

    }



    protected bool IsRowModified(GridViewRow r)
    {
        int currentID;
        Boolean cbVerificado;
        
        currentID = Convert.ToInt32(GridView1.DataKeys[0].Value);

        cbVerificado = ((CheckBox)r.FindControl("CheckBox1")).Checked;
 
        DataRow row =
            originalDataTable.Select(String.Format("id = {0}", currentID))[0];
      if (!cbVerificado.Equals(row["Estado"].ToString())) { 
            return true; 
        }
        return false;
    }
    



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Detalle")
        {
            //int i = Convert.ToInt16(e.CommandArgument);// - (GridView1.PageIndex * GridView1.PageSize);
            //string activasId = Convert.ToString(GridView1.DataKeys[i].Value);
            //Response.Redirect("../Reportes/Solicitud.aspx?id=" + activasId, false);

            int o = Convert.ToInt16(e.CommandArgument);// - (GridView1.PageIndex * GridView1.PageSize);
            //string activasId = Convert.ToString(GridView1.DataKeys[i].Value);
            //Response.Redirect("Solicitud.aspx?id=" + activasId, false);

            string di = Convert.ToString(GridView1.DataKeys[o].Value);

            string resu = "";
            string sql = "EXEC [SP_LISTADO_REPORTE_INCORPORACIONES_PDF] '" + di + "'";
            DataTable dt = con.AccesoDatos(sql);
            int rowSize = dt.Rows.Count;
            for (int i = 0; i < rowSize; i++)
            {
                int colSize = dt.Columns.Count;
                for (int c = 0; c < colSize; c++)
                {
                    if (c == (colSize - 1))
                        resu += Convert.ToString(dt.Rows[i][c]);
                    else
                        resu += Convert.ToString(dt.Rows[i][c]) + "+";
                }

                //System.Windows.Forms.MessageBox.Show(resu);

                string[] datos = resu.Split('+');

                string CODIGO_TERRITORIO = datos[0];
                string FECHA_INCRIPCION = datos[1];
                string CAMPAÑA_INCRIPCION = datos[2];
                string CODIGO_CONSULTORA_RECOMIENDA = datos[3];
                string TIPO_CONTACTO = datos[4];
                string SOLICITANTE_APELLIDO_PATERNO = datos[5];
                string SOLICITANTE_APELLIDO_MATERNO = datos[6];
                string SOLICITANTE_NOMBRES = datos[7];
                string SOLICITANTE_FECHA_NACIMIENTO = datos[8];
                string SOLICITANTE_TIPO_DOCUMENTO = datos[9];
                string SOLICITANTE_NUMERO_DOCUMENTO = datos[10];
                string SOLICITANTE_ESTADO_CIVIL = datos[11];
                string SOLICITANTE_NIVEL_EDUCATIVO = datos[12];
                string SOLICITANTE_VENDE_OTRAS_MARCAS = datos[13];
                string SOLICITANTE_TELEFONO_CASA = datos[14];
                string SOLICITANTE_TELEFONO_CELULAR = datos[15];
                string SOLICITANTE_CORREO_ELECTRONICO = datos[16];
                string SOLICITANTE_DIRECCION = datos[17];
                string SOLICITANTE_REFERENCIA = datos[18];
                string SOLICITANTE_CODIGO_POSTAL = datos[19];
                string SOLICITANTE_PUEBLO = datos[20];
                string SOLICITANTE_ESTADO = datos[21];
                string SOLICITANTE_MUNICIPIO = datos[22];
                string SOLICITANTE_CIUDAD = datos[23];
                string SOLICITANTE_PROVINCIA = datos[24];
                string DIRECCION_ENTREGA_DIRECCION = datos[25];
                string DIRECCION_ENTREGA_PUEBLO = datos[26];
                string DIRECCION_ENTREGA_CODIGO_POSTAL = datos[27];
                string DIRECCION_ENTREGA_REFERENCIA = datos[28];
                string REFERENCIA_FAMILIAR_APELLIDO_PATERNO = datos[29];
                string REFERENCIA_FAMILIAR_APELLIDO_MATERNO = datos[30];
                string REFERENCIA_FAMILIAR_APELLIDO_NOMBRES = datos[31];
                string REFERENCIA_FAMILIAR_APELLIDO_DIRECCION = datos[32];
                string REFERENCIA_FAMILIAR_TELEFONO_RESIDENCIA = datos[33];
                string REFERENCIA_FAMILIAR_TELEFONO_CELULAR = datos[34];
                string REFERENCIA_FAMILIAR_TIPO_VINCULO = datos[35];
                string REFERENCIA_NO_FAMILIAR_APELLIDO_PATERNO = datos[36];
                string REFERENCIA_NO_FAMILIAR_APELLIDO_MATERNO = datos[37];
                string REFERENCIA_NO_FAMILIAR_APELLIDO_NOMBRES = datos[38];
                string REFERENCIA_NO_FAMILIAR_APELLIDO_DIRECCION = datos[39];
                string REFERENCIA_NO_FAMILIAR_TELEFONO_RESIDENCIA = datos[40];
                string REFERENCIA_NO_FAMILIAR_TELEFONO_CELULAR = datos[41];
                string REFERENCIA_NO_FAMILIAR_TIPO_VINCULO = datos[42];

                generarPDF(
                    CODIGO_TERRITORIO,
                    FECHA_INCRIPCION,
                    CAMPAÑA_INCRIPCION,
                    CODIGO_CONSULTORA_RECOMIENDA,
                    TIPO_CONTACTO,
                    SOLICITANTE_APELLIDO_PATERNO,
                    SOLICITANTE_APELLIDO_MATERNO,
                    SOLICITANTE_NOMBRES,
                    SOLICITANTE_FECHA_NACIMIENTO,
                    SOLICITANTE_TIPO_DOCUMENTO,
                    SOLICITANTE_NUMERO_DOCUMENTO,
                    SOLICITANTE_ESTADO_CIVIL,
                    SOLICITANTE_NIVEL_EDUCATIVO,
                    SOLICITANTE_VENDE_OTRAS_MARCAS,
                    SOLICITANTE_TELEFONO_CASA,
                    SOLICITANTE_TELEFONO_CELULAR,
                    SOLICITANTE_CORREO_ELECTRONICO,
                    SOLICITANTE_DIRECCION,
                    SOLICITANTE_REFERENCIA,
                    SOLICITANTE_CODIGO_POSTAL,
                    SOLICITANTE_PUEBLO,
                    SOLICITANTE_ESTADO,
                    SOLICITANTE_MUNICIPIO,
                    SOLICITANTE_CIUDAD,
                    SOLICITANTE_PROVINCIA,
                    DIRECCION_ENTREGA_DIRECCION,
                    DIRECCION_ENTREGA_PUEBLO,
                    DIRECCION_ENTREGA_CODIGO_POSTAL,
                    DIRECCION_ENTREGA_REFERENCIA,
                    REFERENCIA_FAMILIAR_APELLIDO_PATERNO,
                    REFERENCIA_FAMILIAR_APELLIDO_MATERNO,
                    REFERENCIA_FAMILIAR_APELLIDO_NOMBRES,
                    REFERENCIA_FAMILIAR_APELLIDO_DIRECCION,
                    REFERENCIA_FAMILIAR_TELEFONO_RESIDENCIA,
                    REFERENCIA_FAMILIAR_TELEFONO_CELULAR,
                    REFERENCIA_FAMILIAR_TIPO_VINCULO,
                    REFERENCIA_NO_FAMILIAR_APELLIDO_PATERNO,
                    REFERENCIA_NO_FAMILIAR_APELLIDO_MATERNO,
                    REFERENCIA_NO_FAMILIAR_APELLIDO_NOMBRES,
                    REFERENCIA_NO_FAMILIAR_APELLIDO_DIRECCION,
                    REFERENCIA_NO_FAMILIAR_TELEFONO_RESIDENCIA,
                    REFERENCIA_NO_FAMILIAR_TELEFONO_CELULAR,
                    REFERENCIA_NO_FAMILIAR_TIPO_VINCULO
        );

            }
        }
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        originalDataTable = (DataTable)ViewState["originalValuesDataTable"];

        foreach (GridViewRow r in GridView1.Rows)
            if (IsRowModified(r))
            {
                GridView1.UpdateRow(r.RowIndex, false);
            }

        // Rebind the Grid to repopulate the original values table.
        tableCopied = false;
        GridView1.DataBind();
    }


    private void generarPDF(
            string CODIGO_TERRITORIO,
            string FECHA_INCRIPCION,
            string CAMPAÑA_INCRIPCION,
            string CODIGO_CONSULTORA_RECOMIENDA,
            string TIPO_CONTACTO,
            string SOLICITANTE_APELLIDO_PATERNO,
            string SOLICITANTE_APELLIDO_MATERNO,
            string SOLICITANTE_NOMBRES,
            string SOLICITANTE_FECHA_NACIMIENTO,
            string SOLICITANTE_TIPO_DOCUMENTO,
            string SOLICITANTE_NUMERO_DOCUMENTO,
            string SOLICITANTE_ESTADO_CIVIL,
            string SOLICITANTE_NIVEL_EDUCATIVO,
            string SOLICITANTE_VENDE_OTRAS_MARCAS,
            string SOLICITANTE_TELEFONO_CASA,
            string SOLICITANTE_TELEFONO_CELULAR,
            string SOLICITANTE_CORREO_ELECTRONICO,
            string SOLICITANTE_DIRECCION,
            string SOLICITANTE_REFERENCIA,
            string SOLICITANTE_CODIGO_POSTAL,
            string SOLICITANTE_PUEBLO,
            string SOLICITANTE_ESTADO,
            string SOLICITANTE_MUNICIPIO,
            string SOLICITANTE_CIUDAD,
            string SOLICITANTE_PROVINCIA,
            string DIRECCION_ENTREGA_DIRECCION,
            string DIRECCION_ENTREGA_PUEBLO,
            string DIRECCION_ENTREGA_CODIGO_POSTAL,
            string DIRECCION_ENTREGA_REFERENCIA,
            string REFERENCIA_FAMILIAR_APELLIDO_PATERNO,
            string REFERENCIA_FAMILIAR_APELLIDO_MATERNO,
            string REFERENCIA_FAMILIAR_APELLIDO_NOMBRES,
            string REFERENCIA_FAMILIAR_DIRECCION,
            string REFERENCIA_FAMILIAR_TELEFONO_RESIDENCIA,
            string REFERENCIA_FAMILIAR_TELEFONO_CELULAR,
            string REFERENCIA_FAMILIAR_TIPO_VINCULO,
            string REFERENCIA_NO_FAMILIAR_APELLIDO_PATERNO,
            string REFERENCIA_NO_FAMILIAR_APELLIDO_MATERNO,
            string REFERENCIA_NO_FAMILIAR_APELLIDO_NOMBRES,
            string REFERENCIA_NO_FAMILIAR_DIRECCION,
            string REFERENCIA_NO_FAMILIAR_TELEFONO_RESIDENCIA,
            string REFERENCIA_NO_FAMILIAR_TELEFONO_CELULAR,
            string REFERENCIA_NO_FAMILIAR_TIPO_VINCULO
    )
    {
        int m = 30;//margen
        Report report = new Report(new PdfFormatter());
        FontDef fd = new FontDef(report, "Helvetica");
        FontProp fp = new FontPropMM(fd, 2, System.Drawing.Color.Black);
        FontProp fp1 = new FontPropMM(fd, 2, System.Drawing.Color.Black);
        FontProp fp2 = new FontPropMM(fd, 2, System.Drawing.Color.Black);
        FontProp fp_Title = new FontPropMM(fd, 4);
        Root.Reports.Page page = new Root.Reports.Page(report);
        fp_Title.bBold = true;
        fp1.bBold = true;
        fp2.bBold = true;
        fp2.bItalic = true;
        Double rX = 10;
        Double rY = 20;

        //Double rYTemp, rYContinue;
        Double rYcopy = rY;
        //centrado al medio del dpdf
        page.AddCB_MM(10, new RepString(fp_Title, "Solicitud de Crédito"));
        rY += fp_Title.rLineFeedMM;

        page.AddMM(rX, rY - 12, new RepString(fp, "CÓDIGO TERRITORIAL:"));
        page.AddRightMM(rX + 4, rY - 9, new RepString(fp1, CODIGO_TERRITORIO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 50, rY - 17, new RepString(fp, "FECHA DE INSCRIPCIÓN:"));
        page.AddRightMM(rX + 64, rY - 14, new RepString(fp1, FECHA_INCRIPCION));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 120, rY - 21, new RepString(fp, "CAMPAÑA DE INSCRIPCIÒN:"));
        page.AddRightMM(rX + 130, rY - 18, new RepString(fp1, CAMPAÑA_INCRIPCION));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY - 15, new RepString(fp, "CÓDIGO CONSULTORA QUE RECOMIENDA:"));
        page.AddRightMM(rX + 11, rY - 12, new RepString(fp1, CODIGO_CONSULTORA_RECOMIENDA));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 100, rY - 19, new RepString(fp, "TIPO DE CONTACTO:"));
        page.AddRightMM(rX + 116, rY - 16, new RepString(fp1, TIPO_CONTACTO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY - 11, new RepString(fp2, "DATOS SOLICITANTE"));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY - 9, new RepString(fp, "APELLIDO PATERNO:"));
        page.AddRightMM(rX + 12, rY - 5, new RepString(fp1, SOLICITANTE_APELLIDO_PATERNO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 70, rY - 13, new RepString(fp, "APELLIDO MATERNO:"));
        page.AddRightMM(rX + 83, rY - 9, new RepString(fp1, SOLICITANTE_APELLIDO_MATERNO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 130, rY - 17, new RepString(fp, "NOMBRES:"));
        page.AddRightMM(rX + 158, rY - 13, new RepString(fp1, SOLICITANTE_NOMBRES));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY - 11, new RepString(fp, "FECHA DE NACIMIENTO:"));
        page.AddRightMM(rX + 14, rY - 7, new RepString(fp1, SOLICITANTE_FECHA_NACIMIENTO));
        rY += fp.rLineFeedMM;
        page.AddMM(rX + 70, rY - 15, new RepString(fp, "NUMERO DE DOCUMENTO DE IDENTIDAD:"));
        page.AddRightMM(rX + 73, rY - 12, new RepString(fp1, SOLICITANTE_TIPO_DOCUMENTO));
        page.AddRightMM(rX + 92, rY - 12, new RepString(fp1, SOLICITANTE_NUMERO_DOCUMENTO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY - 8, new RepString(fp, "ESTADO CIVIL:"));
        page.AddRightMM(rX + 9, rY - 5, new RepString(fp1, SOLICITANTE_ESTADO_CIVIL));
        rY += fp.rLineFeedMM;
        page.AddMM(rX + 50, rY - 12, new RepString(fp, "NIVEL EDUCATIVO:"));
        page.AddRightMM(rX + 67, rY - 9, new RepString(fp1, SOLICITANTE_NIVEL_EDUCATIVO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 100, rY - 16, new RepString(fp, "¿VENDE OTRAS MARCAS?:"));
        page.AddRightMM(rX + 105, rY - 13, new RepString(fp1, SOLICITANTE_VENDE_OTRAS_MARCAS));
        rY += fp.rLineFeedMM;


        page.AddMM(rX, rY - 10, new RepString(fp, "TELÉFONO CASA:"));
        page.AddRightMM(rX + 11, rY - 7, new RepString(fp1, SOLICITANTE_TELEFONO_CASA));
        rY += fp.rLineFeedMM;


        page.AddMM(rX + 70, rY - 14, new RepString(fp, "TELÉFONO CELULAR:"));
        page.AddRightMM(rX + 85, rY + -11, new RepString(fp1, SOLICITANTE_TELEFONO_CELULAR));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY - 8, new RepString(fp, "CORREO ELECTRÓNICO:"));
        page.AddRightMM(rX + 30, rY - 4, new RepString(fp1, SOLICITANTE_CORREO_ELECTRONICO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY, new RepString(fp, "DIRECCIÓN:"));
        page.AddRightMM(rX + 15, rY + 4, new RepString(fp1, SOLICITANTE_DIRECCION));
        rY += fp.rLineFeedMM;


        page.AddMM(rX, rY + 8, new RepString(fp, "REFERENCIA:"));
        page.AddRightMM(rX + 16, rY + 12, new RepString(fp1, SOLICITANTE_REFERENCIA));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 70, rY + 4, new RepString(fp, "CÓDIGO POSTAL:"));
        page.AddRightMM(rX + 86, rY + 8, new RepString(fp1, SOLICITANTE_CODIGO_POSTAL));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY + 12, new RepString(fp, "PUEBLO:"));
        page.AddRightMM(rX + 11, rY + 16, new RepString(fp1, SOLICITANTE_PUEBLO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 70, rY + 8, new RepString(fp, "ESTADO:"));
        page.AddRightMM(rX + 81, rY + 12, new RepString(fp1, SOLICITANTE_ESTADO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 130, rY + 4, new RepString(fp, "MUNICIPIO:"));
        page.AddRightMM(rX + 144, rY + 8, new RepString(fp1, SOLICITANTE_MUNICIPIO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY + 12, new RepString(fp, "CIUDAD:"));
        page.AddRightMM(rX + 11, rY + 16, new RepString(fp1, SOLICITANTE_CIUDAD));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 70, rY + 8, new RepString(fp, "PROVINCIA:"));
        page.AddRightMM(rX + 84, rY + 12, new RepString(fp1, SOLICITANTE_PROVINCIA));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY + 18, new RepString(fp2, "DIRECCIÓN ENTREGA"));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY + 19, new RepString(fp, "DIRECCIÓN:"));
        page.AddRightMM(rX + 14, rY + 23, new RepString(fp1, DIRECCION_ENTREGA_DIRECCION));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 68, rY + 15, new RepString(fp, "PUEBLO:"));
        page.AddRightMM(rX + 79, rY + 19, new RepString(fp1, DIRECCION_ENTREGA_PUEBLO));
        rY += fp.rLineFeedMM;


        page.AddMM(rX + 130, rY + 12, new RepString(fp, "CÓDIGO POSTAL:"));
        page.AddRightMM(rX + 146, rY + 15, new RepString(fp1, DIRECCION_ENTREGA_CODIGO_POSTAL));
        rY += fp.rLineFeedMM;


        page.AddMM(rX, rY + 16, new RepString(fp, "REFERENCIA:"));
        page.AddRightMM(rX + 16, rY + 20, new RepString(fp1, DIRECCION_ENTREGA_REFERENCIA));
        rY += fp.rLineFeedMM;


        page.AddMM(rX, rY + 25, new RepString(fp2, " REFERENCIA FAMILIAR"));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY + 26, new RepString(fp, "APELLIDO PATERNO:"));
        page.AddRightMM(rX + 12, rY + 29, new RepString(fp1, REFERENCIA_FAMILIAR_APELLIDO_PATERNO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 70, rY + 22, new RepString(fp, "APELLIDO MATERNO:"));
        page.AddRightMM(rX + 82, rY + 25, new RepString(fp1, REFERENCIA_FAMILIAR_APELLIDO_MATERNO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 130, rY + 18, new RepString(fp, "NOMBRES:"));
        page.AddRightMM(rX + 143, rY + 21, new RepString(fp1, REFERENCIA_FAMILIAR_APELLIDO_NOMBRES));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY + 22, new RepString(fp, "DIRECCIÓN:"));
        page.AddRightMM(rX + 14, rY + 25, new RepString(fp1, REFERENCIA_FAMILIAR_DIRECCION));
        rY += fp.rLineFeedMM;


        page.AddMM(rX, rY + 27, new RepString(fp, "TELÉFONO RESIDENCIA:"));
        page.AddRightMM(rX + 15, rY + 31, new RepString(fp1, REFERENCIA_FAMILIAR_TELEFONO_RESIDENCIA));
        rY += fp.rLineFeedMM;


        page.AddMM(rX + 70, rY + 24, new RepString(fp, "TELÉFONO CELULAR:"));
        page.AddRightMM(rX + 83, rY + 27, new RepString(fp1, REFERENCIA_FAMILIAR_TELEFONO_CELULAR));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY + 29, new RepString(fp, "TIPO VÍNCULO:"));
        page.AddRightMM(rX + 15, rY + 32, new RepString(fp1, REFERENCIA_FAMILIAR_TIPO_VINCULO));
        rY += fp.rLineFeedMM;


        page.AddMM(rX, rY + 36, new RepString(fp2, " REFERENCIA NO FAMILIAR"));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY + 38, new RepString(fp, "APELLIDO PATERNO:"));
        page.AddRightMM(rX + 13, rY + 41, new RepString(fp1, REFERENCIA_NO_FAMILIAR_APELLIDO_PATERNO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 70, rY + 34, new RepString(fp, "APELLIDO MATERNO:"));
        page.AddRightMM(rX + 83, rY + 37, new RepString(fp1, REFERENCIA_NO_FAMILIAR_APELLIDO_MATERNO));
        rY += fp.rLineFeedMM;

        page.AddMM(rX + 130, rY + 31, new RepString(fp, "NOMBRES:"));
        page.AddRightMM(rX + 145, rY + 34, new RepString(fp1, REFERENCIA_NO_FAMILIAR_APELLIDO_NOMBRES));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY + 35, new RepString(fp, "DIRECCIÓN:"));
        page.AddRightMM(rX + 15, rY + 38, new RepString(fp1, REFERENCIA_NO_FAMILIAR_DIRECCION));
        rY += fp.rLineFeedMM;


        page.AddMM(rX, rY + 41, new RepString(fp, "TELÉFONO RESIDENCIA:"));
        page.AddRightMM(rX + 14, rY + 45, new RepString(fp1, REFERENCIA_NO_FAMILIAR_TELEFONO_RESIDENCIA));
        rY += fp.rLineFeedMM;


        page.AddMM(rX + 70, rY + 36, new RepString(fp, "TELÉFONO CELULAR:"));
        page.AddRightMM(rX + 82, rY + 41, new RepString(fp1, REFERENCIA_NO_FAMILIAR_TELEFONO_CELULAR));
        rY += fp.rLineFeedMM;

        page.AddMM(rX, rY + 45, new RepString(fp, "TIPO VÍNCULO:"));
        page.AddRightMM(rX + 14, rY + 49, new RepString(fp1, REFERENCIA_NO_FAMILIAR_TIPO_VINCULO));
        rY += fp.rLineFeedMM;

        /*page.AddMM(rX, rY, new RepString(fp, "Año:"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "falta año")); //falta de donde sacar año
         rY += fp.rLineFeedMM;

         page.AddMM(rX, rY, new RepString(fp, "CAMP."));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;

         page.AddMM(rX, rY, new RepString(fp, "Código consultora que recomienda:"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;

         page.AddMM(rX, rY, new RepString(fp, "Consultora que recomienda :"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "falta nombre consultora")); //falta obtener nombre consultora recomienda
         rY += fp.rLineFeedMM;

         page.AddMM(rX, rY, new RepString(fp, "Selección Premio:"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "falta sacar premio")); //falta de donde sacar premio
         // rY += fp.rLineFeedMM;

         rX = 20;
         rY += 10;
         rYTemp = rY;
         page.AddMM(rX, rY, new RepString(fp, "Primer Apellido:"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;
         page.AddMM(rX, rY, new RepString(fp, "Primer Nombre:"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;
         page.AddMM(rX, rY, new RepString(fp, "Fecha nacimiento:"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;
         page.AddMM(rX, rY, new RepString(fp, "Estado civil:"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;
         page.AddMM(rX, rY, new RepString(fp, "Nivel Educativo :"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;
         //page.AddMM(rX, rY, new RepString(fp, "Selección Premio:"));
         //page.AddRightMM(rX + 80, rY, new RepInt32(fp, 0, "$#;($#);Zero"));
         //rYContinue = rY;

         rX += 90;
         rY = rYTemp;
         page.AddMM(rX, rY, new RepString(fp, "Segundo apellido:"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;
         page.AddMM(rX, rY, new RepString(fp, "Segundo Nombre:"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;
         page.AddMM(rX, rY, new RepString(fp, "Doc de identidad:"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;
         page.AddMM(rX, rY, new RepString(fp, "Número:"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;
         page.AddMM(rX, rY, new RepString(fp, "Vendes otras Marcas :"));
         page.AddRightMM(rX + 80, rY, new RepString(fp, "aa"));
         rY += fp.rLineFeedMM;
         //page.AddMM(rX, rY, new RepString(fp, "Selección Premio:"));
         //page.AddRightMM(rX + 80, rY, new RepInt32(fp, 0, "$#;($#);Zero"));
         */

        string archivo = "sc" + DateTime.Now.Second + DateTime.Now.Millisecond;
        //report.Save(@"C:\Bcaribe\" + archivo + ".pdf");

        //return archivo;
        RT.ViewPDF(report, "Solcitud de crédito.pdf");

    }


}

