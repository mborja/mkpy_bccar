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

using System.Data.SqlClient;

//using System.Configuration.ConfigurationManager;
//using System.Windows.Forms;
//mantUsuarios.aspx?met=E


public partial class mantUsuarios : System.Web.UI.Page
{
    ConexionDatos cd = new ConexionDatos();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Get("met") == "I")
            FormView2.DefaultMode = FormViewMode.Insert;
        if (Request.QueryString.Get("met") == "E")
        {
            FormView2.ChangeMode(FormViewMode.Edit);
            FillCountryDdl();
            BindFormView(Request.QueryString.Get("usuarioID"));
        }
    }

    private void BindFormView(String usuarioID)
    {
        SqlConnection cn = new SqlConnection(cd.getConnectionString());
        SqlDataAdapter da = new SqlDataAdapter();
        String sqlQuery = "SELECT u.id, u.idtablaperfil, u.idpais, u.codigo, u.clave, u.nombre, u.estado FROM Usuario u WITH (NOLOCK) WHERE u.id = @usuarioID;";
        try
        {
            cn.Open();
            DataSet ds = new DataSet();
            da = new SqlDataAdapter(sqlQuery, cn);
            da.SelectCommand.Parameters.Add("@usuarioID", SqlDbType.Int).Value = usuarioID;
            da.Fill(ds);

            FormView2.DataSource = ds;
            FormView2.DataBind();
        }
        catch (Exception ex)
        {
            // event logger
            System.Windows.Forms.MessageBox.Show(ex.Message);
        }
        finally
        {
            cn.Close();
        }
    }

    private void FillCountryDdl()
    {
        SqlConnection cn = new SqlConnection(cd.getConnectionString());
        SqlDataAdapter da = new SqlDataAdapter();
        String sqlQuery = "SELECT p.id, p.nombre FROM Pais p WITH (NOLOCK);";
        try
        {
            cn.Open();
            DataSet ds = new DataSet();
            da = new SqlDataAdapter(sqlQuery, cn);
            da.Fill(ds);

            /*
            DropDownList ddlPais = ((DropDownList)(FormView2.FindControl("ddlPais")));
            ddlPais.DataSource = ds;
            ddlPais.DataValueField = "id";
            ddlPais.DataTextField = "nombre";
            ddlPais.DataBind();
            */
        }
        catch (Exception ex)
        {
            // print ex
            System.Windows.Forms.MessageBox.Show(ex.Message);
        }
        finally
        {
            cn.Close();
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("lstUsuarios.aspx");
    }

    protected void FormView2_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        Response.Redirect("lstUsuarios.aspx?upd=1");
    }

    protected void FormView2_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        Response.Redirect("lstUsuarios.aspx?ins=1");
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        // selecting sqldatasource 1 O_O
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox ckBox = ((CheckBox)(FormView2.FindControl("chBox")));
        TextBox txtBoxPwd = ((TextBox)(FormView2.FindControl("ClaveTextBox")));
        TextBox txtBoxPwdConf = ((TextBox)(FormView2.FindControl("ClaveTextBox0")));
        Label lblPwd = ((Label)(FormView2.FindControl("lblPwdUu")));
        Label lblPwd0 = ((Label)(FormView2.FindControl("lblPwdUu0")));
            if (ckBox.Checked)
            {
                lblPwd.Visible = true;
                lblPwd0.Visible = true;
                txtBoxPwd.Visible = true;
                txtBoxPwdConf.Visible = true;
            }
            else {
                lblPwd.Visible = false;
                lblPwd0.Visible = false;
                txtBoxPwd.Visible = false;
                txtBoxPwdConf.Visible = false;
            }
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        CheckBox ckBox = ((CheckBox)(FormView2.FindControl("chBox")));

        if (ckBox.Checked)
        {
            TextBox txtBoxPwd = ((TextBox)(FormView2.FindControl("ClaveTextBox")));
            TextBox txtBoxPwdConf = ((TextBox)(FormView2.FindControl("ClaveTextBox0")));
            TextBox txtBoxCod = ((TextBox)(FormView2.FindControl("CodigoTextBox")));
            TextBox txtBoxNom = ((TextBox)(FormView2.FindControl("NombreTextBox")));
            DropDownList ddlPerfil = ((DropDownList)(FormView2.FindControl("cboPerfil")));
            CheckBox chkboxEstado = ((CheckBox)(FormView2.FindControl("EstadoCheckBox")));
        }
        /*
        if (ckBox.Checked)
        {

            TextBox txtBoxPwd = ((TextBox)(FormView2.FindControl("ClaveTextBox")));
            TextBox txtBoxPwdConf = ((TextBox)(FormView2.FindControl("ClaveTextBox0")));
            TextBox txtBoxCod = ((TextBox)(FormView2.FindControl("CodigoTextBox")));
            TextBox txtBoxNom = ((TextBox)(FormView2.FindControl("NombreTextBox")));
            DropDownList ddlPerfil = ((DropDownList)(FormView2.FindControl("cboPerfil")));
            CheckBox chkboxEstado = ((CheckBox)(FormView2.FindControl("EstadoCheckBox")));
            if (txtBoxPwd.Equals(txtBoxPwdConf))
            {
                SqlDataSource1.UpdateCommand =
                "UPDATE [Usuario] SET [idptablaerfil] = '" + ddlPerfil.SelectedValue +
                    "' , [idpais] =  '" + Session["paisId"].ToString() +
                    "' , [codigo] =  '" + txtBoxCod.Text +
                    "' , [clave] = '" + txtBoxPwd.Text +
               "' , [nombre] =  '" + txtBoxNom.Text +
               "' , [estado] =  '" + chkboxEstado.Checked +
               "' WHERE [id] =  '" + Request.QueryString["idUsuario"].ToString() + "' ";
            }
            
        }
        */
    }
    protected void ErrorGeneral(Object sender, EventArgs e)
    {
        string mensaje = Server.GetLastError().Message;
        string error = "Error Inesperado";
        // Listar Errores //
        if (mensaje.Contains("UQ_usuario_codigo"))
            error = "El codigo de usuario ya existe";
        CompareValidator cv = (CompareValidator)(FormView2.FindControl("CustomValidator1"));
        cv.IsValid = true;
        cv.ErrorMessage = error;
    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
        TextBox txtBoxPwd = ((TextBox)(FormView2.FindControl("ClaveTextBox")));
        TextBox txtBoxCod = ((TextBox)(FormView2.FindControl("CodigoTextBox")));
        TextBox txtBoxNom = ((TextBox)(FormView2.FindControl("NombreTextBox")));
        DropDownList ddlPerfil = ((DropDownList)(FormView2.FindControl("cboPerfilUsuario")));
        DropDownList ddlPais = ((DropDownList)(FormView2.FindControl("cboPaisUsuario")));
        CheckBox chkboxEstado = ((CheckBox)(FormView2.FindControl("EstadoCheckBox")));

        ConexionDatos cd = new ConexionDatos();
        SqlConnection cn = new SqlConnection(cd.getConnectionString());
        SqlCommand cmd = new SqlCommand();

        try
        {
            cn.Open();

            cmd = new SqlCommand("INSERT INTO Usuario VALUES (@perfilID, @paisID, @usuario, @clave, @nombre, @estado)", cn);
            cmd.Parameters.Add("@perfilID", SqlDbType.Int).Value = ddlPerfil.SelectedValue;
            cmd.Parameters.Add("@paisID", SqlDbType.Int).Value = ddlPais.SelectedValue;
            cmd.Parameters.Add("@nombre", SqlDbType.VarChar, 50).Value = txtBoxCod.Text;
            cmd.Parameters.Add("@usuario", SqlDbType.VarChar, 15).Value = txtBoxNom.Text;
            cmd.Parameters.Add("@clave", SqlDbType.VarChar, 15).Value = txtBoxPwd.Text;
            cmd.Parameters.Add("@estado", SqlDbType.Bit).Value = chkboxEstado.Checked;
            
            cmd.ExecuteNonQuery();
            cmd.Transaction.Commit();
        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show(ex.Message);
            cmd.Transaction.Rollback();
        }
        finally
        {
            cn.Close();
        }
    }
    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {

    }
}
