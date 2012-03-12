<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="vistaReporteDetalleIncorporaciones.aspx.cs" Inherits="HistorialCrediticio_vistaIncorporaciones" Title="Detalle incorporaciones" %>

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
            $("#ctl00_ContentPlaceHolder1_txtFechaInscripcionIni").datepicker({
                showOn: "button",
                buttonImage: "../img/calendar.gif",
                buttonImageOnly: true
            });
            $("#ctl00_ContentPlaceHolder1_txtFechaInscripcionFin").datepicker({
                showOn: "button",
                buttonImage: "../img/calendar.gif",
                buttonImageOnly: true
            });
        });
    </script>
    <div align="center">
        <div id="divMensaje" runat="server" style="width: 90%;">
        </div>
    <div id="formulario" style="width: 90%; display: block; text-align: center;" runat="server">
        <table width="90%" align="center" border="0">
            <tr>
                <td colspan="6" >
                    <asp:Label ID="Label1" runat="server" 
                CssClass="labelTitulo"
                Text="Detalle Incorporaciones"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 10%; text-align: left;">
                            <asp:Label ID="lblRegion" runat="server" Text="Región GZ:" 
                                CssClass="labelEs"></asp:Label> 
                        </td>
                <td style="text-align: left">
                    <asp:Label ID="lblRegionCodigo" runat="server" 
                        style="font-family: Verdana; font-size: small; font-weight: 700"></asp:Label>
                </td>
                <td>
                            &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: left">
                            <asp:Label ID="lblZona" 
                                runat="server" Text="Zona GZ:" CssClass="labelEs"></asp:Label>  
                                </td>
                <td style="text-align: left">
                    <asp:Label ID="lblZonaCodigo" runat="server" 
                        style="font-size: small; font-weight: 700; font-family: Verdana"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                            <asp:Label ID="lblFechInscripcion" runat="server" Text="Fecha de incorporación desde:" 
                                CssClass="labelEs" MaxLength="10"></asp:Label> 
                        </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtFechaInscripcionIni"  Width="80px" 
                        MaxLength="10" runat="server"></asp:TextBox>
                </td>
                <td align="left">
                            &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
                <td style="text-align: left">
                            <asp:Label ID="lblCampInscripcion" 
                                runat="server" Text="Campaña de incorporación:" CssClass="labelEs"></asp:Label>  
                    </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtCampaniaInscripcion" onkeypress="return onlyNumbers();" runat="server"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td style="text-align: left">
                            <asp:Label ID="lblFechInscripcion0" runat="server" Text="Fecha de incorporación hasta:" 
                                CssClass="labelEs" MaxLength="10"></asp:Label> 
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtFechaInscripcionFin"  Width="80px" 
                        MaxLength="10" runat="server"></asp:TextBox>
                </td>
                <td>
                        &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: left">
                            <asp:Label ID="lblCodConsultora" runat="server" Text="Código de consultora:" 
                                CssClass="labelEs"></asp:Label> 
                                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtCodigoConsultora" onkeypress="return onlyNumbers();" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                        <asp:Label ID="lblModo" runat="server" CssClass="labelEs" Text="Modo:"></asp:Label>
                </td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlModoGrabacion" runat="server" Enabled="False">
                        <asp:ListItem Value="2">Todos</asp:ListItem>
                        <asp:ListItem Value="0">Real</asp:ListItem>
                        <asp:ListItem Value="1">Borrador</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left">
                    &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
                <td style="text-align: left">
                            <asp:Label ID="lblEstado" 
                                runat="server" Text="Estado:" CssClass="labelEs"></asp:Label>   
                        </td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlEstadoVerificado" runat="server" Enabled="False">
                        <asp:ListItem Value="2">Todos</asp:ListItem>
                        <asp:ListItem Value="1">Verificado</asp:ListItem>
                        <asp:ListItem Value="0">No Verificado</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                            <asp:Label ID="lblDocIdentidad" 
                                runat="server" Text="Documento de identidad:" CssClass="labelEs"></asp:Label> </td>
                <td style="text-align: left">
                    <asp:Label ID="lblPaisTipoDocumento" runat="server" 
                        style="font-family: Verdana; font-size: x-small; font-weight: 700"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtDocumentoIdentidad" onkeypress="return onlyNumbers();" 
                        runat="server" MaxLength="11"></asp:TextBox>
                    </td>
                <td align="left">
                    &nbsp;</td>
                <td style="text-align: left">
                            <asp:Label ID="lblApePaterno" runat="server" Text="Apellido paterno:" 
                                CssClass="labelEs"></asp:Label>   
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtApellidoPaterno" runat="server"></asp:TextBox>
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
                <td style="text-align: left">
                            <asp:Label ID="lblApeMaterno" runat="server" Text="Apellido materno:" 
                                CssClass="labelEs"></asp:Label>  
                    </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtApellidoMaterno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td style="text-align: left">
                            <asp:Label ID="lblNombres" runat="server" Text="Nombres:" CssClass="labelEs"></asp:Label>  
                </td>
            <td style="text-align: left">
                    <asp:TextBox ID="txtNombres" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <asp:Button ID="cmdBuscar" runat="server" Text="Buscar" 
                        onclick="cmdBuscar_Click" CssClass="ButtonEs" Width="100px" />
                    <asp:Button ID="cmdExportarExcel" runat="server" Text="Exportar a Excel" 
                        onclick="cmdExportarExcel_Click" CssClass="ButtonEs" Width="100px" />
                </td>
            </tr>
        </table>
    </div>
    <div id="resultado" style="width: 80%;" runat="server">
        <asp:GridView ID="gvIncorporaciones" runat="server" AutoGenerateColumns="False"
            CellPadding="4" CssClass="labelEs" ForeColor="#333333" GridLines="None" 
            onrowcommand="gvIncorporaciones_RowCommand" 
            onrowcreated="gvIncorporaciones_RowCreated" PageSize="1000">
            <RowStyle BackColor="#DBDADA" CssClass="rowstablas" />
            <Columns>
                <asp:BoundField DataField="incorporacionID" HeaderText="incorporacionID" />
                <asp:BoundField DataField="consultoraID" HeaderText="consultoraID" />
                <asp:BoundField DataField="fechaRegistro" HeaderText="Fecha de Incorporación" />
                <asp:BoundField DataField="campanhaInscripcion" 
                    HeaderText="Campaña de Incorporación" />
                <asp:BoundField DataField="numeroDocumento" HeaderText="Documento de identidad" />
                <asp:BoundField HeaderText="Código de consultora" DataField="consultoraCodigo" />
                <asp:BoundField DataField="apellidoPaterno" HeaderText="Apellido Paterno" />
                <asp:BoundField DataField="apellidoMaterno" HeaderText="Apellido Materno" />
                <asp:ButtonField CommandName="generatePDFView" HeaderText="Nombres" 
                    Text="Button" DataTextField="nombres" />
                <asp:CheckBoxField DataField="estadoVerificado" 
                    HeaderText="Estado Verificado" Visible=false />
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

