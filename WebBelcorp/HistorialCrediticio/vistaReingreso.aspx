<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="vistaReingreso.aspx.cs" Inherits="HistorialCrediticio_vistaReingreso" Title="Reingresos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="../includes/themes/base/jquery.ui.all.css" >
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.js" type="text/javascript"></script> 
	<script src="../includes/js/ui/jquery.ui.core.js" type="text/javascript"></script> 
	<script src="../includes/js/ui/jquery.ui.widget.js" type="text/javascript"></script> 
	<script src="../includes/js/ui/jquery.ui.datepicker.js" type="text/javascript"></script>
	<script src="../includes/js/ui/i18n/jquery.ui.datepicker-es.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../includes/css/demos.css"> 
    <script type="text/javascript">
        function onlyNumbers(evt) {
            var e = event || evt; // for trans-browser compatibility
            var charCode = e.which || e.keyCode;

            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;

        }
        $(function() {
            $.datepicker.setDefaults($.datepicker.regional["es"]);
            $("#ctl00_ContentPlaceHolder1_txtFechaReingresoIni").datepicker({
                showOn: "button",
                buttonImage: "../img/calendar.gif",
                buttonImageOnly: true
            });
            $("#ctl00_ContentPlaceHolder1_txtFechaReingresoFin").datepicker({
                showOn: "button",
                buttonImage: "../img/calendar.gif",
                buttonImageOnly: true
            });
        });
    </script>

           <table>
      <tr align="left"> 
         <td align=left>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:Label ID="Label10" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text="Historial crediticio - "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Reingresos</asp:HyperLink>
                        </td>
      </tr>
    </table>

<div align="center">
        <div id="divMensaje" runat="server" style="width: 90%;">
        </div>
    <div id="formulario" style="width: 100%; display: block; text-align: center;" runat="server">
        <table class="style7">
            <tr>
                <td colspan="6">
                    <asp:Label ID="Label1" runat="server" 
                CssClass="labelTitulo"
                Text="Búsqueda Reingreso"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                            <asp:Label ID="lblRegion" 
                                runat="server" Text="Región GZ :" CssClass="labelEs"></asp:Label>  
                        </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtRegion" onkeypress="return onlyNumbers();" runat="server" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            <asp:Label ID="lblZona" runat="server" Text="Zona GZ:" CssClass="labelEs"></asp:Label> 
                                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtZona" runat="server" onkeypress="return onlyNumbers();" 
                        MaxLength="6"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    &nbsp;</td>
                <td style="text-align: left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left">
                            <asp:Label ID="lblFechReingreso" runat="server" CssClass="labelEs" 
                                Text="Fecha Reingreso Desde:"></asp:Label>
                        </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtFechaReingresoIni" runat="server" Width="80px" 
                        EnableViewState="true"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            <asp:Label ID="lblCampInscripcion" 
                                runat="server" Text="Campaña de Inscripción :" CssClass="labelEs"></asp:Label>  
                                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtCampanhaInscripcion" onkeypress="return onlyNumbers();" runat="server"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            <asp:Label ID="lblCampPriCompra" runat="server" Text="Campaña 1era compra :" 
                                CssClass="labelEs"></asp:Label> 
                                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtCampanhaFacturacion" onkeypress="return onlyNumbers();" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                            <asp:Label ID="lblFechReingreso0" runat="server" CssClass="labelEs" 
                                Text="Fecha Reingreso Hasta:"></asp:Label>
                </td>
                <td style="text-align: left">
                    <!--<asp:Label ID="lblPaisDocumentoTipo" runat="server" CssClass="labelEs" 
                        Font-Bold="True"></asp:Label>//-->
                    <asp:TextBox ID="txtFechaReingresoFin" runat="server" Width="80px" 
                        EnableViewState="true"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            &nbsp;</td>
                <td style="text-align: left">
                    &nbsp;</td>
                <td style="text-align: left">
                            <asp:Label ID="lblEstado" 
                                runat="server" Text="Estado :" CssClass="labelEs"></asp:Label> 
                </td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlEstadoVerificado" runat="server">
                        <asp:ListItem Value="2">Todos</asp:ListItem>
                        <asp:ListItem Value="1">Verificado</asp:ListItem>
                        <asp:ListItem Value="0">No Verificado</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                            <asp:Label ID="lblDocIdentidad" 
                                runat="server" Text="Documento de identidad:" CssClass="labelEs"></asp:Label> 
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtDocumentoIdentidad" runat="server" onkeypress="return onlyNumbers();"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            <asp:Label ID="lblCodConsultora" runat="server" Text="Código de Consultora:" 
                                CssClass="labelEs"></asp:Label> 
                                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtConsultoraCodigo" onkeypress="return onlyNumbers();" runat="server"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            &nbsp;</td>
                <td style="text-align: left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left">
                            <asp:Label ID="lblApePaterno" runat="server" Text="Apellido Paterno :" 
                                CssClass="labelEs"></asp:Label> 
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtApellidoPaterno" runat="server"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            <asp:Label ID="lblApeMaterno" runat="server" Text="Apellido Materno :" 
                                CssClass="labelEs"></asp:Label>  
                                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtApellidoMaterno" runat="server"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            <asp:Label ID="lblNombres" runat="server" Text="Nombres :" CssClass="labelEs"></asp:Label>  
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtNombres" runat="server"></asp:TextBox>
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
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="6">
                    <asp:Button ID="cmdBuscar" runat="server" Text="Buscar" 
                        onclick="cmdBuscar_Click" CssClass="ButtonEs" Width="100px" />
                    <asp:Button ID="cmdGuardar" runat="server" Text="Guardar" 
                        onclick="cmdGuardar_Click" CssClass="ButtonEs" Width="100px" />
                </td>
            </tr>
        </table>
    </div>
    <div id="resultado" style="width: 100%;" runat="server">
        <asp:GridView ID="gvReingreso" runat="server" runat="server" AutoGenerateColumns="False"
            CellPadding="4" CssClass="labelEs" ForeColor="#333333" GridLines="None" 
            onrowcreated="gvReingreso_RowCreated" 
            onpageindexchanging="gvReingreso_PageIndexChanging" 
            onrowcommand="gvReingreso_RowCommand" PageSize="1000">
            <RowStyle BackColor="#DBDADA" CssClass="rowstablas" />
            
            <Columns>
                <asp:BoundField DataField="reingresoID" HeaderText="reingresoID" />
                <asp:BoundField DataField="regionCodigo" HeaderText="Región Consultora" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="zonaCodigo" HeaderText="Zona Consultora" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Fecha" HeaderText="Fecha Solicitud de Reingreso" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="campanhaInscripcion" 
                    HeaderText="Campaña de Inscripción" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="campanhaPrimeraCompra" 
                    HeaderText="Campaña 1era Compra" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="documentoNumero" HeaderText="Documento de identidad" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="consultoraCodigo" HeaderText="Codigo de consultora" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="apellidoPaterno" HeaderText="Apellido Paterno" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="apellidoMaterno" HeaderText="Apellido Materno" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:ButtonField CommandName="generatePDFView" DataTextField="nombres" 
                    HeaderText="Nombres" ShowHeader="True" Text="nombres" />
                <asp:TemplateField HeaderText="Verificado">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" 
                            Checked='<%# Bind("estadoVerificado") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" 
                            Checked='<%# Bind("estadoVerificado") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VerificadoOculto">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" 
                            Checked='<%# Bind("estadoVerificado") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" 
                            Checked='<%# Bind("estadoVerificado") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
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

