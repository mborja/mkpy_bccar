<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contingencia.aspx.cs" Inherits="Movimientos_Contingencia" Title="Contingencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           <table>
      <tr> 
         <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:Label ID="Label10" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text="Mantenimientos - "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Contingencia</asp:HyperLink>
                        </td>
      </tr>
    </table>
    <center>
        <div id="divMensaje" runat="server" style="width: 50%;">
        </div>
    </center>
    <table class="style1" align="center" style="width: 99%">
    <tr>
        <td align="center" colspan="2" style="height: 40px">
            <asp:Label ID="Label4" runat="server" 
            CssClass="l labelTituloCentro" 
                Text="Contingencia"></asp:Label>
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
            <table style="width: 132%; height: 181px">
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                        <asp:Label ID="Label5" runat="server" Text="Incorporación" CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="width: 243px; text-align: left">
                        <asp:FileUpload ID="fuIncorporacion" runat="server" CssClass="ButtonEsCarga" 
                            Width="255px" />
                    </td>
                    <td style="text-align: left">
                        <asp:RegularExpressionValidator 
id="FileUpLoadValidator" runat="server" 
ErrorMessage="la extension del archivo debe ser .txt" 
ValidationExpression="^.*\.(txt|TXT)$" 
ControlToValidate="fuIncorporacion" SetFocusOnError="True" CssClass="lblMsjCargaError" ></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                        <asp:Label ID="Label6" runat="server" Text="Seguimiento" CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="width: 243px; text-align: left">
                        <asp:FileUpload ID="fuSeguimiento" runat="server" CssClass="ButtonEsCarga" 
                            Width="255px" />
                    </td>
                    <td style="text-align: left">
                        <asp:RegularExpressionValidator 
id="FileUpLoadValidator0" runat="server" 
ErrorMessage="la extension del archivo debe ser .txt" 
ValidationExpression="^.*\.(txt|TXT)$" 
ControlToValidate="fuSeguimiento" CssClass="lblMsjCargaError"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                        <asp:Label ID="Label7" runat="server" Text="Reingreso" CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="width: 243px; text-align: left">
                        <asp:FileUpload ID="fuReingreso" runat="server" CssClass="ButtonEsCarga" 
                            Width="255px" />
                    </td>
                    <td style="text-align: left">
                        <asp:RegularExpressionValidator 
id="FileUpLoadValidator1" runat="server" 
ErrorMessage="la extension del archivo debe ser .txt" 
ValidationExpression="^.*\.(txt|TXT)$" 
ControlToValidate="fuReingreso" CssClass="lblMsjCargaError"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 79px">
                        &nbsp;</td>
                    <td style="text-align: left; width: 134px">
                        &nbsp;</td>
                    <td style="width: 243px; text-align: left">
                        &nbsp;</td>
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
                        <asp:Label ID="lblCIncorp" runat="server" CssClass="lblMsjCargaError"></asp:Label>
                        <br />
                        <asp:Label ID="lblCSegu" runat="server" CssClass="lblMsjCargaError"></asp:Label>
                        <br />
                        <asp:Label ID="lblCReing" runat="server" CssClass="lblMsjCargaError"></asp:Label>
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

