<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mantenimientoPais.aspx.cs" Inherits="Mantenimientos_mantenimientoPais" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
    <div id="divMensaje" runat="server" style="width: 50%;">
    </div>
    <div id="formulario" style="width: 50%;" runat="server">
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
                        onselectedindexchanged="ddlNombre_SelectedIndexChanged" Visible="False">
                    </asp:DropDownList>
                    <asp:TextBox ID="txtNombre" runat="server" Visible="False" Enabled="False"></asp:TextBox><div id="divCountryFlag" runat="server"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Nomenclatura: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNomenclatura" runat="server"></asp:TextBox><br/>
                    <asp:RequiredFieldValidator ID="valitadorNomenclatura" runat="server" 
                        ControlToValidate="txtNomenclatura" 
                        ErrorMessage="No puede dejar este campo en blanco." Display="Dynamic" 
                        CssClass="validateLabel"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Mayoría de edad: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEdad" runat="server"></asp:TextBox><br/>
                    <asp:RangeValidator ID="rvEdad01" runat="server" ControlToValidate="txtEdad" 
                        ErrorMessage="Este campo debe ser numérico." Type="Integer" 
                        CssClass="validateLabel" Display="Dynamic" MaximumValue="120" MinimumValue="0"></asp:RangeValidator><br/>
                    <asp:RangeValidator ID="rvEdad02" runat="server" 
                        ErrorMessage="Este campo debe ser mayor de 10 y menor que 100." 
                        ControlToValidate="txtEdad" CssClass="validateLabel" Display="Dynamic" 
                        MaximumValue="99" MinimumValue="10" Type="Integer"></asp:RangeValidator><br />
                        <asp:RequiredFieldValidator ID="rfvEdad" runat="server" 
                        ControlToValidate="txtEdad" 
                        ErrorMessage="No puede dejar este campo en blanco." CssClass="validateLabel" 
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Caducidad (min) validación en BlackBerry: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCaducidad" runat="server"></asp:TextBox><br/>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtCaducidad" 
                        ErrorMessage="Este campo debe ser numérico." Type="Integer" 
                        CssClass="validateLabel" Display="Dynamic" MaximumValue="920" MinimumValue="0"></asp:RangeValidator><br/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtCaducidad" 
                        ErrorMessage="No puede dejar este campo en blanco." CssClass="validateLabel" 
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="divPolitica" runat="server">
                    </div>
                    <asp:GridView ID="gvDivPolitica" runat="server" Width="90%"
                        CellPadding="4" CssClass="labelEs" AutoGenerateColumns="False"
		                 ForeColor="#333333" GridLines="None" Visible="False">
		                 
		                 <Columns>
                            <asp:BoundField DataField="divisionID" HeaderText="Código" />
                            <asp:BoundField DataField="divisionNombre" HeaderText="División política" />
                             <asp:TemplateField HeaderText="Estado">
                                 <EditItemTemplate>
                                     <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("estado") %>' />
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("estado") %>' />
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
            <tr id="trEstado" runat="server">
                <td>
                    <asp:Label ID="lblEstado" runat="server" CssClass="labelEs" Text="Estado"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlEstado" runat="server">
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
                <td colspan="2" style="height: 23px">
                    <asp:Button ID="cmdCrear" runat="server" onclick="cmdCrear_Click" Text="Crear" 
                        Visible="False" />
                    <asp:Button ID="cmdEditar" runat="server" Text="Editar" Visible="False" 
                        onclick="cmdEditar_Click" />
                    <asp:HyperLink ID="hlkRegresar" runat="server" CssClass="linkEs" 
                        NavigateUrl="~/Mantenimientos/vistaPaises.aspx">Regresar</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>

