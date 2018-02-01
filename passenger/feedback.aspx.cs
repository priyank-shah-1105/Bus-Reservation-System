using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

      //  Session["userid"] = "1122334455";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Server=localhost;Integrated security=SSPI;database=BRS");
        con.Open();
        DateTime now = DateTime.Now;

        //String userid1 = Session["userid"].ToString;
        String userid1 = "1112223334";
        DateTime time = DateTime.Now;
        String contact = TextBox1.Text;
        String subject = TextBox2.Text;
        String details = TextBox3.Text;
        int rating = Convert.ToInt32(ListBox1.SelectedValue);
        String str = "INSERT INTO dbo.feedback (user_id,contact,subject,details,rating)"
        +"VALUES (@userid1,@contact,@subject,@details,@rating)";
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.Parameters.Add("@userid1", SqlDbType.VarChar, 10).Value = userid1;
        //cmd.Parameters.Add("@time", SqlDbType.Time, 7).Value = time;
        cmd.Parameters.Add("@contact", SqlDbType.VarChar, 10).Value = contact;
        cmd.Parameters.Add("@subject", SqlDbType.VarChar, 100).Value = subject;
        cmd.Parameters.Add("@details", SqlDbType.VarChar, 500).Value = details;
        cmd.Parameters.Add("@rating", SqlDbType.Int).Value = userid1;

        cmd.ExecuteNonQuery();


        /*int OBJ = Convert.ToInt32( cmd.ExecuteNonQuery()); */

       /* if (OBJ > 0)
        {

            //Redirect to thanks page

        }

        else
        {

            //Redirect to Error Page

        }
        */
        con.Close();



    }
}