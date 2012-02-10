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


public partial class Mantenimientos_vistaPaises : System.Web.UI.Page
{
    private Pais pais = new Pais();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void OnRowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
    }

    protected void RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditarPais")
        {
            String paisID = gvPais.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            Response.Redirect("mantenimientoPais.aspx?paisID=" + paisID, true);
        }
    }
    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dtPais = new DataTable();
            dtPais = pais.obtener(txtNomenclatura.Text, txtNombre.Text, txtEdad.Text);

            if (dtPais != null)
            {
                if (dtPais.Rows.Count == 0)
                    divMensaje.InnerHtml = "<div id=\"info\">No hay resultados que coincidan con los criterios de búsqueda ingresados.</div>";
                else
                    divMensaje.InnerHtml = "";

                gvPais.DataSource = dtPais;
                gvPais.DataBind();
            }
            else
                divMensaje.InnerHtml = "<div id=\"error\">Ha ocurrido un error al cargar la lista de países.</div>";
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0 [vistaPaises - método: cmdBuscar_Click]", ex);
        }
    }
    protected void gvPais_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPais.PageIndex = e.NewPageIndex;
    }
}
