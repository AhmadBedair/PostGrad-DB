<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="root.aspx.cs" Inherits="GucianPostGradSystem.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

       
         Login:<br/>
        <asp:Button ID="Button1" runat="server" Text="Login" Height="33px" OnClick="Button1_Click" Width="61px" />

        <br/>

         Register:<br/>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Register" Height="31px" Width="74px" />


    </form>
</body>
</html>
