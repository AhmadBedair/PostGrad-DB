<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefenseComment.aspx.cs" Inherits="WebApplication.DefenseComment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
        body {
            background-image: url("./comm3.jpg");
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
            color:white;
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
            <h2 class="lab">ThesisSerialNumber</h2> 
            <asp:TextBox ID="ThesisSerialno" runat="server" CssClass="input"></asp:TextBox>
            
            <h2 class="lab">Enter Defense Date as &quot;yyyy/mm/dd&quot;</h2>
            <asp:TextBox ID="DefenseDate" runat="server" CssClass="input"></asp:TextBox>
            
            <h2 class="lab">Add your DefenseComment</h2>
           
            <asp:TextBox ID="ExDefenseComment" runat="server" CssClass="input"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="AddComment" runat="server" OnClick="AddComment_Click" Text="AddComment" CssClass="btn"/>
            <br />
            <br />
            <asp:Button ID="back" runat="server" Text="Back to Home page" OnClick="back_Click" CssClass="btn"/>
        </div>
    </form>
</body>
</html>
