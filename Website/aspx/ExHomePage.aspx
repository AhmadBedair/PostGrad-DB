<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExHomePage.aspx.cs" Inherits="WebApplication.ExHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<style>
        body{
            background-image:url('back.jpg');
            background-repeat:no-repeat;
           background-size:cover;
        height: 492px;
        width: 1000px;
    }
        .hello{
            font-size:80px;
            
            color:#e8c413;
            width:100%;
            font-family:"Impact";
            border-bottom:2px solid red;
           
            -webkit-text-stroke:3.25px black;
        }
        .btn:hover{
            background-color:white;
            color:#25dee0;
            transition:0.5s;
            cursor:pointer;
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
    </style>
<body>
    <form id="form1" runat="server">
        <div >
            <h1 class="hello">WELCOME</h1>
            
            <asp:Button ID="EditInfo" runat="server" OnClick="EditInfo_Click" Text="Edit My Info" Width="312px" CssClass="btn" />
            <br />
            <br />
            <asp:Button ID="ListData" runat="server" Text="List Info of Thesis I attended" OnClick="ListData_Click" Width="312px" CssClass="btn"/>
            <br />
            <br />
            <asp:Button ID="AddComment" runat="server" Text="Add Comments to a Defense" OnClick="AddComment_Click"  Width="312px" CssClass="btn"/>
            <br />
            <br />
            <asp:Button ID="AddGrade" runat="server" Text="Add a Grade for a Defense" OnClick="AddGrade_Click" Width="312px" CssClass="btn" />
            <br />
            <br />
            <asp:Button ID="Search" runat="server" Text="Search for Thesis" OnClick="Search_Click" Width="312px" CssClass="btn" />
        </div>
    </form>
</body>
</html>
