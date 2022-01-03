<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancelThesis.aspx.cs" Inherits="GucianPostGradSystem.cancelThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 198px;
        }
    </style>
</head>
<body style="height: 206px">
    <form id="form1" runat="server">
        Cancel thesis:<br />
        please enter thesis&#39;s serial number<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    </form>
</body>
</html>
