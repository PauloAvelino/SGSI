<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="SGSI.Web.Application.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../JS/Telas.js" type="text/javascript"></script>
    <title>Manager</title>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server" DirectMethodNamespace="SGSI" Locale="pt-BR" Theme="Default" />
     <ext:Store ID="storeProcedimentos" runat="server" AutoLoad="true">
            <Model>
                <ext:Model runat="server" IDProperty="ProcedimentoId">
                    <Fields>
                        <ext:ModelField Name="Descricao" />
                        <ext:ModelField Name="Solicitante" />
                        <ext:ModelField Name="ProcedimentoId" />
                        <ext:ModelField Name="Nome" />
                        <ext:ModelField Name="Norma" />
                        <ext:ModelField Name="DataInicial" Type="Date" />
                        <ext:ModelField Name="DataFinal" Type="Date" />
                        <ext:ModelField Name="Departamento" />
                        <ext:ModelField Name="ResponsavelAtual" />
                        <ext:ModelField Name="Cargo" />
                        <ext:ModelField Name="Situacao" />
                        <ext:ModelField Name="Progresso" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>
     <ext:Store ID="storeHistoricoProc" runat="server" AutoLoad="true">
            <Model>
                <ext:Model runat="server" IDProperty="HistoricoId">
                    <Fields>
                        <ext:ModelField Name="HistoricoId" />
                        <ext:ModelField Name="ProcedimentoId" />
                        <ext:ModelField Name="Usuario" />
                        <ext:ModelField Name="DataHistorico" Type="Date" />
                        <ext:ModelField Name="Atualizacao" />
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
                                    Width="1300"
                                    Fixed="true"
                                    StoreID="storeProcedimentos">
                                    <ColumnModel>
                                        <Columns>
                                            <ext:RowNumbererColumn runat="server" Width="30" />
                                            <ext:Column ID="ColumnProcId" runat="server" Text="Id" Width="150" DataIndex="ProcedimentoId" Hidden="true" />
                                            <ext:Column ID="ColumnSolicitante" runat="server" Text="Solicitante" Width="150" DataIndex="Solicitante" Hidden="true" />
                                            <ext:Column ID="ColumnDescricao" runat="server" Text="Descricao" Width="150" DataIndex="Descricao" Hidden="true" />
                                            <ext:Column ID="ColumnNome" runat="server" Text="Nome" Width="150" DataIndex="Nome" />
                                            <ext:Column ID="ColumnNorma" runat="server" Text="Norma" Width="150" DataIndex="Norma" />
                                            <ext:DateColumn ID="ColumndtInicial" runat="server" Text="Data Inicial" DataIndex="DataInicial" />
                                            <ext:DateColumn ID="ColumndtFInal" runat="server" Text="Data Final" DataIndex="DataFinal" />
                                            <ext:Column ID="ColumnDepartamento" runat="server" Text="Departamento" Width="150" DataIndex="Departamento" />
                                            <ext:Column ID="ColumnResponsalvel" runat="server" Text="Responsável atual" Width="150" DataIndex="ResponsavelAtual" />
                                            <ext:Column ID="ColumnCargo" runat="server" Text="Cargo" Width="150" DataIndex="Cargo" />
                                            <ext:Column ID="ColumnSituacao" runat="server" Text="Situacão" Width="150" DataIndex="Situacao" />
                                            <ext:ProgressBarColumn ID="BarProgress" runat="server" Text="Progresso" Width="150" DataIndex="Progresso" />
                                            <ext:CommandColumn runat="server">
                                                <Commands>
                                                    <ext:GridCommand ToolTip-Title="Detalhes" CommandName="Detalhes" Icon="ApplicationViewDetail" />
                                                    <ext:GridCommand ToolTip-Title="Aceitar" Icon="Accept" />
                                                    <ext:GridCommand ToolTip-Title="Recusar" Icon="Cancel" />
                                                </Commands>
                                                <Listeners>
                                                    <Command Handler="Tcc.javaScript.gridProcedimentos(command, record, #{storeUsuarios}, #{WinDetalhes}, #{FormDetalhes});" />
                                                </Listeners>
                                            </ext:CommandColumn>
                                        </Columns>

                                    </ColumnModel>
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

    <%--Janela de detalhes do procedimentos--%>
    <ext:Window runat="server" ID="WinDetalhes" Title="Detalhes" Closable="false" TitleAlign="Center" AutoHeight="true" Padding="5" Hidden="true" Modal="true" Width="800px" Height="650px">
        <Items>
            <ext:FormPanel runat="server" ID="FormDetalhes" Border="false" Frame="true" BodyPadding="10" DefaultAnchor="100%">
                <FieldDefaults
                    LabelAlign="Top"
                    LabelWidth="100"
                    LabelStyle="font-weight:bold;" />
                <Defaults>
                    <ext:Parameter Name="margin" Value="0 0 10 0" Mode="Value" />
                </Defaults>
                <Items>
                    <ext:FieldContainer
                        runat="server"
                        Padding="10"
                        LabelStyle="font-weight:bold;padding:0;"
                        Layout="HBoxLayout">
                        <FieldDefaults LabelAlign="Top" />
                        <Items>
                            <ext:TextField runat="server" ID="TextField2" Width="50" FieldLabel="Id" MarginSpec="0 0 0 10" Editable="false" DataIndex="ProcedimentoId" />
                            <ext:TextField runat="server" ID="TextField1" Width="100" FieldLabel="Solicitante" MarginSpec="0 0 0 10" Editable="false" DataIndex="Solicitante" />
                          
                        </Items>
                    </ext:FieldContainer>
                    <ext:FieldContainer
                        runat="server"
                        Padding="10"
                        LabelStyle="font-weight:bold;padding:0;"
                        Layout="HBoxLayout">
                        <FieldDefaults LabelAlign="Top" />
                        <Items>
                            <ext:DateField runat="server" ID="DateField1" FieldLabel="Data Inicial" MarginSpec="0 0 0 10" Selectable="false" Format="dd/MM/yyyy" Editable="false" DataIndex="DataInicial" />
                            <ext:DateField runat="server" ID="DateField2" FieldLabel="Data Final" MarginSpec="0 0 0 10" Selectable="false" Editable="false" Format="dd/MM/yyyy" DataIndex="DataFinal" />
                        </Items>
                    </ext:FieldContainer>
                    <ext:FieldContainer
                        runat="server"
                        Padding="10"
                        LabelStyle="font-weight:bold;padding:0;"
                        Layout="HBoxLayout">
                        <FieldDefaults LabelAlign="Top" />
                        <Items>
                            <ext:TextArea runat="server" MarginSpec="0 20 0 10" Padding="10" FieldLabel="Descrição" ID="TextArea1" Width="450" MaxLengthText="250" Editable="false" DataIndex="Descricao" />
                         <ext:Button runat="server" ID="btnNorma"  Icon="PageWhiteAcrobat" IconAlign="top" Text="Norma" TextAlign="Center" MarginSpec="0 0 0 80"/>
                             </Items>
                    </ext:FieldContainer>
                </Items>
            </ext:FormPanel>
            <ext:GridPanel
                ID="GridHistoricoProcedimentos"
                runat="server"
                RowLines="true"
                Title="Histórico do Procedimento"
                TitleAlign="Center"
                ColumnLines="true"
                DefaultAnchor="100%"
                Fixed="true"
                StoreID="storeHistoricoProc">
                <ColumnModel>
                    <Columns>
                        <ext:RowNumbererColumn runat="server" Width="30" />
                        <ext:Column ID="Column5" runat="server" Text="HistoricoId" DataIndex="HistoricoId" Width="150" Hidden="true" />
                        <ext:Column runat="server" Text="ProcedimentoId" DataIndex="ProcedimentoId" />
                        <ext:DateColumn ID="DateColumN1" runat="server" Format="dd/MM/yyyy HH:mm" Text="Data da Atualização" DataIndex="DataHistorico" Width="200" />
                        <ext:Column ID="Column6" runat="server" Text="Usuario" DataIndex="Usuario" Width="170" />
                        <ext:Column ID="Column7" runat="server" Text="Atualizacao" DataIndex="Atualizacao" Width="170" />
                    </Columns>
                </ColumnModel>
                <BottomBar>
                    <ext:PagingToolbar ID="PagingToolbar4" runat="server" PageSize="2" />
                </BottomBar>
                <SelectionModel>
                    <ext:RowSelectionModel ID="RowSelectionModel4" runat="server" Mode="Multi">
                    </ext:RowSelectionModel>
                </SelectionModel>
                <ViewConfig StripeRows="true">
                </ViewConfig>
            </ext:GridPanel>
        </Items>
        <Buttons>
            <ext:Button runat="server" Text="Salvar" Icon="Accept">
                <Listeners>
                    <Click Handler="if(#{FormProcedimentos}.isValid()) {Tcc.javaScript.salvarProcedimento(#{TextProcNome}.getValue(), #{CmbProcNorma}.getValue(), #{CmbProcDepartamentos}.getValue(),
                                        #{DateProcInicial}.getValue(), #{DateProcFinal}.getValue(), #{TextDescricao}.getValue(), #{WinProcedimentos}, #{storeProcedimentos})};" />
                </Listeners>
            </ext:Button>
            <ext:Button runat="server" Text="Fechar" Icon="Decline">
                <Listeners>
                    <Click Handler="#{WinDetalhes}.hide();" />
                </Listeners>
            </ext:Button>
        </Buttons>
    </ext:Window>

   
</body>
</html>
