<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update_Extension.aspx.cs" Inherits="WebApplication.Update_Extension" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Serial Number<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Extend" runat="server" Height="34px" Text="Extend" Width="104px" OnClick="Extend_Click" />
        </div>
    </form>
</body>
</html>
