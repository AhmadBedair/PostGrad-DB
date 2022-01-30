<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NonGucianHome.aspx.cs" Inherits="WebApplication.NonGucianHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    body{
            background-image:url("./student.jfif");
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
            height: 800px;
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
<body style="height: 472px">
    <form id="form1" runat="server">
        
        <p>
            <asp:Label ID="Label1" runat="server" Text="Add Phone Number" CssClass="lab"></asp:Label>
        </p>
       
        <p>
        <asp:Button ID="add" runat="server" Text="Add" OnClick="add_Click" Height="30px" Width="118px" CssClass="btn" />
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="View Profile" CssClass="lab"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Height="33px" Text="view" Width="115px" OnClick="Button1_Click"  CssClass="btn" />
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="List Thesis" CssClass="lab"></asp:Label>
        </p>
        <p style="height: 35px">
            <asp:Button ID="Button2" runat="server" Height="32px" Text="List Thesis" Width="113px" OnClick="Button2_Click"  CssClass="btn" />
        </p>
        
        <asp:Label ID="Label4" runat="server" Text="List Courses grad" CssClass="lab"></asp:Label>
        
        <p>
            <asp:Button ID="Button3" runat="server" Height="32px" Text="List Courses grad" Width="114px" OnClick="Button3_Click" CssClass="btn" />
        </p>

         <p>
            <asp:Label ID="Label5" runat="server" Text="Add Progress Report" CssClass="lab"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button4" runat="server" Height="24px" style="margin-left: 0px" Text="Add" Width="97px" OnClick="Button4_Click" CssClass="btn" />
        </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="fill Progress Report" CssClass="lab"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button5" runat="server" Height="27px" Text="fill" Width="89px" OnClick="Button5_Click" style="direction: ltr"  CssClass="btn" />
        </p>
        
        <asp:Label ID="Label7" runat="server" Text="Add Publication" CssClass="lab" ></asp:Label>


        <br />
        <asp:Button ID="Button6" runat="server" Height="28px" Text="add" Width="98px" OnClick="Button6_Click" CssClass="btn" />
    </form>
    </body>
</html>
