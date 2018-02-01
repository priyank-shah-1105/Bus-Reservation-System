<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listbus.aspx.cs" Inherits="listbus"  %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function CheckOtherIsCheckedByGVID(spanChk) {

            var IsChecked = spanChk.checked;
            if (IsChecked) {                
                spanChk.parentElement.parentElement.style.color = 'black';
                
            }
            var CurrentRdbID = spanChk.id;
            var Chk = spanChk;
            Parent = document.getElementById("<%=GridView1.ClientID%>");
                var items = Parent.getElementsByTagName('input');
                for (i = 0; i < items.length; i++) {
                    if (items[i].id != CurrentRdbID && items[i].type == "radio") {
                        if (items[i].checked) {
                            items[i].checked = false;
                            

                            items[i].parentElement.parentElement.style.color = 'black';
                        }
                    }
                }
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
    <!--/header-->  
        <div class="about-main">
        <div class="container">
            <h3>List of Buses</h3>   
    <div>        
        <asp:PlaceHolder>
     <asp:GridView ID="GridView1" runat="server"  OnSelectedIndexChanged ="GridView1_SelectedIndexChanged" CssClass="table table-striped table-hover" AutoGenerateColumns="False" BorderColor="White" BackColor="White" BorderStyle="None" BorderWidth="1px" ForeColor="#000066" >            
            <Columns>
                  <asp:TemplateField>
                    <ItemTemplate>                                                                     
                         <asp:RadioButton ID="radio" runat="server" onclick="javascript:CheckOtherIsCheckedByGVID(this);" AutoPostBack="true"  OnCheckedChanged="rdbauthid_CheckedChanged" GroupName="a" />
                      </ItemTemplate>
                     </asp:TemplateField>                                 
                <asp:BoundField  DataField="busid" HeaderText="BUS ID" />
                <asp:BoundField  DataField="busname" HeaderText="Bus Name" />                
                <asp:BoundField  DataField="path" HeaderText="Via Route" />
                <asp:BoundField  DataField="source" HeaderText="source" />                       
                <asp:BoundField  DataField="destination" HeaderText="destination" />                
                <asp:BoundField  DataField="time" HeaderText="Depature Time" />
                <asp:BoundField  DataField="date" HeaderText="Depature Date" ApplyFormatInEditMode="true"  DataFormatString="{0:d}"   />
                <asp:BoundField  DataField="bustype" HeaderText="Type of Bus" />
                
                <asp:BoundField  DataField="totalseats" HeaderText="Total Seats" />
                <asp:TemplateField HeaderText="Seat Details">
                    <ItemTemplate>
                        <asp:LinkButton ID="seatdetails" runat="server" OnClick="seatdetails_Click">Details</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
       </asp:GridView>
        </asp:PlaceHolder>
        <br />
        
    </div>
            </div>
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label"></asp:Label>
            </div>
        <div>            
        </div>
       

        <!--/start-footer-->                                                             
		<div class="footer-section">
				<div class="container">
					<div class="footer-grids">
						<%--<div class="col-md-3 footer-grid category">
							<h3>Categories </h3>
								<ul>
									<li><a href="#">Proin at tellus quis</a> </li>
									<li><a href="#">Felis tincidun</a>  </li>
									<li><a href="#">Vestibulum</a> </li>
									<li><a href="#">Sets</a> </li>
									<li><a href="#">Praesent sit</a> </li>
									<li><a href="#">Amet nulla molestie</a> </li>
									
									<div class="clearfix"> </div>
								</ul>
							</div>--%>
							<%--<div class="col-md-3 footer-grid contact">
								 	 <h3>Contact</h3>
											<ul>
												<li><a href="#">Tel:1(234) 567-8901</a></li>
												<li><a href="#">Tel:1(234) 567-8936</a></li>
												<div class="clearfix"> </div>
											</ul>
									
								</div>--%>	
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
