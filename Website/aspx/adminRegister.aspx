<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminRegister.aspx.cs" Inherits="GucianPostGradSystem.adminRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 217px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
        
        <p>
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
        </p>
        
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
        
        <p>
            <asp:TextBox ID="password" runat="server" style="margin-bottom: 0px"></asp:TextBox>
        </p>
        
        <p>
            <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
        </p>
        
    </form>
</body>
</html>
