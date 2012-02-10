<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CargarDescargar.aspx.cs" Inherits="CargarDescargar" Title="Carga y Descarga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                    <script language="javascript">
function SelCarpeta() { 

alert("holaaaa");
//var objShell = new ActiveXObject("Shell.Application"); var objFolder = objShell.BrowseForFolder(0, "SELECCIONE LA RUTA DONDE DESEA GUARDAR EL ARCHIVO", 0, 18); if (objFolder != null) { var objFolderItem = objFolder.Items().Item(); var objPath = objFolderItem.Path; var foldername = objPath; document.Frm.text.value = foldername; return false; } } 
                      </script>

       <table>
      <tr> 
      <td>
      <input id="btnDefAceptar" type="button" value="Aceptar" onclick="SelCarpeta()"/>
      </td>
         <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:Label ID="Label10" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text="Mantenimientos - "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Cargas y 
                    Descargas</asp:HyperLink>
                        </td>
      </tr>
    </table>

    <table class="style1" align="center" style="width: 99%">
    <tr>
        <td align="center" colspan="2" style="height: 40px">
            <asp:Label ID="Label4" runat="server" 
            CssClass="l labelTituloCentro" 
                Text="Cargas y Descargas"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            &nbsp;</td>
        <td>
                                &nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <br />
            <table style="width: 132%; height: 181px">
                <tr>
                    <td style="text-align: left; height: 32px; " colspan="4">
                        <asp:Label ID="lblDescargas0" runat="server" CssClass="labelSubTitulo" Text="Cargas"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                                &nbsp;</td>
                    <td style="width: 243px; text-align: left">

                       </td>
                    <td style="text-align: left">
                                &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                                <asp:Label ID="Label5" runat="server" Text="Consultoras" CssClass="labelEs"></asp:Label>
                            </td>
                    <td style="width: 243px; text-align: left">
                        <asp:FileUpload ID="fuConsultora"  runat="server" Width="255px" CssClass="ButtonEsCarga" />
                                </td>
                    <td style="text-align: left">
                                <asp:RegularExpressionValidator 
id="FileUpLoadValidator" runat="server" 
ErrorMessage="la extension del archivo debe ser .txt" 
ValidationExpression="^.*\.(txt|TXT)$" 
ControlToValidate="fuConsultora" SetFocusOnError="True" CssClass="lblMsjCargaError" ></asp:RegularExpressionValidator>
                                </td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                                <asp:Label ID="Label6" runat="server" Text="Gerente de Zonas" CssClass="labelEs"></asp:Label>
                            </td>
                    <td style="width: 243px; text-align: left">
                                <asp:FileUpload ID="fuGerentZona" runat="server"  Width="255px" CssClass="ButtonEsCarga" />
                                </td>
                    <td style="text-align: left">
                                <asp:RegularExpressionValidator 
id="FileUpLoadValidator0" runat="server" 
ErrorMessage="la extension del archivo debe ser .txt" 
ValidationExpression="^.*\.(txt|TXT)$" 
ControlToValidate="fuGerentZona" CssClass="lblMsjCargaError"></asp:RegularExpressionValidator>
                                </td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                                <asp:Label ID="Label7" runat="server" Text="Campaña" CssClass="labelEs"></asp:Label>
                            </td>
                    <td style="width: 243px; text-align: left">
                        <asp:FileUpload ID="fuCampaña" runat="server"  Width="255px" CssClass="ButtonEsCarga" />
                                </td>
                    <td style="text-align: left">
                                <asp:RegularExpressionValidator 
id="FileUpLoadValidator1" runat="server" 
ErrorMessage="la extension del archivo debe ser .txt" 
ValidationExpression="^.*\.(txt|TXT)$" 
ControlToValidate="fuCampaña" CssClass="lblMsjCargaError"></asp:RegularExpressionValidator>
                                </td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                                <asp:Label ID="Label8" runat="server" CssClass="labelEs" 
                                    Text="Cronograma de Facturacion"></asp:Label>
                            </td>
                    <td style="width: 243px; text-align: left">
                        <asp:FileUpload ID="fuCronogFacturacion" runat="server" CssClass="ButtonEs" 
                            Width="255px" />
                                </td>
                    <td style="text-align: left">
                                <asp:RegularExpressionValidator ID="FileUpLoadValidator2" runat="server" 
                                    ControlToValidate="fuCronogFacturacion" CssClass="lblMsjCargaError" 
                                    ErrorMessage="la extension del archivo debe ser .txt" 
                                    ValidationExpression="^.*\.(txt|TXT)$"></asp:RegularExpressionValidator>
                                </td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>

                    <td style="width: 243px; text-align: left">
                        <asp:TreeView ID="TreeView1" runat="server" 
                            onselectednodechanged="TreeView1_SelectedNodeChanged">
                        </asp:TreeView>
                    </td>
                    <td style="text-align: left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                                <asp:Button id="UploadBtn" Text="Cargar Archivos" OnClick="UploadBtn_Click" runat="server" CssClass="ButtonEsCarga"/>
                                </td>
                    <td style="width: 243px; text-align: left">
                        &nbsp;</td>
                    <td style="text-align: left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                                &nbsp;</td>
                    <td colspan="2" style="text-align: left">
                        <asp:Label ID="lblCCon" runat="server" CssClass="lblMsjCargaError"></asp:Label>
                        <br />
                        <asp:Label ID="lblCGZ" runat="server" CssClass="lblMsjCargaError"></asp:Label>
                        <br />
                        <asp:Label ID="lblCCamp" runat="server" CssClass="lblMsjCargaError"></asp:Label>
                        <br />
                        <asp:Label ID="lblCCronogFact" runat="server" CssClass="lblMsjCargaError"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table align="center" style="width: 100%; height: 49px;">
                <tr>
                    <td style="text-align: left; " colspan="4">
                        <asp:Label ID="lblDescargas" runat="server" CssClass="labelSubTitulo" Text="Descargas"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 111px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 125px">
                        <asp:Label ID="lblSolCredito" runat="server" Text="Solicitud de credito" CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="text-align: left; width: 92px">
                            <asp:Button ID="btnSolCredito" runat="server" Text="Descargar" 
                            onclick="btnSolCredito_Click" CssClass="ButtonEs"/>
                        </td>
                    <td style="text-align: left; width: 286px">
                        <asp:Label ID="lblResultadoSolCredit" runat="server" CssClass="labelEs"></asp:Label>
                    </td>
                </tr>
                </table>
            <br />
        </td>
        <td>
                                &nbsp;</td>
    </tr>
    <tr>
        <td align="center">
            <br />
        </td>
        <td>
                                &nbsp;</td>
    </tr>
</table>
</asp:Content>
