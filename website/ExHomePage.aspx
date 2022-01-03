<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExHomePage.aspx.cs" Inherits="WebApplication.ExHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="direction: ltr">
            WELCOME<br />
            <br />
            <asp:Button ID="EditInfo" runat="server" OnClick="EditInfo_Click" Text="Edit My Info" Width="312px" />
            <br />
            <br />
            <asp:Button ID="ListData" runat="server" Text="List Info of Thesis I attended" OnClick="ListData_Click" Width="312px" />
            <br />
            <br />
            <asp:Button ID="AddComment" runat="server" Text="Add Comments to a Defense" OnClick="AddComment_Click"  Width="312px"/>
            <br />
            <br />
            <asp:Button ID="AddGrade" runat="server" Text="Add a Grade for a Defense" OnClick="AddGrade_Click" Width="312px" />
            <br />
            <br />
            <asp:Button ID="Search" runat="server" Text="Search for Thesis" OnClick="Search_Click" Width="312px" />
        </div>
    </form>
</body>
</html>
