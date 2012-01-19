<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mantenimientoCorreo.aspx.cs" Inherits="Mantenimientos_mantenimientoCorreo" Title="Untitled Page" %>

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
                    <asp:Label ID="lblCorreoID" runat="server" CssClass="labelEs"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Operación: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlOperacion" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Email: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox> <br />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ErrorMessage="No puede dejar este campo en blanco." 
                        ControlToValidate="txtEmail" CssClass="validateLabel" Display="Dynamic"></asp:RequiredFieldValidator> <br />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" CssClass="validateLabel" Display="Dynamic" 
                        ErrorMessage="Debe ingresar una dirección de correo válida." 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Nombres: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNombres" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvNombres" runat="server" 
                        ErrorMessage="No puede dejar este campo en blanco." 
                        ControlToValidate="txtNombres" CssClass="validateLabel" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Apellido Paterno: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtApePaterno" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvApePaterno" runat="server" 
                        ErrorMessage="No puede dejar este campo en blanco." 
                        ControlToValidate="txtApePaterno" CssClass="validateLabel" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Apellido Materno: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtApeMaterno" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvApeMaterno" runat="server" 
                        ErrorMessage="No puede dejar este campo en blanco." 
                        ControlToValidate="txtApeMaterno" CssClass="validateLabel" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Documento de identidad: " CssClass="labelEs"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNroDoc" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvNroDoc" runat="server" 
                        ErrorMessage="No puede dejar este campo en blanco." 
                        ControlToValidate="txtNroDoc" CssClass="validateLabel" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 23px">
                    <asp:Label ID="Label8" runat="server" Text="Estado: " CssClass="labelEs"></asp:Label>
                </td>
                <td style="height: 23px">
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
                <td colspan="2">
                    <asp:Button ID="cmdCrear" runat="server" Text="Crear" Visible="False" 
                        onclick="cmdCrear_Click" />
                    <asp:Button ID="cmdEditar" runat="server" Text="Editar" Visible="False" 
                        onclick="cmdEditar_Click" />
                    <asp:HyperLink ID="hlkRegresar" runat="server" CssClass="linkEs" 
                        NavigateUrl="~/Mantenimientos/vistaCorreos.aspx">Regresar</asp:HyperLink>
                </td>
            </tr>
        </table>
        
    </div>
</div>
</asp:Content>

