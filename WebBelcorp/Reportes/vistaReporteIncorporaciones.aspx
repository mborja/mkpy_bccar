<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="vistaReporteIncorporaciones.aspx.cs" Inherits="Reportes_vistaReporteIncorporaciones" Title="Reporte de incorporaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function onlyNumbers(evt) {
            var e = event || evt; // for trans-browser compatibility
            var charCode = e.which || e.keyCode;

            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;

        }
    </script>
   <table>
      <tr align="left"> 
         <td align=left>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:Label ID="Label10" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text="Reportes - "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Incorporaciones</asp:HyperLink>
                        </td>
      </tr>
    </table>
<div align="center">
        <div id="divMensaje" runat="server" style="width: 90%;">
        </div>
    <div id="formulario" style="width: 80%; display: block; text-align: center;" runat="server">
        <table class="style7">
            <tr>
                <td colspan="4">
            <asp:Label ID="Label1" runat="server" CssClass="labelTituloCentro"
                Text="Reporte de Incorporaciones"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left">
                        <asp:Label ID="Label2" runat="server" Text="Región GZ:" CssClass="labelEs" ></asp:Label>
                        </td>
                <td align="left">
                    <asp:TextBox ID="txtRegion" runat="server" onkeypress="return onlyNumbers();" MaxLength="2"></asp:TextBox>
                </td>
                <td align="left">
                        <asp:Label ID="lblZona" runat="server" Text="Zona GZ:" CssClass="labelEs"></asp:Label>
                    </td>
                <td align="left">
                    <asp:TextBox ID="txtZona" runat="server" onkeypress="return onlyNumbers();" MaxLength="6"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left">
                        <asp:Label ID="lblModo0" runat="server" Text="Modo de grabación:" CssClass="labelEs"></asp:Label>
                        </td>
                <td align="left">
                    <asp:DropDownList ID="ddlModoGrabacion" runat="server">
                        <asp:ListItem Value="2">Todos</asp:ListItem>
                        <asp:ListItem Value="0">Real</asp:ListItem>
                        <asp:ListItem Value="1">Borrador</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left">
                        <asp:Label ID="lblEstado" runat="server" Text="Estado :" CssClass="labelEs"></asp:Label>
                    </td>
                <td align="left">
                    <asp:DropDownList ID="ddlEstadoVerificado" runat="server">
                        <asp:ListItem Value="2">Todos</asp:ListItem>
                        <asp:ListItem Value="1">Verificado</asp:ListItem>
                        <asp:ListItem Value="0">No Verificado</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Button ID="cmdBuscar" runat="server" Text="Buscar" 
                        onclick="cmdBuscar_Click" CssClass="ButtonEs" Width="100px" />
                    <asp:Button ID="cmdExportarExcel" runat="server" Text="Exportar a Excel" 
                        onclick="cmdExportarExcel_Click" CssClass="ButtonEs" Width="100px" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <div id="resultado" style="width: 80%;" runat="server">
        <asp:GridView ID="gvIncorporaciones" runat="server" AutoGenerateColumns="False"
            CellPadding="4" CssClass="labelEs" ForeColor="#333333" GridLines="None" 
            onrowcommand="gvIncorporaciones_RowCommand" 
            onrowcreated="gvIncorporaciones_RowCreated" PageSize="1000" >
            <RowStyle BackColor="#DBDADA" CssClass="rowstablas" />
            <Columns>
                <asp:BoundField DataField="regionCodigo" HeaderText="Región GZ" />
                <asp:BoundField DataField="zonaCodigo" HeaderText="Zona GZ" />
                <asp:BoundField DataField="modoGrabacionString" HeaderText="Modo Grabación" />
                <asp:BoundField DataField="estadoVerificadoString" HeaderText="Verificado" />
                <asp:ButtonField CommandName="VerDetalle" DataTextField="cantidad" 
                    HeaderText="Cantidad" Text="Button" />
                <asp:BoundField DataField="modoGrabacion" HeaderText="modoGrabacion" />
                <asp:BoundField DataField="estadoVerificado" HeaderText="estadoVerificado" />
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

