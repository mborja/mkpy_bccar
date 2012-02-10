<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BusquedaReingreso.aspx.cs" Inherits="Movimientos_Reingreso" Title="Reingreso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <table __designer:mapid="75a" style="width: 100%">
	        <tr __designer:mapid="75b">
		        <td __designer:mapid="75c" align="left">
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Segoe UI" 
                        Font-Underline="False" ForeColor="#660033" NavigateUrl="~/Inicio.aspx">Inicio
                    </asp:HyperLink>
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Segoe UI" 
                        ForeColor="#660033" Text="  :  "></asp:Label>
                    <asp:Label ID="Label4" runat="server" Font-Names="Segoe UI" ForeColor="#660033" 
                        Text="Historial Crediticio - "></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
                        Font-Names="Segoe UI" Font-Underline="False" ForeColor="#660033">Búsqueda Reingresos</asp:HyperLink>
                </td>
	        </tr>
	        <tr __designer:mapid="75b">
		        <td __designer:mapid="75c" align="center">
                    <asp:Label ID="Label1" runat="server" 
                CssClass="labelTitulo"
                Text="Búsqueda Reingreso"></asp:Label>
                </td>
	        </tr>
	        </table>

        <table class="style7">
            <tr>
                <td>
            
              <table cellpadding="3" cellspacing="3" align="center" style="width: 778px">
	                <tr>
		                <td style="width: 229px; " align="left">
                            <asp:Label ID="lblRegion" 
                                runat="server" Text="Región :" CssClass="labelEs"></asp:Label>  
                        </td>
		                <td style="text-align: left; width: 271px;">
                            <asp:TextBox ID="txtRegion" runat="server" 
                                CssClass="textEs" MaxLength="15"></asp:TextBox>
                                </td>
		                <td style="width: 290px">
                            <asp:Label ID="lblZona" runat="server" Text="Zona :" CssClass="labelEs"></asp:Label> 
                                </td>
		                <td style="text-align: left; width: 225px;">
                            <asp:TextBox ID="txtZona" runat="server" 
                                CssClass="textEs" MaxLength="15"></asp:TextBox>
                                </td>
		                <td style="text-align: left; width: 297px;">
                            &nbsp;</td>
		                <td style="text-align: left; width: 225px;">
                            &nbsp;</td>
	                </tr>
	                <tr>
		                <td style="width: 229px; " align="left">
                            <asp:Label ID="lblFechReingreso" runat="server" CssClass="labelEs" 
                                Text="Fecha reingreso:"></asp:Label>
                        </td>
		                <td style="text-align: left; width: 271px;">
                            <asp:TextBox ID="txtFechReingreso" runat="server" CssClass="textEs"></asp:TextBox>
                                </td>
		                <td style="width: 290px">
                            <asp:Label ID="lblCampInscripcion" 
                                runat="server" Text="Campaña Inscripción :" CssClass="labelEs"></asp:Label>  
                                </td>
		                <td style="text-align: left; width: 225px;">
                            <asp:TextBox ID="txtCampInscripcion" runat="server" 
                                CssClass="textEs" MaxLength="15"></asp:TextBox>
                                </td>
		                <td style="text-align: left; width: 297px;">
                            <asp:Label ID="lblCampPriCompra" runat="server" Text="Campaña Facturación :" 
                                CssClass="labelEs"></asp:Label> 
                                </td>
		                <td style="text-align: left; width: 225px;">
                            <asp:TextBox ID="txtCampPriCompra" runat="server" 
                                CssClass="textEs" MaxLength="15"></asp:TextBox>
                                </td>
	                </tr>
	                <tr>
		                <td style="width: 229px; " align="left">
                            <asp:Label ID="lblDocIdentidad" 
                                runat="server" Text="Documento identidad :" CssClass="labelEs"></asp:Label> </td>
		                <td style="text-align: left; width: 271px;">
                            <asp:Label ID="Label2" runat="server" CssClass="labelEs" Font-Bold="True" 
                                Height="20px" Text="ID   " Width="13px"></asp:Label>
                            <asp:TextBox ID="txtDocIdentidad" runat="server" 
                                CssClass="textEs" MaxLength="15" Width="111px"></asp:TextBox>
                                </td>
		                <td style="width: 290px">
                            <asp:Label ID="lblCodConsultora" runat="server" Text="Cod. Consultora :" 
                                CssClass="labelEs"></asp:Label> 
                                </td>
		                <td style="text-align: left; width: 225px;">
                            <asp:TextBox ID="txtCodConsultora" runat="server" 
                                CssClass="textEs" MaxLength="15"></asp:TextBox>
                                </td>
		                <td style="text-align: left; width: 297px;">
                            &nbsp;</td>
		                <td style="text-align: left; width: 225px;">
                            &nbsp;</td>
	                </tr>
                    <tr>
		                <td style="width: 229px; " align="left">
                            <asp:Label ID="lblApePaterno" runat="server" Text="Apellido Paterno :" 
                                CssClass="labelEs"></asp:Label> </td>
		                <td style="text-align: left; width: 271px;">
                            <asp:TextBox ID="txtApePaterno" runat="server" 
                                style="text-align: left" CssClass="textEs" MaxLength="15"></asp:TextBox>
                                </td>
		                <td style="width: 290px">
                            <asp:Label ID="lblApeMaterno" runat="server" Text="Apellido Materno :" 
                                CssClass="labelEs"></asp:Label>  
                                </td>
		                <td style="text-align: left; width: 225px;">
                            <asp:TextBox ID="txtApeMaterno" 
                                runat="server" CssClass="textEs" MaxLength="25"></asp:TextBox>
                                </td>
		                <td style="text-align: left; width: 297px;">
                            <asp:Label ID="lblNombres" runat="server" Text="Nombres :" CssClass="labelEs"></asp:Label>  
                        </td>
		                <td style="text-align: left; width: 225px;">
                            <asp:TextBox ID="txtNombres" 
                                runat="server" CssClass="textEs"></asp:TextBox>
                                </td>
	                </tr>
	                <tr>
		                <td style="width: 229px; " align="left">&nbsp;</td>
		                <td style="text-align: left; width: 271px;">
                            &nbsp;</td>
		                <td style="text-align: left; width: 290px;">
                            &nbsp;</td>
		                <td style="text-align: left; width: 225px;">
                            &nbsp;</td>
		                <td style="text-align: left; width: 297px;">
                            <asp:Label ID="lblEstado" 
                                runat="server" Text="Estado :" CssClass="labelEs"></asp:Label> </td>
		                <td style="text-align: left; width: 225px;">
                                                <asp:DropDownList ID="ddlEstado" runat="server" 
                                Height="16px" CssClass="ComboEs" onselectedindexchanged="ddlEstado_SelectedIndexChanged">
                                                    <asp:ListItem Value="2">Todos</asp:ListItem>
                                                    <asp:ListItem Value="1">Verificado</asp:ListItem>
                                                    <asp:ListItem Value="0">No Verificado</asp:ListItem>
                            </asp:DropDownList>
                                                </td>
	                </tr>
	                <tr>
		                <td style="text-align: right" colspan="3" align="center">
                            &nbsp;</td>
		                <td style="text-align: right" colspan="3" align="center">
                            &nbsp;</td>
	                </tr>
	                <tr>
		                <td colspan="6" align="center">
                            &nbsp;
                            <asp:Button ID="btnBuscar" 
                                runat="server" Text="Buscar" onclick="btnBuscar_Click" CssClass="ButtonEs" />&nbsp;&nbsp;
                            <asp:Button ID="Button1" runat="server" CssClass="ButtonEs" 
                                onclick="Button1_Click" Text="Guardar" />
                        </td>
	                </tr>	   	                
                </table>
                </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td>
        <div style="text-align: left">
            <asp:Label ID="lblMsj" runat="server" CssClass="lblMsjEs"></asp:Label>
        </div>       
                </td>
            </tr>
            <tr>
                <td align="center">


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource5" 
            ForeColor="#333333" GridLines="None" style="text-align: center" AllowPaging="True" 
                        AllowSorting="True" Visible="False" CssClass="labelEs" 
                        onrowdatabound="GridView1_RowDataBound" PageSize="25" Width="750px" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        DataKeyNames="id">
            <RowStyle BackColor="#DBDADA"  CssClass="RowsTablas"/>
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" 
                    SortExpression="id" InsertVisible="False" ReadOnly="True" 
                    Visible="False" />
                <asp:BoundField DataField="Región" HeaderText="Región" 
                    SortExpression="Región" />
                <asp:BoundField DataField="Zona" HeaderText="Zona" 
                    SortExpression="Zona" />
                <asp:BoundField DataField="Fecha reingreso" HeaderText="Fecha reingreso" 
                    SortExpression="Fecha reingreso" ReadOnly="True" />
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
                <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Estado") %>' 
                            CssClass="labelEs" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#7F7F7F" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#7F7F7F" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#7F7F7F" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="#D2BEDC" />
        </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
            SelectCommand="SP_LISTADO_HISTORIAL_REINGRESOS" 
            SelectCommandType="StoredProcedure" 
            UpdateCommand="UPDATE Reingreso SET verifica = @ESTADO WHERE id = @ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtRegion" DefaultValue="%" Name="REGION" 
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtZona" DefaultValue="%" Name="ZONA" 
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtFechReingreso" DefaultValue="%" 
                    Name="FECHREING" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtCampInscripcion" DefaultValue="%" 
                    Name="CAMPAINSC" PropertyName="Text" Type="String" />
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
            <UpdateParameters>
                <asp:Parameter Name="ESTADO" />
                <asp:Parameter Name="ID" />
            </UpdateParameters>
        </asp:SqlDataSource>


</asp:Content>
