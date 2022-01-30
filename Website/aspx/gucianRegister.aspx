<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gucianRegister.aspx.cs" Inherits="WebApplication.gucianRegister" %>

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
            height: 700px;
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
<body style="height: 905px">
    <form id="form1" runat="server">
        
        <asp:Label  ID="Label1" runat="server" Text="Insert Your Info" CssClass="lab"></asp:Label>
        
        <p>
            <asp:Label ID="Label2" runat="server" Text="First name" CssClass="lab"></asp:Label>
        </p>
        
        <asp:TextBox ID="firstName" runat="server" CssClass="input"></asp:TextBox>
        
        <p>
            <asp:Label ID="label3" runat="server" Text="Last name" CssClass="lab"></asp:Label>
        </p>
        
        <asp:TextBox ID="lastName" runat="server" CssClass="input"></asp:TextBox>
        <p>
            <asp:Label ID="label4" runat="server" Text="Email" CssClass="lab"></asp:Label>
        </p>
        
        <asp:TextBox ID="email" runat="server" CssClass="input"></asp:TextBox>
        
        <p>
            <asp:Label ID="Label5" runat="server" Text="Password" CssClass="lab"></asp:Label>
        </p>
        
        <asp:TextBox ID="Password" runat="server" type="password" CssClass="input"></asp:TextBox>
        
        <p>
            <asp:Label ID="Label6" runat="server" Text="Address" CssClass="lab"></asp:Label>
        </p>
        
        <asp:TextBox ID="address" runat="server" CssClass="input"></asp:TextBox>
        
        <p>
            <asp:Label ID="Label7" runat="server" Text="Under Grad ID" CssClass="lab"></asp:Label>
        </p>
        
        <asp:TextBox ID="undergradID" runat="server" CssClass="input"></asp:TextBox>
        
        <p>
            <asp:Label ID="Label8" runat="server" Text="GPA" CssClass="lab"></asp:Label>
        </p>
        
        <asp:TextBox ID="gpa" runat="server" CssClass="input" ></asp:TextBox>
        
        <p>
            <asp:Label ID="Label9" runat="server" Text="type" CssClass="lab"></asp:Label>
        </p>
        
        <asp:TextBox ID="type" runat="server" CssClass="input"></asp:TextBox>
        
        <p>
            <asp:Label ID="Label10" runat="server" Text="Faculty" CssClass="lab"></asp:Label>
        </p>
        
        <asp:TextBox ID="faculty" runat="server" CssClass="input"></asp:TextBox>
        
        <p>
            <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" CssClass="btn" />
        </p>
        
    </form>
</body>
</html>
