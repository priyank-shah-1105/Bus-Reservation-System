using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddRoute : System.Web.UI.Page
{
    int i = 1;
    string admin;
    protected void Page_PreInit(object sender, EventArgs e)
    {
        List<string> keys = Request.Form.AllKeys.Where(key => key.Contains("txtDynamic")).ToList();

        foreach (string key in keys)
        {
            this.CreateTextBox("txtDynamic" + i);
            i++;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["admin"] != null)
            {
                string abc = Request.QueryString["admin"];
                byte[] dec = System.Convert.FromBase64String(abc);
                admin = System.Text.ASCIIEncoding.ASCII.GetString(dec);


                var abc1 = admin;
                byte[] var = System.Text.ASCIIEncoding.ASCII.GetBytes(abc1);

                home.Text = "Home";
                home.NavigateUrl = "AdminHome.aspx?admin=" + System.Convert.ToBase64String(var);

                addbus.Text = "Add Bus";
                addbus.NavigateUrl = "~/AddBus.aspx?admin=" + System.Convert.ToBase64String(var);

                deletebus.Text = "Delete Bus";
                deletebus.NavigateUrl = "~/DeleteBus.aspx?admin=" + System.Convert.ToBase64String(var);

                updatebus.Text = "Update Bus";
                updatebus.NavigateUrl = "~/UpdateBus.aspx?admin=" + System.Convert.ToBase64String(var);

                deleteroute.Text = "DeleteRoute";
                deleteroute.NavigateUrl = "~/DeleteRoute.aspx?admin=" + System.Convert.ToBase64String(var);

                addroute.Text = "Add Route";
                addroute.NavigateUrl = "~/AddRoute.aspx?admin=" + System.Convert.ToBase64String(var);

                profit.Text = "View Profit";
                profit.NavigateUrl = "~/Profit.aspx?admin=" + System.Convert.ToBase64String(var);

                chgpasswd.Text = "Change Password";
                chgpasswd.NavigateUrl = "~/Changepass.aspx?admin=" + System.Convert.ToBase64String(var);

                logout.Text = "Logout";
                logout.NavigateUrl = "~/logout.aspx";
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int index = PlaceHolder1.Controls.OfType<TextBox>().ToList().Count + 1;

        this.CreateTextBox("txtDynamic" + index);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string route = "";
        foreach (TextBox textBox in PlaceHolder1.Controls.OfType<TextBox>())
        {
            route = route + textBox.Text + "-";
        }
        if(!(String.IsNullOrEmpty(route)))
        route = route.TrimEnd(route[route.Length - 1]);

        string connection = ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
        SqlConnection con = new SqlConnection(connection);
        SqlCommand cmd;
        try{

        con.Open();
           string sql = "INSERT INTO route (path) values ('"+route+"')";
            
            cmd = new SqlCommand(sql, con);
        
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
"alert('SUCCESS');", true);

        con.Close();

    } 
    catch(Exception ex){
        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
 "alert('SOMETHING WENT WRONG, COULDNT ADD');", true);

    }
    
    
    
    
    }
    private void CreateTextBox(string id)
    {
        int x = i;
        TextBox txt = new TextBox();
        Label lbl = new Label();
        lbl.ID = "Label" + i.ToString();
        lbl.Text = "Station " + i;
        txt.ID = id;
        PlaceHolder1.Controls.Add(lbl);
        PlaceHolder1.Controls.Add(txt);
        PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
    }
}