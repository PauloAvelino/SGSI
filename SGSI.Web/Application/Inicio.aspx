<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="MeuTcc.Application.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../Css/Css.css" rel="stylesheet" />
</head>
<body>

    <ext:ResourceManager ID="ResourceManager1" runat="server" />

    <ext:Viewport ID="Viewport1" runat="server">
        <LayoutConfig>
            <ext:VBoxLayoutConfig Align="Center" Pack="Center" />
        </LayoutConfig>
        <Items>

            <ext:FormPanel ID="FormPanel1"
                runat="server"
                Title="Security Office"
                Width="350px"
                Frame="true"
                BodyPadding="10"
                DefaultAnchor="100%"
                TitleAlign="Center">
                <Items>

                    <ext:TextField ID="TextField1"
                        runat="server"
                        AllowBlank="false"
                        FieldLabel="E-mail"
                        Name="user"
                        EmptyText="e-mail" />

                    <ext:TextField ID="TextField2"
                        runat="server"
                        AllowBlank="false"
                        FieldLabel="Senha"
                        Name="pass"
                        EmptyText="senha"
                        InputType="Password" />
                </Items>

                <Buttons>
                    <ext:Button runat="server" Text="Entrar" Icon="Accept" StyleHtmlCls="min-width: 75px; right: auto; left: 306px; " />
                </Buttons>

            </ext:FormPanel>
        </Items>
    </ext:Viewport>

</body>
</html>
