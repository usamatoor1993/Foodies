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
    public partial class WebForm6 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=EBRAHIM\\SQLEXPRESS; Database=dbFoodie; Integrated Security= true;");

        protected void Page_Load(object sender, EventArgs e)
        {
           


            if (!IsPostBack)
            {
                if (Session["dtadd"] == null)
                {
                    DataTable dta = new DataTable();
                    dta.Columns.Add("Product_ID");
                    dta.Columns.Add("Product_Name");

                    dta.Columns.Add("Price");

                    dta.Columns.Add("Quantity");

                    dta.Columns.Add("Total_Price");
                    Session["dtadd"] = dta;
                }
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand("select * from tbl_MainCategory", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddlOrderMainCategory.DataSource = dt;
                    ddlOrderMainCategory.DataTextField = ("Category_Name");
                    ddlOrderMainCategory.DataValueField = ("ID");
                    ddlOrderMainCategory.DataBind();
                    ddlOrderMainCategory.Items.Insert(0, new ListItem("Select Main Category", "0"));
                }
            }
        }

        

        protected void ddlOrderMainCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataAdapter daa = new SqlDataAdapter();
            daa.SelectCommand = new SqlCommand("select * from tbl_Products where CID = '" + ddlOrderMainCategory.SelectedValue + "' ", con);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            if (dtt.Rows.Count > 0)
            {
                ddlOrderProducts.DataSource = dtt;
                ddlOrderProducts.DataTextField = ("Product_Name");
                ddlOrderProducts.DataValueField = ("ID");
                ddlOrderProducts.DataBind();
                btnshift.Enabled = true;
                btnAddProducts.Enabled = true;
            }
            else
            {

                ddlOrderProducts.SelectedIndex = 0;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Product Not Found')", true);
                btnshift.Enabled = false;
                btnAddProducts.Enabled = true;

            }
        }

        protected void btnAddProducts_Click(object sender, EventArgs e)
        {
            if (Session["dtadd"] != null)
            {
                DataTable dta = (DataTable)Session["dtadd"];
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand("select ID,Product_Name,Price,1 as Quantity from tbl_Products where ID = '" + ddlOrderProducts.SelectedValue + "' ", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    
                    string id = dt.Rows[0]["ID"].ToString();
                    string name = dt.Rows[0]["Product_Name"].ToString();
                    string price = dt.Rows[0]["Price"].ToString();
                    string quantity = dt.Rows[0]["Quantity"].ToString();
                    string totalprice = dt.Rows[0]["Price"].ToString();
                    dta.Rows.Add(id, name, price, quantity, totalprice);
                    gvOrderProducts.DataSource = dta;
                    gvOrderProducts.DataBind();
                    btnClear.Enabled = true;

                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Session["dtadd"] = null;
            Response.Redirect("Walkin.aspx");
        }

        protected void gvOrderProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dta = (DataTable)Session["dtadd"];
            int index = e.RowIndex;
            dta.Rows[index].Delete();
            Session["dtadd"] = dta;
            gvOrderProducts.DataSource = dta;
            gvOrderProducts.DataBind();
        }

        protected void txtOrderQuantity_TextChanged(object sender, EventArgs e)
        {
            GridViewRow gvrow = (GridViewRow)(sender as Control).Parent.Parent;
            string totalprice = ((Label)gvOrderProducts.Rows[gvrow.RowIndex].FindControl("lblTotalPrice")).Text;
            string price = ((Label)gvOrderProducts.Rows[gvrow.RowIndex].FindControl("lblPrice")).Text;
            string quantity = ((TextBox)gvOrderProducts.Rows[gvrow.RowIndex].FindControl("txtOrderQuantity")).Text;
            double qty = double.Parse(quantity);
            double prc = double.Parse(price);
            double tprice = double.Parse(totalprice);
            tprice = qty * prc;
            DataTable dt = (DataTable)Session["dtadd"];
            dt.Rows[gvrow.RowIndex]["Quantity"] = qty;
            dt.Rows[gvrow.RowIndex]["Total_Price"] = tprice;
            gvOrderProducts.DataSource = dt;
            gvOrderProducts.DataBind();
            Session["dtadd"] = dt;
        }





        
    }
}