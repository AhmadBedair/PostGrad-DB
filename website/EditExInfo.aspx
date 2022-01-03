<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditExInfo.aspx.cs" Inherits="WebApplication.EditExInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter your new info<br />
            Note: if some info didn&#39;t change, Enter the old one<br />
            Email<br />
            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            <br />
            Password<br />
            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
            <br />
            Name<br />
            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            <br />
            Field of work<br />
            <asp:TextBox ID="FOW" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="editInfo" runat="server" Text="Submit" OnClick="editInfo_Click" />
            <br />
            <asp:Button ID="back" runat="server" Text="Back to Home page" OnClick="back_Click" />
            <br />
        </div>
    </form>
</body>
</html>
