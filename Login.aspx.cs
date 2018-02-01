using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class Login : System.Web.UI.Page
{
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {


    }
protected void Button1_Click(object sender, EventArgs e)
{

    if (validate(TextBox1.Text,TextBox2.Text))
    {

        var abc = Session["admin"].ToString();
        byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
        Response.Redirect("AdminHome.aspx?admin=" + System.Convert.ToBase64String(var));
        Response.Write(Session["admin"]);
    }
    else
    {
        Response.Write("error in LOGIN");
    }}
  
    protected bool validate(string id, string password)
   {
    string userid_x=id,pass_x=password;
    string userid = null, pass = null;
    
    string cs = ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlConnection con = new SqlConnection(cs);
    string query = "SELECT * FROM ADMIN";
    SqlCommand cmd = new SqlCommand(query, con);
    SqlDataReader reader;
    try
    {

        con.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                userid = reader["UserID"].ToString();
                pass = reader["Password"].ToString();
            }

            con.Close();
            reader.Close();

        }

        if (userid.Equals(userid_x) && pass.Equals(pass_x))
        {
            Session.Add("admin", userid);
            return true;
        }

        else
        {
            Session.Add("admin", null);
            return false;
        }
        
    }
    catch (Exception ex)
    {
        Response.Write("SOMETHING WENT WRONG TRY AGAIN : " + ex);

        return false;

    }
        
}
}