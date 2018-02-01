<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addBus.aspx.cs" Inherits="addBus" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Bus</title>

    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
<!-- Custom Theme files -->
<link href="css/style1.css" rel='stylesheet' type='text/css' />
<!--Custom Theme files-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</script>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/modernizr.custom.js"></script>

 <!--start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
		
		<script type="text/javascript">
		    jQuery(document).ready(function ($) {
		        $(".scroll").click(function (event) {
		            event.preventDefault();
		            $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
		        });
		    });
		</script>
<!--start-smoth-scrolling-->
	<!--webfonts-->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<!--webfonts-->	




</head>


<body style="height:auto">

    <form id="form1" runat="server">
        <!--header-->
	<div class="header-section">
		<div class="header-top"></div>
			<div class="container">
			<!--logo-->
			   <div class="logo">
				<a href="index.html"><img src="images/logo.png" alt=""></a>
				</div>
			<!--top-nav-->
			<div class="sub-header">
			<div class="top-nav">
					<span class="menu"> </span>
					<ul>

  
                        <li><asp:HyperLink ID="home" runat="server" NavigateUrl="~/AdminHome.aspx">Home</asp:HyperLink></li>
						<li><asp:HyperLink ID="addbus" runat="server" NavigateUrl="~/addBus.aspx">Add Bus</asp:HyperLink></li>
						<li><asp:HyperLink ID="updatebus" runat="server" NavigateUrl="~/UpdateBus.aspx" >Update Bus</asp:HyperLink></li>
						<li><asp:HyperLink ID="deletebus" runat="server" NavigateUrl="DeleteBus.aspx">Delete Bus</asp:HyperLink></li>
						<li><asp:HyperLink ID="profit" runat="server" NavigateUrl="~/Profit.aspx">View Profit</asp:HyperLink></li>
						<li><asp:HyperLink ID="addroute" runat="server" NavigateUrl="~/AddRoute.aspx">Add Route</asp:HyperLink></li>
                        <li><asp:HyperLink ID="deleteroute" runat="server" NavigateUrl="~/DeleteRoute.aspx">Delete Route</asp:HyperLink></li>
                        <li><asp:HyperLink ID="chgpasswd" runat="server" NavigateUrl="~/Changepass.aspx">Change Password</asp:HyperLink></li>
                        <li><asp:HyperLink ID="logout" runat="server" NavigateUrl="~/logout.aspx">Logout</asp:HyperLink></li>
						<div class="clearfix"> </div>
                    
                </ul></div>
			</div>
				<div class="clearfix"> </div>
		<!-- script-for-menu -->
				<script>
				    $(document).ready(function () {
				        $("span.menu").click(function () {
				            $(".top-nav ul").slideToggle(200);
				        });
				    });
				</script>
			<div class="clearfix"> </div>
			<!--//End-slider-script-->
		</div>
	</div>
		
	<div class="container">
		   
        <br />
        <br />
        Bus ID : 
        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>        
        <br />
        <br />
        Bus Name :
        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" height="30px" width="190px" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" Display="Dynamic" CssClass="text-danger" ErrorMessage="*Required"></asp:RequiredFieldValidator>
        <br />
        <br />
        Max Seats : <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Must Be Integer Only" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>
        <br />        
        <br />
        Bus Type :
        <asp:DropDownList ID="ListBox2" runat="server"  CssClass="form-control1">
            <asp:ListItem Value="Local">Local</asp:ListItem>
            <asp:ListItem Value="Express(NON-A/C)">Express(NON-A/C)</asp:ListItem>
            <asp:ListItem Value="Express(A/C)">Express(A/C)</asp:ListItem>
            <asp:ListItem Value="Volvo(A/C)">Volvo(A/C)</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        Time :<asp:TextBox ID="TextBox5" runat="server"  CssClass="form-control" height="30px" width="190px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
        <br />
        <br />
        Route :
        <asp:DropDownList ID="ListBox1" runat="server" DataSourceID="SqlDataSource2" CssClass="form-control1"  DataTextField="path" DataValueField="path"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [path] FROM [route]"></asp:SqlDataSource>
        <br />
        <br />
        Fare/KM :
        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox6" ErrorMessage="Only Numbers with decimal point Allowed" ValidationExpression="^\d*\.?\d*$" Display="Dynamic"></asp:RegularExpressionValidator>
        <br />
        <br />        
        <div class="submit"> 
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="btn btn-primary btn-lg" Text="Add" />
            </div>
        <br />
        <br />          
        </div>
  


        
    </form>
     <div class="copy-right-section">
				<div class="container">
					<div class="col-md-6 copy-right">
						<p></p>
					</div>
					
				</div>
		</div>

    
</body>
</html>
