<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server" CssClass="lblMsjCargaError" 
            Text="Ha ocurrido un error inesperado. Por favor, si el problema persiste, comuniquese con el Administrador de la página."></asp:Label>
    </p>
</asp:Content>

