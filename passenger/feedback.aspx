<%@ Page Language="C#" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Feedback/Complaint Form : </h1>
    
    </div>
        <p>
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
            <h3>Contact number :<br />
                (on which you would like to be contacted for communication purposes addition to your email id you&#39;ve registered for ) </h3>
            <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" TextMode="Phone"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
            <h3>Subject :</h3>
        <asp:TextBox ID="TextBox2" runat="server" MaxLength="100" Width="448px"></asp:TextBox>
        <p>
            <h3>Details :</h3>
        <asp:TextBox ID="TextBox3" runat="server" Height="111px" MaxLength="1000" TextMode="MultiLine" Width="453px"></asp:TextBox>
        <br />
        <p>
            <h3>Rate Us : </h3>
            <asp:ListBox ID="ListBox1" runat="server" Height="25px" Width="115px">
                <asp:ListItem Value="5">Excellent</asp:ListItem>
                <asp:ListItem Value="4">Very Good</asp:ListItem>
                <asp:ListItem Value="3">Good</asp:ListItem>
                <asp:ListItem Value="2">Satisfactory</asp:ListItem>
                <asp:ListItem Value="1">Poor</asp:ListItem>
            </asp:ListBox>
        <asp:Rating ID="Rating1" runat="server">
        </asp:Rating>
        
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        </p>
    </form>
</body>
</html>
