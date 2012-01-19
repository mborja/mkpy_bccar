<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReporteSeguimientos.aspx.cs" Inherits="Reportes_Seguimientos" Title="Reporte de Seguimiento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <table>
      <tr> 
         <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Reporte de Seguimientos </asp:HyperLink>
                        </td>
      </tr>
    </table>
    <table align="center" >
    <tr>
        <td align="center">
            <asp:Label ID="Label1" runat="server" CssClass="labelTituloCentro"
                Text="Reporte de Seguimientos"></asp:Label>
            <br />
            <table class="style1" style="width: 55%">
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label2" runat="server" Text="Región :" CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtRegion" runat="server" CssClass="textEs" MaxLength="15"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label3" runat="server" Text="Zona :" CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtZona" runat="server" CssClass="textEs" MaxLength="15"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label4" runat="server" Text="Estado :" CssClass="labelEs"></asp:Label>
                    </td>
                    <td style="text-align: left">
                        <asp:DropDownList ID="ddlEstado" runat="server" CssClass="ComboEs" 
                            Height="22px">
                            <asp:ListItem Value="2">Todos</asp:ListItem>
                            <asp:ListItem Value="1">Verificado</asp:ListItem>
                            <asp:ListItem Value="0">No Verificado</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="ButtonEs" 
                            onclick="btnBuscar_Click"/>
                    &nbsp;&nbsp;
                        <asp:Button ID="btnExportar" runat="server" Text="Exportar a Excel" 
                                    CommandName="Exportar" oncommand="btnExportar_Command" 
                            CssClass="ButtonEsCarga"/>
            <br />
            <br />
            <div style="text-align: left">
            <asp:Label ID="lblMsj" runat="server" CssClass="lblMsjEs" Width="750px"></asp:Label> 
        </div>
                
            <asp:GridView ID="GridView1" runat="server" Width="750px" 
                AutoGenerateColumns="False" CellPadding="4" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                onrowcommand="GridView1_RowCommand" Visible="False" CssClass="labelEs" 
                AllowPaging="True" AllowSorting="True" PageSize="25" 
                HorizontalAlign="Center" DataKeyNames="Región,Zona,Estado">
                <RowStyle BackColor="#dbdada" CssClass="RowsTablas" />
                <Columns>
                    <asp:BoundField DataField="Región" HeaderText="Región" 
                        SortExpression="Región" />
                    <asp:BoundField DataField="Zona" HeaderText="Zona" 
                        SortExpression="Zona" />
                    <asp:CheckBoxField DataField="Estado" HeaderText="Estado" 
                        SortExpression="Estado" />
                    <asp:ButtonField CommandName="Detalle" DataTextField="Cantidad" 
                        HeaderText="Cantidad" Text="Cantidad" />
                </Columns>
                <FooterStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#7f7f7f" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="#d2bedc" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                SelectCommand="SP_LISTADO_REPORTE_SEGUIMIENTOS" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="IDPAIS" SessionField="paisId" Type="Int32" />
                    <asp:ControlParameter ControlID="txtRegion" DefaultValue="%" Name="REGION" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtZona" DefaultValue="%" Name="ZONA" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ddlEstado" DefaultValue="2" Name="ESTADO" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </td>
    </tr>
    </table>
</asp:Content>
