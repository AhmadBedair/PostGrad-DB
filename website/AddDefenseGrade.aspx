<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDefenseGrade.aspx.cs" Inherits="WebApplication.AddDefenseGrade" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter ThesisSerialNumber<br />
            <asp:TextBox ID="serialNo" runat="server"></asp:TextBox>
            <br />
            Enter Defense Date<br />
            <asp:TextBox ID="DDate" runat="server"></asp:TextBox>
            <br />
            Enter Defense Grade<br />
            <asp:TextBox ID="Dgrade" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="AddGrade" runat="server" OnClick="AddGrade_Click" Text="AddGrade" />
            <br />
            <asp:Button ID="back" runat="server" Text="Back to Home page" OnClick="back_Click"/>
        </div>
    </form>
</body>
</html>
