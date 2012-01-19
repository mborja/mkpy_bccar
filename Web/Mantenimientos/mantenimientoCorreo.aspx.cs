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


public partial class Mantenimientos_mantenimientoCorreo : System.Web.UI.Page
{
    Tabla tabla = new Tabla();
    Correo correo = new Correo();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            cargarCombos();
            String correoID = Request.QueryString.Get("correoID");
            lblCorreoID.Visible = false;

            if (correoID != null)
            {
                //Actualizar Gerente
                //------------------------------------
                lblTitle.Text = "Actualizar Correo: ";
                cmdEditar.Visible = true;

                DataTable dtCorreo = new DataTable();
                dtCorreo = correo.cargar(Convert.ToInt32(correoID));

                if (dtCorreo != null)
                {
                    lblCorreoID.Text = Convert.ToString(dtCorreo.Rows[0]["correoID"]);
                    ddlOperacion.Text = Convert.ToString(dtCorreo.Rows[0]["operacionDescripcion"]);
                    txtEmail.Text = Convert.ToString(dtCorreo.Rows[0]["email"]);
                    txtNombres.Text = Convert.ToString(dtCorreo.Rows[0]["nombres"]);
                    txtApePaterno.Text = Convert.ToString(dtCorreo.Rows[0]["apellidoPaterno"]);
                    txtApeMaterno.Text = Convert.ToString(dtCorreo.Rows[0]["apellidoMaterno"]);
                    txtNroDoc.Text = Convert.ToString(dtCorreo.Rows[0]["nrodoc"]);
                    ddlEstado.Text = (Convert.ToBoolean(dtCorreo.Rows[0]["estado"])) ? "Verificado" : "No Verificado";
                }
            }
            else
            {
                //Crear Gerente
                //------------------------------------
                lblTitle.Text = "Crear Correo: ";
                cmdCrear.Visible = true;
            }
        }
    }

    private void cargarCombos()
    {
        DataTable dtOperaciones = new DataTable();
        dtOperaciones = tabla.obtenerOperaciones();

        if (dtOperaciones != null)
        {
            ddlOperacion.DataSource = dtOperaciones;
            ddlOperacion.DataValueField = "tablaID";
            ddlOperacion.DataTextField = "operacionDescripcion";
            ddlOperacion.DataBind();
        }
    }

    protected void cmdCrear_Click(object sender, EventArgs e)
    {
        int paisID = Convert.ToInt32(Session["paisID"]);
        int operacionID = Convert.ToInt32(ddlOperacion.SelectedValue);
        String apellidoPaterno = txtApePaterno.Text;
        String apellidoMaterno = txtApeMaterno.Text;
        String nombres = txtNombres.Text;
        String numeroDocumento = txtNroDoc.Text;
        String email = txtEmail.Text;
        bool estado = (ddlEstado.SelectedIndex == 0) ? true : false;

        String resultado = correo.crear(paisID, operacionID, apellidoPaterno, apellidoMaterno, nombres, numeroDocumento, email, estado);
        if (resultado.Equals("success"))
            divMensaje.InnerHtml = "<div id=\"success\">Creación de correo realizada con éxito.</div>";
        else
            divMensaje.InnerHtml = "<div id=\"error\">" + resultado + "</div>";

        txtEmail.Text = "";
        txtApePaterno.Text = "";
        txtApeMaterno.Text = "";
        txtNombres.Text = "";
        txtNroDoc.Text = "";
        txtEmail.Text = "";
        cargarCombos();
        ddlEstado.Text = "Verificado";
    }

    protected void cmdEditar_Click(object sender, EventArgs e)
    {
        int correoID = Convert.ToInt32(lblCorreoID.Text);
        int operacionID = Convert.ToInt32(ddlOperacion.SelectedValue);
        String apellidoPaterno = txtApePaterno.Text;
        String apellidoMaterno = txtApeMaterno.Text;
        String nombres = txtNombres.Text;
        String numeroDocumento = txtNroDoc.Text;
        String email = txtEmail.Text;
        bool estado = (ddlEstado.SelectedIndex == 0) ? true : false;

        String resultado = correo.actualizar(correoID, operacionID, apellidoPaterno, apellidoMaterno, nombres, numeroDocumento, email, estado);
        if (resultado.Equals("success"))
            divMensaje.InnerHtml = "<div id=\"success\">Actualización de correo realizada con éxito.</div>";
        else
            divMensaje.InnerHtml = "<div id=\"error\">" + resultado + "</div>";
    }
}
