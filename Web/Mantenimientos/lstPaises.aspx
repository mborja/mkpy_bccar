<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="lstPaises.aspx.cs" Inherits="lstPaises" Title="Países" %>
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
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Búsqueda de 
                    Países</asp:HyperLink>
                        </td>
      </tr>
    </table>
    <table __designer:mapid="75a" style="width: 100%">
	        <tr __designer:mapid="75b">
		        <td __designer:mapid="75c" align="center">
                    <asp:Label ID="Label3" runat="server" CssClass="labelTitulo" 
                Text="Busqueda de Países :"></asp:Label>
                </td>
	        </tr>
	        </table>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    
    <div align="center">
    
        <div style="width: 268px">
            <div align="center" dir="ltr">
            
            <table border="0" cellpadding="3" cellspacing="3">
	            <tr>
		            <td style="text-align: right; width: 253px;">
                        <asp:Label ID="Label1" runat="server" Text="Nombre:" 
                         CssClass="labelEs" ></asp:Label></td>
		            <td style="text-align: left" colspan="2"><asp:TextBox ID="TextBox1" runat="server" CssClass="textEs"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="NombrePais" runat="server" 
                        ControlToValidate="TextBox1"  
                        ErrorMessage="Campo Vacio." 
                        ToolTip="Campo Vacio.">*</asp:RequiredFieldValidator></td>
	            </tr>
	            <tr>
		            <td style="text-align: right; width: 253px;">
                        <asp:Label ID="Label11" runat="server" Text="Nomenclatura:" 
                         CssClass="labelEs" ></asp:Label></td>
		            <td style="text-align: left" colspan="2"><asp:TextBox ID="TextBox2" runat="server" 
                            CssClass="textEs"></asp:TextBox>
                     </td>
	            </tr>
	            <tr>
		            <td style="text-align: right; width: 253px;">
                        <asp:Label ID="Label12" runat="server" Text="Mayoría de edad:" 
                         CssClass="labelEs" ></asp:Label></td>
		            <td style="text-align: left" colspan="2"><asp:TextBox ID="TextBox3" runat="server" 
                            CssClass="textEs"></asp:TextBox>
                     </td>
	            </tr>
	            <tr>
		            <td style="text-align: right; width: 253px;">
                        <asp:Label ID="Label2" runat="server" Text="Estado :" CssClass="labelEs"></asp:Label></td>
		            <td style="text-align: left" colspan="2">                    
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="ComboEs">
                        <asp:ListItem Value="1">Todos</asp:ListItem>
                        <asp:ListItem Value="1">Activo</asp:ListItem>
                        <asp:ListItem Value="0">Inactivo</asp:ListItem>
                    </asp:DropDownList></td>
	            </tr>
	            <tr>
		            <td style="width: 253px"></td>
		            <td style="text-align: left" colspan="2">&nbsp;</td>
	            </tr>
	            <tr>
		            <td style="width: 253px"></td>
		            <td style="text-align: left"><asp:Button ID="Button2" runat="server" Text="Crear"  CausesValidation="false"
                            onclick="Button2_Click" CssClass="ButtonEs" /></td>
		            <td style="text-align: left"><asp:Button ID="Button1" runat="server" Text="Buscar" 
                            onclick="Button1_Click" CssClass="ButtonEs" /></td>
	            </tr>	            
            </table>
            </div>
        </div>
        <br />
        <div style="text-align: left">
            <asp:Label ID="lblMsj" runat="server" CssClass="lblMsjEs"></asp:Label>
    </div>

        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="idPais" DataSourceID="SqlDataSource2" 
            ForeColor="#333333" GridLines="None" onrowcommand="GridView3_RowCommand" 
            AllowPaging="True" AllowSorting="True" Visible="False" PageSize="25" >
            <RowStyle BackColor="#dbdada" CssClass="RowsTablas" />
            <Columns>
                <asp:BoundField DataField="idPais" HeaderText="idPais" 
                    SortExpression="idPais" InsertVisible="False" ReadOnly="True" 
                    Visible="False" />
                <asp:ButtonField CommandName="Editar" DataTextField="Nombre" 
                    HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="edadMayoria" HeaderText="Edad" 
                    SortExpression="edadMayoria" />
                <asp:CheckBoxField DataField="habilitaA" HeaderText="habilita A" 
                    SortExpression="habilitaA" />
                <asp:CheckBoxField DataField="habilitaB" HeaderText="habilitaB" 
                    SortExpression="habilitaB" />
                <asp:CheckBoxField DataField="habilitaC" HeaderText="habilitaC" 
                    SortExpression="habilitaC" />
                <asp:CheckBoxField DataField="habilitaD" HeaderText="habilitaD" 
                    SortExpression="habilitaD" />
                <asp:CheckBoxField DataField="Estado" HeaderText="Estado" 
                    SortExpression="Estado" />
            </Columns>
            <FooterStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#7f7f7f" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="#d2bedc" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
            
            SelectCommand="SELECT [idPais], [Nombre], [edadMayoria], [habilitaA], [habilitaB], [habilitaC], [habilitaD], [Estado] FROM [Pais] WHERE ([Nombre] like '%' + @Nombre + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="%" Name="Nombre" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </div>
</asp:Content>
