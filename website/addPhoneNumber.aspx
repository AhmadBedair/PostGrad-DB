<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addPhoneNumber.aspx.cs" Inherits="GucianPostGradSystem.addPhoneNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 118px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Add Phone Number"></asp:Label>
        </div>
        <asp:TextBox ID="Phone" runat="server"></asp:TextBox>
        <asp:Button ID="addphone" runat="server" Text="add" OnClick="addphone_Click" />
    </form>
</body>
</html>
