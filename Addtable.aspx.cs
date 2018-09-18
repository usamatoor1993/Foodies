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
    public partial class WebForm4 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=EBRAHIM\\SQLEXPRESS; Database=dbFoodie; Integrated Security= true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand("Select * from tbl_Table", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gvTable.DataSource = dt;
                    gvTable.DataBind();
                    ViewState["gvdata"] = dt;
                }
            }
        }

        protected void btnAddTable_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("Select * From tbl_Table where Table_Name = '" + txtTable.Text + "' ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Table Already Exist');window.location='Addtable.aspx'", true);
            }
            else
            { 
            SqlCommand cmd = new SqlCommand("insert into tbl_Table (Table_Name) values('" + txtTable.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("save");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Table Saved');window.location='Addtable.aspx'", true);
        }
        }

        protected void gvTable_RowEditing(object sender, GridViewEditEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            gvTable.EditIndex = e.NewEditIndex;
            gvTable.DataSource = dt;
            gvTable.DataBind();
        }

        protected void gvTable_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            string id = ((Label)gvTable.Rows[e.RowIndex].FindControl("lblid")).Text;
            SqlCommand cmd = new SqlCommand("Delete from tbl_Table where ID='" + id + "' ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Delete succesfully');window.location='Addtable.aspx'", true);
           
        }

        protected void gvTable_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            gvTable.EditIndex = -1;
            gvTable.DataSource = dt;
            gvTable.DataBind();

        }

        protected void gvTable_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            string id = ((Label)gvTable.Rows[e.RowIndex].FindControl("lblid")).Text;
            string tablename = ((TextBox)gvTable.Rows[e.RowIndex].FindControl("txtEditTableName")).Text;
            
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tbl_Table where Table_Name = '" + tablename + "' ", con);
            DataTable dtt = new DataTable();
            da.Fill(dtt);
            if (dtt.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Table Already Exist');window.location='Addtable.aspx'", true);
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Update  tbl_Table set Table_Name='" + tablename + "' where ID='" + id + "' ", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('update succesfully');window.location='Addtable.aspx'", true);

            }
        }

        
    }
}