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

public partial class Mantenimientos_mantenerUsuario : System.Web.UI.Page
{
    private Tabla tabla = new Tabla();
    private Usuario usuario = new Usuario();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            cargarCombos();
            lblUsuarioID.Visible = false;
            String usuarioID = Request.QueryString.Get("usuarioID");

            if (usuarioID != null)
            {
                //Actualizar usuario
                //------------------------------------
                lblTitle.Text = "Actualizar Usuario: ";
                cmdActualizar.Visible = true;
                txtUsuario.Enabled = false;

                DataTable dtUsuario = new DataTable();
                dtUsuario = usuario.cargar(Convert.ToInt32(usuarioID));

                if (dtUsuario != null)
                {
                    lblUsuarioID.Text = Convert.ToString(dtUsuario.Rows[0]["usuarioID"]);
                    txtPais.Text = Convert.ToString(dtUsuario.Rows[0]["paisNombre"]);
                    txtUsuario.Text = Convert.ToString(dtUsuario.Rows[0]["usuario"]);
                    txtNombres.Text = Convert.ToString(dtUsuario.Rows[0]["nombres"]);
                    ddlPerfil.Text = Convert.ToString(dtUsuario.Rows[0]["perfilID"]);
                    chkEstado.Checked = Convert.ToBoolean(dtUsuario.Rows[0]["estado"]);
                }
            }
            else
            {
                //Crear usuario
                //------------------------------------
                lblTitle.Text = "Agregar Usuario: ";
                txtPais.Text = Convert.ToString(Session["paisNombre"]);
                cmdRegistrar.Visible = true;
            }
        }
    }
    /**
     * Método que realiza el llenado de controles 'DropDownList' en el formulario
     */
    private void cargarCombos()
    {
        DataTable dtPerfil = new DataTable();
        dtPerfil = tabla.obtenerPerfiles();

        if (dtPerfil != null)
        {
            ddlPerfil.DataSource = dtPerfil;
            ddlPerfil.DataValueField = "perfilCodigo";
            ddlPerfil.DataTextField = "perfilDescripcion";
            ddlPerfil.DataBind();
        }
    }
    protected void cmdRegistrar_Click(object sender, EventArgs e)
    {
        if (txtClave.Text.Equals(txtClaveConfirmar.Text))
        {
            int paisID = Convert.ToInt32(Session["paisID"]);
            int perfilID = Convert.ToInt32(ddlPerfil.SelectedValue);
            String usuario = txtUsuario.Text;
            String clave = txtClave.Text;
            String nombres = txtNombres.Text;
            bool estado = chkEstado.Checked;

            Usuario u = new Usuario();
            String resultado = u.crear(paisID, perfilID, usuario, clave, nombres, estado);
            if (resultado.Equals("success"))
                divMensaje.InnerHtml = "<div id=\"success\">Creación de usuario realizada con éxito.</div>";
            else
                divMensaje.InnerHtml = "<div id=\"error\">" + resultado + "</div>";

            txtUsuario.Text = "";
            txtClave.Text = "";
            txtNombres.Text = "";
            chkEstado.Checked = false;
            cargarCombos();
        }
        else
        {
            divMensaje.InnerHtml = "<div id=\"warning\">La contraseñas ingresadas no coinciden.</div>";
            txtClave.Focus();
        } 
        
    }
    protected void cmdActualizar_Click(object sender, EventArgs e)
    {
        int usuarioID = Convert.ToInt32(lblUsuarioID.Text);
        int perfilID = Convert.ToInt32(ddlPerfil.SelectedValue);
        String nombres = txtNombres.Text;
        bool estado = chkEstado.Checked;

        String resultado = usuario.actualizar(usuarioID, perfilID, nombres, estado);
        if (resultado.Equals("success"))
            divMensaje.InnerHtml = "<div id=\"success\">Actualización de usuario realizada con éxito.</div>";
        else
            divMensaje.InnerHtml = "<div id=\"error\">" + resultado + "</div>";
    }
}
