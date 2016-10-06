<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="MeuTcc.Application.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager</title>
</head>
<body>
     <ext:ResourceManager ID="ResourceManager1" runat="server" />
        <ext:TabPanel
            ID="TabPanel1"
            Region="Center"
            runat="server"
            Title="Manager Field"
            TitleAlign="Right">
            <TabBar>
                <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                <ext:Button ID="Button1" runat="server" Flat="true" Text="Sair" Icon="Disconnect"/>
            </TabBar>
        <Items>
            <ext:Panel runat="server" Title="Dashboard">

            </ext:Panel>
            <ext:Panel runat="server" Title="Normas"></ext:Panel>
            <ext:Panel runat="server" Title="Relatórios"></ext:Panel>
        </Items>
                
        </ext:TabPanel>
</body>
</html>
