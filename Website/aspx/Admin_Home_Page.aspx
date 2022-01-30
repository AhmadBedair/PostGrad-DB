<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Home_Page.aspx.cs" Inherits="WebApplication.Admin_Home_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
        body{
            background-image:url('admin.jfif');
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
        <div>
            <br />
            <asp:Button ID="List_sups" runat="server" Height="33px" OnClick="List_sups_Click" Text="List All Supervisors" Width="161px" />
            <br />
            <br />
            <br />
            <asp:Button ID="Admin_view" runat="server" Text="View All Thesis" Width="161px" OnClick="Admin_view_Click" Height="33px" />
            <br />
            <br />
            <br />
            <asp:Button ID="Issue_Payment" runat="server" Height="33px" Text="Issue Payment" Width="161px" OnClick="Issue_Payment_Click" />
            <br />
            <br />
            <br />
            <asp:Button ID="Issue_Installment" runat="server" Height="33px" Text="Issue Installment" Width="161px" OnClick="Issue_Installment_Click" />
            <br />
            <br />
            <br />
            <asp:Button ID="Update_Extension" runat="server" Height="33px" Text="Update Extension" Width="161px" OnClick="Update_Extension_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
