<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addPublication.aspx.cs" Inherits="WebApplication.addPublication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
        body {
            background-image: url("./pub.jfif");
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
        </div>
        <asp:Label ID="Label1" runat="server" Text="Title" CssClass="lab"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" CssClass="input"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Publication Date"  CssClass="lab"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="input"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Host"  CssClass="lab"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" CssClass="input"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Place"  CssClass="lab"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" CssClass="input"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Text="serial number" CssClass="lab"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox5" runat="server" CssClass="input"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Accepted" CssClass="lab"></asp:Label>
        <asp:CheckBox ID="CheckBox1" runat="server" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Height="26px" Text="Submit" Width="91px" OnClick="Button1_Click" CssClass="btn" />
    </form>
</body>
</html>
