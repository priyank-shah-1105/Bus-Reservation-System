using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data.Sql;
//using System.Threading.ThreadAbortException;
public partial class Register : System.Web.UI.Page
{
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlDataAdapter adapter = new SqlDataAdapter();
    SqlConnection con;
    SqlDataReader reader;
    string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label3.Visible = false;
        Label1.Visible = false;
    }

    protected void reset_Click(object sender, EventArgs e)
    {
        pass.Text = "";
        address.Text = "";
        username.Text = "";
        confirmpass.Text = "";
        fname.Text = "";
        lname.Text = "";
        mname.Text = "";
        dob.Text = "";
        email.Text = "";
        city.Text = "";
        state.Text = "";
        country.Text = "";
        postal.Text = "";
        mobileno.Text = "";
    }

   

    public void insert()
    {
        /*string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
        SqlDataAdapter adapter = new SqlDataAdapter();
        */
        con = new SqlConnection(connectionstring);
        try
        {
            con.Open();
            //sql = "insert into passenger values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + DropDownList1.SelectedItem.Text + "','" + TextBox12.Text + "'," + TextBox7.Text + ",'" + RadioButton1.Text + "','" + TextBox8.Text + "'," + TextBox10.Text + ",'" + TextBox11.Text + "','" + TextBox9.Text + "','" + DropDownList2.SelectedItem.Text + "')";
            string sql = "insert into passenger values(@val1,@val2,@val3,@val4,@val5,@val6,@drop1,@val12,@val7,@radio1,@val8,@val10,@val11,@val9,@drop2)";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@val1", username.Text);
            cmd.Parameters.AddWithValue("@val2", pass.Text);
            cmd.Parameters.AddWithValue("@val3", confirmpass.Text);
            cmd.Parameters.AddWithValue("@val4", fname.Text);
            cmd.Parameters.AddWithValue("@val5", mname.Text);
            cmd.Parameters.AddWithValue("@val6", lname.Text);
            cmd.Parameters.AddWithValue("@drop1", state.Text);
            cmd.Parameters.AddWithValue("@val12", city.Text);
            cmd.Parameters.AddWithValue("@val7", dob.Text);
            if (male.Checked)
            {
                cmd.Parameters.AddWithValue("@radio1", male.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@radio1", female.Text);
            }
            cmd.Parameters.AddWithValue("@val8", address.Text);
            cmd.Parameters.AddWithValue("@val10", postal.Text);
            cmd.Parameters.AddWithValue("@val11", mobileno.Text);
            cmd.Parameters.AddWithValue("@val9", email.Text);
            cmd.Parameters.AddWithValue("@drop2", country.Text);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Label1.Visible = true;
                Label1.Text = "success";
                if (Label1.Text == "success")
                {
                    fetch();
                }
                else
                {
                    Label1.Text = "error";
                }
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "error";
            }
            con.Close();
            if(string.IsNullOrEmpty(userid))
            {

            }
            else
            {
                var abc =userid;
                byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc);
                Response.Redirect("homepage.aspx?userid=" + System.Convert.ToBase64String(var) + "", false);  
            }

        }
        catch (Exception em)
        {
            Console.WriteLine(em.Message);
            Console.ReadKey();
        }

    }
    public void fetch()
    {
        con = new SqlConnection(connectionstring);
        try
        {
            con.Open();
            string sql = "select user_id from passenger where username='"+username.Text+"'";
            SqlCommand cmd = new SqlCommand(sql,con);
            reader = cmd.ExecuteReader();
            if(reader.Read())
            {
                userid = reader["user_id"].ToString();
            }
            reader.Close();
        }
        catch(Exception e)
        {
            Response.Write(e.Message);
        }
        con.Close();
    }
    protected void username_TextChanged(object sender, EventArgs e)
    {
        //fetch();

        con = new SqlConnection(connectionstring);
        try
        {
            con.Open();
            string sql = "select username from passenger where username=@name";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@name", username.Text);
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                Label3.Visible = true;
            }
            else
            {
               Label3.Visible = false;
            }
            con.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            Console.ReadKey();
        }
    }

    protected void reg_Click1(object sender, EventArgs e)
    {
        insert();
    }
}