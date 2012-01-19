<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mantPais.aspx.cs" Inherits="mantPais" Title="Países" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


    <div align="center">
    
    <asp:FormView ID="FormView2" runat="server" DataKeyNames="idPais" 
        DataSourceID="SqlDataSource1" onitemupdated="FormView2_ItemUpdated" 
        oniteminserted="FormView2_ItemInserted" DefaultMode="Edit">
        <EditItemTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="text-align: left">
                        <asp:Label ID="Label1" runat="server" 
                            CssClass="labelTitulo" 
                            Text="Editar País :"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
        <table border="0" cellpadding="3" cellspacing="3" align="center" width="600">
	        <tr>
		        <td style="text-align: left; width: 136px"><asp:Label ID="lblIdPais" runat="server" Text="ID :" 
                         CssClass="labelEs" ></asp:Label> </td>
		        <td align=left><asp:Label ID="idPaisLabel1" runat="server" Text='<%# Eval("idPais") %>' CssClass="textEs"/></td>
	        </tr>
	        <tr>
		        <td style="text-align: left; width: 136px"> <asp:Label ID="lblNomP" runat="server" Text="Nombre :" 
                         CssClass="labelEs" ></asp:Label> </td>
		        <td align=left><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' CssClass="textEs" />
		        <asp:RequiredFieldValidator ID="NombreTextBoxVV" runat="server" 
                        ControlToValidate="NombreTextBox"  
                        ErrorMessage="Campo Vacio." 
                        ToolTip="Campo Vacio.">*</asp:RequiredFieldValidator></td>
	        </tr>
	        <tr>
		        <td style="text-align: left; width: 136px"><asp:Label ID="lblMayEdP" runat="server" Text="Mayoría de Edad :" 
                         CssClass="labelEs" ></asp:Label> </td>
		        <td align=left><asp:TextBox ID="edadMayoriaTextBox" runat="server" Text='<%# Bind("edadMayoria") %>' CssClass="textEs" />
		        <asp:RequiredFieldValidator ID="edadMayoriaTextBoxVV" runat="server" 
                        ControlToValidate="edadMayoriaTextBox"  
                        ErrorMessage="Campo Vacio." 
                        ToolTip="Campo Vacio.">*</asp:RequiredFieldValidator></td>
	        </tr>
	        <tr>
		        <td style="text-align: left; width: 136px"><asp:Label ID="lblEstP" runat="server" Text="Estado :" 
                         CssClass="labelEs" ></asp:Label> </td>
		        <td align=left> <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Bind("Estado") %>' CssClass="textEs" /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left; width: 136px"><asp:Label ID="lblAP" runat="server" Text="A :" 
                         CssClass="labelEs" ></asp:Label></td>
		        <td align=left><asp:CheckBox ID="habilitaACheckBox" runat="server" Checked='<%# Bind("habilitaA") %>' CssClass="textEs" /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left; width: 136px"><asp:Label ID="lblBP" runat="server" Text="B :" 
                         CssClass="labelEs" ></asp:Label> </td>
		        <td align=left><asp:CheckBox ID="habilitaBCheckBox" runat="server" Checked='<%# Bind("habilitaB") %>' CssClass="textEs" /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left; width: 136px"><asp:Label ID="lblCP" runat="server" Text="C :" 
                         CssClass="labelEs" ></asp:Label></td>
		        <td align=left><asp:CheckBox ID="habilitaCCheckBox" runat="server" Checked='<%# Bind("habilitaC") %>' CssClass="textEs" /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left; width: 136px"><asp:Label ID="lblDP" runat="server" Text="D :" 
                         CssClass="labelEs" ></asp:Label></td>
		        <td align=left><asp:CheckBox ID="habilitaDCheckBox" runat="server" Checked='<%# Bind("habilitaD") %>' CssClass="textEs" /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left; width: 136px"></td>
		        <td align=left>&nbsp;</td>
	        </tr>
            <tr>
                <td align="right" colspan="2" style="text-align: left">
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Actualizar" CssClass="linkButtonFuncEs" />
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                        CommandName="Cancel" PostBackUrl="~/Mantenimientos/lstPaises.aspx" 
                        Text="Cancelar" CssClass="linkButtonFuncEs"/>
                </td>
            </tr>
        </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="text-align: left">
                        <asp:Label ID="Label1" runat="server" 
                            style="font-size: xx-large; font-weight: 700; text-align: left" 
                            Text="Editar País :"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table border="0" cellpadding="3" cellspacing="3" width="600">
	            <tr>
		            <td align=right>Nombre : </td>
		            <td align=left><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
		            <asp:RequiredFieldValidator ID="NombreTextBoxV" runat="server" 
                        ControlToValidate="NombreTextBox"  
                        ErrorMessage="Campo Vacio." 
                        ToolTip="Campo Vacio.">*</asp:RequiredFieldValidator></td>
	            </tr>
	            <tr>
		            <td align=right>Mayoría de Edad : </td>
		            <td align=left><asp:TextBox ID="edadMayoriaTextBox" runat="server" 
                Text='<%# Bind("edadMayoria") %>' />
                <asp:RequiredFieldValidator ID="edadMayoriaTextBoxV" runat="server" 
                        ControlToValidate="edadMayoriaTextBox"  
                        ErrorMessage="Campo Vacio." 
                        ToolTip="Campo Vacio.">*</asp:RequiredFieldValidator></td>
	            </tr>
	            <tr>
		            <td align=right>Estado : </td>
		            <td align=left><asp:CheckBox ID="EstadoCheckBox" runat="server" 
                Checked='<%# Bind("Estado") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>A : </td>
		            <td align=left><asp:CheckBox ID="habilitaACheckBox" runat="server" 
                Checked='<%# Bind("habilitaA") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>B : </td>
		            <td align=left><asp:CheckBox ID="habilitaBCheckBox" runat="server" 
                Checked='<%# Bind("habilitaB") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>C : </td>
		            <td align=left><asp:CheckBox ID="habilitaCCheckBox" runat="server" 
                Checked='<%# Bind("habilitaC") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>D : </td>
		            <td align=left><asp:CheckBox ID="habilitaDCheckBox" runat="server" 
                Checked='<%# Bind("habilitaD") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>&nbsp;</td>
		            <td align=left>&nbsp;</td>
	            </tr>
                <tr>
                    <td align="right" colspan="2" style="text-align: left">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insertar" />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" PostBackUrl="~/Mantenimientos/lstPaises.aspx" 
                            Text="Cancelar" />
                    </td>
                </tr>
            </table>            
        </InsertItemTemplate>
        <ItemTemplate>
        <table border="0" cellpadding="3" cellspacing="3">
	        <tr>
		        <td style="text-align: left">ID : </td>
		        <td style="text-align: left"><asp:Label ID="idPaisLabel" runat="server" Text='<%# Eval("idPais") %>' /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left">Nombre : </td>
		        <td style="text-align: left"><asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left">Mayoría de Edad : </td>
		        <td style="text-align: left"><asp:Label ID="edadMayoriaLabel" runat="server" 
                Text='<%# Bind("edadMayoria") %>' /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left">Estado : </td>
		        <td style="text-align: left"><asp:CheckBox ID="EstadoCheckBox" runat="server" 
                Checked='<%# Bind("Estado") %>' Enabled="false" /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left">A : </td>
		        <td style="text-align: left"><asp:CheckBox ID="habilitaACheckBox" runat="server" 
                Checked='<%# Bind("habilitaA") %>' Enabled="false" /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left">B : </td>
		        <td style="text-align: left"><asp:CheckBox ID="habilitaBCheckBox" runat="server" 
                Checked='<%# Bind("habilitaB") %>' Enabled="false" /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left">C : </td>
		        <td style="text-align: left"><asp:CheckBox ID="habilitaCCheckBox" runat="server" 
                Checked='<%# Bind("habilitaC") %>' Enabled="false" /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left">D : </td>
		        <td style="text-align: left"><asp:CheckBox ID="habilitaDCheckBox" runat="server" 
                Checked='<%# Bind("habilitaD") %>' Enabled="false" /></td>
	        </tr>
	        <tr>
		        <td style="text-align: left"></td>
		        <td style="text-align: left">&nbsp;</td>
	        </tr>
            <tr>
                <td colspan="2" style="text-align: left">
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Editar" />
                    &nbsp;&nbsp;
                    <asp:HyperLink ID="hlCancelar" runat="server" 
                        NavigateUrl="~/Mantenimientos/lstPaises.aspx">Cancelar</asp:HyperLink>
                </td>
            </tr>
        </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
        SelectCommand="SELECT [idPais], [Nombre], [edadMayoria], [Estado], [habilitaA], [habilitaB], [habilitaC], [habilitaD] FROM [Pais] WHERE ([idPais] = @idPais)" 
        
        
        
        UpdateCommand="UPDATE [Pais] SET [Nombre] = @Nombre, [edadMayoria] = @edadMayoria, [Estado] = @Estado, [habilitaA] = @habilitaA, [habilitaB] = @habilitaB, [habilitaC] = @habilitaC, [habilitaD] = @habilitaD WHERE [idPais] = @idPais" 
        DeleteCommand="DELETE FROM [Pais] WHERE [idPais] = @idPais" 
        InsertCommand="INSERT INTO [Pais] ([Nombre], [edadMayoria], [Estado], [habilitaA], [habilitaB], [habilitaC], [habilitaD]) VALUES (@Nombre, @edadMayoria, @Estado, @habilitaA, @habilitaB, @habilitaC, @habilitaD)">
        <SelectParameters>
            <asp:QueryStringParameter Name="idPais" QueryStringField="IdPais" 
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idPais" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="edadMayoria" Type="Int32" />
            <asp:Parameter Name="Estado" Type="Boolean" />
            <asp:Parameter Name="habilitaA" Type="Boolean" />
            <asp:Parameter Name="habilitaB" />
            <asp:Parameter Name="habilitaC" Type="Boolean" />
            <asp:Parameter Name="habilitaD" />
            <asp:Parameter Name="idPais" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="edadMayoria" Type="Int32" />
            <asp:Parameter Name="Estado" Type="Boolean" />
            <asp:Parameter Name="habilitaA" Type="Boolean" />
            <asp:Parameter Name="habilitaB" Type="Boolean" />
            <asp:Parameter Name="habilitaC" Type="Boolean" />
            <asp:Parameter Name="habilitaD" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    
    
    <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
    <br />
    <br />
    </div>

</asp:Content>
