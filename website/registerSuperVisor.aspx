<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerSuperVisor.aspx.cs" Inherits="GucianPostGradSystem.registerSuperVisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 442px">
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Register"></asp:Label>
        
        <p>
            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
        </p>

        
        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
        <p style="height: 22px">
            <asp:Label ID="Label3" runat="server" Text="Faculty"></asp:Label>
        </p>

        
        <asp:TextBox ID="Faculty" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
        </p>

        
        <p>
            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="Password" runat="server" type="password"></asp:TextBox>
        </p>
            <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />

        
    </form>
</body>
</html>
