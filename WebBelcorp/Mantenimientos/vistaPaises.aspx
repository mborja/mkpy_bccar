<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="vistaPaises.aspx.cs" Inherits="Mantenimientos_vistaPaises" Title="Parámetros" %>

<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table>
      <tr align="left"> 
         <td align=left>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:Label ID="Label10" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text="Mantenimientos - "></asp:Label>
                    <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Parámetros</asp:HyperLink>
                        </td>
      </tr>
    </table>
<div align="center">
    <asp:Label ID="Label1" runat="server" CssClass="labelTitulo" 
        Text="Búsqueda de Paises"></asp:Label>
    <br />
    <br />
    <div id="busqueda" style="width: 50%;">
        <table class="style7">
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" CssClass="labelEs" Text="Nomenclatura: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNomenclatura" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" CssClass="labelEs" Text="Nombre: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" CssClass="labelEs" 
                        Text="Mayoría de Edad: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEdad" runat="server"></asp:TextBox>
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
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="ButtonEs" 
                        NavigateUrl="~/Mantenimientos/mantenimientoPais.aspx" Width="100px">Nuevo país</asp:HyperLink>
                    <asp:Button ID="cmdBuscar" runat="server" Text="Buscar" 
                        onclick="cmdBuscar_Click" CssClass="ButtonEs" Width="100px" />
		
                </td>
            </tr>
        </table>
    </div>
    <div id="listado" style="width: 80%;">
        <div id="divMensaje" runat="server" style="width: 90%;">
        </div>
        
        <asp:GridView ID="gvPais" runat="server" Width="90%" CellPadding="4" 
            CssClass="labelEs" AutoGenerateColumns="False" 
            ForeColor="#333333" GridLines="None" OnRowCreated="OnRowCreated" EnableSortingAndPagingCallbacks="True" 
            onrowcommand="RowCommand" 
            PageSize="90">
            <RowStyle BackColor="#DBDADA" CssClass="rowstablas" />
            <Columns>
                <asp:BoundField DataField="paisID" HeaderText="Código" />
                <asp:BoundField DataField="nomenclatura" HeaderText="Nomenclatura" />
                <asp:ButtonField CommandName="EditarPais" DataTextField="nombre" 
                    HeaderText="Nombre" Text="Button" />
                <asp:BoundField DataField="mayoriaEdad" HeaderText="Mayoría de Edad" />
            </Columns>
            
            <PagerSettings 
                Position="Bottom" 
                Mode="NextPreviousFirstLast" 
                FirstPageText="First" 
                LastPageText="Last" 
                NextPageText="Next" 
                PreviousPageText="Prev"
                 />
            
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

