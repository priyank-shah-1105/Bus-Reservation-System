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

public partial class passenger_changeprofile : System.Web.UI.Page
{
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlConnection con;
    SqlDataReader reader;
    string userid;
    string userid1;    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["userid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
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
            }
            fetch();
        }
        string abc2 = Request.QueryString["userid"];
        byte[] dec1 = System.Convert.FromBase64String(abc2);
        userid1 = System.Text.ASCIIEncoding.ASCII.GetString(dec1);
    }
    public void fetch()
    {
        con = new SqlConnection(connectionstring);
        try
        {
            con.Open();
            string sql = "select * from passenger where user_id='"+userid+"'";
            SqlCommand cmd = new SqlCommand(sql,con);
            reader = cmd.ExecuteReader();
            if(reader.HasRows)
            {
                if(reader.Read())
                {
                    int phone=(int)reader["pincode"];
                    string phone1=phone.ToString();
                    DateTime date = (DateTime)reader["birth"];
                    string date1 = date.ToString("d");                    
                    fname.Text =(string)reader["firstname"];
                    mname.Text = (string)reader["middlename"];
                    lname.Text = (string)reader["lastname"];
                    state.Text = (string)reader["state"];
                    city.Text = (string)reader["city"];
                    dob.Text = date1;
                    gender.Text = (string)reader["gender"];
                    address.Text = (string)reader["address"];
                    pincode.Text = phone1;
                    phoneno.Text = (string)reader["phoneno"];
                    email.Text = (string)reader["email"];
                    country.Text = (string)reader["country"];
                    
                }
            }                
            else
            {
                Response.Redirect("Register.aspx");
            }
            reader.Close();
            con.Close();
        }
        catch
        {

        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {        
        con = new SqlConnection(connectionstring);
        try
        {
            con.Open();
            string sql = "update passenger set firstname=@fname,middlename=@mname,lastname=@lname,state=@state,city=@city,birth=@birth,gender=@gender,address=@address,pincode=@pincode,phoneno=@pno,email=@email,country=@country where user_id='"+userid1+"'";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@fname",fname.Text);
            cmd.Parameters.AddWithValue("@mname",mname.Text);
            cmd.Parameters.AddWithValue("@lname",lname.Text);
            cmd.Parameters.AddWithValue("@state",state.Text);
            cmd.Parameters.AddWithValue("@city",city.Text);
            cmd.Parameters.AddWithValue("@birth",dob.Text);
            cmd.Parameters.AddWithValue("@gender",gender.Text);
            cmd.Parameters.AddWithValue("@address",address.Text);
            cmd.Parameters.AddWithValue("@pincode",pincode.Text);
            cmd.Parameters.AddWithValue("pno",phoneno.Text);
            cmd.Parameters.AddWithValue("email",email.Text);
            cmd.Parameters.AddWithValue("@country",country.Text);            
            int i = cmd.ExecuteNonQuery();
            if(i>0)
            {                
                string message = "SuccessFully Updated";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }
            else
            {               
                string message =  "Error in Updating";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }
            con.Close();
        }
        catch
        {

        }
    }
}