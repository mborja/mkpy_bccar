<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Autenticar</title>
    <link rel="stylesheet" type="text/css" href="includes/css/estilos.css"/>
    <style type="text/css" media="screen" >
        
        .style1
        {
            width: 81%;
            height: 135px;
        }
        #imgpais
        {
            height: 38px;
            width: 54px;
        }
        .style2
        {
            font-size: 10px;
            font-family: Arial;
            color: #000000;
            text-align: right;
        }
        .style3
        {
            font-size: 10px;
            font-family: Arial;
            color: #000000;
            text-align: right;
            height: 1px;
        }
        .style4
        {
            font-size: 10px;
            font-family: Arial;
            color: #000000;
            text-align: right;
            width: 44px;
        }
        .style5
        {
            width: 300px;
        }
        .style6
        {
            width: 124px;
        }
        </style>
</head>
<body bgcolor="White">
    <form id="form1" class="style1" runat="server">
    
                                    <div align="center">
    
                                       
                                        <br />
                                        <br />
                                        <br />
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/logotipo_01.jpg" 
                                            CssClass="labelEs" />
                                        <br />
                                        <br />
                                       
                                        <asp:Login ID="Login1" runat="server"
                                        TitleText="Iniciar sesión"
                                        UserNameLabelText="Usuario"
                                        PasswordLabelText="Contraseña"
                                        LoginButtonText="Inicio de Sesión"
                                        TextBoxStyle-CssClass="textLogin"
                                        LoginButtonStyle-CssClass="buttonLogin"
                                
                         
                                        LabelStyle-CssClass="labelLogin" onauthenticate="Login1_Authenticate1" 
                                            BorderColor="White" BorderWidth="2px"
                                        >
<TextBoxStyle CssClass="textLogin"></TextBoxStyle>

<LoginButtonStyle CssClass="buttonLogin"></LoginButtonStyle>

                                            <LayoutTemplate>
                                                <table class="style1" border="0" cellpadding="1" cellspacing="0" 
                                                    style="border-collapse:collapse;">
                                                    <tr>
                                                        <td class="style5">
                                                            <table border="0" cellpadding="0">
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <asp:Label ID="PasswordLabel1" runat="server" AssociatedControlID="Password" 
                                                                            Font-Bold="True" CssClass="labelEs" Font-Size="Small" 
                                                                            Font-Names="Segoe UI">Iniciar Sesión</asp:Label>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="style4">
                                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                                                            Font-Names="Segoe UI" Font-Size="X-Small">Usuario </asp:Label>
                                                                    </td>
                                                                    <td class="style6">
                                                                        <asp:TextBox ID="UserName" runat="server" CssClass="textLogin" 
                                                                            Font-Names="Segoe UI" Width="100%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="style2" colspan="2">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="style4">
                                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                                                            Font-Names="Segoe UI" Font-Size="X-Small">Contraseña</asp:Label>
                                                                        <br />
                                                                    </td>
                                                                    <td class="style6">
                                                                        <asp:TextBox ID="Password" runat="server" CssClass="textLogin" 
                                                                            TextMode="Password" Font-Names="Segoe UI" Width="100%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="style3" colspan="2">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="style4">
                                                                        <asp:Label ID="PasswordLabel0" runat="server" AssociatedControlID="Password" 
                                                                            Font-Names="Segoe UI" Font-Size="X-Small">País</asp:Label>
                                                                    </td>
                                                                    <td class="style6">
                                                                        <asp:DropDownList ID="ddlPais" runat="server" CssClass="comboLogin" 
                                                                            DataSourceID="SqlDatos" DataTextField="nombre" DataValueField="id" 
                                                                            Font-Names="Segoe UI" Width="100%">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" colspan="2" style="color:Red;">
                                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" colspan="2">
                                                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" 
                                                                            CssClass="buttonLogin" Text="Inicio de Sesión" ValidationGroup="Login2" 
                                                                            Font-Names="Segoe UI" onclick="LoginButton_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style5">
                                                            <asp:SqlDataSource ID="SqlDatos" runat="server" 
                                                                ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                                                                SelectCommand="SELECT [id], [nombre] FROM [tb_pais] WHERE [estado] = 1 AND [id] <> 0 ORDER BY [nombre]"></asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>







<LabelStyle CssClass="labelLogin"></LabelStyle>







                                        </asp:Login> 
                                       
                                       
                                    </div>
    
  
    
    </form>
</body>
</html>
