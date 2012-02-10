<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="vistaCargaDescarga.aspx.cs" Inherits="Movimientos_vistaCargaDescarga" Title="Carga y descarga" %>

<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table>
      <tr align="left"> 
         <td align=left>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:Label ID="Label10" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text="Mantenimientos - "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Carga y descarga</asp:HyperLink>
                        </td>
      </tr>
    </table>
    <div align="center">
    <div id="divMensaje" runat="server" style="width: 50%;">
    </div>
        <div id="formulario" 
            style="width: 52%; display: block; text-align: center; margin-left: 33px;" 
            runat="server" align="left">
            
            <table class="style7" >
                <tr>
                    <td align=center colspan="2">
                        <asp:Label ID="Label11" runat="server" CssClass="labelTitulo" Text="Cargas"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                                <asp:Label ID="Label5" runat="server" Text="Consultoras" CssClass="labelEs"></asp:Label>
                            </td>
                    <td align="left">
                        <asp:FileUpload ID="fileUploadConsultora" runat="server" 
                            CssClass="ButtonEsCarga" Width="103px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                                <asp:Label ID="Label6" runat="server" Text="Gerente de Zonas" CssClass="labelEs"></asp:Label>
                            </td>
                    <td align="left">
                        <asp:FileUpload ID="fileUploadGerenteZona" runat="server" 
                            CssClass="ButtonEsCarga" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                                <asp:Label ID="Label7" runat="server" Text="Campaña" CssClass="labelEs"></asp:Label>
                            </td>
                    <td align="left">
                        <asp:FileUpload ID="fileUploadCampania" runat="server" 
                            CssClass="ButtonEsCarga" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left">
                                <asp:Label ID="Label8" runat="server" CssClass="labelEs" 
                                    Text="Cronograma de Facturación"></asp:Label>
                            </td>
                    <td align="left">
                        <asp:FileUpload ID="fileUploadCronogramaFacturacion" runat="server" 
                            CssClass="ButtonEsCarga" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="cmdCargar" runat="server" onclick="cmdCargar_Click" 
                            Text="Cargar" CssClass="ButtonEs" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align=center colspan="2">
                        <asp:Label ID="Label12" runat="server" CssClass="labelTitulo" Text="Descargas"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblSolCredito" runat="server" Text="Solicitud de credito" CssClass="labelEs"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="cmdDescargar" runat="server" onclick="cmdDescargar_Click" 
                            Text="Descarga" CssClass="ButtonEs" Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblResultadoSolCredit" runat="server" CssClass="labelEs"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            
        </div>
    </div>

</asp:Content>

