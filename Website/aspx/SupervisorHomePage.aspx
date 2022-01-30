<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupervisorHomePage.aspx.cs" Inherits="WebApplication.SupervisorHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-image: url("./pub.jfif");
            background-repeat: no-repeat;
            background-size: cover;
            height: 492px;
        width: 800px;
        }</style>
</head>
<body style="height: 339px">
    <form id="form1" runat="server">
       <p>
           <asp:Button ID="Button6" runat="server" Text="View my profile" Width="178px" OnClick="Button6_Click" />
        <p\>
        
        <p>
            <asp:Button ID="Button1" runat="server" Text="View all my students names and years spent in the thesis" Width="387px" OnClick="Button1_Click" />
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" Text="View all publications of a student" Width="384px" OnClick="Button2_Click" />
        </p>
        <p>
            <asp:Button ID="Button3" runat="server" Text="Add a defense for a thesis" Width="384px" OnClick="Button3_Click" />
        </p>
        <p>
            <asp:Button ID="Button4" runat="server" Text="Evaluate a progress report of a student" Width="384px" OnClick="Button4_Click" />
        </p>
           <p>
               <asp:Button ID="Button5" runat="server" Text="Cancel a thesis. " Width="381px" OnClick="Button5_Click" />
         <p\>
        
        <asp:Button ID="Button7" runat="server" Text="Add examiner(s) for a defense " Width="380px" OnClick="Button7_Click" />
        
        </form>
    
       
</body>
</html>
