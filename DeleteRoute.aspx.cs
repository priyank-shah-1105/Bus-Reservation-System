using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;


public partial class DeleteRoute : System.Web.UI.Page
{
    string connection = ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
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
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('This will permamnently delete route, sure?');", true);

        string route = ListBox1.SelectedItem.ToString();
        SqlConnection con = new SqlConnection(connection);
        SqlCommand cmd;
        SqlDataReader reader;


        
        try
        {
            con.Open();
            string x = "SELECT routeid FROM route WHERE path ='" + route + "'";
            cmd = new SqlCommand(x, con);
            reader = cmd.ExecuteReader();
            int id2 = 0;
            if (reader.Read())
            {
                id2 = Convert.ToInt32(reader["routeid"]);
            }

            reader.Close();
            con.Close();


            

            SqlConnection con2 = new SqlConnection(connection);
            SqlCommand cmd2;
            string sql = "DELETE FROM route WHERE routeid = " + id2 + "";
            cmd2 = new SqlCommand(sql, con2);
            con2.Open();
          int  i= cmd2.ExecuteNonQuery();
            if(i>0)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
    "alert('SUCCESS');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('Cant delete, some buses are still having it as a route');", true);
            }
            con2.Close();




        }






        catch (Exception ex)
        {

            

        }


    }
}
        
    