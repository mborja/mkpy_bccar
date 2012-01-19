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
using System.Security.Principal;

public partial class Mantenimientos_vistaUsuarios : System.Web.UI.Page
{
    ConexionDatos cd = new ConexionDatos();
    Tabla tabla = new Tabla();
    Usuario usuario = new Usuario();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            cargarCombos();
        }
    }

    protected void OnRowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
    }

    protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditarUsuario")
        {
            String usuarioID = gvUsuarios.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text;
            Response.Redirect("mantenimientoUsuario.aspx?usuarioID=" + usuarioID, true);
        }
    }

    private void cargarCombos()
    {
        try
        {
            DataTable dtTemp = new DataTable("TemporalDataTable");
            dtTemp.Columns.Add("tablaID", typeof(Int32));
            dtTemp.Columns.Add("perfilDescripcion", typeof(String));
            DataRow drTemp = dtTemp.NewRow();
            drTemp["tablaID"] = (Int32)0;
            drTemp["perfilDescripcion"] = "Todos";
            dtTemp.Rows.Add(drTemp);

            dtTemp.Merge(tabla.obtenerPerfiles());

            ddlPerfil.DataSource = dtTemp;
            ddlPerfil.DataValueField = "tablaID";
            ddlPerfil.DataTextField = "perfilDescripcion";
            ddlPerfil.DataBind();

            dtTemp = new DataTable("TemporalDataTableB");
            dtTemp.Columns.Add("codigo", typeof(String));
            dtTemp.Columns.Add("descripcion", typeof(String));
            
            drTemp = dtTemp.NewRow();
            drTemp["codigo"] = 0;
            drTemp["descripcion"] = "Todos";
            dtTemp.Rows.Add(drTemp);

            drTemp = dtTemp.NewRow();
            drTemp["codigo"] = true;
            drTemp["descripcion"] = "Activo";
            dtTemp.Rows.Add(drTemp);

            drTemp = dtTemp.NewRow();
            drTemp["codigo"] = false;
            drTemp["descripcion"] = "Inactivo";
            dtTemp.Rows.Add(drTemp);

            ddlEstado.DataSource = dtTemp;
            ddlEstado.DataValueField = "codigo";
            ddlEstado.DataTextField = "descripcion";
            ddlEstado.DataBind();
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0", ex); //ASP.NET 2.0.50727.0
        }
    }

    protected void cmdBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            int num = Convert.ToInt32(ddlPerfil.SelectedValue);
            DataTable dtUsuario = new DataTable();
            dtUsuario = usuario.obtener(Convert.ToInt32(Session["paisID"]), txtNombre.Text, Convert.ToInt32(ddlPerfil.SelectedValue), ddlEstado.SelectedValue);

            if (dtUsuario != null)
            {
                if (dtUsuario.Rows.Count == 0)
                    divMensaje.InnerHtml = "<div id=\"info\">No hay resultados que coincidan con los criterios de búsqueda ingresados.</div>";
                else
                    divMensaje.InnerHtml = "";

                gvUsuarios.DataSource = dtUsuario;
                gvUsuarios.DataBind();
            }
            else
                divMensaje.InnerHtml = "<div id=\"error\">Ha ocurrido un error al cargar la lista de usuarios.</div>";
        }
        catch (Exception ex)
        {
            EventLogger ev = new EventLogger();
            ev.Save("ASP.NET 2.0.50727.0 [vistaUsuarios - método: cmdBuscar_Click]", ex);
        }

    }
    protected void cmdCrear_Click(object sender, EventArgs e)
    {
        Response.Redirect("mantenimientoUsuario.aspx");
    }
}
