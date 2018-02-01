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
</head>
<body>
    <form id="form1" runat="server">       
    <div>        
     <asp:GridView ID="GridView1" runat="server"  OnSelectedIndexChanged ="GridView1_SelectedIndexChanged" AutoGenerateColumns="false" >            
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
                <asp:BoundField  DataField="date" HeaderText="Depature Date" />
                <asp:BoundField  DataField="bustype" HeaderText="Type of Bus" />
                
                <asp:BoundField  DataField="totalseats" HeaderText="Total Seats" />
                <asp:TemplateField HeaderText="Seat Details">
                    <ItemTemplate>
                        <asp:LinkButton ID="seatdetails" runat="server" OnClick="seatdetails_Click">Details</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
       </asp:GridView>
        
    </div>
        <div>            
        </div>
       
    </form>
</body>
</html>
