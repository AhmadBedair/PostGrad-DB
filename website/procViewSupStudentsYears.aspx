<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="procViewSupStudentsYears.aspx.cs" Inherits="GucianPostGradSystem.procViewSupStudentsYears" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" >
        <div>
            <asp:gridView ID="gridId" runat="server" AutoGenerateColumns="false" Width="372px">

                <Columns>
                    <asp:BoundField DataField="firstName" HeaderText="First name" />
                     <asp:BoundField DataField="lastName" HeaderText="Last name" />
                     <asp:BoundField DataField="years" HeaderText="Years spent" />

                </Columns>

            </asp:gridView>
        </div>
    </form>
</body>
</html>
