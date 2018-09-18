using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodies
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection ("Data Source=EBRAHIM\\SQLEXPRESS; Database=dbFoodie; Integrated Security= true;");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

SqlCommand cmd = new SqlCommand("select * from tbl_Login where UserName =@username and Password=@password",con);
cmd.Parameters.AddWithValue("@username", txtUserName.Text);
cmd.Parameters.AddWithValue("@password", txtPassword.Text);
SqlDataAdapter da = new SqlDataAdapter(cmd);
DataTable dt = new DataTable();
da.Fill(dt);
if(dt.Rows.Count>0)
{
Response.Redirect("Dashboard.aspx");
}
else
{
ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
}
}
        }
    }
