<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addExaminers.aspx.cs" Inherits="WebApplication.addExaminers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-image: url("./pub.jfif");
            background-repeat: no-repeat;
            background-size: cover;
            height: 492px;
        width: 800px;
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
            color:yellow;
            }
        #form1{
            border-style: none;
            border-color: inherit;
            border-width: medium;
            display:flex;
            flex-direction:column;
            
            padding:20px;
            align-items:center;
            width:54%;
            border-radius:25px;
            margin-left:30%;
            
            height: 616px;
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
        
            <h2 class:"lab">Add an Examiner for a defense:</h2>
            <h4 class:"lab">Enter thesis&#39;s serial number.<asp:TextBox ID="TextBox1" runat="server" CssClass="input"></asp:TextBox>
            </h4>
        <h4 class:"lab">
            Enter the defense date.<asp:TextBox ID="TextBox2" runat="server" CssClass="input"></asp:TextBox>
            </h4>
        <h4 class:"lab">
             Enter the examiner&#39;s name or(Email).<asp:TextBox ID="TextBox3" runat="server" CssClass="input"></asp:TextBox>
        
            </h4>
        
        <h4 class:"lab">Enter the examiners password.<asp:TextBox ID="TextBox5" runat="server" Width="208px" type="password" CssClass="input"></asp:TextBox>
            
            </h4>
            
        <h4 class:"lab"> If the examiner is international please check the below box.</h4>
            <h4 class:"lab"> 
        <asp:CheckBox ID="CheckBox1" runat="server" Text="International"  />
        
            </h4>
        
        <h4 class:"lab"> Enter the examiner&#39;s filed of work<asp:TextBox ID="TextBox4" runat="server" Width="210px" CssClass="input"></asp:TextBox>
        
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click1"  CssClass="btn"/>
        
            </h4>
        
    </form>
</body>
</html>
