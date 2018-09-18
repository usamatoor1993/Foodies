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
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=EBRAHIM\\SQLEXPRESS; Database=dbFoodie; Integrated Security= true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand("Select * From tbl_MainCategory", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    ddlAddCategory.DataSource = dt;
                    ddlAddCategory.DataTextField = "Category_Name";
                    ddlAddCategory.DataValueField = "ID";
                    ddlAddCategory.DataBind();
                    ddlAddCategory.Items.Insert(0, new ListItem("Select Main Category", "0"));
                }
                
            }
        }

        protected void gvProduct_RowEditing(object sender, GridViewEditEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            gvProduct.EditIndex = e.NewEditIndex;
            gvProduct.DataSource = dt;
            gvProduct.DataBind();
        }

        protected void gvProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            string id = ((Label)gvProduct.Rows[e.RowIndex].FindControl("lblid")).Text;
            SqlCommand cmd = new SqlCommand("Delete from tbl_Products where ID='" + id + "' ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Delete succesfully');window.location='Deals.aspx'", true);
        }

        protected void gvProduct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            gvProduct.EditIndex = -1;
            gvProduct.DataSource = dt;
            gvProduct.DataBind();
        }

        protected void gvProduct_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["gvdata"];
            string id = ((Label)gvProduct.Rows[e.RowIndex].FindControl("lblid")).Text;
            string productname = ((TextBox)gvProduct.Rows[e.RowIndex].FindControl("txteditproductname")).Text;
            string Productprice = ((TextBox)gvProduct.Rows[e.RowIndex].FindControl("txteditproductprice")).Text;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tbl_Products where Product_Name = '" + productname + "' AND Price='" + Productprice + "' ", con);
            DataTable dtt = new DataTable();
            da.Fill(dtt);
            if (dtt.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Product Already Exist');window.location='Deals.aspx'", true);
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Update  tbl_Products set Product_Name='" + productname + "', Price='" + Productprice + "' where ID='" + id + "' ", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('update succesfully');window.location='Deals.aspx'", true);

            }
        }

        protected void ddlAddCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataAdapter daa = new SqlDataAdapter();
            daa.SelectCommand = new SqlCommand("Select * from tbl_Products where CID = '"+ddlAddCategory.SelectedValue+"' ", con);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            if (dtt.Rows.Count > 0)
            {
                gvProduct.DataSource = dtt;
                gvProduct.DataBind();
                ViewState["gvdata"] = dtt;

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Product No Found');window.location='Deals.aspx'", true);
            }
        }
    }
}