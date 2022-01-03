<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nongucianRegister.aspx.cs" Inherits="GucianPostGradSystem.nongucianRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Insert Your Info"></asp:Label>
        
        <p>
            <asp:Label ID="Label2" runat="server" Text="First name"></asp:Label>
        </p>
        
        <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
        
        <p>
            <asp:Label ID="label3" runat="server" Text="Last name"></asp:Label>
        </p>
        
        <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="label4" runat="server" Text="Email"></asp:Label>
        </p>
        
        <asp:TextBox ID="email" runat="server"></asp:TextBox>
        
        <p>
            <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
        </p>
        
        <asp:TextBox ID="Password" runat="server" type="password"></asp:TextBox>
        
        <p>
            <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label>
        </p>
        
        <asp:TextBox ID="address" runat="server"></asp:TextBox>
        
        
        <p>
            <asp:Label ID="Label8" runat="server" Text="GPA"></asp:Label>
        </p>
        
        <asp:TextBox ID="gpa" runat="server"></asp:TextBox>
        
        <p>
            <asp:Label ID="Label9" runat="server" Text="type"></asp:Label>
        </p>
        
        <asp:TextBox ID="type" runat="server"></asp:TextBox>
        
        <p>
            <asp:Label ID="Label10" runat="server" Text="Faculty"></asp:Label>
        </p>
        
        <asp:TextBox ID="faculty" runat="server"></asp:TextBox>
        
        <p>
            <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
        </p>
    </form>
</body>
</html>
