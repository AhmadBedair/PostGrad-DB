<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="GucianPostGradSystem.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:Label ID="Label1" runat="server" Text="login"></asp:Label>
        
        <p>
            <asp:Label ID="label3" runat="server" Text="ID"></asp:Label>
        </p>
        
        <asp:TextBox ID="ID" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Password" ></asp:Label>
        </p>
        
        <asp:TextBox ID="Password" runat="server" type="password"></asp:TextBox>
        
        <p>
            <asp:Button ID="Submit" runat="server" Text="login" OnClick="Submit_Click" />
        </p>
        
    </form>
</body>
</html>
