<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerExaminer.aspx.cs" Inherits="WebApplication.registerExaminer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <asp:Label ID="Label1" runat="server" Text="Register"></asp:Label>
        
        <p>
            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
        </p>

        
        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
        <p style="height: 22px">
            <asp:Label ID="Label3" runat="server" Text="field of work"></asp:Label>
        </p>

        
        <asp:TextBox ID="field_of_work" runat="server"></asp:TextBox>
        
            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" text="isnational"/>
            <br />
        
            <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />

        </div>
    </form>
</body>
</html>
