<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="_MantenerUsuario.aspx.cs" Inherits="Mantenimientos_MantenerUsuario" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server">
        <EditItemTemplate>
            <table class="style7">
                <tr>
                    <td colspan="2">
                        Actualizar usuario</td>
                </tr>
                <tr>
                    <td>
                        Perfil</td>
                    <td>
                        <asp:DropDownList ID="ddlPerfil" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        País</td>
                    <td>
                        <asp:DropDownList ID="ddlPais" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nombres:</td>
                    <td>
                        <asp:TextBox ID="txtNombres" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Usuario:</td>
                    <td>
                        <asp:TextBox ID="txtUsuario" runat="server" Text='<%# Eval("codigo") %>'></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Pass</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Estado</td>
                    <td>
                        <asp:CheckBox ID="chkEstado" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </EditItemTemplate>
        <ItemTemplate>
            <table class="style7">
                <tr>
                    <td>
                        ID:</td>
                    <td>
                        <asp:Label ID="lblUsuarioID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Perfil:</td>
                    <td>
                        <asp:DropDownList ID="ddlPerfil" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        País:</td>
                    <td>
                        <asp:DropDownList ID="ddlPais" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Usuario</td>
                    <td>
                        <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nombres</td>
                    <td>
                        <asp:TextBox ID="txtNombres" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Estado</td>
                    <td>
                        <asp:CheckBox ID="chkEstado" runat="server" Text="Activo" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        Editar</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>

