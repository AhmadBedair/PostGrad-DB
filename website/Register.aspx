<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GucianPostGradSystem.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 265px">
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Register"></asp:Label>
        </div>
        <asp:Button ID="Student" runat="server" Height="38px" Text="Student" OnClick="registerStudent" Width="71px" />
        <p>
            <asp:Button ID="SuperVisor" runat="server" Height="37px" Text="SuperVisor" OnClick="registerSuperVisor" Width="73px" />
        </p>
        <asp:Button ID="Admin" runat="server" Height="38px" Text="Admin" Width="72px" OnClick="registerAdmin" />
        <p>
            <asp:Button ID="Examiner" runat="server" Height="38px" Text="Examiner" Width="73px" OnClick="registerExaminer" />
        </p>
    </form>
</body>
</html>
