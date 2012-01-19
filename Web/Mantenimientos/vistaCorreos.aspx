<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="vistaCorreos.aspx.cs" Inherits="Mantenimientos_vistaCorreo" Title="Correos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table>
      <tr align="left"> 
         <td align=left>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:Label ID="Label10" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text="Mantenimientos - "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Correos</asp:HyperLink>
                        </td>
      </tr>
    </table>
    <div align="center">
    <asp:Label ID="Label1" runat="server" CssClass="labelTitulo" 
        Text="Búsqueda de Correos"></asp:Label>
    <br />
    <br />
    <div id="busqueda" style="width: 50%;">
    <table class="style7">
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" CssClass="labelEs" Text="Nombre: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" CssClass="labelEs" Text="Email: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" CssClass="labelEs" 
                        Text="Operación: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlOperación" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="cmdBuscar" runat="server" Text="Buscar" 
                        onclick="cmdBuscar_Click" style="height: 26px" CssClass="ButtonEs" 
                        Height="16px" Width="73px" />
		
                    <asp:HyperLink ID="hlkNuevo" runat="server" CssClass="ButtonEs" 
                        NavigateUrl="~/Mantenimientos/mantenimientoCorreo.aspx" height="16px" 
                        width="73px">Nuevo correo</asp:HyperLink>
		
                </td>
            </tr>
        </table>
    </div>
    <div id="listado" style="width: 80%;">
        <div id="divMensaje" runat="server" style="width: 90%;">
        </div>
        
        <asp:GridView ID="gvCorreos" runat="server" Width="90%" CellPadding="4" 
            CssClass="labelEs" AutoGenerateColumns="False" AllowSorting="True" 
            ForeColor="#333333" GridLines="None" OnRowCreated="gvCorreos_RowCreated" 
            AllowPaging="True" EnableSortingAndPagingCallbacks="True" 
            onrowcommand="gvCorreos_RowCommand">
            <RowStyle BackColor="#DBDADA" CssClass="rowstablas" />
            <Columns>
                <asp:BoundField DataField="empleadoID" HeaderText="Código" />
                <asp:ButtonField DataTextField="nombres" HeaderText="Nombres" 
                    Text="Button" CommandName="EditarCorreo" 
                    SortExpression="nombres" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="operacionDescripcion" HeaderText="Operación" />
            </Columns>
            <FooterStyle BackColor="#7F7F7F" />
            <PagerStyle BackColor="#7F7F7F" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" />
            <HeaderStyle BackColor="#7F7F7F" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="#D2BEDC" />
        </asp:GridView>
    </div>
</div>
</asp:Content>

