﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReporteReingresos.aspx.cs" Inherits="Reportes_Reingresos" Title="Reporte de Reingreso" %>

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
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Reporte de Reingresos </asp:HyperLink>
                        </td>
      </tr>
    </table>
    <table class="style1" align="center" width="200">
    <tr>
        <td align="center">
            <asp:Label ID="Label1" runat="server" CssClass="labelTitulo"
                Text="Reporte de Reingresos"></asp:Label>
            &nbsp;<br />
            
              <table cellpadding="3" cellspacing="3" align="center" style="width: 778px">
	                <tr>
		                <td style="text-align: right" align="center">
                            <asp:Label ID="lblRegion" runat="server" Text="Región:" CssClass="labelEs"></asp:Label> 
                        </td>
		                <td style="text-align: left" align="center">
                            <asp:TextBox ID="txtRegion" runat="server" CssClass="textEs"></asp:TextBox>
                                </td>
	                </tr>
	                <tr>
		                <td style="text-align: right" align="center">
                            <asp:Label ID="lblZona" runat="server" Text="Zona:" 
                                CssClass="labelEs"></asp:Label> 
                        </td>
		                <td style="text-align: left" align="center">
                            <asp:TextBox ID="txtZona" runat="server" CssClass="textEs"></asp:TextBox>
                                </td>
	                </tr>
	                <tr>
		                <td style="text-align: right" align="center">
                            <asp:Label ID="lblEstado" runat="server" 
                                Text="Estado:" CssClass="labelEs"></asp:Label> 
                        </td>
		                <td style="text-align: left" align="center">
                                                <asp:DropDownList ID="ddlEstado" runat="server" 
                                CssClass="ComboEs" Height="22px">
                                                    <asp:ListItem Value="2">Todos</asp:ListItem>
                                                    <asp:ListItem Value="1">Verificado</asp:ListItem>
                                                    <asp:ListItem Value="0">No Verificado</asp:ListItem>
                                                </asp:DropDownList>
                        </td>
	                </tr>
	                <tr>
		                <td style="text-align: right" align="center">
                            &nbsp;</td>
		                <td style="text-align: right" align="center">
                            &nbsp;</td>
	                </tr>
	                <tr>
		                <td colspan="2" align="center">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="ButtonEs" 
                            onclick="btnBuscar_Click"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnExportar" runat="server" Text="Exportar a Excel" 
                                    CommandName="Exportar" oncommand="btnExportar_Command" 
                            CssClass="ButtonEsCarga"/>
                            <br />
                            <br />
                        </td>
	                </tr>	   	                
                </table>
            <div style="text-align: left">
            <asp:Label ID="lblMsj" runat="server" CssClass="lblMsjEs" Width="750px"></asp:Label> 
        </div>
                
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" 
                onrowcommand="GridView1_RowCommand" Width="750px" AllowPaging="True" 
                AllowSorting="True" Visible="False" 
                CssClass="labelEs" PageSize="25" DataKeyNames="Región,Zona,Estado">
                <RowStyle BackColor="#dbdada" CssClass="RowsTablas" />
                <Columns>
                    <asp:BoundField DataField="Región" HeaderText="Región" 
                        SortExpression="Región" />
                    <asp:BoundField DataField="Zona" HeaderText="Zona" 
                        SortExpression="Zona" />
                    <asp:CheckBoxField DataField="Estado" HeaderText="Estado" 
                        SortExpression="Estado" />
                    <asp:ButtonField CommandName="Detalle" DataTextField="Cantidad" 
                        HeaderText="Cantidad" SortExpression="Cantidad" Text="Cantidad" />
                </Columns>
                <FooterStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#7f7f7f" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="#d2bedc" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                SelectCommand="SP_LISTADO_REPORTE_REINGRESOS" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="IDPAIS" SessionField="paisId" Type="Int32" />
                    <asp:ControlParameter ControlID="txtRegion" DefaultValue="%" Name="REGION" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtZona" DefaultValue="%" Name="ZONA" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ddlEstado" DefaultValue="2 " Name="ESTADO" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    </table>
</asp:Content>
