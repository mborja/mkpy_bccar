<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="lstUsuarios.aspx.cs" Inherits="lstusuarios" Title="Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
       <table>
      <tr> 
         <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:Label ID="Label10" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text="Mantenimientos - "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Búsqueda de 
                    Usuarios</asp:HyperLink>
                        </td>
      </tr>
    </table>
    <div align="center">
    
                    <asp:Label ID="Label1" runat="server" CssClass="labelTitulo" 
                Text="Búsqueda de Usuarios "></asp:Label>
                <br />
        <br />
    
        <div style="width: 239px">
            <div style="width: 259px; text-align: center;" align="center" dir="ltr">
            <table cellpadding="3" cellspacing="3">
	            <tr>
		            <td style="text-align: left; width: 64px;">
                        <asp:Label ID="lblCodUsu" runat="server" Text="Usuario:" 
                         CssClass="labelEs" ></asp:Label> </td>
		            <td style="text-align: left"><asp:TextBox ID="txtusuario" runat="server" 
                            CssClass="textEs" MaxLength="10"></asp:TextBox></td>
	            </tr>
	            <tr>
		            <td style="text-align: left; width: 64px;"><asp:Label ID="lblNomUsu" runat="server" Text="Nombre :" 
                         CssClass="labelEs" ></asp:Label> </td>
		            <td style="text-align: left"><asp:TextBox ID="txtnombre" runat="server" 
                            CssClass="textEs" MaxLength="25"></asp:TextBox></td>
	            </tr>
	            <tr>
		            <td style="text-align: left; width: 64px;"><asp:Label ID="lblPerUsu" runat="server" Text="Perfil :" 
                         CssClass="labelEs" ></asp:Label></td>
		            <td style="text-align: left">
                        <asp:DropDownList ID="ddlperfil" runat="server" CssClass="ComboEs">
                            <asp:ListItem Value="0">Todos</asp:ListItem>
                            <asp:ListItem Value="22">Administrador</asp:ListItem>
                            <asp:ListItem Value="27">Reporteador</asp:ListItem>
                            <asp:ListItem Value="28">Verificador</asp:ListItem>
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                            
                            
                            
                            SelectCommand="SELECT id, descripcion FROM Tabla WHERE (estado = '1') AND (idtipotabla = 7) AND (idpais = 1)">
                        </asp:SqlDataSource>
                                                </td>
	            </tr>
	            <tr>
		            <td style="text-align: left; width: 64px;">&nbsp;</td>
		            <td style="text-align: left">
                        <asp:DropDownList ID="ddlEstado" runat="server" 
                            CssClass="ComboEs" Visible="False">
                        <asp:ListItem Value="1">Todos</asp:ListItem>
                        <asp:ListItem Value="1">Activo</asp:ListItem>
                        <asp:ListItem Value="0">Inactivo</asp:ListItem>
                    </asp:DropDownList></td>
	            </tr>
	            </table>
            </div>
        </div>
        <br />
                        <asp:Button ID="Button2" runat="server" 
            Text="Crear" onclick="Button2_Click" CssClass="ButtonEs" />
                    &nbsp;&nbsp; <asp:Button    ID="Button1" runat="server" 
                            Text="Buscar" onclick="Button1_Click" CssClass="ButtonEs" />
                    <br />
    
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource4" CellPadding="4" 
            ForeColor="#333333" GridLines="None" style="text-align: center" 
                                    onrowcommand="GridView2_RowCommand" Width="750px" 
            AllowPaging="True" AllowSorting="True" Visible="False" CssClass="labelEs" 
            PageSize="25" OnRowCreated="OnRowCreated">
            <RowStyle BackColor="#dbdada" CssClass="rowstablas" />
            <Columns>
                <asp:BoundField DataField="Codigo" HeaderText="Código" 
                    SortExpression="Codigo" />
                <asp:ButtonField CommandName="Editar" DataTextField="Usuario" 
                    HeaderText="Usuario" Text="Usuario" SortExpression="Usuario" />
                <asp:BoundField DataField="Nombre y Apellidos" HeaderText="Nombre y Apellidos" 
                    SortExpression="Nombre y Apellidos" />
                <asp:BoundField DataField="Perfil" HeaderText="Perfil" 
                    SortExpression="Perfil" ReadOnly="True" />
            </Columns>
            <FooterStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#7f7f7f" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="#d2bedc" />
        </asp:GridView>
        
        <br />
        <div style="text-align: left">
            <asp:Label ID="lblMsj" runat="server" CssClass="lblMsjEs"></asp:Label> 
        </div>
    
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                        SelectCommand="SP_MANTENIMIENTO_LISTADO_USUARIOS" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtusuario" DefaultValue="%" Name="USUARIO" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtnombre" DefaultValue="%" Name="NOMBRE" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ddlperfil" DefaultValue="0" Name="PERFIL" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        
    </div>

</asp:Content>
