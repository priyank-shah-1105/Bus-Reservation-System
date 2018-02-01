<%@ Page Language="C#" AutoEventWireup="true" CodeFile="printing.aspx.cs" Inherits="passenger_printing" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Page</title>
    <link href="../css/style1.css" rel="stylesheet" type="text/css" />
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

</head>
<body>
    
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div id="printablediv">
        <asp:Panel ID="Panel1" runat="server"   Height="134px" Width="361px">
            <asp:Table ID="Table1"  CellSpacing="0" CellPadding="2" style="border:2px solid gray;padding:10px" runat="server">
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
                          <asp:Literal ID="jdate" runat="server" ></asp:Literal>                   
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
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />    
        </asp:Panel>
    </div>    
    
    </form>
</body>
</html>
