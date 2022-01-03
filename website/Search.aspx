<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebApplication.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter a keyword about Thesis Title<br />
            <asp:TextBox ID="KWord" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="SFT" runat="server" Text="GO" OnClick="SFT_Click" />
        

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
