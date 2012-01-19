<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mantGerenteZona.aspx.cs" Inherits="mantGerenteZona" Title="Gerente de Zonas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


    <div align="center">
    
    <asp:FormView ID="FormView2" runat="server" DataKeyNames="idGerenteZona" 
        DataSourceID="SqlDataSource1" onitemupdated="FormView2_ItemUpdated" 
            DefaultMode="Edit">
        <EditItemTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="text-align: left">
                        <asp:Label ID="Label1" runat="server" 
                           CssClass="labelTitulo"
                            Text="Editar Gerente de zona :"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table border="0" cellpadding="3" cellspacing="3" width="600">
	            <tr>
		            <td style="text-align: left"><asp:Label ID="lblClaGZ" runat="server" Text="Clave :" 
                         CssClass="labelEs" ></asp:Label></td>
		            <td align=left><asp:TextBox ID="ClaveTextBox" runat="server" 
                            Text='<%# Bind("Clave") %>' CssClass="textEs" TextMode="Password" 
                            Enabled="False"/>
		            </td>
	            </tr>
	            <tr>
		            <td style="text-align: left"><asp:Label ID="lblNomGZ" runat="server" Text="Nombres :" 
                         CssClass="labelEs" ></asp:Label> </td>
		            <td align=left><asp:TextBox ID="NombresTextBox" runat="server" 
                            Text='<%# Bind("Nombres") %>' CssClass="textEs" MaxLength="50" 
                            Width="230px" Enabled="False"/>
		            </td>
	            </tr>
	            <tr>
		            <td style="text-align: left">
                        <asp:Label ID="lblAmGZ" runat="server" CssClass="labelEs" 
                            Text="Apellido Materno :"></asp:Label>
                    </td>
		            <td style="text-align: left">
                        <asp:TextBox ID="maternoTextBox" runat="server" CssClass="textEs" 
                            Text='<%# Bind("materno") %>' Enabled="False" />
                    </td>
	            </tr>
	            <tr>
                    <td style="text-align: left">
                        <asp:Label ID="lblApGZ" runat="server" CssClass="labelEs" 
                            Text="Apellido Paterno :"></asp:Label>
                    </td>
                    <td style="text-align: left">
                        <asp:TextBox ID="paternoTextBox" runat="server" CssClass="textEs" 
                            Text='<%# Bind("paterno") %>' Enabled="False" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left">
                        <asp:Label ID="lblRegGZ" runat="server" CssClass="labelEs" Text="Región :"></asp:Label>
                    </td>
                    <td style="text-align: left">
                        <asp:TextBox ID="RegionTextBox" runat="server" CssClass="textEs" 
                            Text='<%# Bind("Region") %>' Enabled="False" />
                    </td>
                </tr>
	            <tr>
		            <td style="text-align: left"><asp:Label ID="lblZonGZ" runat="server" Text="Zona :" 
                         CssClass="labelEs" ></asp:Label> </td>
		            <td align=left><asp:TextBox ID="ZonaTextBox" runat="server" 
                            Text='<%# Bind("Zona") %>' CssClass="textEs" Enabled="False"/></td>
	            </tr>
	            <tr>
		            <td style="text-align: left"><asp:Label ID="lblPinGZ" runat="server" Text="PIN :" 
                         CssClass="labelEs" ></asp:Label> </td>
		            <td align=left><asp:TextBox ID="PINTextBox" runat="server" 
                            Text='<%# Bind("PIN") %>' CssClass="textEs" Enabled="False"/></td>
	            </tr>
	            <tr>
		            <td style="text-align: left"><asp:Label ID="lblImsiGZ" runat="server" Text="IMSI :" 
                         CssClass="labelEs" ></asp:Label> </td>
		            <td align=left><asp:TextBox ID="IMSITextBox" runat="server" 
                            Text='<%# Bind("IMSI") %>' CssClass="textEs" Width="158px" 
                            Enabled="False"/></td>
	            </tr>
	            <tr>
		            <td style="text-align: left"><asp:Label ID="lblCorGZ" runat="server" Text="Correo Electrónico :" 
                         CssClass="labelEs" ></asp:Label> </td>
		            <td align=left><asp:TextBox ID="correoTextBox" runat="server" 
                            Text='<%# Bind("correo") %>' CssClass="textEs" Width="311px" 
                            Enabled="False"/>
                    </td>
	            </tr>
	            <tr>
                    <td style="text-align: left">
                        <asp:Label ID="lblTdGZ" runat="server" CssClass="labelEs" 
                            Text="Tipo de Documento :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DropDownList1" Runat="server" CssClass="ComboEs" 
                            DataSourceID="SqlDataSource2" DataTextField="Descripcion" 
                            DataValueField="idTablas" Enabled="False" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                            SelectedValue='<%# Bind("Tablas_idTipoDoc") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                            SelectCommand="SELECT Descripcion, idTablas FROM Tablas WHERE (Pais_idPais = @pais) AND (TipoTabla_idTipoTabla = 5) and Estado = 'true'">
                            <SelectParameters>
                                <asp:SessionParameter Name="pais" SessionField="paisId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
	            <tr>
		            <td style="text-align: left">
                        <asp:Label ID="lblDniGZ" runat="server" Text="Nro. de Doc :" 
                         CssClass="labelEs" ></asp:Label> </td>
		            <td align=left>
                        <asp:Label ID="lbl" runat="server" CssClass="labelEs"></asp:Label>
                        <asp:TextBox ID="numerodocTextBox" runat="server"  
                Text='<%# Bind("numerodoc") %>' CssClass="textEs" Enabled="False"/>
                    </td>
	            </tr>
	            <tr>
		            <td style="text-align: left"><asp:Label ID="lblTelGZ" runat="server" Text="Teléfono :" 
                         CssClass="labelEs" ></asp:Label> </td>
		            <td align=left>
                        <asp:TextBox ID="telefonoTextBox" runat="server" 
                Text='<%# Bind("telefono") %>' CssClass="textEs" Enabled="False"/></td>
	            </tr>
	            <tr>
		            <td style="text-align: left"><asp:Label ID="lblEstGZ" runat="server" Text="Estado :" 
                         CssClass="labelEs" ></asp:Label></td>
		            <td align=left>
                        <asp:CheckBox ID="EstadoCheckBox" runat="server" 
                Checked='<%# Bind("Estado") %>' CssClass="labelEs" Text="Activo"/></td>
	            </tr>
	            <tr>
		            <td style="text-align: left">
                        <asp:Label ID="lblCodGZ" runat="server" CssClass="labelEs" Text="Código :" 
                            Visible="False"></asp:Label>
                    </td>
		            <td align=left>
                        <asp:TextBox ID="CodigoTextBox" runat="server" CssClass="textEs" 
                            Enabled="False" Text='<%# Bind("Codigo") %>' Visible="False" />
                    </td>
	            </tr>
                <tr>
                    <td colspan="2" style="text-align: left">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            DisplayMode="List" CssClass="lblMsjCargaError" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: left">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Actualizar" CssClass="linkButtonFuncEs" 
                            onclick="UpdateButton_Click"/>
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" PostBackUrl="~/Mantenimientos/lstGZ.aspx" 
                            Text="Cancelar" CssClass="linkButtonFuncEs" />
                    </td>
                </tr>
            </table>        
           </EditItemTemplate>
        <ItemTemplate>
            <table border="0" cellpadding="3" cellspacing="3">
	            <tr>
		            <td align=right>ID : </td>
		            <td align=left><asp:Label ID="idGerenteZonaLabel" runat="server" 
                Text='<%# Eval("idGerenteZona") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Tipo de Documento : </td>
		            <td align=left>
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="Descripcion" 
                DataValueField="idTablas" SelectedValue='<%# Bind("Tablas_idTipoDoc") %>'  />
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                
                SelectCommand="SELECT idTablas, Descripcion FROM Tablas WHERE Estado = 1">
                <SelectParameters>
                    <asp:Parameter DefaultValue="true" Name="Estado" Type="Boolean" />
                    <asp:QueryStringParameter Name="Tablas_idTipoDoc" 
                        QueryStringField="IdGerenteZona" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource></td>
	            </tr>
	            <tr>
		            <td align=right>País : </td>
		            <td align=left>
                        <asp:DropDownList ID="cboPaisUsuario" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="Nombre" 
                DataValueField="idPais" SelectedValue='<%# Bind("Pais_idPais") %>' />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                
                SelectCommand="SELECT [idPais], [Nombre] FROM [Pais] WHERE ([Estado] = @Estado)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="True" Name="Estado" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource></td>
	            </tr>
	            <tr>
		            <td align=right>Código : </td>
		            <td align=left><asp:Label ID="CodigoLabel" runat="server" Text='<%# Bind("Codigo") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Clave : </td>
		            <td align=left><asp:Label ID="ClaveLabel" runat="server" Text='<%# Bind("Clave") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Nombres : </td>
		            <td align=left><asp:Label ID="NombresLabel" runat="server" Text='<%# Bind("Nombres") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Región : </td>
		            <td align=left><asp:Label ID="RegionLabel" runat="server" Text='<%# Bind("Region") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Zona : </td>
		            <td align=left><asp:Label ID="ZonaLabel" runat="server" Text='<%# Bind("Zona") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>PIN : </td>
		            <td align=left><asp:Label ID="PINLabel" runat="server" Text='<%# Bind("PIN") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>IMSI : </td>
		            <td align=left><asp:Label ID="IMSILabel" runat="server" Text='<%# Bind("IMSI") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Correo Electrónico : </td>
		            <td align=left><asp:Label ID="correoLabel" runat="server" Text='<%# Bind("correo") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Nro. de DNI : </td>
		            <td align=left><asp:Label ID="numerodocLabel" runat="server" Text='<%# Bind("numerodoc") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Teléfono : </td>
		            <td align=left><asp:Label ID="telefonoLabel" runat="server" Text='<%# Bind("telefono") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Apellido Paterno : </td>
		            <td><asp:Label ID="paternoLabel" runat="server" Text='<%# Bind("paterno") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Apellido Materno : </td>
		            <td align=left><asp:Label ID="maternoLabel" runat="server" Text='<%# Bind("materno") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Estado : </td>
		            <td align=left><asp:CheckBox ID="EstadoCheckBox" runat="server" 
                Checked='<%# Bind("Estado") %>' Enabled="false" /></td>
	            </tr>
	            <tr>
		            <td></td>
		            <td><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Editar" /></td>
	            </tr>
            </table>        
        </ItemTemplate>
    </asp:FormView> 
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
        SelectCommand="SELECT [idGerenteZona], [Tablas_idTipoDoc], [Pais_idPais], [Codigo], [Clave], [Nombres], [Region], [Zona], [PIN], [IMSI], [correo], [numerodoc], [telefono], [paterno], [materno], [Estado] FROM [GerenteZona] WHERE ([idGerenteZona] = @idGerenteZona)" 
        
        
        
        UpdateCommand="UPDATE [GerenteZona] SET [Tablas_idTipoDoc] = @Tablas_idTipoDoc, [Pais_idPais] = @Pais_idPais, [Codigo] = @Codigo, [Clave] = @Clave, [Nombres] = @Nombres, [Region] = @Region, [Zona] = @Zona, [PIN] = @PIN, [IMSI] = @IMSI, [correo] = @correo, [numerodoc] = @numerodoc, [telefono] = @telefono, [paterno] = @paterno, [materno] = @materno, [Estado] = @Estado WHERE [idGerenteZona] = @idGerenteZona" 
        DeleteCommand="DELETE FROM [GerenteZona] WHERE [idGerenteZona] = @idGerenteZona" 
        
        
        
            InsertCommand="INSERT INTO [GerenteZona] ([Tablas_idTipoDoc], [Pais_idPais], [Codigo], [Clave], [Nombres], [Region], [Zona], [PIN], [IMSI], [correo], [numerodoc], [telefono], [paterno], [materno], [Estado]) VALUES (@Tablas_idEstado, @Tablas_idTipoDoc, @Pais_idPais, @Codigo, @Clave, @Nombres, @Region, @Zona, @PIN, @IMSI, @correo, @numerodoc, @telefono, @paterno, @materno, @Estado)">
        <SelectParameters>
            <asp:QueryStringParameter Name="idGerenteZona" QueryStringField="idGerenteZona" 
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idGerenteZona" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Tablas_idTipoDoc" Type="Int32" />
            <asp:Parameter Name="Pais_idPais" Type="Int32" />
            <asp:Parameter Name="Codigo" Type="String" />
            <asp:Parameter Name="Clave" Type="String" />
            <asp:Parameter Name="Nombres" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="Zona" Type="String" />
            <asp:Parameter Name="PIN" Type="String" />
            <asp:Parameter Name="IMSI" Type="String" />
            <asp:Parameter Name="correo" Type="String" />
            <asp:Parameter Name="numerodoc" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="paterno" Type="String" />
            <asp:Parameter Name="materno" Type="String" />
            <asp:Parameter Name="Estado" Type="Boolean" />
            <asp:Parameter Name="idGerenteZona" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Tablas_idEstado" Type="Int32" />
            <asp:Parameter Name="Tablas_idTipoDoc" Type="Int32" />
            <asp:Parameter Name="Pais_idPais" Type="Int32" />
            <asp:Parameter Name="Codigo" Type="String" />
            <asp:Parameter Name="Clave" Type="String" />
            <asp:Parameter Name="Nombres" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="Zona" Type="String" />
            <asp:Parameter Name="PIN" Type="String" />
            <asp:Parameter Name="IMSI" Type="String" />
            <asp:Parameter Name="correo" Type="String" />
            <asp:Parameter Name="numerodoc" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="paterno" Type="String" />
            <asp:Parameter Name="materno" Type="String" />
            <asp:Parameter Name="Estado" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    
  
    
    <br />
    <br />
        
          </div>
   
</asp:Content>


