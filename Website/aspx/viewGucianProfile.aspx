<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewGucianProfile.aspx.cs" Inherits="WebApplication.viewGucianProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>body{
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
<body>
    <form id="form1" runat="server">
        <asp:gridView ID="gridId" runat="server" AutoGenerateColumns="false" Width="372px">

                <Columns>
                    <asp:BoundField DataField="firstName" HeaderText="First name" />
                     <asp:BoundField DataField="lastName" HeaderText="Last name" />
                     <asp:BoundField DataField="type" HeaderText="type" />
                     <asp:BoundField DataField="faculty" HeaderText="Faculty" />
                     <asp:BoundField DataField="address" HeaderText="Address" />
                     <asp:BoundField DataField="GPA" HeaderText="GPA" />
                    <asp:BoundField DataField="undergradID" HeaderText="undergradID" />
                    

                </Columns>

            </asp:gridView>
    </form>
</body>
</html>
