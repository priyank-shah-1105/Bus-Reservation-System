<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/style.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Flat UI Web Form Widget and Kit,Login Forms,Sign up Forms,Registration Forms,News latter Forms,Elements"./>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>
<!--webfonts-->
		<link href='http://fonts.googleapis.com/css?family=Cabin:400,500,600,700,400italic,500italic,600italic,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts-->
</head>
<body>


    <div class="login-01">
		<div class="one-login  hvr-float-shadow">
			<div class="one-login-head">
					<img src="../Images/top-lock.png" alt=""/>
					<h1>LOGIN</h1>
					<span></span>
			</div>
			<form runat="server" id="form">
				<li>
                    <asp:TextBox ID="username" runat="server" Text="Username" CssClass="text" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}" ></asp:TextBox>
					<a href="#" class=" icon user"></a>
				</li>
				<li>
                    <asp:TextBox ID="password" runat="server" TextMode="Password" Text="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" ></asp:TextBox>
					<a href="#" class=" icon lock"></a>
				</li>
				<div class="p-container">
						<label class="checkbox"><input type="checkbox" name="checkbox" checked><i></i>Remember Me</label>
						<h6>
                            <asp:HyperLink ID="forgot" runat="server" NavigateUrl="~/passenger/forgotpass.aspx">Forgot Password ?</asp:HyperLink> 

						</h6>
							<div class="clear"> </div>
				</div>
				<div class="submit">
                    <asp:Button ID="Button1" runat="server" Text="SIGN IN" OnClick="Button1_Click" />						
				</div>
				<div>                    
						<ul class="soc_icons2">
							<li class="pic"><a href="#"><i class="icon_4"></i></a></li>
							<li class="pic"><a href="#"><i class="icon_5"></i></a></li>
							<li class="pic"><a href="#"><i class="icon_6"></i></a></li>
								
						</ul>
				</div>
					<h5>Don't have an account ?<a href="Register.aspx"> Sign Up </a></h5>
				</form>
		</div>
	</div>


<%--    <form id="form1" runat="server">

        




    <div>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Login ID="Login1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" Height="304px" OnAuthenticate="Login1_Authenticate" Width="401px">
            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
        </asp:Login>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
    </div>
    </form>
    <p>
        Not a user?</p>
   
    <a href="Register.aspx">Rgister here!!!</a>--%>
</body>
</html>
