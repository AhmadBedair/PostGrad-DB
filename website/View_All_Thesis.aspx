<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_All_Thesis.aspx.cs" Inherits="WebApplication.Ongoing_Thesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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


            <br />
            <asp:Button ID="View_Ongoing_Thesis" runat="server" Height="37px" Text="Ongoing Thesis" Width="118px" OnClick="View_Ongoing_Thesis_Click" />
            <br />


        </div>
    </form>
</body>
</html>
