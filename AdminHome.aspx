<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADMIN PANEL | ONLINE BUS RESERVATION SYSTEM

    </title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
    <!-- Custom Theme files -->
    <link href="css/style1.css" rel='stylesheet' type='text/css' />
    <!--Custom Theme files-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <%--</script>--%>
    <script src="~/js/jquery-1.8.3.min.js"></script>
    <script src="~/js/modernizr.custom.js"></script>

    <!--start-smoth-scrolling-->
    <script type="text/javascript" src="~/js/move-top.js"></script>
    <script type="text/javascript" src="~/js/easing.js"></script>

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


<body>
  
  
    <!--header-->
  <div class="header-section">
		<div class="header-top"></div>
			<div class="container">
			<!--logo-->
			   <div class="logo">
				<a href="homepage.aspx"><img src="Images/logo.png" alt=""></a>
				</div>
			<!--top-nav-->
			<div class="sub-header">
			<div class="top-nav1">
               
					<span class="menu"> </span>
					<ul>
                    <li>
                        <asp:HyperLink ID="home" runat="server" NavigateUrl="~/AdminHome.aspx">Home</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="addbus" runat="server" NavigateUrl="~/addBus.aspx">Add Bus</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="updatebus" runat="server" NavigateUrl="~/UpdateBus.aspx">Update Bus</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="deletebus" runat="server" NavigateUrl="DeleteBus.aspx">Delete Bus</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="profit" runat="server" NavigateUrl="~/Profit.aspx">View Profit</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="addroute" runat="server" NavigateUrl="~/AddRoute.aspx">Add Route</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="deleteroute" runat="server" NavigateUrl="~/DeleteRoute.aspx">Delete Route</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="chgpasswd" runat="server" NavigateUrl="~/Changepass.aspx">Change Password</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="logout" runat="server" NavigateUrl="~/logout.aspx">Log out</asp:HyperLink></li>
                   <div class="clearfix"> </div>
					</ul>
                   
				</div>
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
	


    
      
</body>
</html>
