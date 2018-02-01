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
using System.Web.Configuration;
using System.Collections;

public partial class passenger_payment : System.Web.UI.Page
{
    string pnr;
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlConnection con;
    SqlDataReader reader;
    SqlDataReader reader1;
    SqlDataReader reader2;
    SqlDataReader reader3;
    string abc;
    string busid;
    string userid;
    string abc1;
    string date;
    string time;
    protected void Page_Load(object sender, EventArgs e)
    {
        display();        
        create();
    }


    public void display()
    {
        abc = Request.QueryString["busid"];
        byte[] temp = System.Convert.FromBase64String(abc);
        busid = System.Text.ASCIIEncoding.ASCII.GetString(temp);

        string abc1 = Request.QueryString["userid"];
        byte[] dec = System.Convert.FromBase64String(abc1);
        userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);

        con = new SqlConnection(connectionstring);
        con.Open();
        //Response.Write(Session["usersource"]);
        //Response.Write(Session["userdestination"]);
        string sql = "select fare from bus where busid='" + busid + "'";
        SqlCommand cmd = new SqlCommand(sql, con);
        reader2 = cmd.ExecuteReader();
        if (reader2.Read())
        {

            calculate(float.Parse(reader2["fare"].ToString()));
        }
        reader2.Close();
        con.Close();
    }

    private void calculate(float p)
    {
        reader2.Close();
        string sql = "select kms from city where cityname=@name";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@name", Session["usersource"]);
        reader1 = cmd.ExecuteReader();
        if (reader1.Read())
        {
            float temp = (float.Parse(reader1["kms"].ToString()));
            desti(p, temp);
        }
        reader1.Close();
    }

    private void desti(float p, float temp)
    {
        reader1.Close();
        float destikms = 0;
        string sql = "select kms from city where cityname=@name";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@name", Session["userdestination"]);
        reader2 = cmd.ExecuteReader();
        if (reader2.Read())
        {
            destikms = float.Parse(reader2["kms"].ToString());
        }
        reader2.Close();
        float temp1 = ((destikms - temp) * p);
        float ans = Math.Abs(temp1);
        Session["Fare1"] = ans;
    }

    private void create()
    {
        string abc = Request.QueryString["pnr"];
        byte[] temp = System.Convert.FromBase64String(abc);
        pnr = System.Text.ASCIIEncoding.ASCII.GetString(temp);
        pnrlit.Text = pnr;
        Session["pnr"] = pnrlit.Text;
        //Response.Write((string)Session["busid"]);
    }
   
    protected void checkout_Click(object sender, EventArgs e)
    {
        datefetch();
        reader3.Close();
        con = new SqlConnection(connectionstring);
        con.Open();
        string sql = "insert into booking(pnr,name,contact,source,destination,date,time,totalseats,seatno,amount,status,busid,user_id) values(@val1,@val2,@val3,@val4,@val5,@val11,@val12,@val6,@val7,@val8,@val9,@val10,@val13)";
        SqlCommand cmd = new SqlCommand(sql,con);
        cmd.Parameters.AddWithValue("@val1",pnrlit.Text);
        cmd.Parameters.AddWithValue("@val2", name.Text);
        cmd.Parameters.AddWithValue("@val3", phoneno.Text);
        cmd.Parameters.AddWithValue("@val4",(string)Session["usersource"] );
        cmd.Parameters.AddWithValue("@val5", (string)Session["userdestination"]);
        cmd.Parameters.AddWithValue("@val6", (string)Session["totalseats"]);
        cmd.Parameters.AddWithValue("@val7", (string)Session["seatno"]);
        cmd.Parameters.AddWithValue("@val8", (float)Session["Fare1"]);
        cmd.Parameters.AddWithValue("@val9","booked");
        cmd.Parameters.AddWithValue("@val10", (string)Session["busid"]);
        cmd.Parameters.AddWithValue("@val11", date);
        cmd.Parameters.AddWithValue("@val12", time);
        cmd.Parameters.AddWithValue("@val13", userid);
        //cmd.Parameters.AddWithValue("@val11", (string)Session["userid"]);
        int i = cmd.ExecuteNonQuery();
        if(i>0)
        {
            var userid1 = userid;
            byte[] var2 = System.Text.ASCIIEncoding.ASCII.GetBytes(userid1);
            Response.Redirect("printing.aspx?userid=" + System.Convert.ToBase64String(var2));
        }
        else
        {
            Response.Write("failed");
        }
        con.Close();
    }
    public void datefetch()
    {
        con.Open();
        string sql = "select date,time from bus where busid='"+busid+"'";
        SqlCommand cmd = new SqlCommand(sql,con);
        reader3 = cmd.ExecuteReader();
        if(reader3.Read())
        {
            date = reader3["date"].ToString();
            time = reader3["time"].ToString();
        }
        reader3.Close();
        con.Close();
    }
}