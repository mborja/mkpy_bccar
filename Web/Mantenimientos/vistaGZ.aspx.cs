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


public partial class Mantenimientos_vistaGZ : System.Web.UI.Page
{
    GerenteZona gz = new GerenteZona();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void OnRowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
    }


    protected void RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditarGerente")
        {
            String gerenteID = gvGerenteZona.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            Response.Redirect("mantenimientoGZ.aspx?gerenteID=" + gerenteID, true);
        }
    }
    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dtGZ = new DataTable();
            dtGZ = gz.obtener(txtUsuario.Text, txtRegion.Text, txtZona.Text);

            if (dtGZ != null)
            {
                if (dtGZ.Rows.Count == 0)
                    divMensaje.InnerHtml = "<div id=\"info\">No hay resultados que coincidan con los criterios de búsqueda ingresados.</div>";
                else
                    divMensaje.InnerHtml = "";

                gvGerenteZona.DataSource = dtGZ;
                gvGerenteZona.DataBind();
            }
            else
                divMensaje.InnerHtml = "<div id=\"error\">Ha ocurrido un error al cargar la lista de gerentes de zona.</div>";
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0 [vistaGZ - método: cmdBuscar_Click]", ex);
        }
    }
}
