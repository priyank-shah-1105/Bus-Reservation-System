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

public partial class homepage : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter adapter;
    SqlDataReader reader;
    string[] a;
    ArrayList pat = new ArrayList();
    ArrayList ab = new ArrayList();
    ArrayList routeid = new ArrayList();
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.QueryString["userid"]!=null)
            {
                string abc = Request.QueryString["userid"];
                byte[] dec = System.Convert.FromBase64String(abc);
                userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
                //Session["homeuserid"] = userid;

                var abc1 =userid;
                byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc1);

                home.Text = "Home";
                home.NavigateUrl = "~/passenger/homepage.aspx?userid=" + System.Convert.ToBase64String(var);
                aboutus.Text = "Modify Profile";
                aboutus.NavigateUrl = "~/passenger/changeprofile.aspx?userid=" + System.Convert.ToBase64String(var);
                newservices.Text = "Booking History";
                newservices.NavigateUrl = "~/passenger/pastbooking.aspx?userid=" + System.Convert.ToBase64String(var);
                recent.Text = "Ticket Cancellation";
                recent.NavigateUrl = "~/passenger/cancelticket.aspx?userid=" + System.Convert.ToBase64String(var);
                login.Text = "Log Out";
                login.NavigateUrl = "~/passenger/logout.aspx";
                reg.Text = "change Password";
                reg.NavigateUrl = "~/passenger/changepassword.aspx?userid=" + System.Convert.ToBase64String(var);
            }            
        }
                
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (from.SelectedItem.Text.ToString().Equals(to.SelectedItem.Text.ToString()))
        {
            string message = "From And To Are Same....";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

        }

        else
        {
            if ((from.SelectedItem.Text.ToString()) != null && (to.SelectedItem.Text.ToString()) != null && date.Text != null)
            {
                Session["usersource"] = from.SelectedItem.Text.ToString();
                Session["userdestination"] = to.SelectedItem.Text.ToString();
                Session["date"] = date.Text;
                search(from.SelectedItem.Text.ToString(), to.SelectedItem.Text.ToString(), date.Text);
            }
        }
        
    }

    //search for availability of buses
    public void search(string from, string to,string date)
    {
        Session["date"] = date;
        con = new SqlConnection(connectionstring);
        string sql = "select routeid,path from route";
        SqlCommand cmd = new SqlCommand(sql, con);

        int i;
        con.Open();
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {

            pat.Add(reader["path"]);
        }
        reader.Close();
        foreach (object obj in pat)
        {
            string n = (string)obj;
            a = n.Split('-');
            //a=convert(a);                  
            for (i = 0; i < a.Length; i++)
            {
                if (a[i] == from)
                {
                    //Response.Write("source is available"+"and route is"+a[i]);
                    for (i = i + 1; i < a.Length; i++)
                    {
                        if (a[i] == to)
                        {
                            //               display(n);
                            string ans;
                            ans = string.Join("-", a);
                            // Response.Write(ans);
                            // b[0] = "ahmedabad";
                            //arr[i] = ans;
                            //p++;
                            string sql1 = "select routeid from route where path='" + n + "'";
                           // string sql1 = "select route.routeid from route as route join bus as bus on bus.routeid=route.routeid where path='"+n+"'";
                           // string sql1 = "select bus.busid from bus as bus join route as route on bus.routeid=route.routeid where bus.date='" + date + "' and path='" + n + "'";
                            SqlCommand cmd1 = new SqlCommand(sql1, con);

                            SqlDataReader reader1;
                            reader1 = cmd1.ExecuteReader();
                            while (reader1.Read())
                            {                                

                                routeid.Add(reader1["routeid"]);
                            }
                            ab.Add(n);
                            reader1.Close();
                        }
                        else
                        {
                            continue;

                        }
                    }
                }
                else
                {

                }
            }
        }
        
        con.Close();
        add(ab, routeid);


    }

    //converting int stations to string stations
    /* public string[] convert(string[] abc)
      {
          int i;
          con = new SqlConnection(connectionstring);
             
          con.Open();
          SqlDataReader reader1;
          for (i = 0; i < a.Length; i++)
          {
              string sql1 = "select cityname from city where cityid=@name"+i+"";
              SqlCommand cmd1 = new SqlCommand(sql1, con);
             
              cmd1.Parameters.AddWithValue("@name"+i+"", abc[i]);
              reader1 = cmd1.ExecuteReader();
              while (reader1.Read())
              {
                  a[i] = (string)reader1["cityname"];
              }
              reader1.Close();
                 
          }
          return a;
      }*/
    public void add(ArrayList ab, ArrayList routeid)
    {
        string b=null;
        byte[] temp=null;
        Session.Add("A", ab);
        Session.Add("routeid", routeid);        
        if(Request.QueryString["userid"]!=null)
        {
            string abc = Request.QueryString["userid"];
            byte[] dec = System.Convert.FromBase64String(abc);
            userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
            var abc1 = userid;
            byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc1);              
            Response.Redirect("listbus.aspx?userid=" + System.Convert.ToBase64String(var) + "", false);           
        }
        else
        {
            Response.Redirect("listbus.aspx");
        }        
    }

    

   



   
}