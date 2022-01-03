<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="procAddDefense.aspx.cs" Inherits="GucianPostGradSystem.procAddDefense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 505px;
        }
    </style>
</head>
<body style="height: 502px">
    <form id="form1" runat="server">
        <div>
            Add a defense:<br />
            Enter thesis&#39;s serial number.</div>
        <asp:TextBox ID="TextBox1" runat="server" Width="228px"></asp:TextBox>
        <p>
            Enter the defense date.</p>
        <asp:TextBox ID="TextBox2" runat="server" Width="228px"></asp:TextBox>
        <p>
            Enter the location of the defense.</p>
        <asp:TextBox ID="TextBox3" runat="server" Width="223px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click1" />
        <br />
        </form>
</body>
</html>
