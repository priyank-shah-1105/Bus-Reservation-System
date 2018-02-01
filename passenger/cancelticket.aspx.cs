using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;
using System.Collections;

public partial class passenger_cancelticket : System.Web.UI.Page
{
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlConnection con;
    SqlDataReader reader;
    string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Panel1.Visible = false;
            Panel3.Visible = false;
           // printcancelled.Visible = false;
            if (Request.QueryString["userid"] != null)
            {
                string abc = Request.QueryString["userid"];
                byte[] dec = System.Convert.FromBase64String(abc);
                userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
                //Session["homeuserid"] = userid;

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
            }            
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
    protected void cancel_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(connectionstring);
        con.Open();
        string sql = "select status from booking where pnr=@pnr1";
        SqlCommand cmd = new SqlCommand(sql,con);
        cmd.Parameters.AddWithValue("@pnr1",txt.Text);
        reader = cmd.ExecuteReader();
        string temp = reader.ToString();
        while(reader.Read())
        {
            if((string)reader["status"]=="booked")
            {
                change();
                string message = "Cancelled Successfully";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
             //   printcancelled.Visible = true;
            }
            else
            {
                string message = "Ticket already Cancelled";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }
        }        
        con.Close();
    }

    private void change()
    {
        con = new SqlConnection(connectionstring);
        con.Open();
        string sql = "update booking SET status=@val where pnr=@pnr";
        SqlCommand cmd = new SqlCommand(sql,con);
        cmd.Parameters.AddWithValue("@val","cancelled");
        cmd.Parameters.AddWithValue("@pnr", txt.Text);
        int i = cmd.ExecuteNonQuery();
        if(i>0)
        {
            print();
            
        }        
        
    }
    public void print()
    {
        con = new SqlConnection(connectionstring);
        con.Open();
        string sql="select * from booking where pnr=@pnr";
        SqlCommand cmd = new SqlCommand(sql,con);
        cmd.Parameters.AddWithValue("@pnr",txt.Text);
        reader = cmd.ExecuteReader();
        while(reader.Read())
        {
            pnr.Text = reader["pnr"].ToString();
            passengername.Text = reader["name"].ToString();
            phoneno.Text = reader["contact"].ToString();
            source.Text = reader["source"].ToString();
            destination.Text = reader["destination"].ToString();
            jdate.Text = reader["date"].ToString();
            jtime.Text = reader["time"].ToString();
            seatnumbers.Text = reader["seatno"].ToString();
            noofpassenger.Text = reader["totalseats"].ToString();
            rent.Text = reader["amount"].ToString();
            status.Text = reader["status"].ToString();
        }
        
        panel2.Visible = false;
        Panel3.Visible = false;
        Panel1.Visible = true;
        //printcancelled.Visible = false;
    }
    protected void pnrbutton_Click(object sender, EventArgs e)
    {
        print();
    }
    
}