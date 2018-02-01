<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changeprofile.aspx.cs" Inherits="passenger_changeprofile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
   


        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <!--/header-->  
        <div class="about-main">
        <div class="container">
        <asp:Label runat="server" Style="color:GrayText;">
            FirstName:
            </asp:Label>
            <asp:TextBox ID="fname" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="fname"></asp:RequiredFieldValidator>
            <br />
        <br /> 
            <asp:Label runat="server" Style="color:GrayText;">               
                MiddleName:
                </asp:Label>
            <asp:TextBox ID="mname" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="mname"></asp:RequiredFieldValidator>
            <br />
        <br />
            <asp:Label runat="server" Style="color:GrayText;">
               lastname:
                </asp:Label>
            <asp:TextBox ID="lname" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="lname"></asp:RequiredFieldValidator>
            <br />
        <br />        
            <asp:Label runat="server" Style="color:GrayText;">
                state:
                </asp:Label>
            <asp:TextBox ID="state" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="state"></asp:RequiredFieldValidator>
            <br />
        <br />
            <asp:Label runat="server" Style="color:GrayText;">        
                city:
                </asp:Label>
            <asp:TextBox ID="city" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="city"></asp:RequiredFieldValidator>
            <br />
        <br />        
            <asp:Label runat="server" Style="color:GrayText;">
                Dirth of Birth:
                </asp:Label>
            <div>
            <asp:TextBox ID="dob" runat="server"  CssClass="form-control" height="30px" width="190px"></asp:TextBox> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="dob"></asp:RequiredFieldValidator>
                <asp:Label runat="server" Text="*MM-DD-YY" ForeColor="Red"></asp:Label>                           
        </div>
        <br />
            <asp:Label runat="server" Style="color:GrayText;">      
                Gender:
                </asp:Label>
            <asp:TextBox ID="gender" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="gender"></asp:RequiredFieldValidator>
            <br />
        <br />       
        Address:<asp:TextBox ID="address" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="address"></asp:RequiredFieldValidator>
            <br />
        <br />
            <asp:Label runat="server" Style="color:GrayText;">        
                Pincode:
                </asp:Label>
            <asp:TextBox ID="pincode" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="pincode"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="pincode" ErrorMessage="*Invalid Format" CssClass="text-danger" ValidationExpression="^([0-9]{6})$"></asp:RegularExpressionValidator>
            <br />
        <br />
            <asp:Label runat="server" Style="color:GrayText;">        
                Mobile Number:
                </asp:Label>
            <asp:TextBox ID="phoneno" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="phoneno"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="phoneno" ErrorMessage="*Invalid Format" CssClass="text-danger" ValidationExpression="^([0-9]{10})$"></asp:RegularExpressionValidator>
            <br />
        <br />
            <asp:Label runat="server" Style="color:GrayText;">        
                Email:
                </asp:Label>
            <asp:TextBox ID="email" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="email"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="email" ErrorMessage="*Invalid Format" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
        <br />
            <asp:Label runat="server" Style="color:GrayText;">        
                Country:
                </asp:Label>
            <asp:TextBox ID="country" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" Display="Dynamic" ErrorMessage="*Required." CssClass="text-danger" ControlToValidate="country"></asp:RequiredFieldValidator>
            <br />
        <br />        
        <asp:Button ID="submit" runat="server" Text="Modify Profile" OnClick="submit_Click" CssClass="btn btn-primary btn-lg"/>
            <br />
    </div>
            </div>

         <!--/start-footer-->                                                             
		<div class="footer-section">
				<div class="container">
					<div class="footer-grids">
						<%--<div class="col-md-3 footer-grid bottom-nav">
							<h3>Information </h3>
								<ul>
									<li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/passenger/homepage.aspx">Home</asp:HyperLink></li>
						            <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/passenger/about.aspx">About Us</asp:HyperLink> <%--<a href="about.html">About Us</a>--%></li>
						            <%--<li><asp:HyperLink ID="HyperLink3" runat="server" >recent projects</asp:HyperLink></li>
						            <li><asp:HyperLink ID="HyperLink4" runat="server">New Services</asp:HyperLink></li>
						            <li><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/passenger/Register.aspx">Register</asp:HyperLink></li>
						            <li><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/passenger/login.aspx">Login</asp:HyperLink></li>
						            <div class="clearfix"> </div>
								</ul>
							</div>--%>
						<div class="col-md-3 footer-grid category">
							
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
