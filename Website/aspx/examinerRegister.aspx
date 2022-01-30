<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examinerRegister.aspx.cs" Inherits="GucianPostGradSystem.examinerRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 537px;
        }
    </style>
</head>
<body style="height: 509px">
    <form id="form1" runat="server">
          <asp:Label ID="Label1" runat="server" Text="Insert Your Info"></asp:Label>
          
        <p>
            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
        </p>
        
        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="label3" runat="server" Text="Email"></asp:Label>
        </p>
        
        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
        
        <p>
            <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
        </p>
        
        <asp:TextBox ID="Password" runat="server"></asp:TextBox>
          <p>
            <asp:Label ID="Label5" runat="server" Text="Field of work"></asp:Label>
        </p>
        
        <asp:TextBox ID="FieldOfWork" runat="server"></asp:TextBox>
          <p>
            <asp:Label ID="Label6" runat="server" Text="Are you national?"></asp:Label>
        </p>


        
          <asp:CheckBox ID="National" runat="server" />
          <asp:Label ID="Label7" runat="server" Text="National"></asp:Label>

        
          <br />
          <asp:CheckBox ID="InterNational" runat="server" />

        
          <asp:Label ID="Label8" runat="server" Text="Inter National"></asp:Label>
          <br />
          <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" style="margin-bottom: 0px" />


        
        
        
    </form>
</body>
</html>
