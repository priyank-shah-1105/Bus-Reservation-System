<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pastbooking.aspx.cs" Inherits="passenger_pastbooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
    <!-- Custom Theme files -->
    <link href="../css/style1.css" rel="stylesheet" type="text/css" />
    <!--<link href="css/style.css" rel='stylesheet' type='text/css' />-->
    <!--Custom Theme files-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script src="../js/modernizr.custom.53451.js"></script>

    <!--start-smoth-scrolling-->
    <script type="text/javascript" src="../js/move-top.js"></script>
    <script type="text/javascript" src="../js/easing.js"></script>

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
    <form id="form1" runat="server">
           <!--header-->
    <div class="header-section2">
        <div class="header-top bg">
            <div class="container">
                <!--logo-->
                <div class="logo two">
                    <a href="homepage.aspx">
                        <img src="../Images/logo.png" alt=""></a>
                </div>
                <!--top-nav-->
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="sub-header two">
            <div class="top-nav">
                <span class="menu two"></span>
                <ul>
                    <li class="active"><asp:HyperLink ID="home" runat="server" NavigateUrl="~/passenger/homepage.aspx">Home</asp:HyperLink></li>
						<li><asp:HyperLink ID="aboutus" runat="server" NavigateUrl="~/passenger/about.aspx">About Us</asp:HyperLink> <%--<a href="about.html">About Us</a>--%></li>
						<li><asp:HyperLink ID="recent" runat="server" >recent projects</asp:HyperLink></li>
						<li><asp:HyperLink ID="newservices" runat="server">New Services</asp:HyperLink></li>
						<li><asp:HyperLink ID="reg" runat="server" NavigateUrl="~/passenger/Register.aspx">Register</asp:HyperLink></li>
						<li><asp:HyperLink ID="login" runat="server" NavigateUrl="~/passenger/login.aspx">Login</asp:HyperLink></li>
						<div class="clearfix"> </div>
                    <div class="clearfix"></div>
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>
        <!-- script-for-menu -->
        <script>
            $(document).ready(function () {
                $("span.menu").click(function () {
                    $(".top-nav ul").slideToggle(200);
                });
            });
        </script>
        <div class="clearfix"></div>
    </div>
<!--/header-->  
        <div class="about-main">
        <div class="container">
            <h3>List of Past Bookings</h3>             

    <div>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-hover" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="false" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="#000066">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="busid" HeaderText="Bus Id." />
                <asp:BoundField DataField="pnr" HeaderText="Pnr No." />
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="contact" HeaderText="Mobile No." />
                <asp:BoundField DataField="source" HeaderText="Source." />
                <asp:BoundField DataField="destination" HeaderText="Destination." />
                <asp:BoundField DataField="date" HeaderText="Depature Date." ApplyFormatInEditMode="true"  DataFormatString="{0:d}"/>
                <asp:BoundField DataField="time" HeaderText="Time." />
                <asp:BoundField DataField="totalseats" HeaderText="Total Seats." />
                <asp:BoundField DataField="seatno" HeaderText="Seat No." />
                <asp:BoundField DataField="amount" HeaderText="Amount." />
                <asp:BoundField DataField="status" HeaderText="Status." />                
            </Columns>            
        </asp:GridView>
        
    </div>
            </div>
            </div>
         <!--/start-footer-->                                                             
		<div class="footer-section">
				<div class="container">
					<div class="footer-grids">
						<div class="col-md-3 footer-grid category">
							
									<div class="clearfix"> </div>
								</ul>
							</div>
							<div class="col-md-3 footer-grid contact">
								 	 
								</div>	
						<div class="clearfix"> </div>							
					</div>
				</div>
			</div>
		<!--//End-foote-->
		<div class="copy-right-section">
				<div class="container">
					<div class="col-md-6 copy-right">
						<p></p>
					</div>
					<div class="col-md-6 social-icons">
						<ul class="soc_icons2">
											<li><a href="#"><i class="icon_4"></i></a></li>
											<li><a href="#"><i class="icon_5"></i></a></li>
											<li><a href="#"><i class="icon_6"></i></a></li>
											<div class="clearfix"> </div>
										</ul>

					</div>
				</div>
		</div>

    </form>
</body>
</html>
