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

public partial class passenger_seatdetails : System.Web.UI.Page
{
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlConnection con;
    string abc;
    string busid;
    SqlDataReader reader;
    SqlDataReader reader1;
    SqlDataReader reader2;
    protected void Page_Load(object sender, EventArgs e)
    {
        display();
        fetch();
        //Response.Write(Session["fare1"]);
    }
    public void display()
    {
        abc = Request.QueryString["busid"];
        byte[] temp = System.Convert.FromBase64String(abc);
        busid = System.Text.ASCIIEncoding.ASCII.GetString(temp);        
        con = new SqlConnection(connectionstring);
        con.Open();
        //Response.Write(Session["usersource"]);
        //Response.Write(Session["userdestination"]);
        string sql = "select fare from bus where busid='"+busid+"'";
        SqlCommand cmd = new SqlCommand(sql,con);
        reader = cmd.ExecuteReader();
        if(reader.Read())
        {
             
            calculate(float.Parse (reader["fare"].ToString()));
        }
        reader.Close();
        con.Close();
    }

    private void calculate(float p)
    {
        reader.Close();
        string sql = "select kms from city where cityname=@name";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@name",Session["usersource"]);
        reader1 = cmd.ExecuteReader();
        if(reader1.Read())
        {
            float temp=(float.Parse(reader1["kms"].ToString()));
            desti(p,temp);
        }
        reader1.Close();
    }

    private void desti(float p, float temp)
    {
        reader1.Close();
        float destikms=0;
        string sql = "select kms from city where cityname=@name";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@name", Session["userdestination"]);
        reader2 = cmd.ExecuteReader();
        if(reader2.Read())
        {
            destikms = float.Parse(reader2["kms"].ToString());            
        }
        reader2.Close();
        float temp1=((destikms-temp)*p);
        float ans = Math.Abs(temp1);
        Session["Fare1"] = ans;
    }    

    public void fetch()
    {
        con.Open();
        string sql = "select * from bus where busid='"+busid+"'";
        SqlCommand cmd = new SqlCommand(sql,con);
        reader = cmd.ExecuteReader();
        if(reader.Read())
        {
            sourcevalue.Text = Session["usersource"].ToString();
            destivalue.Text = Session["userdestination"].ToString();
            farevalue.Text = Session["fare1"].ToString();
            DateTime date = (DateTime)reader["date"];
            string date2 = date.ToString("d");
            datevalue.Text = date2;
            timevalue.Text = reader["time"].ToString();
        }
        
        reader.Close();
        con.Close();
    }
}