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

public partial class DeleteBus : System.Web.UI.Page
{
    string conn = ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlConnection con;
    SqlDataReader reader;
    SqlDataReader reader1;
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
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string index = ListBox1.SelectedItem.ToString();
        
        con = new SqlConnection(conn);
        string query = "SELECT * FROM bus WHERE busid = '" + index + "'";
        SqlCommand cmd = new SqlCommand(query, con);
      
        try
        {
            con.Open();

            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                if(reader.Read())
                {
                    Label1.Text = reader[0].ToString();
                    
                    Label3.Text = reader[2].ToString();
                    Label4.Text = reader[3].ToString();
                    Label5.Text = reader[4].ToString();
                    Label6.Text = reader[5].ToString();
                    Label7.Text = reader[6].ToString();
                    Label8.Text = reader[7].ToString();
                    Label9.Text = reader[8].ToString();
                    Label2.Text = GetRoute(Convert.ToInt32(reader[1]));

                }                
            }
            con.Close();
            cmd.Dispose();
            reader.Close();
        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
 "alert('SOMETHING WENT WRONG, COULDNT DELETE');", true);


        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
          string conn = ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
          SqlConnection con = new SqlConnection(conn);
          SqlCommand cmd;
        
          string index = ListBox1.SelectedValue;
          
          string query = "DELETE FROM BUS WHERE busid = '" + index + "'";
          try
          {

              con.Open();
              cmd = new SqlCommand(query, con);
              cmd.ExecuteNonQuery();
              ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SUCCESS');", true);


              con.Close();
              cmd.Dispose();
             

          }
          catch (Exception ex)
          {
              ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
 "alert('SOMETHING WENT WRONG, COULDNT DELETE');", true);

          }
          con.Close();
        
    } 
    string GetRoute(int index)
    {

        reader.Close();
        string path = null;                       
        string query = "SELECT path FROM route WHERE routeid ='"+index+"'";
        SqlCommand cmd = new SqlCommand(query, con);
        reader1 = cmd.ExecuteReader(); 
        //cmd.Parameters.AddWithValue("@name",index);        
        try
        {
            if (reader1.Read())
            {

                path = reader1["path"].ToString();
            }
                reader1.Close();
         //con.Close();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
 "alert('SOMETHING WENT WRONG, COULDNT DELETE');", true);
        }



        return path;
    }
}


