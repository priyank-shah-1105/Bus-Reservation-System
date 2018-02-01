<%@ Page Language="C#" AutoEventWireup="true" CodeFile="selectseat.aspx.cs" Inherits="passenger_selectseat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="pnl1" runat="server">
                                            <asp:Table border="0" ID="seattable" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell ID="TableCell1" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s1" ToolTip="Window Side" ImageUrl="~/Images/available_seat_img.gif"
                                                            OnClick="s1click" runat="server" />1</asp:TableCell>
                                                    <asp:TableCell ID="TableCell2" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s6" OnClick="s6click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />6</asp:TableCell>
                                                    <asp:TableCell ID="TableCell3" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s7" OnClick="s7click" ToolTip="Window Side" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />7</asp:TableCell>
                                                    <asp:TableCell ID="TableCell4" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s12" OnClick="s12click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />12</asp:TableCell>
                                                    <asp:TableCell ID="TableCell5" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s13" OnClick="s13click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />13</asp:TableCell>
                                                    <asp:TableCell ID="TableCell6" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s18" OnClick="s18click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />18</asp:TableCell>
                                                    <asp:TableCell ID="TableCell7" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s19" OnClick="s19click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />19</asp:TableCell>
                                                    <asp:TableCell ID="TableCell8" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s24" OnClick="s24click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />24</asp:TableCell>
                                                    <asp:TableCell ID="TableCell9" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s25" OnClick="s25click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />25</asp:TableCell>
                                                    <asp:TableCell ID="TableCell10" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s31" OnClick="s31click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />31</asp:TableCell></asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell ID="TableCell11" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s2" ImageUrl="~/Images/available_seat_img.gif" OnClick="s2click"
                                                            runat="server" />2</asp:TableCell>
                                                    <asp:TableCell ID="TableCell12" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s5" OnClick="s5click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />5</asp:TableCell>
                                                    <asp:TableCell ID="TableCell13" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s8" OnClick="s8click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />8</asp:TableCell>
                                                    <asp:TableCell ID="TableCell14" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s11" OnClick="s11click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />11</asp:TableCell>
                                                    <asp:TableCell ID="TableCell15" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s14" OnClick="s14click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />14</asp:TableCell>
                                                    <asp:TableCell ID="TableCell16" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s17" OnClick="s17click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />17</asp:TableCell>
                                                    <asp:TableCell ID="TableCell17" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s20" OnClick="s20click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />20</asp:TableCell>
                                                    <asp:TableCell ID="TableCell18" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s23" OnClick="s23click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />23</asp:TableCell>
                                                    <asp:TableCell ID="TableCell19" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s26" OnClick="s26click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />26</asp:TableCell>
                                                    <asp:TableCell ID="TableCell20" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s30" OnClick="s30click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />30</asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell ID="TableCell21" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell22" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell23" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell24" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell25" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell26" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell27" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell28" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell29" runat="server">&nbsp; </asp:TableCell>
                                                    <asp:TableCell ID="TableCell30" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s29" OnClick="s29click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />29</asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell ID="TableCell31" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s3" OnClick="s3click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />3</asp:TableCell>
                                                    <asp:TableCell ID="TableCell32" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s4" OnClick="s4click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />4</asp:TableCell>
                                                    <asp:TableCell ID="TableCell33" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s9" OnClick="s9click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />9</asp:TableCell>
                                                    <asp:TableCell ID="TableCell34" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s10" OnClick="s10click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />10</asp:TableCell>
                                                    <asp:TableCell ID="TableCell35" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s15" OnClick="s15click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />15</asp:TableCell>
                                                    <asp:TableCell ID="TableCell36" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s16" OnClick="s16click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />16</asp:TableCell>
                                                    <asp:TableCell ID="TableCell37" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s21" OnClick="s21click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />21</asp:TableCell>
                                                    <asp:TableCell ID="TableCell38" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s22" OnClick="s22click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />22</asp:TableCell>
                                                    <asp:TableCell ID="TableCell39" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s27" OnClick="s27click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />27</asp:TableCell>
                                                    <asp:TableCell ID="TableCell40" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="s28" OnClick="s28click" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />28</asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </asp:Panel>
       <br />
        
        <asp:Table>
            <asp:TableRow>
                <asp:TableCell ID="TableCell41" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/available_seat_img.gif"
                                                            runat="server" />Available Seats.</asp:TableCell>
                                <asp:TableCell ID="TableCell43" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="ImageButton3" ImageUrl="~/Images/booked_seat_img.gif"
                                                            runat="server" />Booked Seats.</asp:TableCell>
                                <asp:TableCell ID="TableCell42" class="seatCell" valign="middle" runat="server">
                                                        <asp:ImageButton ID="ImageButton2" ImageUrl="~/Images/selected_seat_img.gif"
                                                            runat="server" />Selected Seats.</asp:TableCell>
            </asp:TableRow>
        </asp:Table><br />
        <br />                             
        <asp:TextBox ID="txtseatnumber" runat="server"></asp:TextBox>

        <br />
       
        <br />
        <br />

        <asp:Button ID="next" runat="server" Text="Next" OnClick="next_Click" />



         
    </div>
    </form>
</body>
</html>
