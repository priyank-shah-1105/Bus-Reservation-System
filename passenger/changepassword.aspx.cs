using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;
using System.Data;
using System.Collections;

public partial class passenger_changepassword : System.Web.UI.Page
{
    string userid;
    SqlConnection con;
    SqlDataAdapter adapter;
    SqlDataReader reader;
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        message.Visible = false;
        if(Request.QueryString["userid"]!=null)
        {
            string abc = Request.QueryString["userid"];
            byte[] dec = System.Convert.FromBase64String(abc);
            userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
            var abc1 = userid;
            byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc1);

            home.Text = "Home";
            home.NavigateUrl = "~/passenger/homepage.aspx?userid=" + System.Convert.ToBase64String(var); ;
            aboutus.Text = "Modify Profile";
            aboutus.NavigateUrl = "~/passenger/changeprofile.aspx?userid=" + System.Convert.ToBase64String(var);
            newservices.Text = "Booking History";
            newservices.NavigateUrl = "~/passenger/pastbooking.aspx?userid=" + System.Convert.ToBase64String(var);
            recent.Text = "Ticket Cancellation";
            recent.NavigateUrl = "~/passenger/cancelticket.aspx";
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
    public void change(string userid)
    {
        con = new SqlConnection(connectionstring);
        try
        {
            con.Open();
            string sql = "select * from passenger where user_id='" + userid + "'";
            SqlCommand cmd = new SqlCommand(sql,con);
            reader = cmd.ExecuteReader();
            if(reader.Read())
            {
                string temp = (string)reader["password"];
                if(old.Text.Equals(temp))
                {
                    update();
                }
                else
                {
                    oldpass.Visible = true;
                }
            }
            reader.Close();
        }
        catch
        {

        }
    }
    public void update()
    {
        int i=0;
        try
        {
            reader.Close();
            string temp = newpass.Text;
            string temp1 = confirm.Text;
            string sql = "update passenger SET password=@temp,confirmpass=@temp2 where user_id=@userid";
            SqlCommand cmd = new SqlCommand(sql,con);
            cmd.Parameters.AddWithValue("@temp",temp);
            cmd.Parameters.AddWithValue("@temp2", temp1);
            cmd.Parameters.AddWithValue("@userid", userid);
            if(temp.Equals(temp1))
            {
                i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    message.Visible = true;
                    message.Text = "password changes successfully";
                }
                else
                {
                    message.Visible = true;
                    message.Text = "*some error while changing password";
                }
            }  
            else
            {
                //message.Visible = true;
                //message.Text = "*new password and confirm password doent match";
            }            
        }
        catch(Exception e)
        {
            Response.Write(e.Message);
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        change(userid);
    }
}