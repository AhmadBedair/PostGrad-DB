﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewNonGucianProfile.aspx.cs" Inherits="GucianPostGradSystem.viewNonGucianProfile" %>

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
                    <asp:BoundField DataField="firstName" HeaderText="First name" />
                     <asp:BoundField DataField="lastName" HeaderText="Last name" />
                     <asp:BoundField DataField="type" HeaderText="type" />
                     <asp:BoundField DataField="faculty" HeaderText="Faculty" />
                     <asp:BoundField DataField="address" HeaderText="Address" />
                     <asp:BoundField DataField="GPA" HeaderText="GPA" />
                    

                </Columns>

            </asp:gridView>
        </div>
    </form>
</body>
</html>
