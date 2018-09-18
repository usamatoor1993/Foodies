<%@ Page Title="" Language="C#" MasterPageFile="~/Foodies.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="Foodies.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
          body {
    background-image: url("Images/bg2.jpg");
    background-color: #cccccc;
    
}
    </style>
    
    <div class="container">
        <br /> <br /> <br />
        <div class="col-lg-1">
           
          <center> <h3 style="color:#f89c0a; background-color:#a4efed; height:28px; width:200px;"  >  Add Category </h3></center>
        </div>
    <div class="col-md-6">
            <asp:TextBox runat="server" ID="txtAddCategory" CssClass="form-control" Placeholder="Add Category" Style="margin-left:230px;" Required ></asp:TextBox>
        <br />
            <asp:Button runat="server" CssClass="btn btn-success form-control" Text="Add" ID="btnAddCategory" Style="margin-left:230px;" OnClick="btnAddCategory_Click" />  
        
        </div>
        <br /> <br /><br /><br /><br /><br />
        <div class="col-md-5" style="overflow:auto; height:130px; margin-left:270px;">
            <asp:GridView runat="server" AutoGenerateColumns="false" ID="gvCategory" Style="width:363px;" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnRowEditing="gvCategory_RowEditing" OnRowDeleting="gvCategory_RowDeleting" OnRowCancelingEdit="gvCategory_RowCancelingEdit" OnRowUpdating="gvCategory_RowUpdating" >
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                     <center>   Category Name </center>
                    </HeaderTemplate>
                    <ItemTemplate>
                       <center> <asp:Label runat="server" Text='<%# Eval("Category_Name") %>'></asp:Label> </center>
                        <asp:Label runat="server" ID="lblid" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label runat="server" ID="lblid" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                        <asp:TextBox runat="server" ID="txtEditCategoryName"  Text='<%# Eval("Category_Name") %>'></asp:TextBox>
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
    <br /><br /><br /><br /><br />
</asp:Content>
