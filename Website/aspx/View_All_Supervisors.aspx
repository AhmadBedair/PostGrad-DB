<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_All_Supervisors.aspx.cs" Inherits="WebApplication.View_All_Supervisors" %>

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
                    <asp:BoundField DataField="id" HeaderText="ID" />
                     <asp:BoundField DataField="name" HeaderText="Name" />
                     <asp:BoundField DataField="faculty" HeaderText="Faculty" />                   
                </Columns>

            </asp:gridView>
        </div>
    </form>
</body>
</html>
