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
public partial class searching : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter adapter;
    SqlDataReader reader;
    string[] a;        
    ArrayList pat = new ArrayList();
    ArrayList ab = new ArrayList();
    ArrayList routeid = new ArrayList();
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //checking part        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if((from.Text)!=null && (to.Text)!=null)
        {
            Session["usersource"] = from.Text;
            Session["userdestination"] = to.Text;
            search(from.Text,to.Text);
        }
    }

    //search for availability of buses
    public void search(string from,string to)
    {
        
        con =new SqlConnection(connectionstring);
        string sql = "select routeid,path from route";
        SqlCommand cmd = new SqlCommand(sql,con);
        
        int i;
        con.Open();       
        reader=cmd.ExecuteReader();
        while(reader.Read())
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
                                string sql1 = "select routeid from route where path='"+n+"'";
                                SqlCommand cmd1 = new SqlCommand(sql1, con);
                       
                                SqlDataReader reader1;
                                reader1 = cmd1.ExecuteReader();
                                while(reader1.Read())
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
        add(ab,routeid);
        

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
        public void add(ArrayList ab,ArrayList routeid)
        {

            Session.Add("A",ab);
            Session.Add("routeid",routeid);
            Response.Redirect("listbus.aspx", false);
            
        }
}         
    
        /*foreach(string i in pat)
        {
            Response.Write(i+System.Environment.NewLine);
        }*/
       // string a[]=reader["path"]