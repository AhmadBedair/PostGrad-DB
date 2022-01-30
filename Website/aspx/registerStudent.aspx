<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerStudent.aspx.cs" Inherits="WebApplication.registerStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 175px">
            <asp:Label ID="Label1" runat="server" Text="Select"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Gucian" Height="37px" Width="87px" OnClick="gucianRegister" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="nongucianRegister" Text="Non Gucian" Height="34px" Width="88px" />
            <br />
            <br />
            
       </div>
    </form>
</body>
</html>
