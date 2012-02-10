<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SeguimientoParcial.aspx.cs" Inherits="Reportes_SeguimientoParcial" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <table style="width: 100%">
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlSolicitud" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
            
                    
                    
                    SelectCommand="SELECT Nuevas.idNuevas, (SELECT Nombres FROM GerenteZona WHERE (idGerenteZona = Nuevas.GerenteZona_idGerenteZona)) AS GerenteZona_idGerenteZona, (SELECT codConsultora FROM Consultora WHERE (idConsultora = Nuevas.Consultora_idConsultora)) AS Consultora_idConsultora, Nuevas.codTerritorio, Nuevas.codConsultoraRec, Nuevas.paterno, Nuevas.materno, Nuevas.nombres, Nuevas.fechanac, Nuevas.numerodoc, Nuevas.longitud, Nuevas.latitude, Nuevas.margen, Nuevas.satelites, Nuevas.Verificado, Nuevas.tipoaccion, Nuevas.telefonocasa, Nuevas.telefonocelular, Nuevas.correo, Nuevas.notienecorreo, Nuevas.solicitante_direc, Nuevas.solicitante_referencia, Nuevas.solicitante_cpostal, Nuevas.solicitante_pueblo, Nuevas.solicitante_estado, Nuevas.solicitante_muni, Nuevas.solicitante_ciudad, Nuevas.solicitante_prov, Nuevas.reffam_nombre, Nuevas.reffam_appat, Nuevas.reffam_apmat, Nuevas.reffam_direcc, Nuevas.reffam_telef, Nuevas.reffam_celu, Nuevas.refnofam_nom, Nuevas.refnofam_appat, Nuevas.refnofam_appmat, Nuevas.refnofam_direc, Nuevas.refnofam_telefono, Nuevas.refnofam_celu, Nuevas.entrega_direc, Nuevas.entrega_pueblo, Nuevas.entrega_cpostal, Nuevas.entrega_referencia, Nuevas.record_imsi, Nuevas.record_pin, Nuevas.record_obs, Nuevas.record_fechavisita, (SELECT Tablas.Descripcion FROM Tablas INNER JOIN TipoTabla ON Tablas.TipoTabla_idTipoTabla = TipoTabla.idTipoTabla WHERE (Tablas.idTablas = Nuevas.refnofam_idTipoVinculo)) AS refnofam_tipoVinculo, (SELECT Tablas_6.Descripcion FROM Tablas AS Tablas_6 INNER JOIN TipoTabla AS TipoTabla_6 ON Tablas_6.TipoTabla_idTipoTabla = TipoTabla_6.idTipoTabla WHERE (Tablas_6.idTablas = Nuevas.Tablas_idTipoDoc)) AS marca, (SELECT Tablas_5.Descripcion FROM Tablas AS Tablas_5 INNER JOIN TipoTabla AS TipoTabla_5 ON Tablas_5.TipoTabla_idTipoTabla = TipoTabla_5.idTipoTabla WHERE (Tablas_5.idTablas = Nuevas.Tablas_idEstadoCivil)) AS Tablas_idEstadoCivil, (SELECT Tablas_4.Descripcion FROM Tablas AS Tablas_4 INNER JOIN TipoTabla AS TipoTabla_4 ON Tablas_4.TipoTabla_idTipoTabla = TipoTabla_4.idTipoTabla WHERE (Tablas_4.idTablas = Nuevas.Tablas_idTipoContacto)) AS Tablas_idTipoContacto, (SELECT Tablas_3.Descripcion FROM Tablas AS Tablas_3 INNER JOIN TipoTabla AS TipoTabla_3 ON Tablas_3.TipoTabla_idTipoTabla = TipoTabla_3.idTipoTabla WHERE (Tablas_3.idTablas = Nuevas.Tablas_idNivelEducativo)) AS Tablas_idNivelEducativo, (SELECT Tablas_2.Descripcion FROM Tablas AS Tablas_2 INNER JOIN TipoTabla AS TipoTabla_2 ON Tablas_2.TipoTabla_idTipoTabla = TipoTabla_2.idTipoTabla WHERE (Tablas_2.idTablas = Nuevas.Tablas_idOtraMarca)) AS Tablas_idOtraMarca, Pais.Nombre, (SELECT Tablas_1.Descripcion FROM Tablas AS Tablas_1 INNER JOIN TipoTabla AS TipoTabla_1 ON Tablas_1.TipoTabla_idTipoTabla = TipoTabla_1.idTipoTabla WHERE (Tablas_1.idTablas = Nuevas.reffam_idTipoVinculo)) AS reffam_idTipoVinculo FROM Nuevas INNER JOIN Pais ON Nuevas.Pais_idPais = Pais.idPais WHERE (Nuevas.Consultora_idConsultora = (SELECT Consultora_idConsultora FROM Segumiento WHERE (idSegumiento = @seguimiento)))">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="seguimiento" QueryStringField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label1" runat="server" CssClass="labelTituloCentro"
                Text="Evaluación"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
                <table align="left" style="width: 100%">
                    <tr>
                        <td>
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="idNuevas" 
                    DataSourceID="SqlSolicitud"
                    Width="500px">
                                <ItemTemplate>
                                    <table width="750">
                                        <tr>
                                            <td align="left">
                                                <table width="750">
                                                    <tr>
                                                        <td colspan="4">
                                                            <asp:Label ID="codConsultoraRecLabel3" runat="server" 
                                                    CssClass="labelSubTituloDetalle" Text="Datos" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 23px; width: 139px;">
                                                            <asp:Label ID="codConsultoraRecLabel13" runat="server" 
                                                    Text="Numero de Documento :" CssClass="labelEs" />
                                                        </td>
                                                        <td style="height: 23px; width: 191px;">
                                                            <asp:Label ID="numerodocLabel" runat="server" Text='<%# Bind("numerodoc") %>' 
                                                    CssClass="labelEs" />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel32" runat="server" CssClass="labelEs" 
                                                    Text="País :" />
                                                        </td>
                                                        <td style="width: 191px;">
                                                            <asp:Label ID="NombreLabel" runat="server" CssClass="labelEs" 
                                                    Text='<%# Bind("Nombre") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 139px">
                                                            <asp:Label ID="codConsultoraRecLabel37" runat="server" CssClass="labelEs" 
                                                    Text="Nombres :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label  CssClass="labelEs" ID="nombresLabel" runat="server" Text='<%# Bind("nombres") %>' />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel38" runat="server" CssClass="labelEs" 
                                                    Text="Apellidos :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="paternoLabel" runat="server" CssClass="labelEs" 
                                                    Text='<%# Bind("paterno") %>' />
                                                            ,
                                                            <asp:Label ID="maternoLabel" runat="server" CssClass="labelEs" 
                                                    Text='<%# Bind("materno") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 139px">
                                                            <asp:Label ID="codConsultoraRecLabel15" runat="server" CssClass="labelEs" 
                                                    Text="Verificado :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:CheckBox ID="VerificadoCheckBox" runat="server" CssClass="labelEs"
                                                    Checked='<%# Bind("Verificado") %>' Enabled="false" />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel27" runat="server" CssClass="labelEs" 
                                                    Text="margen :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label CssClass="labelEs" ID="latitudeLabel" runat="server" Text='<%# Bind("latitude") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 139px">
                                                            <asp:Label ID="codConsultoraRecLabel16" runat="server" CssClass="labelEs" 
                                                    Text="Tipo de Acción :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label CssClass="labelEs" ID="tipoaccionLabel" runat="server" 
                                                    Text='<%# Bind("tipoaccion") %>' />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel28" runat="server" CssClass="labelEs" 
                                                    Text="Margen :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label CssClass="labelEs" ID="margenLabel" runat="server" Text='<%# Bind("margen") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 139px">
                                                            <asp:Label  ID="codConsultoraRecLabel17" runat="server" CssClass="labelEs" 
                                                    Text="Teléfono casa :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="telefonocasaLabel" runat="server" 
                                                    Text='<%# Bind("telefonocasa") %>' CssClass="labelEs" />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel29" runat="server" CssClass="labelEs" 
                                                    Text="Satelites :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="satelitesLabel" runat="server" Text='<%# Bind("satelites") %>' 
                                                    CssClass="labelEs" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 139px">
                                                            <asp:Label ID="codConsultoraRecLabel18" runat="server" CssClass="labelEs" 
                                                    Text="Teléfono movil :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="telefonocelularLabel" runat="server" 
                                                    Text='<%# Bind("telefonocelular") %>' CssClass="labelEs" />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel30" runat="server" CssClass="labelEs" 
                                                    Text="Tipo contacto :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="Tablas_idTipoContactoLabel" runat="server" 
                                                    Text='<%# Bind("Tablas_idTipoContacto") %>' CssClass="labelEs" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 139px">
                                                            <asp:Label ID="codConsultoraRecLabel19" runat="server" CssClass="labelEs" 
                                                    Text="No tiene correo :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:CheckBox ID="notienecorreoCheckBox" runat="server" 
                                                    Checked='<%# Bind("notienecorreo") %>' Enabled="false" 
                                                    CssClass="labelEs" />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel14" runat="server" CssClass="labelEs" 
                                                    Text="Longitud :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="longitudLabel" runat="server" CssClass="labelEs" 
                                                    Text='<%# Bind("longitud") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 139px">
                                                            <asp:Label ID="codConsultoraRecLabel20" runat="server" CssClass="labelEs" 
                                                    Text="Correo electrónico :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="correoLabel" runat="server" Text='<%# Bind("correo") %>' 
                                                    CssClass="labelEs" />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel31" runat="server" CssClass="labelEs" 
                                                    Text="Nivel educativo :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="Tablas_idNivelEducativoLabel" runat="server" 
                                                    Text='<%# Bind("Tablas_idNivelEducativo") %>' CssClass="labelEs" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 139px">
                                                            <asp:Label ID="codConsultoraRecLabel21" runat="server" CssClass="labelEs" 
                                                    Text="Estado civil :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="Tablas_idEstadoCivilLabel" runat="server" 
                                                    Text='<%# Bind("Tablas_idEstadoCivil") %>' CssClass="labelEs" />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel33" runat="server" CssClass="labelEs" 
                                                    Text="Otra marca :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="Tablas_idOtraMarcaLabel" runat="server" 
                                                    Text='<%# Bind("Tablas_idOtraMarca") %>' CssClass="labelEs" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 139px">
                                                            <asp:Label ID="codConsultoraRecLabel22" runat="server" CssClass="labelEs" 
                                                    Text="Id GZ :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="GerenteZona_idGerenteZonaLabel" runat="server" 
                                                    Text='<%# Bind("GerenteZona_idGerenteZona") %>' CssClass="labelEs" />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel1" runat="server" 
                                                    Text="Gerente de Zona :" CssClass="labelEs" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="codConsultoraRecLabel" runat="server" 
                                                    Text='<%# Bind("codConsultoraRec") %>' CssClass="labelEs" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 139px">
                                                            <asp:Label ID="codConsultoraRecLabel23" runat="server" CssClass="labelEs" 
                                                    Text="Consultora :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="Consultora_idConsultoraLabel" runat="server" 
                                                    Text='<%# Bind("Consultora_idConsultora") %>' CssClass="labelEs" />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel34" runat="server" CssClass="labelEs" 
                                                    Text="Fecha Nac :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="fechanacLabel" runat="server" Text='<%# Bind("fechanac") %>' 
                                                    CssClass="labelEs" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 139px">
                                                            <asp:Label ID="codConsultoraRecLabel24" runat="server" CssClass="labelEs" 
                                                    Text="Territorio :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="codTerritorioLabel" runat="server" 
                                                    Text='<%# Bind("codTerritorio") %>' CssClass="labelEs" />
                                                        </td>
                                                        <td style="width: 122px">
                                                            <asp:Label ID="codConsultoraRecLabel35" runat="server" CssClass="labelEs" 
                                                    Text="Marca :" />
                                                        </td>
                                                        <td style="width: 191px">
                                                            <asp:Label ID="marcaLabel" runat="server" Text='<%# Bind("marca") %>' 
                                                    CssClass="labelEs" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table align="left" style="width: 100%">
                                                    <tr>
                                                        <td align="left" colspan="2">
                                                            <asp:Label ID="codConsultoraRecLabel4" runat="server" 
                                                                CssClass="labelSubTituloDetalle" Text="Referencia familiar " />
                                                        </td>
                                                        <td align="left" colspan="2">
                                                            <asp:Label ID="codConsultoraRecLabel5" runat="server" 
                                                                CssClass="labelSubTituloDetalle" Text="Referencia no familiar " />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel2" runat="server" CssClass="labelEs" 
                                                                Text="Nombre :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="reffam_nombreLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("reffam_nombre") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel67" runat="server" CssClass="labelEs" 
                                                                Text="Nombre :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="refnofam_nomLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("refnofam_nom") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel39" runat="server" CssClass="labelEs" 
                                                                Text="Apellidos :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="reffam_appatLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("reffam_appat") %>' />
                                                            &nbsp;<asp:Label ID="reffam_apmatLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("reffam_apmat") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel68" runat="server" CssClass="labelEs" 
                                                                Text="Apellidos :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="refnofam_appat" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("refnofam_appat") %>' />
                                                            &nbsp;<asp:Label ID="refnofam_appmat" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("refnofam_appmat") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel40" runat="server" CssClass="labelEs" 
                                                                Text="Dirección :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="reffam_direccLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("reffam_direcc") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel69" runat="server" CssClass="labelEs" 
                                                                Text="Dirección :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="refnofam_direcLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("refnofam_direc") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel41" runat="server" CssClass="labelEs" 
                                                                Text="Teléfono casa :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="reffam_telefLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("reffam_telef") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel70" runat="server" CssClass="labelEs" 
                                                                Text="Teléfono casa :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="refnofam_telefonoLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("refnofam_telefono") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel42" runat="server" CssClass="labelEs" 
                                                                Text="Teléfono movil :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="reffam_celuLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("reffam_celu") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel71" runat="server" CssClass="labelEs" 
                                                                Text="Teléfono movil :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="refnofam_celuLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("refnofam_celu") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel43" runat="server" CssClass="labelEs" 
                                                                Text="Tipo Vinculos :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="reffam_idTipoVinculoLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("reffam_idTipoVinculo") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel72" runat="server" CssClass="labelEs" 
                                                                Text="Tipo Vinculos :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="refnofam_tipoVinculoLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("refnofam_tipoVinculo") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            
                                            <td style="height: 52px">
                                                <table style="width: 100%" align="left">
                                                    <tr>
                                                        <td align="left" colspan="2">
                                                            &nbsp;</td>
                                                        <td align="left" colspan="2">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="2">
                                                            <asp:Label ID="codConsultoraRecLabel9" runat="server" 
                                                                CssClass="labelSubTituloDetalle" Text="Entrega" />
                                                        </td>
                                                        <td align="left" colspan="2">
                                                            <asp:Label ID="codConsultoraRecLabel10" runat="server" 
                                                                CssClass="labelSubTituloDetalle" Text="Datos del Movil" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel11" runat="server" CssClass="labelEs" 
                                                                Text="Dirección :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="entrega_direcLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("entrega_direc") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel12" runat="server" CssClass="labelEs" 
                                                                Text="IMSI :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="record_imsiLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("record_imsi") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel51" runat="server" CssClass="labelEs" 
                                                                Text="Pueblo :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="entrega_puebloLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("entrega_pueblo") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel54" runat="server" CssClass="labelEs" 
                                                                Text="PIN :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label CssClass="labelEs" ID="record_pinLabel" runat="server" 
                                                    Text='<%# Bind("record_pin") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel52" runat="server" CssClass="labelEs" 
                                                                Text="Código postal :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="entrega_cpostalLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("entrega_cpostal") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel55" runat="server" CssClass="labelEs" 
                                                                Text="Fecha" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label CssClass="labelEs" ID="record_obsLabel" runat="server" 
                                                    Text='<%# Bind("record_obs") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel53" runat="server" CssClass="labelEs" 
                                                                Text="Referencia :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="entrega_referenciaLabel" runat="server" CssClass="labelEs" 
                                                                Text='<%# Bind("entrega_referencia") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel56" runat="server" CssClass="labelEs" 
                                                                Text="Fecha visita :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label CssClass="labelEs" ID="record_fechavisitaLabel" runat="server" 
                                                    Text='<%# Bind("record_fechavisita") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 40px;">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td colspan="4">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="2">
                                                            <asp:Label ID="codConsultoraRecLabel7" runat="server" 
                                                    CssClass="labelSubTituloDetalle" Text="Solicitante" />
                                                        </td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel73" runat="server" CssClass="labelEs" 
                                                    Text="Dirección :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="solicitante_direcLabel" runat="server" CssClass="labelEs" 
                                                    Text='<%# Bind("solicitante_direc") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel76" runat="server" CssClass="labelEs" 
                                                    Text="Código postal :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="solicitante_cpostalLabel" runat="server" CssClass="labelEs" 
                                                    Text='<%# Bind("solicitante_cpostal") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel74" runat="server" CssClass="labelEs" 
                                                    Text="Referencia :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label CssClass="labelEs" ID="solicitante_referenciaLabel" runat="server" 
                                                    Text='<%# Bind("solicitante_referencia") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel75" runat="server" CssClass="labelEs" 
                                                    Text="Pueblo :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="solicitante_puebloLabel" runat="server" CssClass="labelEs" 
                                                    Text='<%# Bind("solicitante_pueblo") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel58" runat="server" CssClass="labelEs" 
                                                    Text="Estado :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="solicitante_estadoLabel" runat="server" CssClass="labelEs" 
                                                    Text='<%# Bind("solicitante_estado") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel77" runat="server" CssClass="labelEs" 
                                                    Text="Ciudad :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="solicitante_ciudadLabel" runat="server" CssClass="labelEs" 
                                                    Text='<%# Bind("solicitante_ciudad") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel79" runat="server" CssClass="labelEs" 
                                                    Text="Municipalidad :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="solicitante_muniLabel" runat="server" CssClass="labelEs" 
                                                    Text='<%# Bind("solicitante_muni") %>' />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="codConsultoraRecLabel78" runat="server" CssClass="labelEs" 
                                                    Text="Provincia :" />
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="solicitante_provLabel" runat="server" CssClass="labelEs" 
                                                    Text='<%# Bind("solicitante_prov") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                <asp:Label ID="codConsultoraRecLabel7" runat="server" 
                                                    CssClass="labelSubTituloDetalle" Text="Seguimiento" />
                                    <br />
                
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                    CellPadding="4" DataSourceID="SqlSeguimientoTotal" ForeColor="#333333" 
                                    GridLines="None" AllowPaging="True" AllowSorting="True" Width="750px" CssClass="labelEs" 
            PageSize="25">
                <RowStyle BackColor="#dbdada"  CssClass="RowsTablas"/>
                <Columns>
                    <asp:BoundField DataField="Consultora_idConsultora" HeaderText="Consultora" 
                                            SortExpression="Consultora_idConsultora" 
                        ReadOnly="True" />
                    <asp:BoundField DataField="GerenteZona_idGerenteZona" HeaderText="Gerente Zona" 
                                            SortExpression="GerenteZona_idGerenteZona" 
                        ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" 
                                            SortExpression="Fecha" />
                    <asp:BoundField DataField="Observacion" HeaderText="Observación" 
                        SortExpression="Observacion" />
                </Columns>
                <FooterStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#7f7f7f" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#7f7f7f" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="#d2bedc" />
            </asp:GridView>
                            <asp:SqlDataSource ID="SqlSeguimientoTotal" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:BelcorpDBConn %>" 
                                
                                
                                SelectCommand="SELECT (SELECT codConsultora FROM Consultora WHERE (idConsultora = Segumiento.Consultora_idConsultora)) AS Consultora_idConsultora, (SELECT Codigo FROM GerenteZona WHERE (idGerenteZona = Segumiento.GerenteZona_idGerenteZona)) AS GerenteZona_idGerenteZona, Observacion, Fecha FROM Segumiento WHERE (Consultora_idConsultora = (SELECT Consultora_idConsultora FROM Segumiento AS Segumiento_1 WHERE (idSegumiento = @seguimiento)))">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="" Name="seguimiento" 
                                        QueryStringField="id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
        <tr>
            <td style="text-align: left" align="left">
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" PostBackUrl="~/Reportes/Evaluaciones.aspx" 
                            Text="Volver" CssClass="linkButtonFuncEs" />
            </td>
        </tr>
    </table>
   
</asp:Content>

