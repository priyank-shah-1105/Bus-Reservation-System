<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="passenger_payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        
        <asp:Literal ID="Literal1" runat="server" Text="Ticket No:"></asp:Literal>
        <asp:Literal ID="pnrlit" runat="server" Text="Ticket No:"></asp:Literal>
        <br />
        <br />
        <br />
     NAME:   <asp:TextBox ID="name" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ErrorMessage="*Name Required" ForeColor="Red" ControlToValidate="name" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        Phone No:<asp:TextBox ID="phoneno" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Phone No Required" ForeColor="Red" ControlToValidate="phoneno" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="phoneno" Display="Dynamic" ErrorMessage="*Invalid Format" ForeColor="Red" ValidationExpression="^([0-9]{10})$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <br />
    </div>
        <asp:Button ID="checkout" runat="server" Text="Proceed to checkout" OnClick="checkout_Click"/>
    </form>
</body>
</html>
