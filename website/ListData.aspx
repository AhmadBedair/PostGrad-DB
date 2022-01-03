﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListData.aspx.cs" Inherits="WebApplication.ListData" %>

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
                    <asp:BoundField DataField="StudentName" HeaderText="StudentName" />
                     <asp:BoundField DataField="ThesisTitle" HeaderText="ThesisTitle" />
                     <asp:BoundField DataField="SupervisorName" HeaderText="SupervisorName" />
                                         
                </Columns>

            </asp:gridView>
            <asp:Button ID="back" runat="server" Text="Back to Home page" OnClick="back_Click" />
            <br />
        </div>
    </form>
</body>
</html>
