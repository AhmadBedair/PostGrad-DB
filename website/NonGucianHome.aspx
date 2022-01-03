<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NonGucianHome.aspx.cs" Inherits="GucianPostGradSystem.NonGucianHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 315px;
        }
    </style>
</head>
<body style="height: 472px">
    <form id="form2" runat="server">
        
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
            <asp:Button ID="Button1" runat="server" Height="33px" Text="view" Width="115px" OnClick="Button1_Click" />
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="List Thesis"></asp:Label>
        </p>
        <p style="height: 35px">
            <asp:Button ID="Button2" runat="server" Height="32px" Text="List Thesis" Width="113px" OnClick="Button2_Click" />
        </p>
        
        <asp:Label ID="Label4" runat="server" Text="List Courses grad"></asp:Label>
        
        <p>
            <asp:Button ID="Button3" runat="server" Height="32px" Text="List Courses grad" Width="114px" OnClick="Button3_Click" />
        </p>

         <p>
            <asp:Label ID="Label5" runat="server" Text="Add Progress Report"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button4" runat="server" Height="24px" style="margin-left: 0px" Text="Add" Width="97px" OnClick="Button4_Click" />
        </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="fill Progress Report"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button5" runat="server" Height="27px" Text="fill" Width="89px" OnClick="Button5_Click" style="direction: ltr" />
        </p>
        
        <asp:Label ID="Label7" runat="server" Text="Add Publication"></asp:Label>


        <br />
        <asp:Button ID="Button6" runat="server" Height="28px" Text="add" Width="98px" OnClick="Button6_Click" />
    </form>
    </body>
</html>
