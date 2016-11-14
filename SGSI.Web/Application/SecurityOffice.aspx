<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecurityOffice.aspx.cs" Inherits="SGSI.Web.Application.SecurityOffice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Security Office</title>
    <script src="../JS/Telas.js"></script>

</head>
<body>
    <ext:ResourceManager ID="ResourceManager2" runat="server" DirectMethodNamespace="SGSI" Locale="pt-BR" Theme="Gray" />

    <form id="form1" runat="server">

        <ext:Store ID="storeUsuarios" runat="server" OnReadData="CarregaUsuarios" AutomaticResponseValues="true">
            <Model>
                <ext:Model runat="server" IDProperty="Nome">
                    <Fields>
                        <ext:ModelField Name="Nome" />
                        <ext:ModelField Name="Departamento" />
                        <ext:ModelField Name="Cargo" />
                        <ext:ModelField Name="Email" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>
        <ext:Store ID="storeProcedimentos" runat="server" AutoLoad="true">
            <Model>
                <ext:Model runat="server" IDProperty="ProcedimentoId">
                    <Fields>
                        <ext:ModelField Name="Descricao" />
                        <ext:ModelField Name="Solicitante" />
                        <ext:ModelField Name="ProcedimentoId" />
                        <ext:ModelField Name="DepartamentoId" Type="Int" />
                        <ext:ModelField Name="Nome" />
                        <ext:ModelField Name="Norma" />
                        <ext:ModelField Name="DataInicial" Type="Date" />
                        <ext:ModelField Name="DataFinal" Type="Date" />
                        <ext:ModelField Name="Departamento" />
                        <ext:ModelField Name="ResponsavelAtual" />
                        <ext:ModelField Name="Cargo" />
                        <ext:ModelField Name="Situacao" />
                        <ext:ModelField Name="Progresso" />
                        <ext:ModelField Name="Caminho" />
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
        <ext:Store ID="storeCmbNormas" runat="server" AutoLoad="true">
            <Model>
                <ext:Model runat="server" IDProperty="Nome">
                    <Fields>
                        <ext:ModelField Name="Nome" Type="String" />
                        <ext:ModelField Name="Caminho" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>
        <ext:Store ID="storeDepartamentos" runat="server" AutoLoad="true">
            <Model>
                <ext:Model runat="server" IDProperty="Id">
                    <Fields>
                        <ext:ModelField Name="Id" Type="Int" />
                        <ext:ModelField Name="Nome" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>
        <ext:Store ID="storeGrupoUsuarios" runat="server" AutoLoad="true">
            <Model>
                <ext:Model runat="server" IDProperty="AcessoId">
                    <Fields>
                        <ext:ModelField Name="AcessoId" Type="Int" />
                        <ext:ModelField Name="Descricao" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>
        <ext:Store ID="storeFuncionarios" runat="server" AutoLoad="true">
            <Model>
                <ext:Model runat="server" IDProperty="Nome">
                    <Fields>
                        <ext:ModelField Name="Nome" Type="String" />
                        <ext:ModelField Name="Email" Type="String" />
                        <ext:ModelField Name="Cargo" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>
        <ext:Store ID="storeCarregaNormas" runat="server" AutoLoad="true">
            <Model>
                <ext:Model runat="server" IDProperty="Nome">
                    <Fields>
                        <ext:ModelField Name="NormaId" />
                        <ext:ModelField Name="Nome" />
                        <ext:ModelField Name="Caminho" />
                        <ext:ModelField Name="Criacao" Type="Date" />
                        <ext:ModelField Name="Autor" />
                        <ext:ModelField Name="Atualizacao" Type="Date" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>
        <ext:Hidden runat="server" ID="HUserName" />
        <ext:Viewport runat="server" Layout="FitLayout" Region="Center">
            <Items>
                <ext:TabPanel
                    ID="TabPanel1"
                    Region="Center"
                    runat="server"
                    Title="Sistema de Gestão de Segurança da Informação"
                    TitleAlign="Center"
                    AnchorHeight="200">

                    <TabBar>
                        <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                        <ext:Label ID="LabelEmail" runat="server" Icon="User" MarginSpec="10 10 10 10" />
                        <ext:Button ID="Button1" runat="server" Flat="true" Text="Sair" Icon="Disconnect" MarginSpec="10 10 10 10">
                            <Listeners>
                                <Click Handler="Tcc.javaScript.logout();" />
                            </Listeners>
                        </ext:Button>
                    </TabBar>
                    <Items>

                        <%--###Tab de Procedimentos###--%>
                        <ext:Panel ID="TabProcedimentos"
                            runat="server"
                            Title="Procedimentos"
                            Icon="LayoutHeader">
                            <DockedItems>
                                <ext:Toolbar runat="server" Dock="top" Width="50">
                                    <Items>
                                        <ext:Button ID="Button3" runat="server" Text="Novo Procedimento" Icon="Add">
                                            <Listeners>
                                                <Click Handler="#{FormProcedimentos}.reset(), #{WinProcedimentos}.show();" />
                                            </Listeners>
                                        </ext:Button>
                                    </Items>
                                </ext:Toolbar>
                            </DockedItems>
                            <LayoutConfig>
                                <ext:HBoxLayoutConfig Align="Stretch" />
                            </LayoutConfig>
                            <Items>
                                <ext:Container runat="server" ID="Container1" Layout="FitLayout" ResizeHandles="All" HeightSpec="100%" WidthSpec="100%" StyleSpec="Width:100%" MonitorResize="true" AnchorVertical="100%" AnchorHorizontal="100%" Region="Center">
                                    <Items>
                                        <ext:GridPanel
                                            ID="GridProcedimentos"
                                            RowLines="true"
                                            Title="Normas Cadastradas"
                                            TitleAlign="Center"
                                            Header="true"
                                            TrackMouseOver="false"
                                            runat="server"
                                            TitleCollapse="false"
                                            Collapsible="false"
                                            AutoFill="false"
                                            MonitorResize="true"
                                            Stateful="true"
                                            EnableColumnHide="true"
                                            WidthSpec="100%"
                                            StoreID="storeProcedimentos">
                                            <ColumnModel>
                                                <Columns>
                                                    <ext:RowNumbererColumn runat="server" Width="30" />
                                                    <ext:Column ID="ColumnProcId" runat="server" Text="Id" Width="150" DataIndex="ProcedimentoId" Hidden="true" />
                                                    <ext:Column ID="ColumnDpId" runat="server" Text="DpId" Width="150" DataIndex="DepartamentoId" Hidden="true" />
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
                                                    <ext:Column ID="Column8" runat="server" Text="Situacão" Width="150" DataIndex="Caminho" Hidden="true" />
                                                    <ext:CommandColumn runat="server">
                                                        <Commands>
                                                            <ext:GridCommand ToolTip-Title="Detalhes" CommandName="Detalhes" Icon="ApplicationViewDetail" />
                                                            <ext:GridCommand ToolTip-Title="Aceitar" CommandName="Aceitar" Icon="Accept" Hidden="true" />
                                                            <ext:GridCommand ToolTip-Title="Recusar" CommandName="Recusar" Icon="Cancel" Hidden="true" />
                                                            <ext:GridCommand ToolTip-Title="Delegar" CommandName="Delegar" Icon="UserGo" Hidden="true" />
                                                            <ext:GridCommand ToolTip-Title="Apagar" CommandName="Apagar" Icon="Delete" Hidden="true" />
                                                        </Commands>
                                                        <PrepareToolbar Fn="Tcc.javaScript.desabilitarCommand" />

                                                        <Listeners>
                                                            <Command Handler="Tcc.javaScript.gridProcedimentos(command, record, #{WinDetalhes}, #{FormDetalhes});" />
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
                                </ext:Container>
                            </Items>
                        </ext:Panel>

                        <%--##Tab normas##--%>
                        <ext:Panel
                            ID="TabNormas"
                            runat="server"
                            Title="Normas"
                            Icon="Bookmark">
                            <DockedItems>
                                <ext:Toolbar runat="server" Dock="top" Width="50">
                                    <Items>
                                        <ext:Button ID="Button2" runat="server" Text="Nova norma" Icon="Add">
                                            <Listeners>
                                                <Click Handler="#{FormNorma}.reset(), #{WinNorma}.show();" />
                                            </Listeners>
                                        </ext:Button>
                                    </Items>
                                </ext:Toolbar>
                            </DockedItems>
                            <LayoutConfig>
                                <ext:HBoxLayoutConfig Align="Stretch" />
                            </LayoutConfig>
                            <Items>
                                <ext:Container runat="server" ID="Container2" Layout="FitLayout" ResizeHandles="All" HeightSpec="100%" WidthSpec="100%" StyleSpec="Width:100%" MonitorResize="true" AnchorVertical="100%" AnchorHorizontal="100%" Region="Center">
                                    <Items>
                                        <ext:GridPanel
                                            ID="GridNormas"
                                            runat="server"
                                            RowLines="true"
                                            Title="Normas Cadastradas"
                                            TitleAlign="Center"
                                            TitleCollapse="false"
                                            Collapsible="false"
                                            AutoFill="false"
                                            MonitorResize="true"
                                            Stateful="true"
                                            EnableColumnHide="true"
                                            WidthSpec="100%"
                                            StoreID="storeCarregaNormas">
                                            <ColumnModel>
                                                <Columns>
                                                    <ext:RowNumbererColumn runat="server" Width="30" />
                                                    <ext:Column ID="ClnNormasNome" runat="server" Text="Nome" DataIndex="Nome" Width="150" />
                                                    <ext:Column runat="server" DataIndex="Caminho" Hidden="true" />
                                                    <ext:DateColumn ID="DateColumNormasCriac" runat="server" Format="dd/MM/yyyy HH:mm" Text="Data de Criação" DataIndex="Criacao" Width="200" />
                                                    <ext:Column ID="ClnNormasAutor" runat="server" Text="Autor" DataIndex="Autor" Width="170" />
                                                    <ext:DateColumn ID="DateColumNormasAtuali" runat="server" Format="dd/MM/yyyy HH:mm" Text="Data de Atualização" DataIndex="Atualizacao" Width="200" EmptyCellText="Não alterado" />
                                                    <ext:CommandColumn runat="server" Width="65" Text="Anexos">
                                                        <Commands>
                                                            <ext:GridCommand Icon="PageWhiteAcrobat" CommandName="Norma" ToolTip-Text="Ver Norma" />
                                                        </Commands>
                                                        <Listeners>
                                                            <Command Handler="Tcc.javaScript.gridNormas(command, record);" />
                                                        </Listeners>
                                                    </ext:CommandColumn>
                                                </Columns>
                                            </ColumnModel>
                                            <BottomBar>
                                                <ext:PagingToolbar ID="PagingToolbar2" runat="server" PageSize="2" />
                                            </BottomBar>
                                            <SelectionModel>
                                                <ext:RowSelectionModel ID="RowSelectionModel2" runat="server" Mode="Multi">
                                                </ext:RowSelectionModel>
                                            </SelectionModel>
                                            <ViewConfig StripeRows="true">
                                            </ViewConfig>
                                        </ext:GridPanel>
                                    </Items>
                                </ext:Container>
                            </Items>
                        </ext:Panel>

                        <%--###Tab de Auditoria###--%>
                        <ext:Panel ID="TabAuditoria"
                            runat="server"
                            Title="Auditoria"
                            Icon="Shield"
                            Layout="Fit">
                        </ext:Panel>


                        <%--###Tab de Usuarios###--%>
                        <ext:Panel
                            ID="TabUsuarios"
                            runat="server"
                            Title="Usuários"
                            Icon="User"
                            MonitorResize="true"
                            Stateful="true"
                            EnableColumnHide="true"
                            WidthSpec="100%">
                            <DockedItems>
                                <ext:Toolbar runat="server" Dock="top" Width="50">
                                    <Items>
                                        <ext:Button ID="NovoUsuario" runat="server" Text="Novo Usuário" Icon="Add">
                                            <Listeners>
                                                <Click Handler="Tcc.javaScript.abrirFormUser(#{WinUsuario}, #{CadastroUsuario});" />
                                            </Listeners>
                                        </ext:Button>
                                    </Items>
                                </ext:Toolbar>
                            </DockedItems>
                            <LayoutConfig>
                                <ext:HBoxLayoutConfig Align="Stretch" />
                            </LayoutConfig>
                            <Items>
                                <ext:Container runat="server" ID="Container3" Layout="FitLayout" ResizeHandles="All" HeightSpec="100%" WidthSpec="100%" StyleSpec="Width:100%" MonitorResize="true" AnchorVertical="100%" AnchorHorizontal="100%" Region="Center">

                                    <Items>
                                        <ext:GridPanel
                                            ID="GridUsuarios"
                                            runat="server"
                                            RowLines="true"
                                            Title="Usuarios Cadastrados"
                                            TitleAlign="Center"
                                            ColumnLines="true"
                                            Width="825"
                                            StoreID="storeUsuarios">
                                            <ColumnModel>
                                                <Columns>
                                                    <ext:RowNumbererColumn runat="server" Width="30" />
                                                    <ext:Column ID="Column1" runat="server" Text="Nome" DataIndex="Nome" Width="150" />
                                                    <ext:Column ID="Column2" runat="server" Text="Departamento" DataIndex="Departamento" Width="200" />
                                                    <ext:Column ID="Column3" runat="server" Text="Cargo" DataIndex="Cargo" Width="150" />
                                                    <ext:Column ID="Column4" runat="server" Text="E-mail" DataIndex="Email" Width="230" />
                                                    <ext:CommandColumn runat="server" Width="65">
                                                        <Commands>
                                                            <ext:GridCommand Icon="Delete" CommandName="Apagar" ToolTip-Text="Apagar" />
                                                            <ext:GridCommand Icon="Key" CommandName="Senha" ToolTip-Text="Alterar Senha" />
                                                        </Commands>
                                                        <Listeners>
                                                            <Command Handler="Tcc.javaScript.gridUsuarios(command, record, #{storeUsuarios}, #{WinAtualizarSenha}, #{formSenha});" />
                                                        </Listeners>
                                                    </ext:CommandColumn>
                                                </Columns>
                                            </ColumnModel>
                                            <BottomBar>
                                                <ext:PagingToolbar ID="PagingToolbar1" runat="server" PageSize="2" />
                                            </BottomBar>
                                            <SelectionModel>
                                                <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" Mode="Multi">
                                                </ext:RowSelectionModel>
                                            </SelectionModel>
                                            <ViewConfig StripeRows="true">
                                            </ViewConfig>
                                        </ext:GridPanel>
                                    </Items>
                                </ext:Container>
                            </Items>
                        </ext:Panel>

                    </Items>
                </ext:TabPanel>

                <%--Janela cadastro de norma--%>
                <ext:Window runat="server" ID="WinNorma" Title="Cadastro de Norma" Closable="false" TitleAlign="Center" AutoHeight="true" Padding="5" Modal="true" Width="400px" Height="350px" Hidden="true">
                    <Items>
                        <ext:FormPanel runat="server" ID="FormNorma" Padding="10" Collapsed="false" Width="350" Height="300">
                            <Items>
                                <ext:TextField runat="server" ID="TextNomeNorma" FieldLabel="Nome" />
                                <ext:FileUploadField runat="server" ID="UploadNorma" FieldLabel="Selecionar" Icon="PageWhiteAcrobat" />

                            </Items>
                            <Buttons>
                                <ext:Button runat="server" Text="Salvar" Icon="Accept">
                                    <Listeners>
                                        <Click Handler="if(#{FormNorma}.isValid()) {Tcc.javaScript.salvarNorma(#{TextNomeNorma}.getValue())};" />
                                    </Listeners>
                                </ext:Button>
                                <ext:Button runat="server" Text="Fechar" Icon="Decline">
                                    <Listeners>
                                        <Click Handler="#{WinNorma}.hide();" />
                                    </Listeners>
                                </ext:Button>
                            </Buttons>
                        </ext:FormPanel>
                    </Items>
                </ext:Window>

                <%--###Janela de cadastro de Usuario###--%>
                <ext:Window runat="server" ID="WinUsuario" Title="Cadastro de usuário" Closable="false" TitleAlign="Center" AutoHeight="true" Padding="5" Modal="true" Width="400px" Height="350px" Hidden="true">
                    <Items>
                        <ext:FormPanel runat="server" ID="CadastroUsuario" Padding="10" Collapsed="false" Width="350" Height="300">
                            <Items>
                                <ext:ComboBox runat="server" ID="CmbNewUserDpto" Editable="false" FieldLabel="Departamento" Anchor="100%" StoreID="storeDepartamentos"
                                    ValueField="Id" DisplayField="Nome" EmptyText="Selecione um Departamento">
                                    <Listeners>
                                        <Select Handler="Tcc.javaScript.carregaFunc(#{CmbNewUserDpto}.getValue())" />
                                    </Listeners>
                                </ext:ComboBox>
                                <ext:ComboBox runat="server" ID="CmbNewUserNome" FieldLabel="Nome" Editable="false" AllowBlank="false" StoreID="storeFuncionarios" DataIndex="Nome" DisplayField="Nome" EmptyText="Carregando...">
                                    <Listeners>
                                        <Select Handler="Tcc.javaScript.carregaEmail(#{CmbNewUserNome}.getValue(), #{CmbNewUserDpto}.getValue())" />
                                    </Listeners>
                                </ext:ComboBox>
                                <ext:TextField runat="server" ID="TextNewUserEmail" FieldLabel="E-mail" Editable="false" />
                                <ext:TextField runat="server" ID="TextNewUserCargo" FieldLabel="Cargo" Editable="false" />
                                <ext:ComboBox runat="server" ID="CmbNewUserTipo" FieldLabel="Permissão" Editable="false" AllowBlank="false" StoreID="storeGrupoUsuarios" DataIndex="Descricao" DisplayField="Descricao" ValueField="AcessoId" EmptyText="Carregando..." />
                                <ext:TextField runat="server" ID="TextNewUserSenha" InputType="Password" MaxLengthText="10" FieldLabel="Senha" AllowBlank="false" />
                            </Items>
                            <Buttons>
                                <ext:Button runat="server" Text="Salvar" Icon="Accept">
                                    <Listeners>
                                        <Click Handler="if(#{CadastroUsuario}.isValid()) {Tcc.javaScript.cadastroUsuario(#{CmbNewUserDpto}.getValue(), #{CmbNewUserNome}.getValue(), #{TextNewUserEmail}.getValue(),
                                        #{TextNewUserCargo}.getValue(), #{CmbNewUserTipo}.getValue(), #{TextNewUserSenha}.getValue(), #{WinUsuario}, #{storeUsuarios})};" />
                                    </Listeners>
                                </ext:Button>
                                <ext:Button runat="server" Text="Fechar" Icon="Decline">
                                    <Listeners>
                                        <Click Handler="#{WinUsuario}.hide();" />
                                    </Listeners>
                                </ext:Button>
                            </Buttons>
                        </ext:FormPanel>
                    </Items>
                </ext:Window>

                <%--###Janela de alteração de senha###--%>
                <ext:Window runat="server" ID="WinAtualizarSenha" Width="300" Height="250" Modal="true" Hidden="true" Title="Alterar Senha" Padding="5" TitleAlign="Center" Closable="false">
                    <Items>
                        <ext:FormPanel runat="server" ID="formSenha" Width="300" Height="200" Padding="10">
                            <Items>
                                <ext:TextField runat="server" ID="TextAlerarSenha" InputType="Password" MaxLength="10" MaxLengthText="10" FieldLabel="Nova Senha" Anchor="80%" />
                                <ext:TextField runat="server" ID="TextEmailSenha" Editable="false" DataIndex="Email" Hidden="true" FieldLabel="E-mail" />
                            </Items>
                            <Buttons>
                                <ext:Button runat="server" ID="btnSalvarSenha" Text="Salvar">
                                    <Listeners>
                                        <Click Handler="Tcc.javaScript.alterarSenha(#{TextEmailSenha}.getValue(), #{TextAlerarSenha}.getValue(), #{WinAtualizarSenha});" />
                                    </Listeners>
                                </ext:Button>
                                <ext:Button runat="server" ID="btnFecharSenha" Text="Fechar">
                                    <Listeners>
                                        <Click Handler="#{WinAtualizarSenha}.hide()" />
                                    </Listeners>
                                </ext:Button>
                            </Buttons>
                        </ext:FormPanel>
                    </Items>
                </ext:Window>

                <%--Janela de procedimentos--%>
                <ext:Window runat="server" ID="WinProcedimentos" Title="Cadastro de Procedimento" Closable="false" TitleAlign="Center" AutoHeight="true" Padding="5" Modal="true" Width="600px" Height="450px" Hidden="true">
                    <Items>
                        <ext:FormPanel runat="server" ID="FormProcedimentos" Border="false" Frame="true" BodyPadding="10" DefaultAnchor="100%">
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
                                        <ext:TextField runat="server" ID="TextProcNome" Width="200" FieldLabel="Nome" MarginSpec="0 0 0 10" />
                                    </Items>
                                </ext:FieldContainer>
                                <ext:FieldContainer
                                    runat="server"
                                    Padding="10"
                                    LabelStyle="font-weight:bold;padding:0;"
                                    Layout="HBoxLayout">
                                    <FieldDefaults LabelAlign="Top" />
                                    <Items>
                                        <ext:ComboBox runat="server" ID="CmbProcNorma" Editable="false" FieldLabel="Norma" Width="200" StoreID="storeCmbNormas"
                                            ValueField="Nome" DisplayField="Nome" EmptyText="Selecione uma Norma" MarginSpec="0 0 0 10" />
                                        <ext:ComboBox runat="server" ID="CmbProcDepartamentos" Width="200" Editable="false" FieldLabel="Departamento" StoreID="storeDepartamentos"
                                            ValueField="Id" DisplayField="Nome" EmptyText="Selecione um Departamento" MarginSpec="0 0 0 40" />
                                    </Items>
                                </ext:FieldContainer>
                                <ext:FieldContainer
                                    runat="server"
                                    Padding="10"
                                    LabelStyle="font-weight:bold;padding:0;"
                                    Layout="HBoxLayout">
                                    <FieldDefaults LabelAlign="Top" />
                                    <Items>
                                        <ext:DateField runat="server" ID="DateProcInicial" FieldLabel="Data Inicial" MarginSpec="0 0 0 10" />
                                        <ext:DateField runat="server" ID="DateProcFinal" FieldLabel="Data Final" MarginSpec="0 0 0 40" />
                                    </Items>
                                </ext:FieldContainer>
                                <ext:TextArea runat="server" MarginSpec="0 20 0 10" Padding="10" FieldLabel="Descrição" ID="TextDescricao" MaxLengthText="250" AllowBlank="false" />

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
                                        <Click Handler="#{WinProcedimentos}.hide();" />
                                    </Listeners>
                                </ext:Button>
                            </Buttons>
                        </ext:FormPanel>
                    </Items>
                </ext:Window>

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
                                    </Items>
                                </ext:FieldContainer>
                                <ext:FieldContainer
                                    runat="server"
                                    Padding="10"
                                    LabelStyle="font-weight:bold;padding:0;"
                                    Layout="HBoxLayout">
                                    <FieldDefaults LabelAlign="Top" />
                                    <Items>
                                        <ext:TextField runat="server" Hidden="true" ID="Caminhotxt" DataIndex="Caminho" />
                                        <ext:Button runat="server" Text="Abrir norma" MarginSpec="0 0 0 10" Icon="PageWhiteAcrobat">
                                            <Listeners>
                                                <Click Handler="Tcc.javaScript.abrirNorma(#{Caminhotxt}.getValue());" />
                                            </Listeners>
                                        </ext:Button>
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

            </Items>
        </ext:Viewport>

    </form>
</body>
</html>
