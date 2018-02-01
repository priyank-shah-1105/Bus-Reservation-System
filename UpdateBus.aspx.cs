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

public partial class UpdateBus : System.Web.UI.Page
{
    SqlConnection con;
    string connection = ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlCommand cmd;
    SqlDataReader reader;

    string busname = null;
    int maxseats = 0;
    string bustype = null;
    string time = null;
    int rid = 0;
    float fare = 0F;
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
                Response.Redirect("~/Login.aspx");
            }
        }
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {

        string bid = ListBox1.SelectedItem.Text;
        con = new SqlConnection(connection);
        string sql = "SELECT * FROM bus WHERE busid= '"+bid+"'";
        cmd = new SqlCommand(sql, con);

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SOMETHING WENT WRONG, COULDNT UPDATE');", true);
        }
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                busname = reader[2].ToString();
                maxseats = Convert.ToInt32(reader[8]);
                bustype = reader[6].ToString();
                time = reader[5].ToString();
                rid = Convert.ToInt32(reader[1]);
                fare = (float)Convert.ToDouble(reader[7]);
            }

        }
        reader.Close();
        cmd.Dispose();
        con.Close();

        TextBox1.Text = busname;
        TextBox2.Text = maxseats.ToString();
        ListBox2.DataTextField.Equals(bustype);
        TextBox3.Text = time;
        ListBox3.DataTextField.Equals(getRoute(rid));
        TextBox4.Text = fare.ToString();

       


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      
        

    }
    protected string getRoute(int i)
    {
        string path = null;
        string sql = "SELECT path FROM route WHERE routeid = '" + i + "'";
        con = new SqlConnection(connection);
        cmd = new SqlCommand(sql, con);

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SOMETHING WENT WRONG, COULDNT UPDATE');", true);

        }

        if (reader.HasRows)
            while (reader.Read())
                path = reader["path"].ToString();
        reader.Close();
        cmd.Dispose();
        con.Close();

        return path;
    }

    protected int getRid(string path)
    {
        //reader.Close();
        int i = 0;
        string sql = "SELECT routeid FROM route WHERE path='"+path+"'";
        con = new SqlConnection(connection);
        cmd = new SqlCommand(sql, con);

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
                while (reader.Read())
                    i = Convert.ToInt32(reader["routeid"]);
        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SOMETHING WENT WRONG, COULDNT UPDATE');", true);

        }

       

        reader.Close();
        cmd.Dispose();
        con.Close();

        return i;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string busid = ListBox1.SelectedItem.Text;
        busname = TextBox1.Text;
        maxseats = Convert.ToInt32(TextBox2.Text);
        bustype = ListBox2.SelectedItem.Text.ToString() ;
        time = TextBox3.Text;
        rid = getRid(ListBox3.SelectedItem.Text.ToString());
        fare = (float)Convert.ToDouble(TextBox4.Text);
        string[] words = Regex.Split(ListBox3.SelectedItem.Text.ToString(), "-");
        string source = words[0];
        string destination = words.Last();

        string sql = "UPDATE BUS SET routeid = '" + rid + "', busname = '" + busname + "', totalseats = '" + maxseats + "', source = '" + source + "', destination = '" + destination + "', time = '" + time + "', bustype = '" + bustype + "', fare = '" + fare + "' WHERE busid = '" + busid + "'";
        con = new SqlConnection(connection);
        cmd = new SqlCommand(sql, con);

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
           "alert('SUCCESS');", true);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SOMETHING WENT WRONG, COULDNT UPDATE');", true);
        }

        con.Close();

    }
}