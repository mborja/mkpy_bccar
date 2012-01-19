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


public partial class Movimientos_Reingreso : System.Web.UI.Page
{
    private bool tableCopied = false;
    private DataTable originalDataTable;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
            if (!tableCopied)
            {
                originalDataTable = ((DataRowView)e.Row.DataItem).Row.Table.Copy();
                ViewState["originalValuesDataTable"] = originalDataTable;
                tableCopied = true;
            }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        originalDataTable = (DataTable)ViewState["originalValuesDataTable"];

        foreach (GridViewRow r in GridView1.Rows)
           
            if (IsRowModified(r))
            {
                GridView1.UpdateRow(r.RowIndex, false);
            }

        // Rebind the Grid to repopulate the original values table.
        tableCopied = false;
        GridView1.DataBind();

    }


    protected bool IsRowModified(GridViewRow r)
    {
        int currentID;
        Boolean cbVerificado;

        currentID = Convert.ToInt32(GridView1.DataKeys[0].Value);

        cbVerificado = ((CheckBox)r.FindControl("CheckBox1")).Checked;
        DataRow row =
            originalDataTable.Select(String.Format("id = {0}", currentID))[0];

     if (!cbVerificado.Equals(row["Estado"].ToString()))
        {
            return true;
        }
        return false;
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }
 
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
