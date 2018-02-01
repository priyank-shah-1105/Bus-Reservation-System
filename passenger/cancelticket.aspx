<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cancelticket.aspx.cs" Inherits="passenger_cancelticket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
        function printDiv(divID) {
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML =
              "<html><head><title></title></head><body>" +
              divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;

        }
    </script>
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
   
    <div id="printablediv">
        <!--/header-->  
        <div class="about-main">
        <div class="container">
        
        <asp:Panel ID="Panel1" runat="server"   Height="134px" Width="361px">
            <br />
            <br />
            <asp:Table ID="Table1" runat="server" CellPadding="2" CellSpacing="0" style="/*border-collapse:collapse */border:2px solid gray;padding:10px">
                <asp:TableRow>
                    <asp:TableCell>
                        Ticket NO:
                    </asp:TableCell>
                    <asp:TableCell>
                        <span>
                            <strong>
                                <asp:Literal ID="pnr" runat="server"></asp:Literal>
                            </strong>
                        </span>                        
                    </asp:TableCell>
                    <asp:TableCell>
                    </asp:TableCell>
                    <asp:TableCell>
                        Phone Number:
                    </asp:TableCell>
                    <asp:TableCell>
                        <span>
                            <strong>
                                <asp:Literal ID="phoneno" runat="server"></asp:Literal>
                            </strong>
                        </span>                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Passenger Name:
                    </asp:TableCell>
                    <asp:TableCell>
                        <span>
                            <strong>
                                <asp:Literal ID="passengername" runat="server"></asp:Literal>
                            </strong>
                        </span>
                        
                    </asp:TableCell>
                    <asp:TableCell>

                    </asp:TableCell>
                    <asp:TableCell>
                        Status:
                    </asp:TableCell>
                    <asp:TableCell>
                        <strong>
                            <asp:Literal ID="status" runat="server"></asp:Literal>
                        </strong>
                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Source:
                    </asp:TableCell>
                    <asp:TableCell>
                        <strong>
                            <asp:Literal ID="source" runat="server"></asp:Literal>
                        </strong>                        
                    </asp:TableCell>
                    <asp:TableCell>

                    </asp:TableCell>
                    <asp:TableCell>
                        Destination:
                    </asp:TableCell>
                    <asp:TableCell>
                        <strong>
                            <asp:Literal ID="destination" runat="server"></asp:Literal>
                        </strong>                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Journey Date:
                    </asp:TableCell>
                    <asp:TableCell>
                        <strong>
                          <asp:Literal ID="jdate" runat="server"></asp:Literal>                   
                        </strong>                                                                                                                       
                    </asp:TableCell>
                    <asp:TableCell>
                    </asp:TableCell>
                    <asp:TableCell>
                        Journey Time:
                    </asp:TableCell>
                    <asp:TableCell>
                        <strong>
                            <asp:Literal ID="jtime" runat="server"></asp:Literal>
                        </strong>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Seat Numbers:
                    </asp:TableCell>
                    <asp:TableCell>
                        <strong>
                            <asp:Literal ID="seatnumbers" runat="server"></asp:Literal>
                        </strong>
                    </asp:TableCell>
                    <asp:TableCell>
                    </asp:TableCell>
                    <asp:TableCell>
                        Number of Passengers:
                    </asp:TableCell>
                    <asp:TableCell>
                        <strong>
                            <asp:Literal ID="noofpassenger" runat="server"></asp:Literal>
                        </strong>                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Total Rent:
                    </asp:TableCell>
                    <asp:TableCell>
                        <strong>
                            <asp:Literal ID="rent" runat="server"></asp:Literal>
                        </strong>
                        
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Button ID="cancel" runat="server" Text="Cancel Ticket" CssClass="btn btn-primary btn-lg" OnClick="cancel_Click" />
           
               <input type="button" id="xyz" value="Print it" class="btn btn-primary btn-lg" onclick="javascript: printDiv('printablediv')" />  
           
        </asp:Panel>
    </div>    
            </div>
        </div>
    <div>
        <!--/header-->  
        <div class="about-main">
        <div class="container">
        
        <asp:Panel runat="server" ID="panel2">
            <asp:Label runat="server" Style="color:GrayText;">  
            Enter PNR number :
                </asp:Label>
            <br />
            <asp:TextBox ID="txt" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt" CssClass="text-danger" ErrorMessage="*Value required"></asp:RequiredFieldValidator>
            <br />
            <br />
                <asp:Button ID="pnrbutton" runat="server" Text="Enter" CssClass="btn btn-primary btn-lg" OnClick="pnrbutton_Click"/>
        </asp:Panel>
    </div>
       
        <asp:Panel ID="Panel3" runat="server">
            <asp:Literal runat="server" id="error">

            </asp:Literal>
            <br />
            <br />
            <br />
        </asp:Panel>
       </div>
        </div>
        

          <!--/start-footer-->                                                             
		<div class="footer-section">
				<div class="container">
					<div class="footer-grids1">
						<%--<div class="col-md-3 footer-grid bottom-nav">
							<h3>Information </h3>
								<ul>
									<li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/passenger/homepage.aspx">Home</asp:HyperLink></li>
						            <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/passenger/about.aspx">About Us</asp:HyperLink></li>
            						<li><asp:HyperLink ID="HyperLink3" runat="server" >recent projects</asp:HyperLink></li>
			            			<li><asp:HyperLink ID="HyperLink4" runat="server">New Services</asp:HyperLink></li>
						            <li><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/passenger/Register.aspx">Register</asp:HyperLink></li>
						            <li><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/passenger/login.aspx">Login</asp:HyperLink></li>
			            			<div class="clearfix"> </div>                    
								</ul>
							</div>
						--%><div class="col-md-3 footer-grid category">
							
								
							</div>
							<%--<div class="col-md-3 footer-grid brands">
								<h3>Brands </h3>
									<ul>
										<li><a href="#">Pellentesque</a>  </li>
										<li><a href="#">Lorem ipsum dolor </a> </li>
										<li><a href="#">Vestibulum pharetra</a> </li>
										<li><a href="#">Donec eros dolor</li>
										<div class="clearfix"> </a> </div>
									</ul>
							</div>
							--%><div class="col-md-3 footer-grid contact">
								 	 
									
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
