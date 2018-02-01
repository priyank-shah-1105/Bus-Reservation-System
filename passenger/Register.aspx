<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
<title>Login form and sign up</title>
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
	
	<form runat="server" id="form1">    

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
                    <li><asp:HyperLink ID="home" runat="server" NavigateUrl="~/passenger/homepage.aspx">Home</asp:HyperLink></li>
						<li><asp:HyperLink ID="aboutus" runat="server" NavigateUrl="~/passenger/about.aspx">About Us</asp:HyperLink> <%--<a href="about.html">About Us</a>--%></li>
						<li  class="active"><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/passenger/Register.aspx">Register</asp:HyperLink></li>
						<li><asp:HyperLink ID="login" runat="server" NavigateUrl="~/passenger/login.aspx">Login</asp:HyperLink></li>
						<div class="clearfix"> </div>                    
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
           <h3>          
                 Account Information:
            </h3>
            <asp:Label runat="server" Style="color:GrayText;">
                UserName:
             </asp:Label>
            <asp:TextBox ID="username" runat="server" CssClass="form-control" height="30px" width="190px" AutoPostBack="True" OnTextChanged="username_TextChanged"></asp:TextBox>        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="Username required"  ValidationGroup="all" CssClass="text-danger" Display="Dynamic">* Username required</asp:RequiredFieldValidator>
            <asp:Label ID="Label3" runat="server"  CssClass="text-danger" Text="* Username already exists"></asp:Label>
            <br />
            <br />
            <asp:Label runat="server" Style="color:GrayText">
             Password
            </asp:Label>
            <asp:TextBox ID="pass" runat="server" TextMode="Password" CssClass="form-control" height="30px" width="190px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="pass" Display="Dynamic" ErrorMessage="Username required" CssClass="text-danger" ValidationGroup="all">* Password required</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="pass" Display="Dynamic" ErrorMessage="RegularExpressionValidator"  CssClass="text-danger" SetFocusOnError="True" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&amp;+=]).*$" ValidationGroup="all"> * At least one lower case letter,
            At least one upper case letter,At least special character,At least one number,At least 8 characters length</asp:RegularExpressionValidator>
            <br />   
            <br />
            <asp:Label runat="server" Style="color:GrayText;">
            Confirm-Password 
            </asp:Label>
            <asp:TextBox ID="confirmpass" runat="server" TextMode="Password" CssClass="form-control" height="30px" width="190px"></asp:TextBox>       
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="confirmpass" Display="Dynamic" ErrorMessage="Username required"  CssClass="text-danger" ValidationGroup="all">* Confirm password required</asp:RequiredFieldValidator>        
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pass" ControlToValidate="confirmpass" Display="Dynamic" ErrorMessage="CompareValidator"  CssClass="text-danger">* Password doesn&#39;t match</asp:CompareValidator>
            <br />
            <br />
            <h3>
            Personal Information:
                </h3>
            <asp:Label runat="server" Style="color:GrayText;">
            FirstName
            </asp:Label>
            <asp:TextBox ID="fname" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fname" ErrorMessage="Firstname required"  CssClass="text-danger" SetFocusOnError="True" ValidationGroup="all">* Firstname required</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label runat="server" Style="color:GrayText;">
             MiddleName
            </asp:Label>
            <asp:TextBox ID="mname" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="mname" ErrorMessage="Middlename required"  CssClass="text-danger" SetFocusOnError="True" ValidationGroup="all">* Middlename required</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label runat="server" Style="color:GrayText;">
            LastName
            </asp:Label>
            <asp:TextBox ID="lname" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="lname" ErrorMessage="Lastname required"  CssClass="text-danger" SetFocusOnError="True" ValidationGroup="all">* Lastname required</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label runat="server" Style="color:GrayText;">
            Gender
            </asp:Label>            
            <asp:RadioButton ID="male" runat="server" Text="Male" GroupName="abc" Checked="true"/>    
            <asp:RadioButton ID="female" runat="server"  GroupName="abc"  Text="Female" />
            <br />
            <br />
            <asp:Label runat="server" Style="color:GrayText;">
            Date of Birth
            </asp:Label>
            <asp:TextBox ID="dob" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:Label runat="server" CssClass="text-danger">
            *MM-DD-YY
            </asp:Label>            
            <br />
            <br />
            <asp:Label runat="server" Style="color:GrayText;">
            Email Address
            </asp:Label>
            <asp:TextBox ID="email" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="email required"  CssClass="text-danger" SetFocusOnError="True" ValidationGroup="all">* Email address required</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="RegularExpressionValidator"  CssClass="text-danger" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="all">Invalid format</asp:RegularExpressionValidator>
            <br />
            <br />
            <h3>
            Contact Information
            </h3>
            <asp:Label runat="server" Style="color:GrayText;">
                Address
                </asp:Label>
            <asp:TextBox ID="address" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="address" ErrorMessage="Lastname required"  CssClass="text-danger" SetFocusOnError="True" ValidationGroup="all">* Address required</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label runat="server" Style="color:GrayText;">
                City
                </asp:Label>
            <asp:TextBox ID="city" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="city" ErrorMessage="Lastname required"  CssClass="text-danger" SetFocusOnError="True" ValidationGroup="all">* City required</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label runat="server" Style="color:GrayText;">
                State
                </asp:Label>
            <asp:TextBox ID="state" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="state" ErrorMessage="Lastname required"  CssClass="text-danger" SetFocusOnError="True" ValidationGroup="all">* State required</asp:RequiredFieldValidator>
            <br />
            <asp:Label runat="server" Style="color:GrayText;">
                Country
                </asp:Label>
            <asp:TextBox ID="country" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="country" ErrorMessage="Lastname required"  CssClass="text-danger" SetFocusOnError="True" ValidationGroup="all">* Country required</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label runat="server" Style="color:GrayText;">
                Postal Code
                </asp:Label>
            <asp:TextBox ID="postal" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="postal" Display="Dynamic" ErrorMessage="Lastname required"  CssClass="text-danger" SetFocusOnError="True" ValidationGroup="all">* PostalCode required</asp:RequiredFieldValidator>        
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="postal" ErrorMessage="RegularExpressionValidator"  CssClass="text-danger" SetFocusOnError="True" ValidationExpression="^([0-9]{6})$" ValidationGroup="all">* Invalid format</asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label runat="server" Style="color:GrayText;">
            Mobile No:
                </asp:Label>
        <asp:TextBox ID="mobileno" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="mobileno" Display="Dynamic" ErrorMessage="Lastname required"  CssClass="text-danger" SetFocusOnError="True" ValidationGroup="all">* Mobile Number required</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="mobileno" ErrorMessage="RegularExpressionValidator"  CssClass="text-danger" SetFocusOnError="True" ValidationExpression="^([0-9]{10})$" ValidationGroup="all">* Invalid format</asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="reg" runat="server" OnClick="reg_Click1" CssClass="btn btn-primary btn-lg" Text="Register" ValidateRequestMode="Enabled" ValidationGroup="all" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="reset" runat="server" OnClick="reset_Click" Text="Reset" CssClass="btn btn-primary btn-lg" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <br />
    
    </div>    
            </div>


            <!--/start-footer-->                                                             
		<div class="footer-section">
				<div class="container">
					<div class="footer-grids">
						
						<div class="col-md-3 footer-grid category">
							
								<ul>
									
									
									<div class="clearfix"> </div>
								</ul>
							</div>
							<div class="col-md-3 footer-grid contact">
								 	 
											<ul>
												
												<div class="clearfix"> </div>
											</ul>
									
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
