<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ex_mantenimientoPais.aspx.cs" Inherits="Mantenimientos_mantenimientoPais" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
    <div id="divMensaje" runat="server" style="width: 50%;">
    </div>
    <div id="formulario" style="width: 50%;">
        <table class="style7">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblTitle" runat="server" CssClass="labelTitulo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblPaisID" runat="server" CssClass="labelEs"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Nombre: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlNombre" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlNombre_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Nomenclatura: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNomenclatura" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Mayoría de edad: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEdad" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="divPolitica" runat="server">
                    </div>
                    <asp:GridView ID="gvDivPolitica" runat="server" Width="90%"
                        CellPadding="4" CssClass="labelEs" AutoGenerateColumns="False"
		                 ForeColor="#333333" GridLines="None">
		                 
		                 <Columns>
                            <asp:BoundField DataField="divisionID" HeaderText="Código" />
                            <asp:BoundField DataField="divisionNombre" HeaderText="División política" />
                             <asp:TemplateField HeaderText="Estado">
                                 <EditItemTemplate>
                                     <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("estado") %>' />
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("estado") %>' 
                                         Enabled="false" />
                                 </ItemTemplate>
                             </asp:TemplateField>
                            
                        </Columns>
                        
                        <RowStyle BackColor="#DBDADA" CssClass="rowstablas" />
                        <FooterStyle BackColor="#7F7F7F" />
                        <PagerStyle BackColor="#7F7F7F" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" />
                        <HeaderStyle BackColor="#7F7F7F" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="#D2BEDC" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Seguimiento BlackBerry: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlSeguimiento" runat="server">
                        <asp:ListItem>Activo</asp:ListItem>
                        <asp:ListItem>Inactivo</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Reingreso BlackBerry: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlReingreso" runat="server">
                        <asp:ListItem>Activo</asp:ListItem>
                        <asp:ListItem>Inactivo</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Adicional solicitud crédito: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlAdicional" runat="server">
                        <asp:ListItem>Activo</asp:ListItem>
                        <asp:ListItem>Inactivo</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="GPS BlackBerry: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlGPS" runat="server">
                        <asp:ListItem>Activo</asp:ListItem>
                        <asp:ListItem>Inactivo</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Verificación incorporaciones: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlVerificacion" runat="server">
                        <asp:ListItem>Activo</asp:ListItem>
                        <asp:ListItem>Inactivo</asp:ListItem>
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
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>

