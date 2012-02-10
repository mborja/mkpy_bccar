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


public partial class Mantenimientos_vistaCorreo : System.Web.UI.Page
{
    Tabla tabla = new Tabla();
    Correo correo = new Correo();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            cargarCombos();
        }
    }

    private void cargarCombos()
    {
        DataTable dtTemp = new DataTable("TemporalDataTable");
        dtTemp.Columns.Add("tablaID", typeof(Int32));
        dtTemp.Columns.Add("operacionDescripcion", typeof(String));
        DataRow drTemp = dtTemp.NewRow();
        drTemp["tablaID"] = (Int32)0;
        drTemp["operacionDescripcion"] = "Todos";
        dtTemp.Rows.Add(drTemp);

        DataTable dt = new DataTable();
        dt = tabla.obtenerOperaciones();

        if (dt != null)
        {
            dtTemp.Merge(dt);
        }

        ddlOperación.DataSource = dtTemp;
        ddlOperación.DataValueField = "tablaID";
        ddlOperación.DataTextField = "operacionDescripcion";
        ddlOperación.DataBind();
    }

    protected void gvCorreos_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
    }

    protected void gvCorreos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditarCorreo")
        {
            String correoID = gvCorreos.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            Response.Redirect("mantenimientoCorreo.aspx?correoID=" + correoID, true);
        }
    }
    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dtCorreo = new DataTable();
            dtCorreo = correo.obtener(txtNombre.Text, txtEmail.Text, Convert.ToInt32(ddlOperación.SelectedValue), Convert.ToInt32(Session["paisID"]));

            if (dtCorreo != null)
            {
                if (dtCorreo.Rows.Count == 0)
                    divMensaje.InnerHtml = "<div id=\"info\">No hay resultados que coincidan con los criterios de búsqueda ingresados.</div>";
                else
                    divMensaje.InnerHtml = "";

                gvCorreos.DataSource = dtCorreo;
                gvCorreos.DataBind();
            }
            else
                divMensaje.InnerHtml = "<div id=\"error\">Ha ocurrido un error al cargar la lista de correos.</div>";
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0 [vistaCorreos - método: cmdBuscar_Click]", ex);
        }
    }
}
