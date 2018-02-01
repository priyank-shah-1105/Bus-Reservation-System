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

public partial class passenger_forgotpass : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter adapter;
    SqlDataReader reader;
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        value.Visible = false;
        login.Visible = false;
        //recover();
    }
    
   
    protected void submit_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(connectionstring);
        try
        {
            con.Open();
            string sql = "select password from passenger where username='" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string pass = reader["password"].ToString();
                value.Visible = true;
                value.Text = "Your password is:\n" + pass;
                login.Visible = true;

            }
            reader.Close();
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}