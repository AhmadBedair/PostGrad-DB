<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Home_Page.aspx.cs" Inherits="WebApplication.Admin_Home_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Button ID="List_sups" runat="server" Height="33px" OnClick="List_sups_Click" Text="List All Supervisors" Width="161px" />
            <br />
            <br />
            <br />
            <asp:Button ID="Admin_view" runat="server" Text="View All Thesis" Width="161px" OnClick="Admin_view_Click" Height="33px" />
            <br />
            <br />
            <br />
            <asp:Button ID="Issue_Payment" runat="server" Height="33px" Text="Issue Payment" Width="161px" OnClick="Issue_Payment_Click" />
            <br />
            <br />
            <br />
            <asp:Button ID="Issue_Installment" runat="server" Height="33px" Text="Issue Installment" Width="161px" OnClick="Issue_Installment_Click" />
            <br />
            <br />
            <br />
            <asp:Button ID="Update_Extension" runat="server" Height="33px" Text="Update Extension" Width="161px" OnClick="Update_Extension_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
