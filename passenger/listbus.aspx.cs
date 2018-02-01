//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Collections;
//using System.Data;
//using System.Data.Sql;
//using System.Data.SqlClient;
//using System.Data.SqlTypes;
//using System.Web.Configuration;
//using System.Windows.Forms;
//using System.Web.Services;
//public partial class listbus : System.Web.UI.Page
//{
//    SqlConnection con;
//    SqlDataAdapter adapter;
//    SqlDataReader reader;
//    string[] a;
//    int index = 0;
//    string radioButton = String.Empty;
//    string selectedValue;
//    DataTable dt = new DataTable();
//    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
//    string userid;
//    protected void Page_Load(object sender, EventArgs e)
//    {
//        Label1.Visible = false;

//        if (!IsPostBack)
//        {
//            if (Request.QueryString["userid"] != null)
//            {
//                string abc = Request.QueryString["userid"];
//                byte[] dec = System.Convert.FromBase64String(abc);
//                userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
//                //Session["homeuserid"] = userid;

//                var abc1 = userid;
//                byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc1);

//                home.Text = "Home";
//                home.NavigateUrl = "~/passenger/homepage.aspx?userid=" + System.Convert.ToBase64String(var); ;
//                aboutus.Text = "Modify Profile";
//                aboutus.NavigateUrl = "~/passenger/changeprofile.aspx?userid=" + System.Convert.ToBase64String(var);
//                newservices.Text = "Booking History";
//                newservices.NavigateUrl = "~/passenger/pastbooking.aspx?userid=" + System.Convert.ToBase64String(var);
//                recent.Text = "Ticket Cancellation";
//                recent.NavigateUrl = "~/passenger/cancelticket.aspx";
//                login.Text = "Log Out";
//                login.NavigateUrl = "~/passenger/logout.aspx";
//                reg.Text = "change Password";
//                reg.NavigateUrl = "~/passenger/changepassword.aspx?userid=" + System.Convert.ToBase64String(var);
//            }
//            displaybus();
//        }
//    }
    
//    public void displaybus()
//    {
//        DataSet ds = new DataSet(); 
//        try
//        {
//            string date=Session["date"].ToString();
//            //DateTime date1 = (DateTime)Session["date"];
//            //string date2 = date1.ToString("d");
//            con = new SqlConnection(connectionstring);
//            con.Open();
//            ArrayList ab = new ArrayList();
//            ArrayList routeid = new ArrayList();
//            ab = (ArrayList)Session["A"];
//            routeid = (ArrayList)Session["routeid"];
//            //int count = ab.Count;
//            for (int i = 0; i < routeid.Count; i++)
//            {
//                string sql = "select route.path,bus.busid,bus.busname,bus.bustype,bus.source,bus.destination,bus.time,bus.date,bus.totalseats from route as route join bus as bus on bus.routeid=route.routeid where bus.routeid=@id and bus.date='"+date+"'";               
//                SqlCommand cmd = new SqlCommand(sql,con);
//                cmd.Parameters.AddWithValue("@id",routeid[i]);                                   
//                adapter = new SqlDataAdapter(cmd);                                      
//                adapter.Fill(ds);   
//                GridView1.DataSource = ds;
//                GridView1.DataBind();
                                                                                                                                    
//            }
//            con.Close();
//            if(routeid.Count==0)
//            {
//                Label1.Visible = true;
//                Label1.Text = "No buses available on this date.please check for another date";                
//            }
             
//            //ds.Tables[0].Columns.Add(new DataColumn());            

//          /*  BoundField bf4 = new BoundField();
//            bf4.HeaderText = "busid";
//            bf4.DataField = "busid";
//            GridView1.Columns.Add(bf4);


//            BoundField bf1 = new BoundField();
//            bf1.HeaderText = "via route";
//            bf1.DataField = "path";            
//            GridView1.Columns.Add(bf1);
//            BoundField bf2 = new BoundField();
//            bf2.HeaderText = "source";
//            bf2.DataField = "source";
//            GridView1.Columns.Add(bf2);
//            BoundField bf3 = new BoundField();
//            bf3.HeaderText = "destination";
//            bf3.DataField = "destination";
//            GridView1.Columns.Add(bf3);
//            BoundField bf5 = new BoundField();
//            bf5.HeaderText = "Time";
//            bf5.DataField = "time";
//            GridView1.Columns.Add(bf5);


//            BoundField bf6 = new BoundField();
//            bf6.HeaderText = "BusType";
//            bf6.DataField = "bustype";
//            GridView1.Columns.Add(bf6);


//            BoundField bf7 = new BoundField();
//            bf7.HeaderText = "details";
//            GridView1.Columns.Add(bf7);
//            */           
            
              

            
           
            
            
//            /*var temp = GridView1.Columns[1];
//            GridView1.Columns.RemoveAt(1);
//            GridView1.Columns.Insert(3, temp);*/
//        }
//        catch(Exception e)
//        {
//            Response.Write(e.Message);
//        }
//    }
//   /* public string[] convert(string[] abc)
//    {
//        int i;
//        con = new SqlConnection(connectionstring);

//        con.Open();
//        SqlDataReader reader1;
//        for (i = 0; i < abc.Length; i++)
//        {
//            string sql1 = "select cityname from city where cityid=@name" + i + "";
//            SqlCommand cmd1 = new SqlCommand(sql1, con);

//            cmd1.Parameters.AddWithValue("@name" + i + "", abc[i]);
//            reader1 = cmd1.ExecuteReader();
//            while (reader1.Read())
//            {
//                abc[i] = (string)reader1["cityname"];
//            }
//            reader1.Close();

//        }
//        return abc;
//    }*/
    
  
//    [WebMethod]
  
//    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
//    {
        
//        GridViewRow row = GridView1.SelectedRow;
//        string b = row.Cells[1].Text;
//        Response.Write(b);
//    }
    
    
//    protected void rdbauthid_CheckedChanged(object sender, EventArgs e)
//    {

//        getselectedRow();
//    }
//    public void getselectedRow()
//    {
//        byte[] temp1=null;
//        for(int i=0;i<GridView1.Rows.Count;i++)
//        {
//           System.Web.UI.WebControls.RadioButton rb= (System.Web.UI.WebControls.RadioButton)GridView1.Rows[i].Cells[0].FindControl("radio");         
//            if(rb.Checked)
//            {
//                GridViewRow row = GridView1.Rows[i];                
//                Session["fare"] = GridView1.Rows[i].Cells[8].Text;
//                string b=row.Cells[1].Text;
//                byte[] temp = System.Text.ASCIIEncoding.ASCII.GetBytes(b);
                
//                if(Request.QueryString["userid"]!=null)
//                {
//                    string abc = Request.QueryString["userid"];
//                    byte[] dec = System.Convert.FromBase64String(abc);
//                    string userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
//                    var abc1 = userid;
//                    byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc1);                          
//                    Page.ClientScript.RegisterStartupScript(this.GetType(), "key", "window.open('selectseat.aspx?busid=" + System.Convert.ToBase64String(temp) + "&userid=" + System.Convert.ToBase64String(var) + "','','width=700,height=500')", true);                       
//                }
//                else
//                {
//                    Server.Transfer("login.aspx");
//                }

//                //Response.Redirect("new.aspx?busid="+b);
                
//            }
//        }
//    }
//    protected void seatdetails_Click(object sender, EventArgs e)
//    {
//        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
//        string rowNumber = grdrow.Cells[1].Text;
//        byte[] temp = System.Text.ASCIIEncoding.ASCII.GetBytes(rowNumber);
//        Page.ClientScript.RegisterStartupScript(this.GetType(), "key", "window.open('seatdetails.aspx?busid=" + System.Convert.ToBase64String(temp) + "','','width=700,height=500')", true);
//    }
    
//}























using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;
using System.Windows.Forms;
using System.Web.Services;
public partial class listbus : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter adapter;
    SqlDataReader reader;
    string[] a;
    int index = 0;
    string radioButton = String.Empty;
    string selectedValue;
    DataTable dt = new DataTable();
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;

        if (!IsPostBack)
        {
            if (Request.QueryString["userid"] != null)
            {
                string abc = Request.QueryString["userid"];
                byte[] dec = System.Convert.FromBase64String(abc);
                userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
                //Session["homeuserid"] = userid;

                var abc1 = userid;
                byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc1);

                home.Text = "Home";
                home.NavigateUrl = "~/passenger/homepage.aspx?userid=" + System.Convert.ToBase64String(var); ;
                aboutus.Text = "Modify Profile";
                aboutus.NavigateUrl = "~/passenger/changeprofile.aspx?userid=" + System.Convert.ToBase64String(var);
                newservices.Text = "Booking History";
                newservices.NavigateUrl = "~/passenger/pastbooking.aspx?userid=" + System.Convert.ToBase64String(var);
                recent.Text = "Ticket Cancellation";
                recent.NavigateUrl = "~/passenger/cancelticket.aspx";
                login.Text = "Log Out";
                login.NavigateUrl = "~/passenger/logout.aspx";
                reg.Text = "change Password";
                reg.NavigateUrl = "~/passenger/changepassword.aspx?userid=" + System.Convert.ToBase64String(var);
            }
            displaybus();
        }
    }

    public void displaybus()
    {
        DataSet ds = new DataSet();
        try
        {
            string date = Session["date"].ToString();
            //DateTime date1 = (DateTime)Session["date"];
            //string date2 = date1.ToString("d");
            con = new SqlConnection(connectionstring);
            con.Open();
            ArrayList ab = new ArrayList();
            ArrayList routeid = new ArrayList();
            ab = (ArrayList)Session["A"];
            routeid = (ArrayList)Session["routeid"];
            //int count = ab.Count;
            for (int i = 0; i < routeid.Count; i++)
            {
                string sql = "select route.path,bus.busid,bus.busname,bus.bustype,bus.source,bus.destination,bus.time,bus.date,bus.totalseats from route as route join bus as bus on bus.routeid=route.routeid where bus.routeid=@id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", routeid[i]);
                adapter = new SqlDataAdapter(cmd);
                adapter.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }
            con.Close();
            if (routeid.Count == 0)
            {
                Label1.Visible = true;
                Label1.Text = "No buses available";
            }

            //ds.Tables[0].Columns.Add(new DataColumn());            

            /*  BoundField bf4 = new BoundField();
              bf4.HeaderText = "busid";
              bf4.DataField = "busid";
              GridView1.Columns.Add(bf4);


              BoundField bf1 = new BoundField();
              bf1.HeaderText = "via route";
              bf1.DataField = "path";            
              GridView1.Columns.Add(bf1);
              BoundField bf2 = new BoundField();
              bf2.HeaderText = "source";
              bf2.DataField = "source";
              GridView1.Columns.Add(bf2);
              BoundField bf3 = new BoundField();
              bf3.HeaderText = "destination";
              bf3.DataField = "destination";
              GridView1.Columns.Add(bf3);
              BoundField bf5 = new BoundField();
              bf5.HeaderText = "Time";
              bf5.DataField = "time";
              GridView1.Columns.Add(bf5);


              BoundField bf6 = new BoundField();
              bf6.HeaderText = "BusType";
              bf6.DataField = "bustype";
              GridView1.Columns.Add(bf6);


              BoundField bf7 = new BoundField();
              bf7.HeaderText = "details";
              GridView1.Columns.Add(bf7);
              */







            /*var temp = GridView1.Columns[1];
            GridView1.Columns.RemoveAt(1);
            GridView1.Columns.Insert(3, temp);*/
        }
        catch (Exception e)
        {
            Response.Write(e.Message);
        }
    }
    /* public string[] convert(string[] abc)
     {
         int i;
         con = new SqlConnection(connectionstring);

         con.Open();
         SqlDataReader reader1;
         for (i = 0; i < abc.Length; i++)
         {
             string sql1 = "select cityname from city where cityid=@name" + i + "";
             SqlCommand cmd1 = new SqlCommand(sql1, con);

             cmd1.Parameters.AddWithValue("@name" + i + "", abc[i]);
             reader1 = cmd1.ExecuteReader();
             while (reader1.Read())
             {
                 abc[i] = (string)reader1["cityname"];
             }
             reader1.Close();

         }
         return abc;
     }*/


    [WebMethod]

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridView1.SelectedRow;
        string b = row.Cells[1].Text;
        Response.Write(b);
    }


    protected void rdbauthid_CheckedChanged(object sender, EventArgs e)
    {

        getselectedRow();
    }
    public void getselectedRow()
    {
        byte[] temp1 = null;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            System.Web.UI.WebControls.RadioButton rb = (System.Web.UI.WebControls.RadioButton)GridView1.Rows[i].Cells[0].FindControl("radio");
            if (rb.Checked)
            {
                GridViewRow row = GridView1.Rows[i];
                Session["fare"] = GridView1.Rows[i].Cells[8].Text;
                string b = row.Cells[1].Text;
                byte[] temp = System.Text.ASCIIEncoding.ASCII.GetBytes(b);

                if (Request.QueryString["userid"] != null)
                {
                    string abc = Request.QueryString["userid"];
                    byte[] dec = System.Convert.FromBase64String(abc);
                    string userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
                    var abc1 = userid;
                    byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc1);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "key", "window.open('selectseat.aspx?busid=" + System.Convert.ToBase64String(temp) + "&userid=" + System.Convert.ToBase64String(var) + "','','width=700,height=500')", true);
                }
                else
                {
                    Server.Transfer("login.aspx");
                }

                //Response.Redirect("new.aspx?busid="+b);

            }
        }
    }
    protected void seatdetails_Click(object sender, EventArgs e)
    {
        GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
        string rowNumber = grdrow.Cells[1].Text;
        byte[] temp = System.Text.ASCIIEncoding.ASCII.GetBytes(rowNumber);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "key", "window.open('seatdetails.aspx?busid=" + System.Convert.ToBase64String(temp) + "','','width=700,height=500')", true);
    }

}