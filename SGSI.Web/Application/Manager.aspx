<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="MeuTcc.Application.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../JS/Telas.js" type="text/javascript"></script>
    <title>Manager</title>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server" DirectMethodNamespace="SGSI" Locale="pt-BR" Theme="Gray" />
    <ext:Store ID="storeProcedimentos" runat="server" AutoLoad="true">
        <Model>
            <ext:Model runat="server" IDProperty="ProcedimentoId">
                <Fields>
                    <ext:ModelField Name="ProcedimentoId" />
                    <ext:ModelField Name="Nome" />
                    <ext:ModelField Name="Norma" />
                    <ext:ModelField Name="DataInicial" />
                    <ext:ModelField Name="DataFinal" />
                    <ext:ModelField Name="Departamento" />
                    <ext:ModelField Name="ResponsavelAtual" />
                    <ext:ModelField Name="Cargo" />
                    <ext:ModelField Name="Situacao" />
                    <ext:ModelField Name="Progresso" />
                </Fields>
            </ext:Model>
        </Model>
    </ext:Store>
    <ext:TabPanel
        ID="TabPanel1"
        Region="Center"
        runat="server"
        Title="Manager Field"
        TitleAlign="Right">
        <TabBar>
            <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
            <ext:Button ID="Button1" runat="server" Flat="true" Text="Sair" Icon="Disconnect">
                <Listeners>
                    <Click Handler="Tcc.javaScript.ManagerExit();" />
                </Listeners>
            </ext:Button>
        </TabBar>
        <Items>
            <ext:Panel runat="server" Title="Dashboard">
            </ext:Panel>
            <ext:Hidden runat="server" ID="HUserName" />
            <%--###Tab de Procedimentos###--%>
            <ext:Panel ID="TabProcedimentos"
                runat="server"
                Title="Procedimentos"
                Icon="LayoutHeader">
                <LayoutConfig>
                    <ext:HBoxLayoutConfig Align="Stretch" />
                </LayoutConfig>
                <Items>
                    <ext:Toolbar runat="server" ID="Toolbar2" Flat="true" Layout="Container">
                        <Items>
                            <ext:Button ID="Button3" runat="server" Text="Novo Procedimento" Icon="Add">
                                <Listeners>
                                    <Click Handler="#{WinProcedimentos}.show();" />
                                </Listeners>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                    <ext:GridPanel
                        ID="GridProcedimentos"
                        runat="server"
                        RowLines="true"
                        Title="Normas Cadastradas"
                        TitleAlign="Center"
                        ColumnLines="true"
                        Width="1400"
                        Fixed="true"
                        StoreID="storeProcedimentos">
                        <ColumnModel>
                            <Columns>
                                <ext:RowNumbererColumn runat="server" Width="30" />
                                <ext:Column ID="ColumnProcId" runat="server" Text="Nome" Width="150" DataIndex="ProcedimentoId" Hidden="true" />
                                <ext:Column ID="ColumnNome" runat="server" Text="Nome" Width="150" DataIndex="Nome" />
                                <ext:Column ID="ColumnNorma" runat="server" Text="Norma" Width="150" DataIndex="Norma" />
                                <ext:DateColumn ID="ColumndtInicial" runat="server" Text="Data Inicial" DataIndex="DataInicial" />
                                <ext:DateColumn ID="ColumndtFInal" runat="server" Text="Data Final" DataIndex="DataFinal" />
                                <ext:Column ID="ColumnDepartamento" runat="server" Text="Departamento" Width="150" DataIndex="Departamento" />
                                <ext:Column ID="ColumnResponsalvel" runat="server" Text="Responsável atual" Width="150" DataIndex="ResponsavelAtual" />
                                <ext:Column ID="ColumnCargo" runat="server" Text="Cargo" Width="150" DataIndex="Cargo" />
                                <ext:Column ID="ColumnSituacao" runat="server" Text="Situacão" Width="150" DataIndex="Situacao" />
                                <ext:ProgressBarColumn ID="BarProgress" runat="server" Text="Progresso" Width="150" DataIndex="Progresso" />
                                <ext:CommandColumn runat="server" Width="100">
                                    <Commands>
                                        <ext:GridCommand Icon="Accept" ToolTip-Title="Aceitar" Hidden="true" />
                                        <ext:GridCommand Icon="Cancel" ToolTip-Title="Recusar" Hidden="true" />
                                        <ext:GridCommand Icon="ApplicationViewDetail" ToolTip-Title="Detalhes" />
                                        <ext:GridCommand Icon="UserGo" ToolTip-Title="Delegar" />

                                    </Commands>
                                    <PrepareToolbar Fn="Tcc.javaScript.desabilitarCommand" />
                                </ext:CommandColumn>

                            </Columns>
                        </ColumnModel>
                        <View>
                            <ext:GridView ID="GridView1" runat="server" ForceFit="true"/>
                            </View>

                        <BottomBar>
                            <ext:PagingToolbar ID="PagingToolbar3" runat="server" PageSize="2" />
                        </BottomBar>
                        <SelectionModel>
                            <ext:RowSelectionModel ID="RowSelectionModel3" runat="server" Mode="Multi">
                            </ext:RowSelectionModel>
                        </SelectionModel>
                        <ViewConfig StripeRows="true">
                        </ViewConfig>
                    </ext:GridPanel>
                </Items>
            </ext:Panel>
            <ext:Panel runat="server" Title="Normas"></ext:Panel>
            <ext:Panel runat="server" Title="Relatórios"></ext:Panel>

        </Items>

    </ext:TabPanel>

    <ext:Window runat="server" ID="ProcDetail" Title="Detalher" Height="500" Width="600">
        <Items>
            <ext:FormPanel ID="formDetalhesProc" runat="server">
                <Items>
                    <ext:TextField runat="server" FieldLabel="Procedimento" Disabled="true"/>

                </Items>
            </ext:FormPanel>
        </Items>

    </ext:Window>
</body>
</html>
