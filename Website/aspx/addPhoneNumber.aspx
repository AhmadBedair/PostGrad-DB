<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addPhoneNumber.aspx.cs" Inherits="WebApplication.addPhoneNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    body{
            background-image:url("./phone2.jpg");
            background-repeat:no-repeat;
           background-size:cover;
           height: 492px;
        width: 1000px;
            
        }
        .hello{
            font-size:80px;
            text-align:center;
            color:#e8c413;
            width:40%;
            font-family:"Impact";
            border-bottom:2px solid red;
            margin-left:30%;
            -webkit-text-stroke:3.25px black;
        }
        .btn:hover{
            background-color:white;
            color:#25dee0;
            transition:0.5s
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
            
            
            border-radius:10px;
            font:bold;
            color:sandybrown;
            }
        #form1{
            border-style: none;
            border-color: inherit;
            border-width: medium;
            display:flex;
            flex-direction:column;
            background-color:rgba(0,0,0,0.5);
            padding:10px;
            align-items:center;
            width:37%;
            border-radius:25px;
            margin-left:30%;
            backdrop-filter:blur(5px);
            height: 250px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Add Phone Number" CssClass="lab"></asp:Label>
        </div>
        <br />
        <asp:TextBox ID="Phone" runat="server" CssClass="input"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="addphone" runat="server" Text="add" OnClick="addphone_Click" CssClass="btn"/>
    </form>
</body>
</html>
