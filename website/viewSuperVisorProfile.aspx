<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewSuperVisorProfile.aspx.cs" Inherits="GucianPostGradSystem.viewSuperVisorProfile" %>

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
                    <asp:BoundField DataField="id" HeaderText="Id" />
                    <asp:BoundField DataField="name" HeaderText="Name" />
                     <asp:BoundField DataField="faculty" HeaderText="Faculty" />
                </Columns>

            </asp:gridView>
        </div>
    </form>
</body>
</html>
