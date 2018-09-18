<%@ Page Title="" Language="C#" MasterPageFile="~/Foodies.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Foodies.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br /> <br />  
        <style>
          body {
    background-image: url("Images/bg2.jpg");
    background-color: #cccccc;
    
}
    </style>

        <div class="col-lg-1">
           <br /><br />
         <center><h3 style="color:#f89c0a; background-color:#a4efed; height:28px; width:200px;"  >  Add Product </h3></center>
        </div>
          <div class="col-md-6">
        <asp:Dropdownlist runat="server" CssClass="form-control" id="ddlAddCategory" Style="margin-left:230px;" Required ></asp:Dropdownlist>
              </div>
     
    
        <br /><br /><br /><br />
       
    <div class="col-md-4">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtSubCategory" Placeholder="Add Product" Style="margin-left:230px;" Required ></asp:TextBox>
             </div>
        <div class="col-md-2">
            <asp:TextBox runat="server" CssClass="form-control" ID="txtProductPrice" Placeholder="Price" Style="margin-left:230px;" TextMode="Number" Required ></asp:TextBox> 
        </div>
        <br /><br /><br />
        <div class="col-md-6">
        <asp:Button runat="server" Text="AddProduct" ID="btnAddSubCategory" CssClass="btn btn-success form-control" Style="margin-left:230px;" OnClick="btnAddSubCategory_Click" />
            </div>
        <br /><br /><br />

        <div class="col-md-8" style="overflow:auto; height:180px; margin-left:140px;" >
            
            <asp:GridView runat="server" AutoGenerateColumns="false" ID="gvProduct" Style=" width:600px; " BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnRowEditing="gvProduct_RowEditing" OnRowDeleting="gvProduct_RowDeleting" OnRowCancelingEdit="gvProduct_RowCancelingEdit" OnRowUpdating="gvProduct_RowUpdating"  >
           <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Category Name 
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Category_Name") %>'></asp:Label> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
                <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Product Name 
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label> 
                        
                        <asp:Label runat="server" ID="lblid" Text='<%# Eval("ID") %>' Visible="false"></asp:Label> 
                    </ItemTemplate>
                    <EditItemTemplate>
                     <asp:Label runat="server" ID="lblid" Text='<%# Eval("ID") %>' Visible="false"></asp:Label> 
                   
                             <asp:TextBox runat="server" ID="txteditproductname"  Text='<%# Eval("Product_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
                <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Price 
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Price") %>'></asp:Label> 
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="txteditproductprice"  Text='<%# Eval("Price") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" CancelText="<i class='glyphicon glyphicon-remove' ></i>" UpdateText="<i class='glyphicon glyphicon-ok' ></i>" EditText="<i class='glyphicon glyphicon-edit' ></i>" />
<asp:CommandField ShowDeleteButton="true" DeleteText="" ControlStyle-Font-Bold="true" ControlStyle-CssClass="glyphicon glyphicon-trash" />
            </Columns>
                 <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            
        </div>
        </div>
    <br /><br /><br /><br /><br /> <br />
    <div class="clearfix"></div>
</asp:Content>
