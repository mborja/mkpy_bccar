<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="vistaReporteReingresos.aspx.cs" Inherits="Reportes_vistaReporteReingresos" Title="Reporte de reingresos" %>

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
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Reingresos</asp:HyperLink>
                        </td>
      </tr>
    </table>
    <div align="center">
        <div id="divMensaje" runat="server" style="width: 90%;">
        </div>
    <div id="formulario" style="width: 80%; display: block; text-align: center;" runat="server">
        <table class="style7" border="0">
            <tr>
                <td colspan="3">
            <asp:Label ID="Label1" runat="server" CssClass="labelTitulo"
                Text="Reporte de Reingresos"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 20%;">
                    &nbsp;</td>
                <td style="width: 10%;">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td align="left">
                            <asp:Label ID="lblRegion" runat="server" Text="Región:" CssClass="labelEs"></asp:Label> 
                        </td>
                <td align="left">
                    <asp:TextBox ID="txtRegionCodigo" onkeypress="return onlyNumbers();" runat="server" MaxLength="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td align="left">
                            <asp:Label ID="lblZona" runat="server" Text="Zona:" 
                                CssClass="labelEs"></asp:Label> 
                        </td>
                <td align="left">
                    <asp:TextBox ID="txtZonaCodigo" runat="server" onkeypress="return onlyNumbers();" MaxLength="6"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td align="left">
                        <asp:Label ID="lblEstado" runat="server" Text="Estado:" CssClass="labelEs"></asp:Label>                    
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
                <td >
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="cmdBuscar" runat="server" CssClass="ButtonEs" Text="Buscar" 
                        onclick="cmdBuscar_Click" Width="100px" />
                    <asp:Button ID="cmdExportarExcel" runat="server" CssClass="ButtonEs" 
                        Text="Exportar a Excel" Width="100px"  
                        onclick="cmdExportarExcel_Click" />
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <div id="resultado" style="width: 80%;" runat="server">
        <asp:GridView ID="gvReingreso" runat="server" AutoGenerateColumns="False"
            CellPadding="4" CssClass="labelEs" ForeColor="#333333" GridLines="None" 
            onrowcommand="gvReingreso_RowCommand" 
            onrowcreated="gvReingreso_RowCreated" PageSize="1000" >
            <RowStyle BackColor="#DBDADA" CssClass="rowstablas" />
            <Columns>
                <asp:BoundField DataField="regionCodigo" HeaderText="Región" />
                <asp:BoundField DataField="zonaCodigo" HeaderText="Zona" />
                <asp:BoundField DataField="estadoVerificadoString" HeaderText="Verificado" />
                <asp:ButtonField CommandName="VerDetalle" DataTextField="cantidad" 
                    HeaderText="Cantidad" />
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

