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
using System.Configuration;

public partial class UpdateTax : System.Web.UI.Page
{
    SqlConnection con;
    string connection = ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlCommand cmd;
    SqlDataReader reader;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(connection);
        string sql = "SELECT tax FROM ADMIN";
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
        int taxx = 0;
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                taxx = Convert.ToInt32(reader["tax"]);
                Label1.Text = taxx.ToString();
            }

        }
        reader.Close();
        cmd.Dispose();
        con.Close();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        int tax = Convert.ToInt32(TextBox1.Text);
        string sql = "UPDATE ADMIN SET tax = '"+tax+"'";
        con = new SqlConnection(connection);
        cmd = new SqlCommand(sql, con);

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
           "alert('SUCCESS');", true);

            con.Close();
            cmd.Dispose();

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SOMETHING WENT WRONG, COULDNT UPDATE');", true);
            con.Close();
            cmd.Dispose();
        }
    }

   
}