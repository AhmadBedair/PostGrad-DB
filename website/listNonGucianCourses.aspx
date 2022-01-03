<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listNonGucianCourses.aspx.cs" Inherits="GucianPostGradSystem.listNonGucianCourses" %>

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
                    <asp:BoundField DataField="courseID" HeaderText="courseID" />
                     <asp:BoundField DataField="courseCode" HeaderText="courseCode" />
                     <asp:BoundField DataField="grade" HeaderText="grade" />
                     <asp:BoundField DataField="firstName" HeaderText="firstName" />
                     <asp:BoundField DataField="lastName" HeaderText="lastName" />
                    

                </Columns>

            </asp:gridView>
        </div>
    </form>
</body>
</html>
