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
using iTextSharp.text;
using iTextSharp.text.pdf;
public partial class passenger_printing : System.Web.UI.Page
{
    string connectionstring = WebConfigurationManager.ConnectionStrings["Project"].ConnectionString;
    SqlConnection con;
    SqlDataReader reader;
    string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        string abc = Request.QueryString["userid"];
        byte[] dec = System.Convert.FromBase64String(abc);
        userid = System.Text.ASCIIEncoding.ASCII.GetString(dec);        
        print();        
    }

    private void print()
    {
        try
        {            
            con = new SqlConnection(connectionstring);
            con.Open();
            string sql = "select * from booking where pnr=@pnr";
            SqlCommand cmd = new SqlCommand(sql,con);
            cmd.Parameters.AddWithValue("@pnr",Session["pnr"]);
            reader = cmd.ExecuteReader();
            while(reader.Read())
            {
                pnr.Text = reader["pnr"].ToString();
                passengername.Text = reader["name"].ToString();
                phoneno.Text = reader["contact"].ToString();
                source.Text = reader["source"].ToString();
                destination.Text = reader["destination"].ToString();
                jdate.Text = reader["date"].ToString();
                jtime.Text = reader["time"].ToString();
                seatnumbers.Text=reader["seatno"].ToString();
                noofpassenger.Text = reader["totalseats"].ToString();
                rent.Text = reader["amount"].ToString();
                status.Text = reader["status"].ToString();
            }
            con.Close();
        }
        catch
        {

        }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write(pnr.Text);
            try  
            {  
                Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);  
                PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);  
                pdfDoc.Open();
                Paragraph Text = new Paragraph("hi"+"how r u"+pnr.Text);                
                pdfDoc.Add(Text);  
                pdfWriter.CloseStream = false;  
                pdfDoc.Close();  
                Response.Buffer = true;  
                Response.ContentType = "application/pdf";  
                Response.AddHeader("content-disposition", "attachment;filename=Ticket.pdf");  
                Response.Cache.SetCacheability(HttpCacheability.NoCache);  
                Response.Write(pdfDoc);  
                Response.End();  
            }  
            catch (Exception ex)  
            { Response.Write(ex.Message); }  
        }      
}