<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADMIN LOGIN</title>
    <link href="~/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
    <!-- Custom Theme files -->
    <link href="~/css/style1.css" rel="stylesheet" type="text/css" />
    <!--<link href="css/style.css" rel='stylesheet' type='text/css' />-->
    <!--Custom Theme files-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>
    <script src="~/js/jquery-1.8.3.min.js"></script>
    <script src="~/js/modernizr.custom.53451.js"></script>

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
      <form id="form1" runat="server">
    <!--header-->
           <div class="header-section2">
        <div class="header-top bg">
            
                <!--logo-->
                <div class="logo two">
                    <a href="Login.aspx">
                        <img src="Images/logo.png" alt=""></a>
                </div>
                <!--top-nav-->
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="sub-header two">
            <div class="top-nav">
                
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
		
	 
    
	 			<h3 class="h3">
            LOGIN
            </h3>
				
		

  
    <div>
    
        <br />
        <br />
    <div class="container">
        USER ID :
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
        <br />
        <br />
        PASSWORD :
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" AutoCompleteType="Disabled" CssClass="form-control" height="30px" width="190px"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-primary btn-lg" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
    </div>
          <div class="copy-right-section">
				
					<div class="col-md-6 copy-right">
						<p></p>
					</div>
					


				
		</div>
                  
	
    </form>
</body>
</html>
