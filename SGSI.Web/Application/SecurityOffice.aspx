<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecurityOffice.aspx.cs" Inherits="SGSI.Web.Application.SecurityOffice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Security Office</title>
    <script src="../JS/Telas.js" type="text/javascript"></script>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager2" runat="server" DirectMethodNamespace="SGSI" Locale="pt-BR" />
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

        <ext:TabPanel
            ID="TabPanel1"
            Region="Center"
            runat="server"
            Title="Area do Administrador"
            TitleAlign="Right"
            Fixed="true">
            <TabBar>
                <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                <ext:Button ID="Button1" runat="server" Flat="true" Text="Sair" Icon="Disconnect">
                    <Listeners>
                        <Click Handler="#{storeUsuarios}.reload();" />
                    </Listeners>
                </ext:Button>
            </TabBar>
            <Items>

                <%--###Tab de Usuarios###--%>
                <ext:Panel
                    ID="TabUsuarios"
                    runat="server"
                    Title="Usuários"
                    Icon="User"
                    Fixed="true">
                    <Items>
                        <ext:Toolbar runat="server" ID="Botoes" Height="40">
                            <Items>
                                <ext:Button ID="NovoUsuario" runat="server" Text="Novo Usuário" Icon="Add">
                                    <Listeners>
                                        <Click Handler="Tcc.javaScript.AbrirFormUser(#{WinUsuario}, #{CadastroUsuario});" />
                                    </Listeners>
                                </ext:Button>
                            </Items>
                        </ext:Toolbar>
                        <ext:FormPanel runat="server">
                            <Items>
                                <ext:GridPanel
                                    ID="GridPanel1"
                                    runat="server"
                                    RowLines="true"
                                    ColumnLines="true"
                                    Height="500"
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
                                        <ext:PagingToolbar ID="PagingToolbar1" runat="server" PageSize="10" />
                                    </BottomBar>
                                    <SelectionModel>
                                        <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" Mode="Multi">
                                        </ext:RowSelectionModel>
                                    </SelectionModel>
                                    <ViewConfig StripeRows="true">
                                    </ViewConfig>
                                </ext:GridPanel>
                            </Items>
                        </ext:FormPanel>
                    </Items>
                </ext:Panel>

                <%--###Tab de Normas###--%>
                <ext:Panel
                    ID="TabNormas"
                    runat="server"
                    Title="Normas"
                    Icon="Bookmark"
                    Layout="Fit"
                    Region="Center">
                    <Items>
                        <ext:FormPanel runat="server" Region="Center">
                            <Items>
                                <ext:FormPanel runat="server" Height="400" Width="400">
                                    <Items>
                                        <ext:GridPanel runat="server" ID="gridNormas" RowLines="true"
                                            ColumnLines="true" Region="West" Width="300" Height="300">
                                            <ColumnModel>
                                                <Columns>
                                                    <ext:Column runat="server" Text="Tirulo" />
                                                    <ext:Column runat="server" Text="Criação" />
                                                    <ext:Column runat="server" Text="Atualização" />
                                                    <ext:Column runat="server" Text="Norma" />
                                                    <ext:Column runat="server" Text="Norma" />
                                                </Columns>
                                            </ColumnModel>
                                            <SelectionModel>
                                                <ext:RowSelectionModel runat="server" />
                                            </SelectionModel>
                                            <Buttons>
                                                <ext:Button runat="server" Text="Nova Norma" Icon="PageAdd" />
                                            </Buttons>
                                        </ext:GridPanel>
                                    </Items>
                                </ext:FormPanel>
                            </Items>

                        </ext:FormPanel>

                    </Items>
                </ext:Panel>

                <%--###Tab de Procedimentos###--%>
                <ext:Panel ID="TabProcedimentos"
                    runat="server"
                    Title="Procedimentos"
                    Icon="LayoutHeader"
                    Layout="Fit">
                    <Items>
                    </Items>
                </ext:Panel>

                <%--###Tab de Auditoria###--%>
                <ext:Panel ID="Panel1"
                    runat="server"
                    Title="Auditoria"
                    Icon="Shield"
                    Layout="Fit">
                    <Items>
                    </Items>
                </ext:Panel>

                </Items>
          </ext:TabPanel>

        <%--###Janela de cadastro de Usuario###--%>
        <ext:Window runat="server" ID="WinUsuario" Title="Cadastro de usuário" Closable="false" TitleAlign="Center" AutoHeight="true" Padding="5" Modal="true" Width="400px" Height="350px" Hidden="true">
            <Items>
                <ext:FormPanel runat="server" ID="CadastroUsuario" Padding="10" Collapsed="false" Width="350" Height="300">
                    <Items>
                        <ext:ComboBox runat="server" ID="CmbNewUserDpto" Editable="false" FieldLabel="Departamento" Anchor="100%" StoreID="storeDepartamentos"
                            ValueField="Id" DisplayField="Nome" EmptyText="Selecione um Departamento">
                            <Listeners>
                                <Select Handler="Tcc.javaScript.CarregaFunc(#{CmbNewUserDpto}.getValue())" />
                            </Listeners>
                        </ext:ComboBox>
                        <ext:ComboBox runat="server" ID="CmbNewUserNome" FieldLabel="Nome" Editable="false" AllowBlank="false" StoreID="storeFuncionarios" DataIndex="Nome" DisplayField="Nome" EmptyText="Carregando...">
                            <Listeners>
                                <Select Handler="Tcc.javaScript.CarregaEmail(#{CmbNewUserNome}.getValue(), #{CmbNewUserDpto}.getValue())" />
                            </Listeners>
                        </ext:ComboBox>
                        <ext:TextField runat="server" ID="TextNewUserEmail" FieldLabel="E-mail" Editable="false" />
                        <ext:TextField runat="server" ID="TextNewUserCargo" FieldLabel="Cargo" Editable="false" />
                        <ext:TextField runat="server" ID="TextNewUserSenha" InputType="Password" MaxLengthText="10" FieldLabel="Senha" AllowBlank="false" />
                    </Items>
                    <Buttons>
                        <ext:Button runat="server" Text="Salvar" Icon="Accept">
                            <Listeners>
                                <Click Handler="if(#{CadastroUsuario}.isValid()) {Tcc.javaScript.CadastroUsuario(#{CmbNewUserDpto}.getValue(), #{CmbNewUserNome}.getValue(), #{TextNewUserEmail}.getValue(),
                                        #{TextNewUserCargo}.getValue(), #{TextNewUserSenha}.getValue(), #{WinUsuario}, #{storeUsuarios})};" />
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
    </form>
</body>
</html>
