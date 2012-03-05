<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="vistaReporteDetalleSeguimientos.aspx.cs" Inherits="HistorialCrediticio_vistaSeguimientos" Title="Detalle seguimientos" %>

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
    <div id="formulario" style="width: 80%; display: block; text-align: center;" runat="server">
        <table width="90%" align="center" border="0">
            <tr>
                <td colspan="6" style="height: 41px">
                    <asp:Label ID="Label1" runat="server" 
                CssClass="labelTitulo"
                Text="Detalle Seguimientos"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 10%">
                            <asp:Label ID="lblRegion" runat="server" Text="Regi�n GZ:" 
                                CssClass="labelEs"></asp:Label> 
                        </td>
                <td align="left">
                    <asp:Label ID="lblRegionCodigo" runat="server" 
                        style="font-family: Verdana; font-size: small; font-weight: 700"></asp:Label>
                </td>
                <td align="left">
                            &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
                <td align="left">
                            <asp:Label ID="lblZona" 
                                runat="server" Text="Zona GZ:" CssClass="labelEs"></asp:Label>  
                                </td>
                <td>
                    <asp:Label ID="lblZonaCodigo" runat="server" 
                        style="font-size: small; font-weight: 700; font-family: Verdana"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left">
                            <asp:Label ID="lblFechInscripcion" runat="server" Text="Fecha de Seguimiento desde : " 
                                CssClass="labelEs"></asp:Label> 
                        </td>
                <td align="left">
                    <asp:TextBox ID="txtFechaInscripcionIni" runat="server"  Width="80px" 
                        MaxLength="10"></asp:TextBox>
                </td>
                <td align="left">
                            &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
                <td align="left">
                            <asp:Label ID="lblCampInscripcion" 
                                runat="server" Text="Campa�a de incorporaci�n:" CssClass="labelEs"></asp:Label>  
                    </td>
                <td align="left">
                    <asp:TextBox ID="txtCampaniaInscripcion" onkeypress="return onlyNumbers();" runat="server"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td align="left">
                            <asp:Label ID="lblFechInscripcion0" runat="server" Text="Fecha de Seguimiento hasta : " 
                                CssClass="labelEs"></asp:Label> 
                </td>
                <td align="left">
                    <asp:TextBox ID="txtFechaInscripcionFin" runat="server"  Width="80px" 
                        MaxLength="10"></asp:TextBox>
                </td>
                <td align="left">
                            &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
                <td align="left">
                            <asp:Label ID="lblCodConsultora" runat="server" Text="C�digo de consultora:" 
                                CssClass="labelEs"></asp:Label> 
                                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtCodigoConsultora" onkeypress="return onlyNumbers();" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left">
                            <asp:Label ID="lblDocIdentidad" 
                                runat="server" Text="Documento de identidad:" onkeypress="return onlyNumbers();" CssClass="labelEs"></asp:Label> </td>
                <td align="left">
                    <asp:Label ID="lblPaisTipoDocumento" runat="server" 
                        style="font-family: Verdana; font-size: x-small; font-weight: 700"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtDocumentoIdentidad" onkeypress="return onlyNumbers();" runat="server"></asp:TextBox>
                                </td>
                <td align="left">
                    &nbsp;</td>
                <td align="left">
                            <asp:Label ID="lblApePaterno" runat="server" Text="Apellido paterno:" 
                                CssClass="labelEs"></asp:Label> 
                </td>
                <td align="left">
                    
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
                            &nbsp;
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
        <asp:GridView ID="gvSeguimientos" runat="server" AutoGenerateColumns="False"
            CellPadding="4" CssClass="labelEs" ForeColor="#333333" GridLines="None" 
            onrowcommand="gvSeguimientos_RowCommand" 
            onrowcreated="gvSeguimientos_RowCreated" PageSize="1000">
            <RowStyle BackColor="#DBDADA" CssClass="rowstablas" />
            <Columns>
                <asp:BoundField DataField="SeguimientoID" HeaderText="SeguimientoID" />
                <asp:BoundField DataField="consultoraID" HeaderText="consultoraID" />
                <asp:BoundField DataField="FechaIngreso" HeaderText="Fecha de Incorporaci�n" />
                <asp:BoundField DataField="Campanha" 
                    HeaderText="Campa�a de Incorporaci�n" />
                <asp:BoundField DataField="documentoNumero" HeaderText="Documento de identidad" />
                <asp:BoundField HeaderText="C�digo de consultora" DataField="consultoraCodigo" />
                <asp:BoundField DataField="apellidoPaterno" HeaderText="Apellido Paterno" />
                <asp:BoundField DataField="apellidoMaterno" HeaderText="Apellido Materno" />
                <asp:ButtonField CommandName="generatePDFView" HeaderText="Nombres" 
                    Text="Button" DataTextField="nombres" />
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

