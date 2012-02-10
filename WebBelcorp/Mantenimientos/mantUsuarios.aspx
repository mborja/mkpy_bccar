<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mantUsuarios.aspx.cs" Inherits="mantUsuarios" Title="Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


    <div align="center">
    
    <asp:FormView ID="FormView2" runat="server"  
         onitemupdated="FormView2_ItemUpdated" 
        oniteminserted="FormView2_ItemInserted" DefaultMode="Edit">
        <EditItemTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="text-align: left">
                        <asp:Label ID="Label1" runat="server" 
                            CssClass="labelTitulo"
                            Text="Actualizar Usuario :"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table border="0" cellpadding="3" cellspacing="3" align="center" width="600">
	            <tr>
		            <td style="text-align: left; width: 95px"><asp:Label ID="lblPeUsu" runat="server" Text="Perfil :" 
                         CssClass="labelEs" ></asp:Label></td>
		            <td align=left colspan="3"><asp:DropDownList ID="cboPerfil" Runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="Descripcion" DataValueField="idTablas" 
                SelectedValue='<%# Bind("Tablas_idPerfil") %>' CssClass="ComboEs">
                        </asp:DropDownList>  
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                            SelectCommand="SELECT Tablas.idTablas, Tablas.Descripcion FROM Tablas INNER JOIN TipoTabla ON Tablas.TipoTabla_idTipoTabla = TipoTabla.idTipoTabla WHERE (Tablas.Estado = @Estado) AND (Tablas.TipoTabla_idTipoTabla = 7) AND (Tablas.Pais_idPais = (SELECT idPais FROM Pais WHERE ( Nombre like @pais ))) ORDER BY Tablas.Descripcion">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="True" Name="Estado" Type="Boolean" />
                                <asp:SessionParameter DefaultValue="" Name="pais" SessionField="paisNombre" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
	            </tr>
	            <tr>
		            <td style="text-align: left; width: 95px"><asp:Label ID="lblPaisUsu" runat="server" Text="País :" 
                         CssClass="labelEs" ></asp:Label> </td>
		            <td align=left colspan="3"> <asp:DropDownList ID="cboPais" Runat="server" DataSourceID="SqlDataSource2"
                            DataTextField="Nombre" DataValueField="idPais" 
                SelectedValue='<%# Bind("Pais_idPais") %>' CssClass="ComboEs">
                        </asp:DropDownList>  
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                            SelectCommand="SELECT idPais, Nombre FROM Pais WHERE (Estado = @Estado) AND (Nombre = @paisNombre) ORDER BY Nombre">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="True" Name="Estado" Type="Boolean" />
                                <asp:SessionParameter DefaultValue="" Name="paisNombre" 
                                    SessionField="paisNombre" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
	            </tr>
	            <tr>
                    <td style="text-align: left; width: 95px">
                        <asp:Label ID="lblNoUsu" runat="server" CssClass="labelEs" Text="Nombres :"></asp:Label>
                    </td>
                    <td align="left" colspan="3">
                        <asp:TextBox ID="NombreTextBox" runat="server" CssClass="textEs" Height="18px" 
                            MaxLength="50" Text='<%# Bind("nombre") %>' Width="177px" />
                        <asp:RequiredFieldValidator ID="NombreTextBoxV" runat="server" 
                            ControlToValidate="NombreTextBox" ErrorMessage="Campo Vacio." 
                            ToolTip="Campo Vacio." Display="Dynamic">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
	            <tr>
		            <td style="text-align: left; width: 95px; height: 32px;"><asp:Label ID="lblUsua" runat="server" Text="Usuario :" 
                         CssClass="labelEs" ></asp:Label></td>
		            <td align="left" style="height: 32px" colspan="3"><asp:TextBox ID="CodigoTextBox" 
                            runat="server" Text='<%# Bind("codigo") %>' CssClass="textEs" MaxLength="10" />
		            <asp:RequiredFieldValidator ID="CodigoTextBoxV" runat="server" 
                        ControlToValidate="CodigoTextBox"  
                        ErrorMessage="Campo Vacio." 
                        ToolTip="Campo Vacio." Display="Dynamic">*</asp:RequiredFieldValidator></td>
	            </tr>
	            <tr>
		            <td style="text-align: left; " colspan="2">
                        <asp:CheckBox ID="chBox" runat="server" CssClass="labelEs" 
                            oncheckedchanged="CheckBox1_CheckedChanged" Text="¿Cambiar Contraseña?" 
                            AutoPostBack="True" />
                    </td>
                    <td style="text-align: left; ">
                        &nbsp;</td>
                    <td style="text-align: left; ">
                        &nbsp;</td>
	            </tr>
	            <tr>
                    <td style="text-align: left; width: 95px;">
                        <asp:Label ID="lblPwdUu" runat="server" CssClass="labelEs" Text="Contraseña :" 
                            Visible="False"></asp:Label>
                    </td>
                    <td style="text-align: left; ">
                        <asp:TextBox ID="ClaveTextBox" runat="server" CssClass="textEs" MaxLength="10" 
                            Text='<%# Bind("Clave", "{0}") %>' TextMode="Password" Visible="False" />
                        <asp:RequiredFieldValidator ID="ClaveTextBoxV" runat="server" 
                            ControlToValidate="ClaveTextBox" ErrorMessage="ingrese su nueva contraseña" 
                            ToolTip="Campo Vacio." Display="Dynamic" Visible="False">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="text-align: left; ">
                        <asp:Label ID="lblPwdUu0" runat="server" CssClass="labelEs" 
                            Text="Reingrese la Contraseña :" Visible="False"></asp:Label>
                    </td>
                    <td style="text-align: left; ">
                        <asp:TextBox ID="ClaveTextBox0" runat="server" CssClass="textEs" MaxLength="10" 
                            TextMode="Password" Visible="False" />
                        <asp:RequiredFieldValidator ID="ClaveTextBoxV0" runat="server" 
                            ControlToValidate="ClaveTextBox0" ErrorMessage="Campo Vacio." 
                            ToolTip="Campo Vacio." Display="Dynamic" Visible="False">*</asp:RequiredFieldValidator>
                        &nbsp;
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="ClaveTextBox0" ControlToValidate="ClaveTextBox" 
                            ErrorMessage="las claves no coinciden" Display="Dynamic" 
                            SetFocusOnError="True" Visible="False">*</asp:CompareValidator>
                    </td>
                </tr>
	            <tr>
		            <td style="text-align: left; width: 95px"> 
                        <asp:Label ID="lblEstUsu" runat="server" CssClass="labelEs" Text="Estado :"></asp:Label>
                    </td>
		            <td align=left colspan="3">
                        <asp:CheckBox ID="EstadoCheckBox" runat="server" 
                Checked='<%# Bind("Estado") %>' CssClass="labelEs" 
                            ToolTip="marque la casilla para obtener el estado Activo" Text="Activo"/></td>
	            </tr>
	            <tr>
		            <td style="text-align: left; " colspan="4">
                        &nbsp;</td>
	            </tr>
                <tr>
                    <td colspan="4" style="text-align: left; ">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            DisplayMode="List" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: left; ">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" CssClass="linkButtonFuncEs" Text="Actualizar" 
                            onclick="UpdateButton_Click" />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="linkButtonFuncEs" 
                            PostBackUrl="~/Mantenimientos/lstUsuarios.aspx" Text="Cancelar" />
                    </td>
                </tr>
            </table>  
        </EditItemTemplate>
        
        <InsertItemTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="text-align: left">
                        <asp:Label ID="Label1" runat="server" CssClass="labelTitulo"
                            style="font-size: xx-large; font-weight: 700; text-align: left" 
                            Text="Agregar  Usuario :"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table border="0" cellpadding="3" cellspacing="3" width="600">
	            <tr>
		            <td style="text-align: left; width: 95px;"  CssClass="labelEs"> 
                        <asp:Label ID="Label2" runat="server"  CssClass="labelEs" Text="Perfil :"></asp:Label>
                    </td>
		            <td align=left>
                        <asp:DropDownList ID="cboPerfilUsuario" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="Perfil" CssClass="ComboEs" 
                DataValueField="id"  />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                            SelectCommand="SELECT Tabla.id, Tabla.descripcion AS 'Perfil'
FROM Tabla INNER JOIN TipoTabla ON Tabla.idtipotabla = TipoTabla.id
WHERE (Tabla.idtipotabla = 7) AND (Tabla.estado = 1) 
ORDER BY Tabla.descripcion">
                        </asp:SqlDataSource>
                    </td>
	            </tr>
	            <tr>
		            <td style="text-align: left; width: 95px">
                        <asp:Label ID="Label3" runat="server" CssClass="labelEs" Text="País :"></asp:Label>
                    </td>
		            <td align=left>
                        <asp:DropDownList ID="cboPaisUsuario" runat="server" CssClass="ComboEs"
                DataSourceID="SqlDataSource2" DataTextField="nombre" 
                DataValueField="id"   />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                            SelectCommand="SELECT id,nombre 
FROM Pais 
WHERE estado = 1
ORDER BY nombre">
                        </asp:SqlDataSource>
                    </td>
	            </tr>
	            <tr>
                    <td style="text-align: left; width: 95px">
                        &nbsp;<asp:Label ID="Label4" runat="server" CssClass="labelEs" Text="Nombres :"></asp:Label></td>
                    <td align="left">
                        <asp:TextBox ID="NombreTextBox" runat="server" Height="22px" MaxLength="50" 
                           CssClass="textEs" Text='<%# Bind("Nombre") %>' Width="187px" />
                        <asp:RequiredFieldValidator ID="NombreTextBoxVV" runat="server" 
                            ControlToValidate="NombreTextBox" ErrorMessage="ingrese el nombre." 
                            ToolTip="Campo Vacio.">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
	            <tr>
		            <td style="text-align: left; width: 95px">&nbsp;<asp:Label ID="Label5" runat="server" 
                            CssClass="labelEs" Text="Usuario :"></asp:Label></td>
		            <td align=left>
                        <asp:TextBox ID="CodigoTextBox" runat="server" 
                           CssClass="textEs" Text='<%# Bind("Codigo") %>' MaxLength="10" />
		            <asp:RequiredFieldValidator ID="CodigoTextBoxVV" runat="server" 
                        ControlToValidate="CodigoTextBox"  
                        ErrorMessage="ingrese su codigo de  usuario" 
                        ToolTip="Campo Vacio.">*</asp:RequiredFieldValidator>&nbsp;
                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                            ControlToValidate="CodigoTextBox" Display="Dynamic" 
                            ErrorMessage="El usuario ingresado ya existe">*</asp:CustomValidator>
                    </td>
	            </tr>
	            <tr>
		            <td style="text-align: left; width: 95px">&nbsp;<asp:Label ID="Label6" runat="server" 
                            CssClass="labelEs" Text="Contraseña :"></asp:Label></td>
		            <td align=left><asp:TextBox ID="ClaveTextBox" runat="server" 
                           CssClass="textEs" Text='<%# Bind("Clave") %>' TextMode="Password" 
                            MaxLength="10" />
		             <asp:RequiredFieldValidator ID="ClaveTextBoxVV" runat="server" 
                        ControlToValidate="ClaveTextBox"  
                        ErrorMessage="ingrese su contraseña" 
                        ToolTip="Campo Vacio.">*</asp:RequiredFieldValidator></td>
	            </tr>
	            <tr>
		            <td style="text-align: left; width: 95px">&nbsp;<asp:Label ID="Label7" runat="server" 
                            CssClass="labelEs" Text="Estado :"></asp:Label></td>
		            <td align=left>
                        <asp:CheckBox ID="EstadoCheckBox" runat="server" CssClass="textEs" 
                            Text="Activo" ToolTip="Marque la casilla para obtener el estado Activo" />
                    </td>
	            </tr>
	            <tr>
		            <td style="text-align: left; width: 95px"></td>
		            <td align=left>&nbsp;</td>
	            </tr>
                <tr>
                    <td colspan="2" style="text-align: left">
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                            DisplayMode="List" CssClass="lblMsjCargaError" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: left">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                          CssClass="linkButtonFuncEs"  CommandName="Insert" Text="Agregar" 
                            onclick="InsertButton_Click" />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CssClass="linkButtonFuncEs" CommandName="Cancel" PostBackUrl="~/Mantenimientos/lstUsuarios.aspx" 
                            Text="Cancelar" onclick="InsertCancelButton_Click" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table border="0" cellpadding="3" cellspacing="3">
	            <tr>
		            <td align=right>ID : </td>
		            <td align=left><asp:Label ID="idUsuarioLabel" runat="server" Text='<%# Eval("idUsuario") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Perfil : </td>
		            <td align=left><asp:DropDownList ID="cboPerfilUsuario" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="Descripcion" 
                DataValueField="idTablas" SelectedValue='<%# Bind("Tablas_idPerfil") %>' 
                Enabled="False"  />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                
                SelectCommand="SELECT idTablas, Descripcion FROM Tablas WHERE Estado = 1">
                <SelectParameters>
                    <asp:Parameter DefaultValue="true" Name="Estado" Type="Boolean" />
                    <asp:QueryStringParameter Name="TipoTabla_idTipoTabla" 
                        QueryStringField="IdUsuario" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource></td>
	            </tr>
	            <tr>
		            <td align=right>País : </td>
		            <td align=left><asp:DropDownList ID="cboPaisUsuario" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="Nombre" 
                DataValueField="idPais" SelectedValue='<%# Bind("Pais_idPais") %>' 
                Enabled="False" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                
                            SelectCommand="SELECT idPais, Nombre FROM Pais WHERE (Estado = @Estado) AND (Nombre = @paisNombre) ORDER BY Nombre">
                <SelectParameters>
                    <asp:Parameter DefaultValue="True" Name="Estado" Type="Boolean" />
                    <asp:SessionParameter DefaultValue="" Name="paisNombre" 
                        SessionField="paisNombre" />
                </SelectParameters>
            </asp:SqlDataSource></td>
	            </tr>
	            <tr>
		            <td align=right>Usuario : </td>
		            <td align=left><asp:Label ID="Label1" runat="server" Text='<%# Bind("Codigo") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Password : </td>
		            <td align=left><asp:Label ID="ClaveLabel" runat="server" Text='<%# Bind("Clave") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Nombres : </td>
		            <td align=left><asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' /></td>
	            </tr>
	            <tr>
		            <td align=right>Estado : </td>
		            <td align=left><asp:CheckBox ID="EstadoCheckBox" runat="server" 
                Checked='<%# Bind("Estado") %>' Enabled="false" /></td>
	            </tr>
	            <tr>
		            <td></td>
		            <td align=left><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Editar" /></td>
	            </tr>
            </table>
        </ItemTemplate>
    </asp:FormView> 
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
        SelectCommand="SELECT [id], [idtablaperfil], [idpais], [codigo], [clave], [nombre], [estado] FROM [Usuario] WHERE ([id] = @idUsuario)" 
        
        
        
        UpdateCommand="UPDATE Usuario SET idtablaperfil = @Tablas_idPerfil, codigo = @Codigo, nombre = @Nombre, estado = @Estado WHERE (id = @idUsuario)" 
        DeleteCommand="DELETE FROM [Usuario] WHERE [id] = @idUsuario" 
        
        
            InsertCommand="INSERT INTO [Usuario] ([idtablaperfil], [idpais], [codigo], [clave], [nombre], [estado]) VALUES (@Tablas_idPerfil, @Pais_idPais, @Codigo, @Clave, @Nombre, @Estado)" 
            onselecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:QueryStringParameter Name="idUsuario" QueryStringField="IdUsuario" 
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idUsuario" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Tablas_idPerfil" Type="Int32" />
            <asp:Parameter Name="Codigo" Type="String" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Estado" Type="Boolean" />
            <asp:Parameter Name="idUsuario" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Tablas_idPerfil" />
            <asp:Parameter Name="Pais_idPais" Type="Int32" />
            <asp:Parameter Name="Codigo" Type="String" />
            <asp:Parameter Name="Clave" Type="String" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Estado" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    
    
    
    <asp:Label ID="lblMsj" runat="server" Text=""></asp:Label>
    <br />
        <br />
    <br />
      </div>
    
</asp:Content>
