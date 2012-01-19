<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs
        HttpContext ctx = HttpContext.Current;
        Log.lanzarError(ctx);
        ctx.Response.Redirect("PaginaDeError.aspx");
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    void Application_AuthenticateRequest(object sender, EventArgs e){
        String[] roles = { "" };
        if (!(HttpContext.Current.User == null))
        {
           
            if (HttpContext.Current.User.Identity.AuthenticationType == "Forms")
            {
                FormsAuthenticationTicket tkt;
                tkt = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value);

                roles[0] = tkt.UserData;// Session["rolNombre"].ToString();
                        //usuario mal autenticado
                       
            }
            //En este momento asignamos el rol que le ha correspondido
            System.Web.Security.FormsIdentity id;
            id = (System.Web.Security.FormsIdentity)HttpContext.Current.User.Identity;
            HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(id, roles);

        }
   }

           
</script>
