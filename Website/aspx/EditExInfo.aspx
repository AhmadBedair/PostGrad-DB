<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditExInfo.aspx.cs" Inherits="WebApplication.EditExInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
        body{
            background-image:url("./exinfo.jpg");
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
            width:37%;
            border-radius:25px;
            margin-left:30%;
            backdrop-filter:blur(5px);
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
           <h2 class="lab">Enter your new info<br />
            Note: if some info didn&#39;t change, Enter the old one<br /></h2>
            <h2 class="lab">Email</h2> 
            <asp:TextBox ID="Email" runat="server" CssClass="input"></asp:TextBox>
            <h2 class="lab">Password</h2>
            <asp:TextBox ID="Password" runat="server" CssClass="input"></asp:TextBox>
            <h2 class="lab">Name</h2>
            <asp:TextBox ID="Name" runat="server" CssClass="input"></asp:TextBox>
            <h2 class="lab">Field of work</h2>
            <asp:TextBox ID="FOW" runat="server" CssClass="input"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="editInfo" runat="server" Text="Submit" OnClick="editInfo_Click" CssClass="btn"/>
            <br />
            <br />
            <asp:Button ID="back" runat="server" Text="Back to Home page" OnClick="back_Click" CssClass="btn" />
        </div>
    </form>
</body>
</html>
