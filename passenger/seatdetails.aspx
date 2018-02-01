<%@ Page Language="C#" AutoEventWireup="true" CodeFile="seatdetails.aspx.cs" Inherits="passenger_seatdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Literal ID="source" runat="server" Text="Source"></asp:Literal>
        :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Literal ID="sourcevalue" runat="server"></asp:Literal>
        <br />
        <br />
        <asp:Literal ID="destination" runat="server" Text="destination"></asp:Literal>
        :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Literal ID="destivalue" runat="server"></asp:Literal>
        <br />
        <br />
        <asp:Literal ID="fare" runat="server" Text="Total fare"></asp:Literal>
        :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Literal ID="farevalue" runat="server"></asp:Literal>
        <br />
        <br />
        <asp:Literal ID="date" runat="server" Text="Date"></asp:Literal>
        :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Literal ID="datevalue" runat="server"></asp:Literal>
        <br />
        <br />
        <asp:Literal ID="time" runat="server" Text="Time"></asp:Literal>
        :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Literal ID="timevalue" runat="server"></asp:Literal>
        <br />
        <br />
    </form>
</body>
</html>
