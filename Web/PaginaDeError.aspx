<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaginaDeError.aspx.cs" Inherits="Cuerpo"  %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sistema Proturismo</title>
<META HTTP-EQUIV="Cache-Control" CONTENT ="no-cache">
<script language="JavaScript" type="text/javascript" src="../javascript/funciones.js" ></script>
<script language="JavaScript" type="text/javascript">
iniciarScroll();
</script>

    <link href="../Imagenes/Estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table class="PrincipalTablaFondo">
            <tr>
                <td class="PrincipalCeldaSuperior">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="PrincipalCeldaCentro">
                    Ha Ocurrido un error al procesar los datos.<br />
                    <br />
                    <table border="0" style="width: 521px">
                        <tr>
                            <td class="TablaMensajeError" style="text-align: center">
                                <asp:Label ID="LabelError" runat="server" Text="Error"></asp:Label></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <a href="javascript:history.go(-1)">Haga click acá para regresar a la página web.</a><br />
                    <br />
                    Detalles:<br />
                    <br />
                    <table border="0" style="width: 521px">
                        <tr>
                            <td class="TablaMensajeError" style="text-align: center">
                                <asp:Label ID="LabelDetallesError" runat="server" Text="Error"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="PrincipalCeldaInferior">
                    Belcorp</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
