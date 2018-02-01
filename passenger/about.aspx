<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="passenger_about" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>The Automotive bootstrap Website Template |About:: w3layouts</title>
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
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
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
    <div class="header-section2">
        <div class="header-top bg">
            <div class="container">
                <!--logo-->
                <div class="logo two">
                    <a href="index.html">
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
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><a href="about.html">About Us</a></li>
                    <li><a href="services.html">New Services</a></li>
                    <li><a href="404.html">Recent Projects</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="mail.html">Mail Us</a></li>
                    <div class="clearfix"></div>
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>
        <!-- script-for-menu -->
        <script>
					$(document).ready(function(){
						$("span.menu").click(function(){
							$(".top-nav ul").slideToggle(200);
						});
					});
        </script>
        <div class="clearfix"></div>
    </div>
    <!--/header-->
    <div class="about-main">
        <div class="container">
            <h3>SHORTLY ABOUTUS</h3>
            <div class="main-about">
                <div class="main-img">
                    <img src="../Images/ab-pic.jpg" title="" />
                </div>
                <div class="main-text">
                    <h4>Online BusBooking System</h4>
                    <p class="para1">We are one of the most leading</p>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- ourteam -->
    <%--<div class="ourteam">
			<div class="container">
				<h3>Management team</h3>
				<div class="team">
					  <ul id="flexiselDemo3">
						<li>
							<div class="team1">
								<img src="../Images/t1.jpg" class="img-responsive" alt="" />
								<h4>Bruce wayne</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
							</div>
						</li>
						<li>
							<div class="team1">
								<img src="../Images/t2.jpg" class="img-responsive" alt="" />
								<h4>Tony Stark</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
							</div>
						</li>
						<li>
							<div class="team1">
								<img src="../Images/t3.jpg" class="img-responsive" alt="" />
								<h4>Selina Kyle</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
							</div>
						</li>
						<li>
							<div class="team1">
								<img src="../Images/t4.jpg" class="img-responsive" alt="" />
								<h4>Bruce wayne</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
							</div>
					    </li>
						<li>
							<div class="team1">
								<img src="../Images/t1.jpg" class="img-responsive" alt="" />
								<h4>Tony Stark</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
							</div>
					    </li>
					    <li>
							<div class="team1">
								<img src="../Images/t2.jpg" class="img-responsive" alt="" />
								<h4>Tony Stark</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
							</div>
							<li>
							<div class="team1">
								<img src="../Images/t3.jpg" class="img-responsive" alt="" />
								<h4>Tony Stark</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
							</div>
					    </li>
					    </li>
					 </ul>
				</div>
				 <script type="text/javascript">
					$(window).load(function() {
						
						$("#flexiselDemo3").flexisel({
							visibleItems: 4,
							animationSpeed: 1000,
							autoPlay: true,
							autoPlaySpeed: 3000,    		
							pauseOnHover: true,
							enableResponsiveBreakpoints: true,
							responsiveBreakpoints: { 
								portrait: { 
									changePoint:480,
									visibleItems: 1
								}, 
								landscape: { 
									changePoint:640,
									visibleItems: 2
								},
								tablet: { 
									changePoint:768,
									visibleItems: 4
								}
							}
						});
						
					});
				    </script>
				    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
		</div>
	</div>--%>
    <!-- ourteam -->
    <!--/start-text-slider-->
    <div class="testimonials" id="testimonials">
        <div class="wmuSlider example1">
            <div class="container-flueid">
                <article style="position: absolute; width: 64%; opacity: 0;">

                    <div class=" cont span_2_of_3 client-main">
                        <div class="slide-text">
                            <p>
                                Vestibulum pharetra eleifend eros non 
									faucibus. Aliquam viverra magna mi, sit amet 
                            </p>
                            <span></span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </article>
                <article style="position: absolute; width: 64%; opacity: 0;">
                    <div class=" cont span_2_of_3  client-main">
                        <div class="slide-text">
                            <p>
                                Vestibulum pharetra eleifend eros non 
								faucibus. Aliquam viverra magna mi, sit amet 
                            </p>
                            <span></span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </article>
                <article style="position: absolute; width: 64%; opacity: 0;">
                    <div class="cont span_2_of_3  client-main">
                        <div class="slide-text">
                            <p>
                                Vestibulum pharetra eleifend eros non 
									faucibus. Aliquam viverra magna mi, sit amet 
                            </p>
                            <span></span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </article>

                <script src="js/jquery.wmuSlider.js"></script>
                <script>
       				     $('.example1').wmuSlider();         
                </script>
            </div>
        </div>
    </div>
    <!--//text-slider-->
    <!--/start-footer-->
    <!--/start-footer-->
    <div class="footer-section">
        <div class="container">
            <div class="footer-grids">
                <div class="col-md-3 footer-grid bottom-nav">
                    <h3>Information </h3>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="services.html">New Services</a></li>
                        <li><a href="404.html">Recent Projects</a></li>
                        <li><a href="blog.html">Blog</a></li>
                        <li><a href="mail.html">Mail Us</a></li>
                        <div class="clearfix"></div>
                    </ul>
                </div>
                
                
                <div class="col-md-3 footer-grid contact">
                    <h3>Contact</h3>
                    <ul>
                        <li><a href="#">Tel:1(234) 567-8901</a></li>
                        <li><a href="#">Tel:1(234) 567-8936</a></li>
                        <div class="clearfix"></div>
                    </ul>

                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!--//End-foote-->
    <div class="copy-right-section">
        <div class="container">
            <div class="col-md-6 copy-right">
                <p>Design by &nbsp;<a href="http://w3layouts.com">W3Layouts</a></p>
            </div>
            <div class="col-md-6 social-icons">
                <ul class="soc_icons2">
                    <li><a href="#"><i class="icon_4"></i></a></li>
                    <li><a href="#"><i class="icon_5"></i></a></li>
                    <li><a href="#"><i class="icon_6"></i></a></li>
                    <div class="clearfix"></div>
                </ul>

            </div>
        </div>
    </div>
</body>
</html>
