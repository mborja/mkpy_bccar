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


public partial class Mantenimientos_mantenimientoPais : System.Web.UI.Page
{
    Pais pais = new Pais();
    DivisionPolitica dp = new DivisionPolitica();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            cargarCombos();
            cargarGrilla(Convert.ToInt32(ddlNombre.SelectedValue));
            lblPaisID.Visible = false;
            String paisID = Request.QueryString.Get("paisID");

            if (paisID != null)
            {
                //Actualizar País
                //------------------------------------
                lblTitle.Text = "Actualización de país";
                cmdEditar.Visible = true;
                txtNombre.Visible = true;

                DataTable dtPais = new DataTable();
                dtPais = pais.cargar(Convert.ToInt32(paisID));
                //lblGerenteID.Text = Convert.ToString(dtGerente.Rows[0]["gerenteID"]);
                if (dtPais != null)
                {
                    if (Convert.ToBoolean(dtPais.Rows[0]["estado"]))
                    {
                        lblPaisID.Text = Convert.ToString(dtPais.Rows[0]["paisID"]);
                        txtNombre.Text = Convert.ToString(dtPais.Rows[0]["nombre"]);
                        txtNomenclatura.Text = Convert.ToString(dtPais.Rows[0]["nomenclatura"]);
                        txtEdad.Text = Convert.ToString(dtPais.Rows[0]["medad"]);
                        txtCaducidad.Text = Convert.ToString(dtPais.Rows[0]["caducidad"]);
                        ddlSeguimiento.Text = (Convert.ToBoolean(dtPais.Rows[0]["seguimientoBB"])) ? "Activo" : "Inactivo";
                        ddlReingreso.Text = (Convert.ToBoolean(dtPais.Rows[0]["reingresoBB"])) ? "Activo" : "Inactivo";
                        ddlAdicional.Text = (Convert.ToBoolean(dtPais.Rows[0]["adicionalSC"])) ? "Activo" : "Inactivo";
                        ddlGPS.Text = (Convert.ToBoolean(dtPais.Rows[0]["gpsBB"])) ? "Activo" : "Inactivo";
                        ddlVerificacion.Text = (Convert.ToBoolean(dtPais.Rows[0]["verificadoIncorp"])) ? "Activo" : "Inactivo";
                        ddlEstado.Text = (Convert.ToBoolean(dtPais.Rows[0]["estado"])) ? "Activo" : "Inactivo";

                        cargarGrilla(Convert.ToInt32(dtPais.Rows[0]["paisID"]));
                    }
                    else
                    {
                        String html = "<table >" +
                                        "<tr>" +
                                            "<td colspan=\"2\"><label style=\"text-align:left; font-size:xx-large; font-family:Arial; font-weight:700; color:#778391;\">Actualización de país</label></td>" +
                                        "</tr>" +
                                        "<tr>" +
                                            "<td colspan=\"2\">&nbsp;</td>" +
                                        "</tr>" +
                                        "<tr>" +
                                            "<td><a href=\"vistaPaises.aspx\"><label class=\"linkEs\">Regresar</label></a></td>" +
                                            "<td>&nbsp;</td>" +
                                        "</tr>" +
                                      "</table>";
                        formulario.InnerHtml = html;
                        divMensaje.InnerHtml = "<div id=\"warning\">El país seleccionado se encuentra en <b>estado Inactivo</b>. Para cambiar dicho estado deberá seleccionar la opción <b>nuevo país</b> en la vista <b>búsqueda de paises</b>.</div>";
                    }
                }
            }
            else
            {
                //Crear País
                //------------------------------------
                lblTitle.Text = "Creación de país";
                cmdCrear.Visible = true;
                ddlNombre.Visible = true;
                trEstado.Visible = false;
            }
        }
    }

    private void cargarCombos()
    {
        try
        {
            DataTable dtTemp = new DataTable("TemporalDataTable");
            dtTemp.Columns.Add("paisID", typeof(Int32));
            dtTemp.Columns.Add("paisNombre", typeof(String));
            DataRow drTemp = dtTemp.NewRow();
            drTemp["paisID"] = (Int32)0;
            drTemp["paisNombre"] = "Seleccione un país";
            dtTemp.Rows.Add(drTemp);

            DataTable dtPais = new DataTable();
            dtPais = pais.obtenerNombres();

            if (dtPais != null)
            {
                dtTemp.Merge(dtPais);
            }

            ddlNombre.DataSource = dtTemp;
            ddlNombre.DataValueField = "paisID";
            ddlNombre.DataTextField = "paisNombre";
            ddlNombre.DataBind();
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0 [mantenimientoPais - método: cargarCombos]", ex);
            divPolitica.InnerHtml = "<div id=\"error\">Ha ocurrido un error al cargar la lista de paises.</div>";
        }
    }

    private void cargarBandera(int paisID)
    {
        DataTable dtPais = new DataTable();
        dtPais = pais.cargar(paisID);

        if (dtPais != null)
            divCountryFlag.InnerHtml = "<img src=\"../" + dtPais.Rows[0]["rutaimg"] +"\" alt=\""+ dtPais.Rows[0]["nombre"] + "\" />";
    }

    private void cargarGrilla(int paisID)
    {
        DataTable dtDivision = new DataTable();

        if (paisID != 0)
        {
            dtDivision = dp.obtenerPorPaisID(paisID);

            if (dtDivision != null)
            {
                if (dtDivision.Rows.Count == 0)
                    divPolitica.InnerHtml = "<div id=\"info\">El país seleccionado no posee divisiones políticas registradas.</div>";
                else
                {
                    divPolitica.InnerHtml = "";
                    cargarBandera(paisID);
                }   

                gvDivPolitica.DataSource = dtDivision;
                gvDivPolitica.DataBind();
            }
            else
                divPolitica.InnerHtml = "<div id=\"error\">Ha ocurrido un error al cargar la división política.</div>";

            
        }
        else
        {
            gvDivPolitica.DataSource = new DataTable();
            gvDivPolitica.DataBind();
        }
    }

    protected void ddlNombre_SelectedIndexChanged(object sender, EventArgs e)
    {
        divMensaje.InnerHtml = "";
        cargarGrilla(Convert.ToInt32(ddlNombre.SelectedValue));
    }

    protected void cmdCrear_Click(object sender, EventArgs e)
    {
        // No se crea un país, sólo se actualiza de estado 0 a 1
        int paisID = Convert.ToInt32(ddlNombre.SelectedValue);

        if (paisID != 0)
        {
            String nomenclatura = txtNomenclatura.Text;
            int medad = Convert.ToInt32(txtEdad.Text);
            int caducidad = Convert.ToInt32(txtCaducidad.Text);
            bool seguimientoBB = (ddlSeguimiento.SelectedIndex == 0) ? true : false;
            bool reingresoBB = (ddlReingreso.SelectedIndex == 0) ? true : false;
            bool adicionalSC = (ddlAdicional.SelectedIndex == 0) ? true : false;
            bool gpsBB = (ddlGPS.SelectedIndex == 0) ? true : false;
            bool verificadoIncorp = (ddlVerificacion.SelectedIndex == 0) ? true : false;
            bool estado = true;

            DataTable dtDivPolitica = getDivisionPolitica();

            String resultado = pais.actualizar(paisID, nomenclatura, medad, seguimientoBB, reingresoBB, adicionalSC, gpsBB, verificadoIncorp, estado, dtDivPolitica, caducidad);
            if (resultado.Equals("success"))
                divMensaje.InnerHtml = "<div id=\"success\">La creación del país <b>" + ddlNombre.SelectedItem + "</b> se ha realizado con éxito.</div>";
            else
                divMensaje.InnerHtml = "<div id=\"error\">" + resultado + "</div>";

            txtNomenclatura.Text = "";
            txtEdad.Text = "";
            ddlSeguimiento.SelectedIndex = 0;
            ddlReingreso.SelectedIndex = 0;
            ddlAdicional.SelectedIndex = 0;
            ddlGPS.SelectedIndex = 0;
            ddlVerificacion.SelectedIndex = 0;

            cargarCombos();
            cargarGrilla(Convert.ToInt32(ddlNombre.SelectedValue));
        }
        else
        {
            divMensaje.InnerHtml = "<div id=\"warning\">Para crear un país, primero debe seleccionar uno.</div>";
            ddlNombre.Focus();
        }
    }

    protected void cmdEditar_Click(object sender, EventArgs e)
    {
        // No se crea un país, sólo se actualiza de estado 0 a 1
        int paisID = Convert.ToInt32(lblPaisID.Text);
        String nomenclatura = txtNomenclatura.Text;
        int medad = Convert.ToInt32(txtEdad.Text);
        int caducidad = Convert.ToInt32(txtCaducidad.Text);
        bool seguimientoBB = (ddlSeguimiento.SelectedIndex == 0) ? true : false;
        bool reingresoBB = (ddlReingreso.SelectedIndex == 0) ? true : false;
        bool adicionalSC = (ddlAdicional.SelectedIndex == 0) ? true : false;
        bool gpsBB = (ddlGPS.SelectedIndex == 0) ? true : false;
        bool verificadoIncorp = (ddlVerificacion.SelectedIndex == 0) ? true : false;
        bool estado = (ddlEstado.SelectedIndex == 0) ? true : false;

        DataTable dtDivPolitica = getDivisionPolitica();

        String resultado = pais.actualizar(paisID, nomenclatura, medad, seguimientoBB, reingresoBB, adicionalSC, gpsBB, verificadoIncorp, estado, dtDivPolitica, caducidad);
        if (resultado.Equals("success"))
            divMensaje.InnerHtml = "<div id=\"success\">La actualización del país <b>" + txtNombre.Text + "</b> se ha realizado con éxito.</div>";
        else
            divMensaje.InnerHtml = "<div id=\"error\">" + resultado + "</div>";
    }

    private DataTable getDivisionPolitica()
    {
        DataTable dtDivPolitica = new DataTable("DivisionPolitica");
        dtDivPolitica.Columns.Add("divisionID", typeof(Int32));
        dtDivPolitica.Columns.Add("estado", typeof(bool));

        foreach (GridViewRow row in gvDivPolitica.Rows)
        {
            DataRow dr = dtDivPolitica.NewRow();
            dr["divisionID"] = Convert.ToInt32(row.Cells[0].Text);
            CheckBox chk = row.Cells[2].FindControl("CheckBox1") as CheckBox;
            dr["estado"] = chk.Checked;
            dtDivPolitica.Rows.Add(dr);
        }

        return dtDivPolitica;
    }
}
