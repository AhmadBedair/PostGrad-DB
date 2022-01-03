<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fillProgressReport.aspx.cs" Inherits="GucianPostGradSystem.fillProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #TextArea1 {
            height: 80px;
            width: 186px;
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
         <asp:Label ID="Label1" runat="server" Text="fill the following"></asp:Label>
         :
         <br />
         
         <asp:Label ID="Label2" runat="server" Text="Thesis Serial Number"></asp:Label>
         
         <br />
         <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
         <br />
         <br />
         <asp:Label ID="Label3" runat="server" Text="Progress Report Number"></asp:Label>
         
         <br />
         <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
         <br />
         <br />
         <asp:Label ID="Label4" runat="server" Text="State"></asp:Label>
         <br />
         
         <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
         <br />
         <br />
         <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
         
         <br />
         <asp:TextBox ID="TextBox4" runat="server" Height="65px" Width="178px"></asp:TextBox>
         
         <br />
         <br />
         <asp:Button ID="Button1" runat="server" Text="submit" Height="31px" OnClick="Button1_Click" Width="77px" />
         <br />
         
    </form>
</body>
</html>
