<%@ Page Language="C#" EnableViewState="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="vistaIncorporaciones.aspx.cs" Inherits="HistorialCrediticio_vistaIncorporaciones" Title="Incorporaciones" %>

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
            $("#ctl00_ContentPlaceHolder1_txtFechaIniInscripcion").datepicker({
                showOn: "button",
                buttonImage: "../img/calendar.gif",
                buttonImageOnly: true
            });
            $("#ctl00_ContentPlaceHolder1_txtFechaFinInscripcion").datepicker({
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
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Incorporación</asp:HyperLink>
                        </td>
      </tr>
    </table>
    <div align="center">
        <div id="divMensaje" runat="server" style="width: 90%;">
        </div>
    <div id="formulario" style="width: 100%; display: block; text-align: center;" runat="server">
        <table width="100%" align="center" border="0">
            <tr>
                <td colspan="6" style="height: 41px">
                    <asp:Label ID="Label1" runat="server" 
                CssClass="labelTitulo"
                Text="Búsqueda Incorporaciones"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 217px; text-align: left;">
                            <asp:Label ID="lblRegion" runat="server" Text="Región GZ:" 
                                CssClass="labelEs"></asp:Label> 
                        </td>
                <td colspan="2" style="text-align: left">
                    <asp:TextBox ID="txtRegion" runat="server" onkeypress="return onlyNumbers();" MaxLength="2"></asp:TextBox>
                </td>
                    <td style="text-align: left">
                            <asp:Label ID="lblZona" 
                                runat="server" Text="Zona GZ:" CssClass="labelEs"></asp:Label>  
                                </td>
                <td colspan="2" style="text-align: left">
                    <asp:TextBox ID="txtZona" runat="server" onkeypress="return onlyNumbers();" MaxLength="6"></asp:TextBox>
                                </td>
            </tr>
            <tr>
                <td style="width: 217px; text-align: left;">
                            <asp:Label ID="lblFechIniInscripcion" runat="server" Text="Fecha de incorporación desde:" 
                                CssClass="labelEs"></asp:Label> 
                        </td>
                <td colspan="2" style="width: auto; text-align: left;">
                    <asp:TextBox ID="txtFechaIniInscripcion" runat="server" Width="80px" 
                        MaxLength="10" EnableViewState="true"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            <asp:Label ID="lblCampInscripcion" 
                                runat="server" Text="Campaña de incorporación:" CssClass="labelEs"></asp:Label>  
                    </td>
                <td colspan="2" style="text-align: left">
                    <asp:TextBox ID="txtCampaniaInscripcion" runat="server" onkeypress="return onlyNumbers();" MaxLength="6"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td style="width: 217px; text-align: left;">
                            <asp:Label ID="lblFechFinInscripcion" runat="server" Text="Fecha  de incorporación hasta:" 
                                CssClass="labelEs"></asp:Label> 
                </td>
                <td colspan="2" style="text-align: left">
                    <asp:TextBox ID="txtFechaFinInscripcion" runat="server" Width="80px" 
                        MaxLength="10" EnableViewState="true"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            <asp:Label ID="lblCodConsultora" runat="server" Text="Código de consultora:" 
                                CssClass="labelEs"></asp:Label> 
                                </td>
                <td colspan="2" style="text-align: left">
                    <asp:TextBox ID="txtCodigoConsultora" runat="server" onkeypress="return onlyNumbers();" MaxLength="15"></asp:TextBox>
                                </td>
            </tr>
            <tr>
                <td style="width: 217px; text-align: left;">
                            <asp:Label ID="lblDocIdentidad" 
                                runat="server" Text="Documento de identidad:" CssClass="labelEs"></asp:Label> </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtDocumentoIdentidad" runat="server" 
                        onkeypress="return onlyNumbers();" MaxLength="11"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            &nbsp;</td>
                <td style="text-align: left">
                            <asp:Label ID="lblEstado" 
                                runat="server" Text="Estado:" CssClass="labelEs"></asp:Label> 
                </td>
                <td style="text-align: left">
                            &nbsp;</td>
                <td style="text-align: left">
                    <asp:DropDownList ID="ddlEstadoActivo" runat="server">
                        <asp:ListItem Value="2">Todos</asp:ListItem>
                        <asp:ListItem Value="1">Verificado</asp:ListItem>
                        <asp:ListItem Value="0">No Verificado</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 217px; text-align: left;">
                            <asp:Label ID="lblApePaterno" runat="server" Text="Apellido paterno:" 
                                CssClass="labelEs"></asp:Label> </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtApellidoPaterno" runat="server" MaxLength="30"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            <asp:Label ID="lblApeMaterno" runat="server" Text="Apellido materno:" 
                                CssClass="labelEs"></asp:Label>  
                                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtApellidoMaterno" runat="server" MaxLength="30"></asp:TextBox>
                </td>
                <td style="text-align: left">
                            <asp:Label ID="lblNombres" runat="server" Text="Nombres:" CssClass="labelEs"></asp:Label>  
                </td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtNombres" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 217px">
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
        <asp:GridView ID="gvIncorporaciones" runat="server" AutoGenerateColumns="False"
            CellPadding="4" CssClass="labelEs" ForeColor="#333333" GridLines="None" 
            onrowcommand="gvIncorporaciones_RowCommand" 
            onrowcreated="gvIncorporaciones_RowCreated" PageSize="1000" ShowFooter="True" 
                        onrowdatabound="gvIncorporaciones_RowDataBound">
            <RowStyle BackColor="#DBDADA" CssClass="rowstablas" />
            <Columns>
                <asp:BoundField DataField="incorporacionID" HeaderText="incorporacionID" />
                <asp:BoundField DataField="consultoraID" HeaderText="consultoraID" />
                <asp:BoundField DataField="regionCodigo" 
                    HeaderText="Región GZ" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="zonaCodigo" HeaderText="Zona GZ" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="fechaRegistro" HeaderText="Fecha de Incorporación" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="campanhaInscripcion" 
                    HeaderText="Campaña de Incorporación" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="numeroDocumento" HeaderText="Documento de identidad" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="consultoraCodigo" 
                    HeaderText="Código de Consultora" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="apellidoPaterno" HeaderText="Apellido Paterno" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="apellidoMaterno" HeaderText="Apellido Materno" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:ButtonField CommandName="generatePDFView" HeaderText="Nombres" 
                    DataTextField="nombres" Text="Botton" >
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:ButtonField>
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
                </td>
            </tr>
        </table>
    </div>
    <div id="resultado" style="width: 80%;" runat="server">
    </div>
</div>
</asp:Content>

