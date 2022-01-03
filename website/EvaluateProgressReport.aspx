<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EvaluateProgressReport.aspx.cs" Inherits="GucianPostGradSystem.EvaluateProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 310px">
            Evaluation of progress reports:<br />
            Thesis serial number.<br />
            <asp:TextBox ID="TextBox1" runat="server" Width="191px"></asp:TextBox>
            <br />
            Progress report number.<br />
            <asp:TextBox ID="TextBox2" runat="server" Width="189px"></asp:TextBox>
            <br />
            The evaluation grade.<br />
            <asp:TextBox ID="TextBox3" runat="server" Width="189px"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
