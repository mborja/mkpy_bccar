using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.IO;
using System.Text;
using Root.Reports;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Drawing;


public partial class CargarDescargar : System.Web.UI.Page
{
    string StrCx;
    ConexionDatos con = new ConexionDatos();

    protected void Page_Load(object sender, EventArgs e)
    {
        string[] drives;
        //rellenar el array con las unidades lógicas del sistema
        drives = System.Environment.GetLogicalDrives();

        for (int i = 0; i < drives.Length; i++)
        {

            DropDownList1.Items.Add(drives[i]);
            //     System.Windows.Forms.MessageBox.Show(drives[i]);
        }

        //rellenar el Combobox dese el array



        //Me.cbDrive.Items.AddRange(drives)
        //lbImg.Text = "Ninguna imagen cargada"

        //DirectoryInfo di =  new DirectoryInfo("c:/");
        //FileInfo[] rgFiles = di.GetFiles("*.aspx");
        // System.Windows.Forms.MessageBox.Show("-> " + d[0] + " - " + d[1] );
        //foreach (FileInfo fi in rgFiles)
        //{
        // System .Windows.Forms .MessageBox .Show ("<br><a href=" + fi.Name + ">" + fi.Name + "</a>");
        //}
    }
    protected void UploadBtn_Click(object sender, EventArgs e)
    {
        lblCCamp.Text = string.Empty;
        lblCCon.Text = string.Empty;
        lblCGZ.Text = string.Empty;
        lblCCronogFact.Text = string.Empty;
        string resultado = "";

        if (fuConsultora.HasFile)
        {
            string archivo = @"C:\Bcaribe\" + fuConsultora.FileName;
            fuConsultora.SaveAs(archivo);

            //direccion del archivo de texto
            //declaracion de una variable streamreader
            using (StreamReader sr = File.OpenText(archivo))
            {
                string input; //Variable para el texto de la linea
                while ((input = sr.ReadLine()) != null)
                {
                    string[] datos = input.Split(con.splitchar);
                    if (datos.Length == 17)
                    {
                        try
                        {
                            string sSQL = " EXEC USP_CARGA_CONSULTORA  ";
                            for (int i = 0; i < datos.Length; i++)
                            {
                                string cadena = datos[i].Replace('"', ' ');
                                cadena = cadena.TrimStart();
                                cadena = cadena.TrimEnd();
                                if (i + 1 == datos.Length)
                                    sSQL += "'" + cadena + "'";
                                else
                                    sSQL += "'" + cadena + "',";
                            }
                            resultado = con.AccesoDatosIngreso(sSQL);



                        }
                        catch (Exception ex)
                        {
                            lblCCon.Text = "No se pudo cargar el archivo de consultoras. Intente nuevamente. ";
                            //EventLogger ev = new EventLogger();
                            //ev.Save("carga consultora", ex);
                        }
                        if (resultado.Equals("1|"))
                            lblCCon.Text = "Los datos del archivo de consultora se agregaron con exito. ";
                        else
                            lblCCon.Text = "Los datos del archivo de consultora contienen datos erroneos. ";
                    }
                    else
                    {
                        lblCCon.Text = "No se pudo cargar el archivo de consultoras," +
                            " no tiene la estructura adecuada.";
                    }
                }

                sr.Close();
            }
        }

        if (fuGerentZona.HasFile)
        {
            string archivo = @"C:\Bcaribe\" + fuGerentZona.FileName;
            fuGerentZona.SaveAs(archivo);
            //direccion del archivo de texto
            //declaracion de una variable streamreader
            using (StreamReader sr = File.OpenText(archivo))
            {
                string input; //Variable para el texto de la linea
                while ((input = sr.ReadLine()) != null)
                {
                    string[] datos = input.Split(con.splitchar);
                    if (datos.Length == 14)
                    {
                        try
                        {
                            string sSQL = " EXEC USP_CARGA_GZ  ";
                            for (int i = 0; i < datos.Length; i++)
                            {
                                string cadena = datos[i].Replace('"', ' ');
                                cadena = cadena.TrimStart();
                                cadena = cadena.TrimEnd();
                                if (i + 1 == datos.Length)
                                    sSQL += "'" + cadena + "'";
                                else
                                    sSQL += "'" + cadena + "',";
                            }
                            resultado = con.AccesoDatosIngreso(sSQL);
                        }
                        catch (Exception ex)
                        {
                            lblCGZ.Text = "No se pudo cargar los datos de gerente de zona. Intente nuevamente. ";
                            //EventLogger ev = new EventLogger();
                            //ev.Save("carga consultora", ex);
                        }

                        if (resultado.Equals("1|"))
                            lblCGZ.Text = "Los datos del archivo de gerente de zona se agregaron con exito. ";
                        else
                            lblCGZ.Text = "Los datos del archivo de gerente de zona contienen datos erroneos. ";
                    }

                    else
                    {
                        lblCGZ.Text = "No se pudo cargar los datos del archivo de  gerente de zona," +
                            " no tiene la estructura adecuada.";
                    }

                }
                sr.Close();

            }
        }
        if (fuCampaña.HasFile)
        {
            string archivo = @"C:\Bcaribe\" + fuCampaña.FileName;
            fuCampaña.SaveAs(archivo);
            //direccion del archivo de texto
            //declaracion de una variable streamreader
            using (StreamReader sr = File.OpenText(archivo))
            {
                string input; //Variable para el texto de la linea
                while ((input = sr.ReadLine()) != null)
                {
                    string[] datos = input.Split(con.splitchar);
                    if (datos.Length == 3)
                    {
                        try
                        {
                            string sSQL = " EXEC USP_CARGA_CAMPANHA  ";
                            for (int i = 0; i < datos.Length; i++)
                            {
                                string cadena = datos[i].Replace('"', ' ');
                                cadena = cadena.TrimStart();
                                cadena = cadena.TrimEnd();
                                if (i + 1 == datos.Length)
                                    sSQL += "'" + cadena + "'";
                                else
                                    sSQL += "'" + cadena + "',";
                            }
                            resultado = con.AccesoDatosIngreso(sSQL);
                        }
                        catch (Exception ex)
                        {
                            lblCCamp.Text = "No se pudo cargar los datos de campaña. Intente nuevamente. ";
                            //EventLogger ev = new EventLogger();
                            //ev.Save("carga campaña", ex);
                        }

                        if (resultado.Equals("1|"))
                            lblCCamp.Text = "Los datos del archivo de campaña se agregaron con exito. ";
                        else
                            lblCCamp.Text = "Los datos del archivo de campaña contienen datos erroneos. ";
                    }
                    else
                    {
                        lblCCamp.Text = "No se pudo cargar los datos del archivo de  campaña," +
                            " no tiene la estructura adecuada.";
                    }

                }
                sr.Close();
            }
        }
        if (fuCronogFacturacion.HasFile)
        {
            string archivo = @"C:\Bcaribe\" + fuCronogFacturacion.FileName;
            fuCronogFacturacion.SaveAs(archivo);

            //direccion del archivo de texto
            //declaracion de una variable streamreader
            using (StreamReader sr = File.OpenText(archivo))
            {
                string input; //Variable para el texto de la linea
                while ((input = sr.ReadLine()) != null)
                { 
                    string[] datos = input.Split(con.splitchar);
                    if (datos.Length == 6)
                    {
                        try
                        {
                            string sSQL = " EXEC USP_CARGA_FACTURACION  ";
                            for (int i = 0; i < datos.Length; i++)
                            {
                                string cadena = datos[i].Replace('"', ' ');
                                cadena = cadena.TrimStart();
                                cadena = cadena.TrimEnd();
                                if (i + 1 == datos.Length)
                                    sSQL += "'" + cadena + "'";
                                else
                                    sSQL += "'" + cadena + "',";
                            }
                            resultado = con.AccesoDatosIngreso(sSQL);
                        }
                        catch (Exception ex)
                        {
                            lblCCronogFact.Text = "No se pudo cargar el archivo de cronograma de facturacion. Intente nuevamente. ";
                            //EventLogger ev = new EventLogger();
                            //ev.Save("carga consultora", ex);
                        }
                        if (resultado.Equals("1|"))
                            lblCCronogFact.Text = "Los datos del archivo de cronograma de facturacion se agregaron con exito. ";
                        else
                            lblCCronogFact.Text = "Los datos del archivo de cronograma de facturacion contienen datos erroneos. ";
                    }
                    else
                    {
                        lblCCronogFact.Text = "No se pudo cargar el archivo de cronograma de facturacion," +
                            " no tiene la estructura adecuada.";
                    }
                }

                sr.Close();
            }
        }
    }
   
    protected void btnSolCredito_Click(object sender, EventArgs e)
    {
        string sSQL;
        sSQL = "EXEC USP_DESCARGA_SC";
        string resultado = "\"";      
        if (Page.IsPostBack){
            DataTable dt = new DataTable();
            dt = con.AccesoDatos(sSQL);
            int rowSize = dt.Rows.Count;
            for (int r = 0; r < rowSize; r++){
             int colSize = dt.Columns.Count;
                 for (int c = 0; c < colSize; c++){
                     resultado += Convert.ToString(dt.Rows[r][c])+"\"";
                     if (c != colSize - 1)
                     {
                         resultado += ",\"";
                     }
                 }
                 resultado += Environment.NewLine;
            }
            byte[] nombre = null;
            nombre = System.Text.Encoding.Unicode.GetBytes(resultado);
            Response.ClearContent();
            Response.ContentType = "application/plain";
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("content-disposition", "attachment; filename=SOLCREDITO.txt");
            Response.BinaryWrite(nombre);
            Response.End();
        }
    }

    protected void btnCroFact_Click(object sender, EventArgs e)
    {
        string sSQL;
        sSQL = "exec ListaDescargaNuevas";
        string resultado = "\"";
        if (Page.IsPostBack)
        {
            DataTable dt = new DataTable();
            dt = con.AccesoDatos(sSQL);
            int rowSize = dt.Rows.Count;
            for (int r = 0; r < rowSize; r++)
            {
                int colSize = dt.Columns.Count;
                for (int c = 0; c < colSize; c++)
                {
                    resultado += Convert.ToString(dt.Rows[r][c]) + "\"";
                    if (c != colSize - 1)
                    {
                        resultado += ",\"";
                    }
                }
                resultado += Environment.NewLine;
            }
            byte[] nombre = null;
            nombre = System.Text.Encoding.Unicode.GetBytes(resultado);
            Response.ClearContent();
            Response.ContentType = "application/plain";
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("content-disposition", "attachment; filename=CRONOGFACT.txt");
            Response.BinaryWrite(nombre);
            Response.End();
        }

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {


        
        try{
         DirectoryInfo combo = new DirectoryInfo("C:/");
            DirectoryInfo[]  carpetas;
            carpetas = combo .GetDirectories() ;
            TreeNode nodo;
            foreach (DirectoryInfo carpetas2 in carpetas)
            {
                nodo = new TreeNode(carpetas2.Name, null, null);
                TreeView1.Nodes.Add(nodo);


                DirectoryInfo capetas3;
                capetas3 = new DirectoryInfo("C:/" + nodo.Value);
                DirectoryInfo[] carpetas4;
                carpetas4 = capetas3.GetDirectories();
                TreeNode nodo2;
                foreach (DirectoryInfo subcarpetas in carpetas4)
                {
                    nodo2 = new TreeNode(subcarpetas.Name, null, null);
                    nodo.ChildNodes.Add(nodo2);
                }
            }

        }catch (Exception ex) 
        {
           // MessageBox.Show("Mensaje de error: " & pollo.Message, "Error al leer la unidad " & cbDrive.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
           // cbDrive.Text = "C:\";
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
      /*  try
        {

            foreach (TreeNode item in TreeView1.Nodes){
                if (item.Selected) {
                   // if (item.Expanded) {
                        DirectoryInfo capetas3;
                        capetas3 = new DirectoryInfo("C:/" + item.Value);
                        DirectoryInfo[] carpetas4;
                        carpetas4 = capetas3.GetDirectories();

                        TreeNode nodo;
                        foreach (DirectoryInfo subcarpetas in carpetas4){
                            nodo = new TreeNode(subcarpetas.Name,null,null);
                            item.ChildNodes.Add(nodo);
                        
                        } 

                    //}
                    //System.Windows.Forms.MessageBox.Show("seleccionadoo "+item.Value);        
                }
            
            }
            
        }
        catch (Exception ex) { }*/
    }
}

