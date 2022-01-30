<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fillProgressReport.aspx.cs" Inherits="WebApplication.fillProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body style="height: 635px">
    <form id="form1" runat="server">
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
                    <asp:BoundField DataField="no" HeaderText="progress report num" />

                </Columns>

            </asp:gridView>
        </div>
         <br />
         <asp:Label ID="Label1" runat="server" Text="fill the following :" CssClass="lab"></asp:Label>
         
         <br />
         
         <asp:Label ID="Label2" runat="server" Text="Thesis Serial Number" CssClass="lab"></asp:Label>
         
         <br />
         <asp:TextBox ID="TextBox1" runat="server" CssClass="input"></asp:TextBox>
         <br />
         <br />
         <asp:Label ID="Label3" runat="server" Text="Progress Report Number" CssClass="lab"></asp:Label>
         
         <br />
         <asp:TextBox ID="TextBox2" runat="server" CssClass="input"></asp:TextBox>
         <br />
         <br />
         <asp:Label ID="Label4" runat="server" Text="State" CssClass="lab"></asp:Label>
         <br />
         
         <asp:TextBox ID="TextBox3" runat="server" CssClass="input"></asp:TextBox>
         <br />
         <br />
         <asp:Label ID="Label5" runat="server" Text="Description" CssClass="lab"></asp:Label>
         
         <br />
         <asp:TextBox ID="TextBox4" runat="server" Height="65px" Width="178px" CssClass="input"></asp:TextBox>
         
         <br />
         <br />
         <asp:Button ID="Button1" runat="server" Text="submit" Height="31px" OnClick="Button1_Click" Width="77px" CssClass="btn" />
         <br />
         
    </form>
</body>
</html>
