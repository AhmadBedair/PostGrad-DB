<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication.Register" %>

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
        .btn{
            border-style: solid;
            border-color: inherit;
            border-width: 2px;
            background-color:#25dee0;
            border-radius:10px;
            color:white;
            }
        .lab{
            color:white;
        }
    </style>
</head>
<body style="height: 265px">
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Register" CssClass="lab"></asp:Label>
        </div>
        <asp:Button ID="Student" runat="server" Height="38px" Text="Student" OnClick="registerStudent" Width="71px" CssClass="btn"/>
        <p>
            <asp:Button ID="SuperVisor" runat="server" Height="37px" Text="SuperVisor" OnClick="registerSuperVisor" Width="73px" CssClass="btn"/>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Examiner" CssClass="btn" OnClick="Button1_Click"/>
        </p>
       
    </form>
</body>
</html>
