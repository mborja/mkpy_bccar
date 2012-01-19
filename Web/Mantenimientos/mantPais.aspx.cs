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


public partial class mantPais : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Get("met") == "I")
            FormView2.DefaultMode = FormViewMode.Insert;
        if (Request.QueryString.Get("met") == "E")
            FormView2.DefaultMode = FormViewMode.Edit;

    }



    protected void FormView2_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {

        Response.Redirect("lstPaises.aspx?upd=1");
    }

    protected void FormView2_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        Response.Redirect("lstPaises.aspx?ins=1");
    }

}

