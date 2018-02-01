using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Text.RegularExpressions;
using System.Web.Configuration;
using System.Configuration;

public partial class Changepass : System.Web.UI.Page
{
    SqlConnection con;
    string connection = ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlCommand cmd;
    SqlDataReader reader;
    protected void Page_Load(object sender, EventArgs e)
    {
        string admin;
        if (!IsPostBack)
        {

            if (Request.QueryString["admin"] != null)
            {
                string abc = Request.QueryString["admin"];
                byte[] dec = System.Convert.FromBase64String(abc);
                admin = System.Text.ASCIIEncoding.ASCII.GetString(dec);


                var abc1 = admin;
                byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc1);

                home.Text = "Home";
                home.NavigateUrl = "AdminHome.aspx?admin=" + System.Convert.ToBase64String(var);

                addbus.Text = "Add Bus";
                addbus.NavigateUrl = "~/AddBus.aspx?admin=" + System.Convert.ToBase64String(var);

                deletebus.Text = "Delete Bus";
                deletebus.NavigateUrl = "~/DeleteBus.aspx?admin=" + System.Convert.ToBase64String(var);

                updatebus.Text = "Update Bus";
                updatebus.NavigateUrl = "~/UpdateBus.aspx?admin=" + System.Convert.ToBase64String(var);

                deleteroute.Text = "DeleteRoute";
                deleteroute.NavigateUrl = "~/DeleteRoute.aspx?admin=" + System.Convert.ToBase64String(var);

                addroute.Text = "Add Route";
                addroute.NavigateUrl = "~/AddRoute.aspx?admin=" + System.Convert.ToBase64String(var);

                profit.Text = "View Profit";
                profit.NavigateUrl = "~/Profit.aspx?admin=" + System.Convert.ToBase64String(var);

                chgpasswd.Text = "Change Password";
                chgpasswd.NavigateUrl = "~/Changepass.aspx?admin=" + System.Convert.ToBase64String(var);

                logout.Text = "Logout";
                logout.NavigateUrl = "~/logout.aspx";
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (Validate(TextBox1.Text, TextBox2.Text))
        {

            Update(TextBox1.Text, TextBox2.Text);
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SUCCESS');", true);

        }
        else
            Response.Write("OLD Password is wrong");

        }
    protected bool Validate(string oldpass, string newpass)
    {
        con = new SqlConnection(connection);
        string query = "SELECT Password FROM ADMIN WHERE Password = '"+ oldpass +"'";
        cmd = new SqlCommand(query, con);
        try { 
        con.Open();
        reader = cmd.ExecuteReader();
            if(reader.HasRows)
            
                return true;
                else
                    return false;
             reader.Close();
            con.Close();

            }
            
           
        
            catch(Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SOMETHING WENT WRONG, COULDNT CHANGE');", true);

                return false;
                reader.Close();
                con.Close();
            
        }
        

    }

    protected void Update(string oldpass, string newpass)
    {
        con = new SqlConnection(connection);
        string query = "UPDATE ADMIN SET Password = '"+ newpass +"' WHERE Password = '"+oldpass +"'";
        cmd = new SqlCommand(query, con);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


        }
        catch(Exception ex)
        {
            Response.Write("Something Went Wrong" + ex);
        }



    }

}