<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReingresoDetalle.aspx.cs" Inherits="Reportes_ReingresoDetalle" Title="Detalle de Reingreso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <table>
      <tr> 
         <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:Label ID="Label10" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text="Reportes - "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="False" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033" 
                        NavigateUrl="~/Reportes/Reingresos.aspx">Reporte de Reingresos </asp:HyperLink>
                    <asp:Label ID="Label9" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text=" - "></asp:Label>
                    <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Detalle de Reingresos</asp:HyperLink>
                        </td>
      </tr>
    </table>
    <table class="style1" align="center">
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                                   CssClass="labelTituloCentro" 
                Text="Detalle de Reingreso"></asp:Label>
                <br />
            <table class="style1" style="height: 62px">
                <tr>
                    <td style="text-align: left; width: 131px; height: 30px;">
                        <asp:Label ID="lblFechReingreso" runat="server" CssClass="labelEs" 
                            Text="Fecha de reingreso:"></asp:Label>
                    </td>
                    <td style="text-align: right; width: 129px; height: 30px;">
                        <asp:TextBox ID="txtFechReingreso" runat="server" CssClass="textEs"></asp:TextBox>
                    </td>
                    <td style="text-align: left; width: 146px; height: 30px;">
                        <asp:Label ID="lblCampInscripcion" runat="server" CssClass="labelEs" 
                            Text="Campaña de inscripción:"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px; width: 103px;">
                        <asp:TextBox ID="txtCampInscripcion" runat="server" CssClass="textEs"></asp:TextBox>
                    </td>
                    <td style="text-align: left; height: 30px; width: 94px;">
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
                    <td style="text-align: right; width: 129px; height: 30px;">
                        <asp:Label ID="Label2" runat="server" CssClass="labelEs" Font-Bold="True" 
                            Height="20px" Text="ID   " Width="13px"></asp:Label>
                        <asp:TextBox ID="txtDocIdentidad" runat="server" CssClass="textEs" 
                            MaxLength="10" Width="90px"></asp:TextBox>
                    </td>
                    <td style="text-align: left; width: 146px; height: 30px;">
                        <asp:Label ID="lblCodConsultora" runat="server" Text="Código de consultora:" 
                            CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px; width: 103px;">
                        <asp:TextBox ID="txtCodConsultora" runat="server" CssClass="textEs" 
                            MaxLength="10"></asp:TextBox>
                    </td>
                    <td style="text-align: left; height: 30px; width: 94px;">
                        &nbsp;</td>
                    <td style="text-align: left; height: 30px;">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: left; width: 131px; height: 30px;">
                        <asp:Label ID="Label8" runat="server" CssClass="labelEs" 
                            Text="Apellido paterno:"></asp:Label>
                    </td>
                    <td style="text-align: right; width: 129px; height: 30px;">
                        <asp:TextBox ID="txtApePaterno" runat="server" CssClass="textEs"></asp:TextBox>
                    </td>
                    <td style="text-align: left; width: 146px; height: 30px;">
                        <asp:Label ID="Label7" runat="server" CssClass="labelEs" 
                            Text="Apellido materno:"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px; width: 103px;">
                        <asp:TextBox ID="txtApeMaterno" runat="server" CssClass="textEs"></asp:TextBox>
                    </td>
                    <td style="text-align: left; height: 30px; width: 94px;">
                        <asp:Label ID="lblNombres" runat="server" Text="Nombres:" CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px;">
                        <asp:TextBox ID="txtNombres" runat="server" CssClass="textEs" MaxLength="25"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; width: 131px; height: 30px;">
                        &nbsp;</td>
                    <td style="text-align: right; width: 129px; height: 30px;">
                        &nbsp;</td>
                    <td style="text-align: left; width: 146px; height: 30px;">
                        <asp:Label ID="lblEstado" runat="server" CssClass="labelEs" Text="Estado:"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px; width: 103px;">
                        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="ComboEs">
                            <asp:ListItem Value="2">Todos</asp:ListItem>
                            <asp:ListItem Value="1">Verificado</asp:ListItem>
                            <asp:ListItem Value="0">No Verificado</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: left; height: 30px; width: 94px;">
                        <asp:Label ID="lblEstadoBD" runat="server" CssClass="labelEs" Text="Estado BD:"></asp:Label>
                    </td>
                    <td style="text-align: left; height: 30px;">
                        <asp:DropDownList ID="ddlEstadoBD" runat="server" CssClass="ComboEs">
                            <asp:ListItem Value="2">Todos</asp:ListItem>
                            <asp:ListItem Value="1">Activa</asp:ListItem>
                            <asp:ListItem Value="0">Inactiva</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                </table>
                <br />
                            <asp:Button ID="btnBuscar0" runat="server" Text="Buscar" CssClass="ButtonEs" 
                                onclick="btnBuscar0_Click" />
                        &nbsp;&nbsp;
                            <asp:Button ID="btnExportar" runat="server" Text="Exportar a Excel" 
                                    CommandName="Exportar" oncommand="btnExportar_Command"  
                                CssClass="ButtonEsCarga"/>
                <br />
                <br />
                <div style="text-align: left">
            <asp:Label ID="lblMsj" runat="server" CssClass="lblMsjEs" Width="750px"></asp:Label> 
                    <br />
                        <asp:Label ID="Label11" runat="server" CssClass="labelEs" Font-Bold="True" 
                            Height="20px" Text="Región: 00  " Width="73px"></asp:Label>
                        <asp:Label ID="Label12" runat="server" CssClass="labelEs" Font-Bold="True" 
                            Height="20px" Text="Zona: 0000  " Width="73px"></asp:Label>
        </div>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                                    GridLines="None" AllowPaging="True" AllowSorting="True" onrowcommand="GridView1_RowCommand" 
                    Width="750px" CssClass="labelEs" PageSize="25">
                    <RowStyle BackColor="#dbdada" CssClass="RowsTablas" />
                    <Columns>
                        <asp:BoundField DataField="Región" HeaderText="Región" 
                            SortExpression="Región" />
                        <asp:BoundField DataField="Zona" HeaderText="Zona" 
                                            SortExpression="Zona" />
                        <asp:BoundField DataField="Fecha reingreso" HeaderText="Fecha reingreso" 
                                            SortExpression="Fecha reingreso" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="Campaña inscripción" HeaderText="Campaña inscripción" 
                                            SortExpression="Campaña inscripción" />
                        <asp:BoundField DataField="Campaña 1ra compra" HeaderText="Campaña 1ra compra" 
                                            SortExpression="Campaña 1ra compra" />
                        <asp:BoundField DataField="Nro. documento" HeaderText="Nro. documento" 
                                            SortExpression="Nro. documento" />
                        <asp:BoundField DataField="Código" HeaderText="Código" 
                            SortExpression="Código" />
                        <asp:BoundField DataField="Ap. paterno" HeaderText="Ap. paterno" 
                            SortExpression="Ap. paterno" />
                        <asp:BoundField DataField="Ap. materno" HeaderText="Ap. materno" 
                            SortExpression="Ap. materno" />
                        <asp:BoundField DataField="Nombres" HeaderText="Nombres" 
                            SortExpression="Nombres" />
                        <asp:CheckBoxField DataField="Estado" HeaderText="Estado" 
                            SortExpression="Estado" />
                        <asp:CheckBoxField DataField="Estado BD" HeaderText="Estado BD" 
                            SortExpression="Estado BD" />
                    </Columns>
                    <FooterStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#7f7f7f" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="#d2bedc" />
                </asp:GridView>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                                    
                    
                    SelectCommand="SP_LISTADO_REPORTE_REINGRESOS_DET" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="PS" QueryStringField="ps" Type="Int32" />
                        <asp:QueryStringParameter Name="RN" QueryStringField="rn" Type="String" />
                        <asp:QueryStringParameter Name="ZA" QueryStringField="za" Type="String" />
                        <asp:QueryStringParameter Name="EO" QueryStringField="eo" Type="Int32" />
                        <asp:ControlParameter ControlID="txtFechReingreso" DefaultValue="%" 
                            Name="FECHREING" PropertyName="Text" Type="String" />
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
                        <asp:ControlParameter ControlID="ddlEstadoBD" DefaultValue="2" Name="ESTADOBD" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>
</asp:Content>
