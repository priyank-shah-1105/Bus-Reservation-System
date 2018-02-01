<%@ Page Language="C#" AutoEventWireup="true" CodeFile="homepage.aspx.cs" Inherits="homepage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<!DOCTYPE HTML>
<html>
<head runat="server">
<title>Online Bus Reservation System</title>
    <style type="text/css">
/*Calendar Control CSS*/
.cal_Theme1 .ajax__calendar_container   {
background-color: #ffd400;
border:solid 1px #ffffff;
}

.cal_Theme1 .ajax__calendar_header  {
background-color: #ffffff;
margin-bottom: 4px;
}

.cal_Theme1 .ajax__calendar_title,
.cal_Theme1 .ajax__calendar_next,
.cal_Theme1 .ajax__calendar_prev    {
color: #004080;
padding-top: 3px;
}

.cal_Theme1 .ajax__calendar_body    {
background-color: #ffffff;
border: solid 1px #ffd400;
}

.cal_Theme1 .ajax__calendar_dayname {
text-align:center;
font-weight:bold;
margin-bottom: 4px;
margin-top: 2px;
color: #004080;
}

.cal_Theme1 .ajax__calendar_day {
color: #004080;
text-align:center;
}

.cal_Theme1 .ajax__calendar_hover .ajax__calendar_day,
.cal_Theme1 .ajax__calendar_hover .ajax__calendar_month,
.cal_Theme1 .ajax__calendar_hover .ajax__calendar_year,
.cal_Theme1 .ajax__calendar_active  {
color: #004080;
font-weight: bold;
background-color: #DEF1F4;
}

.cal_Theme1 .ajax__calendar_today   {
font-weight:bold;
}

.cal_Theme1 .ajax__calendar_other,
.cal_Theme1 .ajax__calendar_hover .ajax__calendar_today,
.cal_Theme1 .ajax__calendar_hover .ajax__calendar_title {
color: #bbbbbb;
}
</style>





<link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
<!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
<!-- Custom Theme files -->
<link href="../css/style1.css" rel='stylesheet' type='text/css' />
<!--Custom Theme files-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<%--</script>--%>
<script src="../js/jquery-1.8.3.min.js"></script>
<script src="../js/modernizr.custom.js"></script>

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
    <form id="form1" runat="server">
<!--header-->
	<div class="header-section">
		<div class="header-top"></div>
			<div class="container">
			<!--logo-->
			   <div class="logo">
				<a href="homepage.aspx"><img src="../Images/logo.png" alt=""></a>
				</div>
			<!--top-nav-->
			<div class="sub-header">
			<div class="top-nav1">
               
					<span class="menu"> </span>
					<ul>
                        <li class="active"><asp:HyperLink ID="home" runat="server" NavigateUrl="~/passenger/homepage.aspx">Home</asp:HyperLink></li>
						<li><asp:HyperLink ID="aboutus" runat="server" NavigateUrl="~/passenger/about.aspx">About Us</asp:HyperLink> <%--<a href="about.html">About Us</a>--%></li>
						<li><asp:HyperLink ID="recent" runat="server" >recent projects</asp:HyperLink></li>
						<li><asp:HyperLink ID="newservices" runat="server">New Services</asp:HyperLink></li>
						<li><asp:HyperLink ID="reg" runat="server" NavigateUrl="~/passenger/Register.aspx">Register</asp:HyperLink></li>
						<li><asp:HyperLink ID="login" runat="server" NavigateUrl="~/passenger/login.aspx">Login</asp:HyperLink></li>
						<div class="clearfix"> </div>
					</ul>
                   
				</div>
			</div>
				<div class="clearfix"> </div>
		<!-- script-for-menu -->
				<script>
					$(document).ready(function(){
						$("span.menu").click(function(){
							$(".top-nav ul").slideToggle(200);
						});
					});
				</script>
			<div class="clearfix"> </div>
			<!--//End-slider-script-->
		</div>
	</div>
<!--/header-->
		 <div id="Welcome">
					<div class="container">
							<div class="wecome-main">
								<div class=" col-md-6 wecome-text">
										<h1>Welcome</h1>
										<span>Now Travelling is just a click away!</span>
										<p>Our Service is efficient, reliable and easy. Just use the search and select from many buses available. Book the seat you wish to and you can even cancel it before 24 hrs of departure. Travelling was never such easy and fun.  </p>
										<div class= "wecome-button">
											<a class="button rotate2" href="/passenger/about.aspx">Read More<span> </span></a>
										</div>
									</div>	
                                    
                                        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
                                                                                
                                        <div class=" col-md-3" style="margin-left:270px;margin-bottom:-20px;">
                                            <h5 style="color: #ffd400;text-transform: uppercase;font-size: 2.4em;font-family: 'Open Sans', sans-serif;font-weight: 600;">SEARCHING</h5>
                                        </div>                                        
                                                 <div class=" col-md-3 wecome-img " style="margin-left:270px;margin-bottom:0px;">                                            
                                            <asp:RadioButton ID="RadioButton1" runat="server"  GroupName="abc" Checked="true"/>
                                                             <asp:Label runat="server" Style="color:GrayText;">
                                                ONE TRIP
                                            </asp:Label>
                                                     <asp:RadioButton ID="RadioButton2" GroupName="abc" runat="server" Style="margin-left:10px" />
                                                             <asp:Label runat="server" Style="color:GrayText;">
                                                Round TRIP
                                            </asp:Label>                                            
                                                  </div>                                                                               
                                     
										<div class= "col-md-3 wecome-img" style="margin-left:270px;margin-bottom:0px;">
                                            <asp:Label runat="server" Style="color:GrayText;">
                                                FROM:
                                            </asp:Label>
                                            <asp:DropDownList ID="from" CssClass="form-control" runat="server" Style="margin-bottom:8px;" DataSourceID="SqlDataSource1" DataTextField="cityname" DataValueField="cityname"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [cityname] FROM [city]"></asp:SqlDataSource>
										</div>
                                        <div class="col-md-3 wecome-img" style="margin-left:270px;margin-bottom:0px;">
                                            <asp:Label runat="server" Style="color:GrayText;">
                                                TO:
                                            </asp:Label>
                                            <asp:DropDownList ID="to" runat="server" CssClass="form-control" Style="margin-bottom:0px;" DataSourceID="SqlDataSource1" DataTextField="cityname" DataValueField="cityname"></asp:DropDownList>                                            
                                        </div>
                                        <div class=" col-md-3 wecome-img form-group" style="margin-left:270px;margin-bottom:0px;">
                                            <asp:Label runat="server" Style="color:GrayText;">
                                                DATE:
                                            </asp:Label>
 
                                          <div class="input-group">                                            
                                              <asp:TextBox ID="date" runat="server" CssClass="form-control" Style="margin-bottom:8px;"></asp:TextBox>
                                              <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" CssClass= " cal_Theme1"  TargetControlID="date" PopupButtonID="ImageButton1" PopupPosition="TopLeft">
                                              </asp:CalendarExtender>                                              
                                              <span class="input-group-addon">
                                                  <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/images.png"  runat="server" Height="17px" Width="18px" />                                                  
                                              </span>                                                                                            
                                          </div>
                                        </div>
                                        <div>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Style="margin-left:857px;" ControlToValidate="date" ErrorMessage="* Date Required" ForeColor="Red"></asp:RequiredFieldValidator>                                                                                         
                                            <br />
                                            <asp:Button ID="Button1" runat="server"  CssClass="btn btn-primary btn-lg" Style="margin-left:900px;width:120px;" OnClick="Button1_Click" Text="Search" />
                                        </div>
                                        
                                    

								<div class="clearfix"> </div>  			
						</div>
					</div>	
				</div>
	<!-- //End-welcomet-->
	 
	<!--/start-text-slider-->
		<div  class="testimonials" id="testimonials">
			 <div class="wmuSlider example1">
		 	<div class="container-flueid">
			   <article style="position: absolute; width:64%; opacity: 0;"> 				   	
					<div class=" cont span_2_of_3 client-main">
							<div class="slide-text">
									<p>Experience the Simplicity, Confort and Elegance.</p>
						  	<span> </span>
						 	</div>
						 	<div class="clearfix"> </div>  
					</div>
				</article>
				 <article style="position: absolute; width:64%; opacity: 0;"> 
				   	<div class=" cont span_2_of_3  client-main">
							<div class="slide-text">
								<p> Register Today For The World Class Travelling Experience. </p>
						  			<span> </span>
						 	</div>
						 	<div class="clearfix"> </div>  
					</div>
				 </article>
				 <article style="position: absolute; width:64%; opacity: 0;"> 
				   	<div class="cont span_2_of_3  client-main">
							<div class="slide-text">
									<p>
                                        Enjoy The World Class Service, Now Just A Few Clicks Away!

									</p>
						  	<span> </span>
						 	</div>
						 	<div class="clearfix"> </div>  
					</div>
				 </article>
		 
                  <script src="../js/jquery.wmuSlider.js"></script> 
					<script>
       				     $('.example1').wmuSlider();         
   					</script> 	           	      
	         </div>
	     </div>
	 </div>
	 <!--//text-slider-->
<!--/start-footer-->                                                             
		<div class="footer-section">
				<div class="container">
					<div class="footer-grids">
						
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
