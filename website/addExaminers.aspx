<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addExaminers.aspx.cs" Inherits="GucianPostGradSystem.addExaminers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 504px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add an Examiner for a defense:<br />
            Enter thesis&#39;s serial number.</div>
        <asp:TextBox ID="TextBox1" runat="server" Width="228px"></asp:TextBox>
        <p>
            Enter the defense date.</p>
          <asp:TextBox ID="TextBox2" runat="server" Width="228px"></asp:TextBox>
        <p>
             Enter the examiner&#39;s name or(Email).<br />
        <asp:TextBox ID="TextBox3" runat="server" Width="220px"></asp:TextBox>
        <br />
        Enter the examiners password.<br />
             <asp:TextBox ID="TextBox5" runat="server" Width="208px" type="password"></asp:TextBox>
             <br />
        If the examiner is international please check the below box.<br />
        <asp:CheckBox ID="CheckBox1" runat="server" Text="International" />
        <br />
        Enter the examiner&#39;s filed of work<br />
        <asp:TextBox ID="TextBox4" runat="server" Width="210px"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click1" />
        <br />
    </form>
</body>
</html>
