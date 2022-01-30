<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addProgressReport.aspx.cs" Inherits="WebApplication.addGucianProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
        body {
            background-image: url("./report.jfif");
            background-repeat: no-repeat;
            background-size: cover;
            height: 492px;
        width: 1000px;
        }
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
            color:black;
            }
        #form1{
            border-style: none;
            border-color: inherit;
            border-width: medium;
            display:flex;
            flex-direction:column;
            
            padding:20px;
            align-items:center;
            width:37%;
            border-radius:25px;
            margin-left:30%;
            
            height: 599px;
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
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Thesis Serial Number" CssClass="lab"></asp:Label>
            <br />
        </div>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="input"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Progress Report Date" CssClass="lab"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="input"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Height="32px" OnClick="Button1_Click" Text="submit" Width="124px"  CssClass="btn"/>
    </form>
</body>
</html>
