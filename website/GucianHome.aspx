<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GucianHome.aspx.cs" Inherits="GucianPostGradSystem.GucianHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 542px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <p>
            <asp:Label ID="Label1" runat="server" Text="Add Phone Number"></asp:Label>
        </p>
       
        <p>
        <asp:Button ID="add" runat="server" Text="Add" OnClick="add_Click" Height="30px" Width="118px" />
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="View Profile"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Height="33px" Text="view" Width="109px" OnClick="Button1_Click" />
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="List Thesis"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" Height="32px" Text="List Thesis" Width="103px" OnClick="Button2_Click" />
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Add Progress Report"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button3" runat="server" Height="27px" style="margin-left: 0px" Text="Add" Width="105px" OnClick="Button3_Click" />
        </p>


        <asp:Label ID="Label5" runat="server" Text="Fill Progress Report"></asp:Label>
        <br />
        <asp:Button ID="Button4" runat="server" Height="30px" Text="fill" Width="97px" OnClick="Button4_Click" />


        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Add Publication"></asp:Label>


        <br />
        <asp:Button ID="Button5" runat="server" Height="28px" Text="add" Width="98px" OnClick="Button5_Click" />


    </form>
</body>
</html>
