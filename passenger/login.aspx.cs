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

public partial class login : System.Web.UI.Page
{
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlConnection con;
    SqlDataAdapter adapter = new SqlDataAdapter();
    SqlDataReader reader;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(username.Text);
    }
    //protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    //{
        
    //    


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (validate(username.Text,password.Text))
        {

            var abc = Session["userid"].ToString();
            byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
            Response.Redirect("homepage.aspx?userid=" + System.Convert.ToBase64String(var));
            Response.Write(Session["userid"]);
        }
        else
        {
            Response.Write("error in logon");      
        }
    }
    public bool validate(string username, string password)
    {
        bool boolreturnvalue = false;
        try
        {
            con = new SqlConnection(connectionstring);
            con.Open();
            string sql = "select user_id,username,password from passenger where username=@user and password=@pass";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@user", username);
            cmd.Parameters.AddWithValue("@pass", password);
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    Session.Add("userid", reader["user_id"]);
                }

                boolreturnvalue = true;
                return boolreturnvalue;
            }
            else
            {
                return boolreturnvalue;
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            Console.ReadKey();
            return false;
        }

    }    
}