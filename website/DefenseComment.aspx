<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefenseComment.aspx.cs" Inherits="WebApplication.DefenseComment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter ThesisSerialNumber<br />
            <asp:TextBox ID="ThesisSerialno" runat="server"></asp:TextBox>
            <br />
            Enter Defense Date as &quot;yyyy/mm/dd&quot;<br />
            <asp:TextBox ID="DefenseDate" runat="server"></asp:TextBox>
            <br />
            Add your DefenseComment
            <br />
            <asp:TextBox ID="ExDefenseComment" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="AddComment" runat="server" OnClick="AddComment_Click" Text="AddComment" />
            <br />
            <asp:Button ID="back" runat="server" Text="Back to Home page" OnClick="back_Click" />
        </div>
    </form>
</body>
</html>
