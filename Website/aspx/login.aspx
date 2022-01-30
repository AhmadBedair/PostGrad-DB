<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-image: url("./log.jfif");
            background-repeat: no-repeat;
            background-size: cover;
            height: 492px;
        width: 800px;
        }
        .btn{
            border-style: solid;
            border-color: inherit;
            border-width: 2px;
            background-color:#25dee0;
            border-radius:10px;
            color:white;
            }
         #form1{
            border-style: none;
        border-color: inherit;
        border-width: medium;
        display:flex;
            flex-direction:column;
            background-color:rgba(0,0,0,0.5);
            padding:20px;
            align-items:center;
            width:50%;
            border-radius:25px;
            margin-left:30%;
            backdrop-filter:blur(5px);
        height: 370px;
    }
        #box1{
            display:flex;
            justify-self:flex-start;
            align-self:center;
            width:80%;
            padding:10px;
            border:2px solid white;
            border-radius:20px;
            align-items:center;
                
            
        }
        .serchBtn{
            background-color:#f9a411;
        }
        .input{
            background-color:#eae7e2;
            border:solid 2px ;
            border-radius:10px;
            margin-right:10px
           
        }
        .lab{
            color:white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:Label ID="Label1" runat="server" Text="login" CssClass="lab"></asp:Label>
        
        <p>
            <asp:Label ID="label3" runat="server" Text="ID"></asp:Label>
        </p>
        
        <asp:TextBox ID="ID" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Password" CssClass="lab" ></asp:Label>
        </p>
        
        <asp:TextBox ID="Password" runat="server" type="password"></asp:TextBox>
        
        <p>
            <asp:Button ID="Submit" runat="server" Text="login" OnClick="Submit_Click" />
        </p>
        
    </form>
</body>
</html>
