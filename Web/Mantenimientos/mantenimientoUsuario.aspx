<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mantenimientoUsuario.aspx.cs" Inherits="Mantenimientos_mantenerUsuario" Title="Untitled Page" %>

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
                    <asp:Label ID="lblUsuarioID" runat="server" CssClass="labelEs"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 23px">
                    <asp:Label ID="lblPais" runat="server" CssClass="labelEs" Text="País: "></asp:Label>
                </td>
                <td style="height: 23px">
                    <asp:TextBox ID="txtPais" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUsuario" runat="server" CssClass="labelEs" Text="Usuario: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUsuario" runat="server" MaxLength="10"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" 
                        ErrorMessage="No puede dejar este campo en blanco." 
                        ControlToValidate="txtUsuario" CssClass="validateLabel" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblClave" runat="server" CssClass="labelEs" Text="Contraseña: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtClave" runat="server" TextMode="Password" MaxLength="10"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvClave" runat="server" 
                        ErrorMessage="No puede dejar este campo en blanco." 
                        ControlToValidate="txtClave" CssClass="validateLabel" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblClaveConfirmar" runat="server" CssClass="labelEs" 
                        Text="Confirmar contraseña: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtClaveConfirmar" runat="server" TextMode="Password" 
                        MaxLength="10"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvClaveConfirmar" runat="server" 
                        ErrorMessage="No puede dejar este campo en blanco." 
                        ControlToValidate="txtClaveConfirmar" CssClass="validateLabel" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblNombres" runat="server" CssClass="labelEs" Text="Nombres: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNombres" runat="server" MaxLength="90"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvNombres" runat="server" 
                        ErrorMessage="No puede dejar este campo en blanco." 
                        ControlToValidate="txtNombres" CssClass="validateLabel" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPerfil" runat="server" CssClass="labelEs" Text="Perfil: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlPerfil" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEstado" runat="server" CssClass="labelEs" Text="Estado: "></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="chkEstado" runat="server" CssClass="labelEs" Text="Activo" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="cmdRegistrar" runat="server" Text="Registrar" 
                        onclick="cmdRegistrar_Click" Visible="False" />
                    <asp:Button ID="cmdActualizar" runat="server" Text="Actualizar" 
                        onclick="cmdActualizar_Click" Visible="False" />
                    <asp:HyperLink ID="hlkRegresar" runat="server" CssClass="linkEs" 
                        NavigateUrl="~/Mantenimientos/vistaUsuarios.aspx">Regresar</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    </td>
                <td>
                    </td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>

