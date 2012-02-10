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


public partial class mantGerenteZona : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString.Get("met") == "E") 
        {
            FormView2.DefaultMode = FormViewMode.Edit;
           Label lbl = (Label)FormView2.FindControl("lbl");
            if(Session["paisId"].ToString().Equals("3"))
            {
                lbl.Text= "SS";

            }
            else if (Session["paisId"].ToString().Equals("4"))
            {
                lbl.Text = "CI";

            }
            else
            {
                lbl.Text = "";
            }
        }


    }


    protected void FormView2_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        Response.Redirect("lstGZ.aspx?upd=1");
    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void UpdateButton_Click(object sender, EventArgs e)
    {

    }
}
