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
public partial class passenger_selectseat : System.Web.UI.Page
{
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlConnection con;
    SqlDataReader reader;
    string[] temp1;
    string abc;
    ArrayList a = new ArrayList();
    string busid;
    string userid;
    ArrayList seat = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("the userid is"+Session["userid"]);
        string abc = Request.QueryString["userid"];
        byte[] dec = System.Convert.FromBase64String(abc);
        userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);
        if(string.IsNullOrEmpty(userid))
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            check();
        }                       
    }    

    public void check()
    {
        abc = Request.QueryString["busid"];
        byte[] temp = System.Convert.FromBase64String(abc);
        busid = System.Text.ASCIIEncoding.ASCII.GetString(temp);
        Session["busid"] = busid;
        //Response.Write(busid);
        con = new SqlConnection(connectionstring);
        con.Open();
        string sql = "select route.path from route as route join bus as bus on bus.routeid=route.routeid where bus.busid=@id";
        SqlCommand cmd = new SqlCommand(sql,con);
        cmd.Parameters.AddWithValue("@id",busid);
      //  Response.Write("the busid in check method is"+busid);
        reader = cmd.ExecuteReader();
        while(reader.Read())
        {
            a.Add(reader["path"]);
        }        
        con.Close();
        foreach(object obj in a)
        {
            string n = (string)obj;
            temp1 = n.Split('-');
        }
        unlock(temp1);

    }
    private void unlock(string[] temp1)
    {
        int i, j;
        string[] temp2=null;
        int source = Array.IndexOf(temp1,Session["usersource"]);
        //Response.Write(source);
        con = new SqlConnection(connectionstring);
        con.Open();
        for (i = 0; i < temp1.Length-1;i++ )
        {
            for(j=i+1;j<=temp1.Length-1;j++)
            {
                if((j>source) &&(j!=source) )
                {
                    string sql = "select seatno,status from booking where source='"+temp1[i]+"' and busid='"+busid+"' and destination='"+temp1[j]+"'";
                    SqlCommand cmd = new SqlCommand(sql,con);                
                    reader =cmd.ExecuteReader();                
                    while(reader.Read())
                    {                    
                        string n1=(string)reader["seatno"];
                        temp2 = n1.Split(',');
                        for (int k = 0; k < temp2.Length;k++ )
                        {
                            string str = temp2[k];
                            if("booked"== (string)reader["status"])
                            {
                                ImageButton btn = (ImageButton)this.pnl1.FindControl(str);                                
                                btn.ImageUrl = "~/Images/booked_seat_img.gif";
                                btn.Enabled = false;                                                               
                            }
                 
                        }
                    }
                }
                    reader.Close();
            }
        }

        con.Close();
        
    }
       
    protected void s1click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s1);
    }
    protected void s2click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s2);
    }
    protected void s3click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s3);
    }
    protected void s4click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s4);
    }
    protected void s5click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s5);
    }
    protected void s6click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s6);
    }
    protected void s7click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s7);
    }
    protected void s8click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s8);
    }
    protected void s9click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s9);
    }
    protected void s10click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s10);
    }
    protected void s11click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s11);
    }
    protected void s12click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s12);
    }
    protected void s13click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s13);
    }
    protected void s14click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s14);
    }    
    protected void s15click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s15);
    }
    protected void s16click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s16);
    }
    protected void s17click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s17);
    }
    protected void s18click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s18);
    }
    protected void s19click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s19);
    }
    protected void s20click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s20);
    }
    protected void s21click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s21);
    }
    protected void s22click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s22);
    }
    protected void s23click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s23);
    }
    protected void s24click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s24);
    }
    protected void s25click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s25);
    }
    protected void s26click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s26);
    }
    protected void s27click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s27);
    }
    protected void s28click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s28);
    }
    protected void s29click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s29);
    }
    protected void s30click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s30);
    }
    protected void s31click(object sender, ImageClickEventArgs e)
    {
        this.seatClick(this.s31);
    }

    protected void seatClick(ImageButton btn)
    {
        
        if (btn.ImageUrl == "~/Images/selected_seat_img.gif")
        {            
            btn.ImageUrl = "~/Images/available_seat_img.gif";
            if (this.txtseatnumber.Text.IndexOf(btn.ID.ToString() + ",") > -1)
            {
                this.txtseatnumber.Text = this.txtseatnumber.Text.Replace(btn.ID.ToString() + ",", "");
            }
            else
            {
                this.txtseatnumber.Text = this.txtseatnumber.Text.Replace(btn.ID.ToString(), "");
            }
        }
        else if (btn.ImageUrl == "~/Images/available_seat_img.gif")
        {            
            btn.ImageUrl = "~/Images/selected_seat_img.gif";
            if (this.txtseatnumber.Text.Trim().Length == 0)
            {
                this.txtseatnumber.Text = btn.ID.ToString();
            }
            else if (this.txtseatnumber.Text.Trim().EndsWith(","))
            {
                this.txtseatnumber.Text = this.txtseatnumber.Text + btn.ID.ToString();
            }
            else
            {
                this.txtseatnumber.Text = this.txtseatnumber.Text + "," + btn.ID.ToString();
            }
        }
    }

    protected void next_Click(object sender, EventArgs e)
    {
        int num = this.txtseatnumber.Text.Split(new char[] { 's' }).Length - 1;
        string totalseats = num.ToString();
        Session["totalseats"] = totalseats;
        Random random = new Random();
        Random random2 = new Random();
        string pnr = random.Next(0xc350).ToString() + random2.Next(0x85fa7).ToString();
        if (num == 0)
        {
            this.pnl1.Visible = true;            
        }
        else
        {            
            this.pnl1.Visible = false;
            var pqr = pnr;
            byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(pqr);
            var busid1 = busid;
            byte[] var1 = System.Text.ASCIIEncoding.ASCII.GetBytes(busid1);
            Session["seatno"] = txtseatnumber.Text;

            var userid1 = userid;
            byte[] var2 = System.Text.ASCIIEncoding.ASCII.GetBytes(userid1);
            base.Response.Redirect("payment.aspx?pnr=" + System.Convert.ToBase64String(var) + "&busid=" + System.Convert.ToBase64String(var1) + "&userid=" + System.Convert.ToBase64String(var2) + "");            
        }
    }
}