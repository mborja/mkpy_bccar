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
            /*
             cargarCombos();
            lblUsuarioID.Visible = false;
            String usuarioID = Request.QueryString.Get("usuarioID");
             */
        }
    }

    private void cargarCombos()
    {
        DataTable dtPais = new DataTable();
        dtPais = pais.obtenerNombres();

        if (dtPais != null)
        {
            ddlNombre.DataSource = dtPais;
            ddlNombre.DataValueField = "paisID";
            ddlNombre.DataTextField = "paisNombre";
            ddlNombre.DataBind();
        }
    }

    private void cargarGrilla(int paisID)
    {
        DataTable dtDivision = new DataTable();
        dtDivision = dp.obtenerPorPaisID(paisID);
        
        if (dtDivision != null)
        {
            if (dtDivision.Rows.Count == 0)
                divPolitica.InnerHtml = "<div id=\"info\">El país seleccionado no posee divisiones políticas registradas.</div>";
            else
                divPolitica.InnerHtml = "";

            gvDivPolitica.DataSource = dtDivision;
            gvDivPolitica.DataBind();
        }
        else
            divPolitica.InnerHtml = "<div id=\"error\">Ha ocurrido un error al cargar la división política.</div>";
    }

    protected void ddlNombre_SelectedIndexChanged(object sender, EventArgs e)
    {
        cargarGrilla(Convert.ToInt32(ddlNombre.SelectedValue));
    }
}
