<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="procViewAStudentPublications.aspx.cs" Inherits="WebApplication.procViewAStudentPublications" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-image: url("./pub.jfif");
            background-repeat: no-repeat;
            background-size: cover;
            height: 492px;
        width: 800px;
        }
    </style>
</head>
<body style="height: 218px">
    <form id="form1" runat="server">
        <div>
            Enter the student&#39;s ID</div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Enter" OnClick="Button1_Click" />
        <p>
        </p>

              <asp:gridView ID="gridId" runat="server" AutoGenerateColumns="false" Width="372px">

                <Columns>
                    <asp:BoundField DataField="firstName" HeaderText="First name" />
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="title" HeaderText="Tite" />
                    <asp:BoundField DataField="date" HeaderText="Date" />
                    <asp:BoundField DataField="place" HeaderText="Place" />
                    <asp:BoundField DataField="accepted" HeaderText="Accepted" />
                    <asp:BoundField DataField="host" HeaderText="Host" />


                </Columns>

            </asp:gridView>
    </form>
</body>
</html>
