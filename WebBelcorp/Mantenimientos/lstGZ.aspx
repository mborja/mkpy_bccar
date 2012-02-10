<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="lstGZ.aspx.cs" Inherits="lstGZ" Title="Gerente de Zona" %>

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
                        Text="Mantenimientos - "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Búsquedas 
                    de Gerentes de Zona</asp:HyperLink>
                        </td>
      </tr>
    </table>
      

<body>
    <div align="center">
     <asp:Label ID="Label1" runat="server" CssClass="labelTitulo"
                Text="Búsquedas de Gerentes de zona "></asp:Label>
        <br />
            
                <table cellpadding="3" cellspacing="3">
	                <tr>
		                <td>&nbsp;</td>
		                <td style="text-align: left">
                            &nbsp;</td>
	                </tr>
	                <tr>
		                <td><asp:Label ID="lblNombreGZ" runat="server" Text="Nombre :" 
                         CssClass="labelEs" ></asp:Label></td>
		                <td style="text-align: left"><asp:TextBox ID="txtNombre" runat="server" 
                                CssClass="textEs" MaxLength="25"></asp:TextBox></td>
	                </tr>
	                <tr>
		                <td><asp:Label ID="lblRegionGZ" runat="server" Text="Región :" 
                         CssClass="labelEs" ></asp:Label> </td>
		                <td style="text-align: left"><asp:TextBox ID="txtRegion" runat="server" 
                                CssClass="textEs" MaxLength="15"></asp:TextBox></td>
	                </tr>
	                <tr>
		                <td><asp:Label ID="lblZonaGZ" runat="server" Text="Zona :" 
                         CssClass="labelEs" ></asp:Label> </td>
		                <td style="text-align: left"><asp:TextBox ID="txtZona" runat="server" 
                                CssClass="textEs" MaxLength="15"></asp:TextBox></td>
	                </tr>
	                <tr>
		                <td style="text-align: right">&nbsp;</td>
		                <td style="text-align: left">
                            <asp:DropDownList ID="ddlEstado" runat="server" 
                             Visible="False" CssClass="ComboEs" >
                        <asp:ListItem Value="1">Todos</asp:ListItem>
                        <asp:ListItem Value="1">Activo</asp:ListItem>
                        <asp:ListItem Value="0">Inactivo</asp:ListItem>
                    </asp:DropDownList></td>
	                </tr>
	                </table>
            <br />
                            <asp:Button ID="Button3" runat="server" 
                                Text="Buscar" onclick="Button3_Click1" CssClass="ButtonEs" />
        <br />
        <br />
        <div style="text-align: left">
            <asp:Label ID="lblMsj" runat="server" CssClass="lblMsjEs" Width="750px"></asp:Label>
        </div>
    
       
        
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="idGerenteZona" DataSourceID="SqlDataSource2" 
            ForeColor="#333333" GridLines="None" onrowcommand="GridView2_RowCommand" 
            AllowPaging="True" AllowSorting="True" Visible="False" Width="750px" 
            CssClass="labelEs" PageSize="25">
            <RowStyle BackColor="#dbdada" CssClass="RowsTablas" />
            <Columns>
                <asp:BoundField DataField="idGerenteZona" HeaderText="idGerenteZona" 
                    SortExpression="idGerenteZona" InsertVisible="False" ReadOnly="True" 
                    Visible="False" />
                <asp:ButtonField CommandName="Editar" DataTextField="Nombres" 
                    HeaderText="Nombres" SortExpression="Nombres" />
                <asp:BoundField DataField="paterno" HeaderText="Apellido Paterno" 
                    SortExpression="paterno" />
                <asp:BoundField DataField="materno" HeaderText="Apellido materno" 
                    SortExpression="materno" />
                <asp:BoundField DataField="Pais_idPais" HeaderText="Pais_idPais" 
                    SortExpression="Pais_idPais" Visible="False" />
                <asp:BoundField DataField="Region" HeaderText="Región" 
                    SortExpression="Region" />
                <asp:BoundField DataField="Zona" HeaderText="Zona" SortExpression="Zona" />
                <asp:CheckBoxField DataField="estado" HeaderText="Estado" 
                    SortExpression="estado" />
            </Columns>
            <FooterStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White"/>
            <PagerStyle BackColor="#7f7f7f" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="#d2bedc" />
        </asp:GridView>
       
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
            
            
            SelectCommand="SELECT idGerenteZona, Nombres, Pais_idPais, Region, Zona, estado, paterno, materno FROM GerenteZona WHERE  (Nombres LIKE '%' + @Nombres + '%') AND (Pais_idPais = @Pais_idPais) AND (Region LIKE '%' + @Region + '%') AND (Zona LIKE '%' + @Zona + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtNombre" DefaultValue="%" Name="Nombres" 
                    PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="Pais_idPais" SessionField="pais" Type="Int32" />
                <asp:ControlParameter ControlID="txtRegion" DefaultValue="%" Name="Region" 
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtZona" DefaultValue="%" Name="Zona" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
       
    </div>


</asp:Content>
