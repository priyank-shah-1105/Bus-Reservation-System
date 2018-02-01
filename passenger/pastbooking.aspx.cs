using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;
using System.Windows.Forms;
using System.Web.Services;

public partial class passenger_pastbooking : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter adapter;
    SqlDataReader reader;
    DataTable dt = new DataTable();
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["userid"]!=null)
        {
            string abc = Request.QueryString["userid"];
            byte[] dec = System.Convert.FromBase64String(abc);
            userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
            var abc1 = userid;
            byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc1);

            home.Text = "Home";
            home.NavigateUrl = "~/passenger/homepage.aspx?userid=" + System.Convert.ToBase64String(var);
            aboutus.Text = "Modify Profile";
            aboutus.NavigateUrl = "~/passenger/changeprofile.aspx?userid=" + System.Convert.ToBase64String(var);
            newservices.Text = "Booking History";
            newservices.NavigateUrl = "~/passenger/pastbooking.aspx?userid=" + System.Convert.ToBase64String(var);
            recent.Text = "Ticket Cancellation";
            recent.NavigateUrl = "~/passenger/cancelticket.aspx?userid=" + System.Convert.ToBase64String(var);
            login.Text = "Log Out";
            login.NavigateUrl = "~/passenger/logout.aspx";
            reg.Text = "change Password";
            reg.NavigateUrl = "~/passenger/changepassword.aspx?userid=" + System.Convert.ToBase64String(var);
            display(userid);
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    public void display(string userid)
    {
        DataSet ds = new DataSet();
        try
        {
            con = new SqlConnection(connectionstring);
            con.Open();                        
            string sql = "select pnr,name,contact,source,destination,date,time,totalseats,seatno,amount,status,busid from booking where user_id='"+userid+"'";
            SqlCommand cmd = new SqlCommand(sql, con);                
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(ds);            
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();            
        }
        catch(Exception e)
        {
            Response.Write(e.Message);
        }
    }
}