using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlTypes;
using System.Data.SqlClient;


public partial class Profit : System.Web.UI.Page
{
    int count = 0, money = 0;
    string admin;
    protected void Page_Load(object sender, EventArgs e)
    {
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
        showNetIncome();
    }

    public void showNetIncome()
    {   
        string cs = ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string query = "SELECT amount FROM booking WHERE status = 'Booked'";
        SqlCommand cmd = new SqlCommand(query,con);
        SqlDataReader reader;
        try
        {

            con.Open();
            reader = cmd.ExecuteReader();
            if(reader.HasRows)
            {
                while(reader.Read())
                {
                    count++;
                    money += Convert.ToInt32(reader["amount"]);
                }

                con.Close();
                reader.Close();
                TextBox1.Text = money.ToString();
            }
        }
        catch(Exception ex)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
            "alert('SOMETHING WENT WRONG');", true);
        }
        
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int expense = Convert.ToInt32(TextBox2.Text);
        int net = money - expense;
        if (net > 0)
        {
            Label2.Text = "PROFIT ";
            Label1.Text = net.ToString();
        }
        else
        {
            Label2.Text = "LOSS ";
            Label1.Text = (-net).ToString();
        }
        
    }
}