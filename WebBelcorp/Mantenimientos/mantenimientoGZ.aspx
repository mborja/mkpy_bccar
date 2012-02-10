<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mantenimientoGZ.aspx.cs" Inherits="Mantenimientos_mantenimientoGZ" Title="Untitled Page" %>

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
                    <asp:Label ID="lblGerenteID" runat="server" CssClass="labelEs"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPais" runat="server" CssClass="labelEs" Text="País: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPais" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRegion" runat="server" CssClass="labelEs" Text="Región: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRegion" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblZona" runat="server" CssClass="labelEs" Text="Zona: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtZona" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPIN" runat="server" CssClass="labelEs" Text="PIN: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPIN" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblIMSI" runat="server" CssClass="labelEs" Text="IMSI: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtIMSI" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblConsultoraID" runat="server" CssClass="labelEs" 
                        Text="Código consultora: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCodConsu" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblNombres" runat="server" CssClass="labelEs" Text="Nombres: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNombres" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblApellidoPaterno" runat="server" CssClass="labelEs" 
                        Text="Apellido paterno: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtApePaterno" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblApellidoMaterno" runat="server" CssClass="labelEs" 
                        Text="Apellido materno: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtApeMaterno" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDocumentoIdentidad" runat="server" CssClass="labelEs" 
                        Text="Documento de identidad: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNroDoc" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTelefono" runat="server" CssClass="labelEs" Text="Teléfono: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTelefono" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" CssClass="labelEs" Text="Email: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEstado" runat="server" CssClass="labelEs" Text="Estado: "></asp:Label>
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
                <td colspan="2">
                    <asp:Button ID="cmdEditar" runat="server" Text="Grabar" Visible="False" 
                        onclick="cmdEditar_Click" />
                    <asp:HyperLink ID="hlkRegresar" runat="server" 
                        NavigateUrl="~/Mantenimientos/vistaGZ.aspx" CssClass="linkEs">Regresar</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>

