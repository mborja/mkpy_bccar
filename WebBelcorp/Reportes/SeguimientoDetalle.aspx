<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SeguimientoDetalle.aspx.cs" Inherits="Reportes_SeguimientoDetalle" Title="Detalle de Seguimiento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <table>
      <tr> 
         <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:Label ID="Label3" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text="Reportes - "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="False" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033" 
                        NavigateUrl="~/Reportes/Seguimientos.aspx">Reporte de Seguimientos</asp:HyperLink>
                    <asp:Label ID="Label9" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text=" - "></asp:Label>
                    <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Detalle de Seguimientos</asp:HyperLink>
                        </td>
      </tr>
    </table>
    <div align="center">
      <table class="style1" align="center">
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" CssClass="labelTituloCentro"
                Text="Detalle de Seguimiento"></asp:Label>
                <br />
            <table class="style1" style="height: 62px">
                <tr>
                    <td style="text-align: left; width: 131px; height: 30px;">
                        <asp:Label ID="lblFechInscripcion" runat="server" CssClass="labelEs" 
                            Text="Fecha de inscripción:"></asp:Label>
                    </td>
                    <td style="text-align: right; width: 200px; height: 30px;">
                        <asp:TextBox ID="txtFechInscripcion" runat="server" CssClass="textEs"></asp:TextBox>
                    </td>
                    <td style="text-align: left; width: 146px; height: 30px;">
                        <asp:Label ID="lblCampInscripcion" runat="server" CssClass="labelEs" 
                            Text="Campaña de inscripción:"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px; width: 103px;">
                        <asp:TextBox ID="txtCampInscripcion" runat="server" CssClass="textEs"></asp:TextBox>
                    </td>
                    <td style="text-align: left; height: 30px; width: 83px;">
                        <asp:Label ID="lblCampPriCompra" runat="server" CssClass="labelEs" 
                            Text="Campaña 1ra compra:"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px;">
                        <asp:TextBox ID="txtCampPriCompra" runat="server" CssClass="textEs"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 131px; height: 30px;">
                        <asp:Label ID="lblDocIdentidad" runat="server" Text="Documento de identidad:" 
                            CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="text-align: right; width: 200px; height: 30px;">
                        <asp:Label ID="Label2" runat="server" CssClass="labelEs" Font-Bold="True" 
                            Height="20px" Text="ID   " Width="13px"></asp:Label>
                        <asp:TextBox ID="txtDocIdentidad" runat="server" CssClass="textEs" 
                            MaxLength="10" Width="89px"></asp:TextBox>
                    </td>
                    <td style="text-align: left; width: 146px; height: 30px;">
                        <asp:Label ID="lblCodConsultora" runat="server" Text="Código de consultora:" 
                            CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px; width: 103px;">
                        <asp:TextBox ID="txtCodConsultora" runat="server" CssClass="textEs" 
                            MaxLength="10"></asp:TextBox>
                    </td>
                    <td style="text-align: left; height: 30px; width: 83px;">
                        &nbsp;</td>
                    <td style="text-align: left; height: 30px;">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 131px; height: 30px;">
                        <asp:Label ID="Label10" runat="server" CssClass="labelEs" 
                            Text="Apellido paterno:"></asp:Label>
                    </td>
                    <td style="text-align: right; width: 200px; height: 30px;">
                        <asp:TextBox ID="txtApePaterno" runat="server" CssClass="textEs"></asp:TextBox>
                    </td>
                    <td style="text-align: left; width: 146px; height: 30px;">
                        <asp:Label ID="Label11" runat="server" CssClass="labelEs" 
                            Text="Apellido materno:"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px; width: 103px;">
                        <asp:TextBox ID="txtApeMaterno" runat="server" CssClass="textEs"></asp:TextBox>
                    </td>
                    <td style="text-align: left; height: 30px; width: 83px;">
                        <asp:Label ID="lblNombres" runat="server" Text="Nombres:" CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px;">
                        <asp:TextBox ID="txtNombres" runat="server" CssClass="textEs" MaxLength="25"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; width: 131px; height: 30px;">
                        &nbsp;</td>
                    <td style="text-align: right; width: 200px; height: 30px;">
                        &nbsp;</td>
                    <td style="text-align: left; width: 146px; height: 30px;">
                        &nbsp;</td>
                    <td style="text-align: left; height: 30px; width: 103px;">
                        &nbsp;</td>
                    <td style="text-align: left; height: 30px; width: 83px;">
                        <asp:Label ID="lblEstado" runat="server" CssClass="labelEs" Text="Estado:"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px;">
                        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="ComboEs">
                            <asp:ListItem Value="2">Todos</asp:ListItem>
                            <asp:ListItem Value="1">Verificado</asp:ListItem>
                            <asp:ListItem Value="0">No Verificado</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right" colspan="2">
                        &nbsp;</td>
                    <td style="text-align: left" colspan="4">
                        &nbsp;</td>
                </tr>
            </table>
                <br />
                <br />
                            <asp:Button ID="btnBuscar0" runat="server" Text="Buscar"  CssClass="ButtonEs" 
                                onclick="btnBuscar0_Click"/>
                        &nbsp;&nbsp;
                            <asp:Button ID="btnExportar" runat="server" Text="Exportar a Excel" 
                                    CommandName="Exportar" oncommand="btnExportar_Command" 
                                CssClass="ButtonEsCarga"/>
                <br />
                <br />
            <div style="text-align: left">
            <asp:Label ID="lblMsj" runat="server" CssClass="lblMsjEs" Width="750px"></asp:Label> 
                <br />
                        <asp:Label ID="Label13" runat="server" CssClass="labelEs" Font-Bold="True" 
                            Height="20px" Text="Región: 00  " Width="73px"></asp:Label>
                        <asp:Label ID="Label12" runat="server" CssClass="labelEs" Font-Bold="True" 
                            Height="20px" Text="Zona: 0000  " Width="73px"></asp:Label>
        </div>
                
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataSourceID="SqlSeguimiento" ForeColor="#333333" GridLines="None" 
                    CssClass="labelEs" PageSize="25" onrowcommand="GridView1_RowCommand" 
                    HorizontalAlign="Center" Width="750px" DataKeyNames="Nro. documento">
                    <RowStyle BackColor="#dbdada" CssClass="RowsTablas"/>
                    <Columns>
                        <asp:BoundField DataField="Fecha seguimiento" HeaderText="Fecha seguimiento" 
                            SortExpression="Fecha seguimiento" ReadOnly="True" />
                        <asp:BoundField DataField="Campaña inscripción" HeaderText="Campaña inscripción" 
                            SortExpression="Campaña inscripción" />
                        <asp:BoundField DataField="Campaña 1ra compra" HeaderText="Campaña 1ra compra" 
                            SortExpression="Campaña 1ra compra" />
                        <asp:BoundField DataField="Nro. documento" HeaderText="Nro. documento" 
                            SortExpression="Nro. documento" />
                        <asp:BoundField DataField="Código" HeaderText="Código" 
                            SortExpression="Código" />
                        <asp:ButtonField CommandName="Detalle" DataTextField="Ap. paterno" 
                            HeaderText="Ap. paterno" SortExpression="Ap. paterno" Text="Ap. paterno" />
                        <asp:ButtonField CommandName="Detalle" DataTextField="Ap. materno" 
                            HeaderText="Ap. materno" SortExpression="Ap. materno" Text="Ap. materno" />
                        <asp:ButtonField CommandName="Detalle" DataTextField="Nombres" 
                            HeaderText="Nombres" SortExpression="Nombres" Text="Nombres" />
                        <asp:CheckBoxField DataField="estado" HeaderText="Estado" 
                            SortExpression="estado" />
                    </Columns>
                    <FooterStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#7f7f7f" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="#d2bedc" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlSeguimiento" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                    
                    
                    
                    SelectCommand="SP_LISTADO_REPORTE_SEGUIMIENTOS_DET" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="PS" QueryStringField="ps" Type="Int32" />
                        <asp:QueryStringParameter Name="RN" QueryStringField="rn" Type="String" />
                        <asp:QueryStringParameter Name="ZA" QueryStringField="za" Type="String" />
                        <asp:QueryStringParameter Name="EO" QueryStringField="eo" Type="Int32" />
                        <asp:ControlParameter ControlID="txtFechInscripcion" DefaultValue="%" 
                            Name="FECHSEGU" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtCampInscripcion" DefaultValue="%" Name="CAMPAINSC" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtCampPriCompra" DefaultValue="%" 
                            Name="CAMPAPRICOMPRA" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDocIdentidad" DefaultValue="%" 
                            Name="NRODOC" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtCodConsultora" DefaultValue="%" 
                            Name="CODCONSU" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtApePaterno" DefaultValue="%" Name="APEPAT" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtApeMaterno" DefaultValue="%" Name="APEMAT" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtNombres" DefaultValue="%" Name="NOM" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlEstado" DefaultValue="2" Name="ESTADO" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>
    </div>
</asp:Content>
