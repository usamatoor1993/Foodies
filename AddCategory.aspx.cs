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
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=EBRAHIM\\SQLEXPRESS; Database=dbFoodie; Integrated Security= true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand("Select * from tbl_MainCategory", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                { 
                    gvCategory.DataSource = dt;
                    gvCategory.DataBind();
                    ViewState["gvdata"] = dt;
                }
            }
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("Select * from tbl_MainCategory where Category_Name = '" + txtAddCategory.Text + "' ",con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if(dt.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Already Exist');window.location='AddCategory.aspx'", true);
            }
            else
            { 
            SqlCommand cmd = new SqlCommand("insert into tbl_MainCategory (Category_Name) values('" + txtAddCategory.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("save");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Category Saved');window.location='AddCategory.aspx'", true);
        }
        }

        protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            gvCategory.EditIndex = e.NewEditIndex;
            gvCategory.DataSource = dt;
            gvCategory.DataBind();
        }

        

        protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            string id = ((Label)gvCategory.Rows[e.RowIndex].FindControl("lblid")).Text;
            SqlCommand cmd = new SqlCommand("Delete from tbl_MainCategory where ID='" + id + "' ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Delete succesfully');window.location='AddCategory.aspx'", true);
        }

        protected void gvCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            gvCategory.EditIndex = -1;
            gvCategory.DataSource = dt;
            gvCategory.DataBind();

        }

        protected void gvCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            string id = ((Label)gvCategory.Rows[e.RowIndex].FindControl("lblid")).Text;
            string categoryname = ((TextBox)gvCategory.Rows[e.RowIndex].FindControl("txtEditCategoryName")).Text;

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tbl_MainCategory where Category_Name = '" + categoryname + "' ", con);
            DataTable dtt = new DataTable();
            da.Fill(dtt);
            if (dtt.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Table Already Exist');window.location='AddCategory.aspx'", true);
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Update  tbl_MainCategory set Category_Name='" + categoryname + "' where ID='" + id + "' ", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('update succesfully');window.location='AddCategory.aspx'", true);

            }
        }

        

      

       
    

        
        
    }
}