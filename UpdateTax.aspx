<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateTax.aspx.cs" Inherits="UpdateTax" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    
        <br />
        <br />
        Current Value :<br />

        <asp:Label ID="Label1" runat = "server" Text =""></asp:Label>
        <br />
        <br />
        <br />
        Enter New Value :<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="Only Integer Possible" ValidationExpression="(\d)*" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />

    
    </div>
    </form>
</body>
</html>
