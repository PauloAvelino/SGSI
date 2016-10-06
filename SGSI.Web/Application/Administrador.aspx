<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="MeuTcc.Application.Administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Administrator</title>
    <link href="../Css/Css.css" rel="stylesheet" />

    <script src="../JS/Telas.js" type="text/javascript"></script>
</head>
<body>

        <ext:ResourceManager ID="ResourceManager1" runat="server" />
        <ext:TabPanel
            ID="TabPanel1"
            Region="Center"
            runat="server"
            Title="Area do Administrador"
            TitleAlign="Right">
            <TabBar>
                <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                <ext:Button ID="Button1" runat="server" Flat="true" Text="Sair"  Icon="Disconnect">
                 <Listeners>
                        <Click Handler="{Tcc.javaScript.teste()}"/>
                    </Listeners>
                </ext:Button>


            </TabBar>
            <Items>
                <ext:Panel
                    ID="Tab1"
                    runat="server"
                    Title="Usuários"
                    Icon="User"
                    Layout="FitLayout">
                    <Items>

                        <ext:Toolbar runat="server" ID="Botoes" Height="40">
                            <Items>

                                <ext:Button ID="NovoUsuario" runat="server" Text="Novo Usuário" Icon="Add"  >
                                    <Listeners>
                                        <Click Handler="{Tcc.javaScript.Teste()}"  />
                                    </Listeners>
                                </ext:Button>
                            </Items>
                        </ext:Toolbar>

                        <ext:GridPanel
                            ID="GridPanel1"
                            runat="server"
                            ColumnLines="true"
                            Width="400"
                            Height="350"
                            AutoRender="true">
                            <ColumnModel>
                                <Columns>
                                    <ext:Column ID="Column1" runat="server" Text="Nome" />
                                    <ext:Column ID="Column2" runat="server" Text="Departamento" Width="150" />
                                    <ext:Column ID="Column3" runat="server" Text="Cargo" />
                                    <ext:Column ID="Column4" runat="server" Text="E-mail" />
                                </Columns>
                            </ColumnModel>
                            <SelectionModel>
                                <ext:RowSelectionModel ID="RowSelectionModel1" runat="server">
                                </ext:RowSelectionModel>
                            </SelectionModel>
                            <ViewConfig StripeRows="true">
                            </ViewConfig>
                            <DockedItems>
                                <ext:Toolbar ID="Toolbar1" runat="server">
                                    <Items>
                                        <ext:ActionRef ID="ActionRef1" runat="server" />
                                        <ext:ActionRef ID="ActionRef2" runat="server" />
                                    </Items>
                                </ext:Toolbar>
                            </DockedItems>
                        </ext:GridPanel>
                    </Items>
                </ext:Panel>
                <ext:Panel
                    ID="Tab2"
                    runat="server"
                    Title="Normas"
                    Icon="Bookmark"
                    Layout="Fit">
                    <Items>
                        <%-- <ext:Portal
                                    ID="Portal2"
                                    runat="server"
                                    Border="false"
                                    BodyStyle="background-color: transparent;">
                                    <Items>
                                        <ext:PortalColumn ID="PortalColumn4" runat="server" />
                                        <ext:PortalColumn ID="PortalColumn5" runat="server">
                                            <Items>
                                                <ext:Portlet ID="Portlet6" Title="Panel 3" runat="server" />
                                                <ext:Portlet ID="Portlet7" Title="Another Panel 3" runat="server" />
                                            </Items>
                                        </ext:PortalColumn>
                                        <ext:PortalColumn ID="PortalColumn6" runat="server">
                                            <Items>
                                                <ext:Portlet ID="Portlet8" Title="Another Panel 1" runat="server" />
                                            </Items>
                                        </ext:PortalColumn>
                                    </Items>
                                </ext:Portal>--%>
                    </Items>
                </ext:Panel>
                <ext:Panel ID="Panel1"
                    runat="server"
                    Title="Auditoria"
                    Icon="Shield"
                    Layout="Fit">
                    <Items>
                        <%--<ext:Portal
                                    ID="Portal3"
                                    runat="server"
                                    Border="false"
                                    BodyStyle="background-color: transparent;">
                                    <Items>
                                        <ext:PortalColumn ID="PortalColumn7" runat="server">
                                            <Items>
                                                <ext:Portlet ID="Portlet9" runat="server" Title="My &quot;Fun&quot; Portlet" />
                                            </Items>
                                        </ext:PortalColumn>
                                        <ext:PortalColumn ID="PortalColumn8" runat="server" />
                                        <ext:PortalColumn ID="PortalColumn9" runat="server" />
                                    </Items>
                                </ext:Portal>--%>
                    </Items>
                </ext:Panel>
            </Items>
        </ext:TabPanel>

    <ext:Window runat="server" ID="FormUsuario" Hidden="true">
        <Items>
            <ext:FormPanel runat="server">
                <Items>
                    <ext:TextField runat="server" InputType="Password" FieldLabel="Teste"></ext:TextField>

                </Items>
            </ext:FormPanel>

        </Items>

    </ext:Window>
</body>
</html>
