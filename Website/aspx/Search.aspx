<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebApplication.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
        body{
            background-image:url("./searching.jpg");
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
            <h2 class="lab"> Enter a keyword about Thesis Title</h2>     
            <asp:TextBox ID="KWord" runat="server" CssClass="input"></asp:TextBox>
            <br />
            <asp:Button ID="SFT" runat="server" Text="GO" OnClick="SFT_Click" CssClass="serchBtn" />
        

        <asp:gridView ID="gridId" runat="server" AutoGenerateColumns="false" Width="372px">

                <Columns>
                    <asp:BoundField DataField="serialNumber" HeaderText="serialNumber" />
                     <asp:BoundField DataField="field" HeaderText="field" />
                     <asp:BoundField DataField="type" HeaderText="type" />
                     <asp:BoundField DataField="title" HeaderText="title" />
                     <asp:BoundField DataField="startDate" HeaderText="startDate" />
                     <asp:BoundField DataField="endDate" HeaderText="endDate" />
                    <asp:BoundField DataField="defenseDate" HeaderText="defenseDate" />
                    <asp:BoundField DataField="years" HeaderText="years" />
                    <asp:BoundField DataField="grade" HeaderText="grade" />
                    <asp:BoundField DataField="payment_id" HeaderText="payment_id" />
                    <asp:BoundField DataField="noExtension" HeaderText="noExtension" />                    
                </Columns>

            </asp:gridView>
            <asp:Button ID="back" runat="server" Text="Back to Home page" OnClick="back_Click" />
            <br />
            </div>
    </form>
</body>
</html>
