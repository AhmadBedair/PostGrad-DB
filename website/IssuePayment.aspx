<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssuePayment.aspx.cs" Inherits="WebApplication.IssuePayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Thesis Serial Number<br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Amount<br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Number Of Installments<br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            Fund Percentage<br />
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Issue" runat="server" Text="Issue" Height="37px" OnClick="Issue_Click" Width="102px" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
