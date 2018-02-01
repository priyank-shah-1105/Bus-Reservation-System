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
using System.Text.RegularExpressions;
public partial class addBus : System.Web.UI.Page

{
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
        string id = TextBox7.Text;
        string name = TextBox2.Text;
        int max_seat = Convert.ToInt32(TextBox3.Text);
        string btype = ListBox2.SelectedItem.ToString();
        string time = TextBox5.Text;
        float fpkm = float.Parse(TextBox6.Text);
        string route = ListBox1.SelectedItem.ToString();
        string connection = ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
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
            

          
            string[] words = Regex.Split(route,"-");
            string source = words[0];
            string destination = words.Last();

          //  Response.Write("FIRST " + source + " LAST " + destination);

            reader.Close();
            con.Close();
            SqlConnection con2 = new SqlConnection(connection);
            SqlCommand cmd2;
            string sql = "INSERT INTO BUS (busid,routeid,busname,source,destination,time,bustype,fare,totalseats) values ('" + id + "'," + id2 + ",'" + name + "','" + source + "','" + destination + "','" + time +"','" + btype + "'," + fpkm + ","+ max_seat + ")";
            try
            {
                con2.Open();
                cmd2 = new SqlCommand(sql, con2);
               
                cmd2.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SUCCESS');", true);

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SOMETHING WENT WRONG, COULDNT ADD');", true);

            }
            con.Close();
        }
        catch (Exception exm)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SOMETHING WENT WRONG, COULDNT ADD');", true);
        }
    }
}