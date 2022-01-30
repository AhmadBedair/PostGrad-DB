<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Issue_Installment.aspx.cs" Inherits="WebApplication.Issue_Installment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Payment ID<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Start Date<br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Issue" runat="server" Text="Issue" OnClick="Issue_Click" Width="115px" />
        </div>
    </form>
</body>
</html>
