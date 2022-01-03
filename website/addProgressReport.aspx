<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addProgressReport.aspx.cs" Inherits="GucianPostGradSystem.addGucianProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Thesis Serial Number"></asp:Label>
        </div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Progress Report Date"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Height="32px" OnClick="Button1_Click" Text="submit" Width="124px" />
    </form>
</body>
</html>
