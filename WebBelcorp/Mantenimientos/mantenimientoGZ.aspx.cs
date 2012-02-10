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


public partial class Mantenimientos_mantenimientoGZ : System.Web.UI.Page
{
    GerenteZona gz = new GerenteZona();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            String gerenteID = Request.QueryString.Get("gerenteID");
            lblGerenteID.Visible = false;

            if (gerenteID != null)
            {
                //Actualizar Gerente
                //------------------------------------
                lblTitle.Text = "Actualizar Gerente de Zona: ";
                cmdEditar.Visible = true;

                DataTable dtGerente = new DataTable();
                dtGerente = gz.cargar(Convert.ToInt32(gerenteID));

                if (dtGerente != null)
                {
                    lblGerenteID.Text = Convert.ToString(dtGerente.Rows[0]["gerenteID"]);
                    txtPais.Text = Convert.ToString(dtGerente.Rows[0]["paisNombre"]);
                    txtRegion.Text = Convert.ToString(dtGerente.Rows[0]["regionCodigo"]);
                    txtZona.Text = Convert.ToString(dtGerente.Rows[0]["zonaCodigo"]);
                    txtPIN.Text = Convert.ToString(dtGerente.Rows[0]["pin"]).Trim();
                    txtIMSI.Text = Convert.ToString(dtGerente.Rows[0]["imsi"]).Trim();
                    txtCodConsu.Text = Convert.ToString(dtGerente.Rows[0]["consultoraID"]);
                    txtNombres.Text = Convert.ToString(dtGerente.Rows[0]["gerenteNombres"]);
                    txtApePaterno.Text = Convert.ToString(dtGerente.Rows[0]["gerenteApePaterno"]);
                    txtApeMaterno.Text = Convert.ToString(dtGerente.Rows[0]["gerenteApeMaterno"]);
                    txtNroDoc.Text = Convert.ToString(dtGerente.Rows[0]["nrodoc"]);
                    txtTelefono.Text = Convert.ToString(dtGerente.Rows[0]["telefono"]);
                    txtEmail.Text = Convert.ToString(dtGerente.Rows[0]["email"]);
                    ddlEstado.Text = (Convert.ToBoolean(dtGerente.Rows[0]["estado"])) ? "Verificado" : "No Verificado";
                }
            }
            else
            {
                //Crear Gerente
                //------------------------------------
                lblTitle.Text = "Crear Gerente de Zona: ";
                
            }
        }
    }
    protected void cmdEditar_Click(object sender, EventArgs e)
    {
        int gerenteID = Convert.ToInt32(lblGerenteID.Text);
        String pin = txtPIN.Text;
        String imsi = txtIMSI.Text;
        bool estado = (ddlEstado.SelectedIndex == 0) ? true : false;

        String resultado = gz.actualizar(gerenteID, pin, imsi, estado);
        if (resultado.Equals("success"))
            divMensaje.InnerHtml = "<div id=\"success\">Actualización de gerente de zona realizada con éxito.</div>";
        else
            divMensaje.InnerHtml = "<div id=\"error\">" + resultado + "</div>";
    }
}
