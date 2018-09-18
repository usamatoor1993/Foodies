<%@ Page Title="" Language="C#" MasterPageFile="~/Foodies.Master" AutoEventWireup="true" CodeBehind="Deals.aspx.cs" Inherits="Foodies.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br /><br />
        <br /><br />
        <div class="col-md-6">
        <asp:Dropdownlist runat="server" CssClass="form-control" id="ddlAddCategory" Style="margin-left:230px;" AutoPostBack="true" OnSelectedIndexChanged="ddlAddCategory_SelectedIndexChanged" ></asp:Dropdownlist>
              </div>
            <br /><br /><br /><br />
        <div class="col-md-6" style="overflow:auto; height:180px; margin-left:250px;" >
    <asp:GridView runat="server" Style=" width:400px;" AutoGenerateColumns="false" ID="gvProduct" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnRowEditing="gvProduct_RowEditing" OnRowDeleting="gvProduct_RowDeleting" OnRowCancelingEdit="gvProduct_RowCancelingEdit" OnRowUpdating="gvProduct_RowUpdating" >
        
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
    <br /> <br /> <br />
    
    <div class="clearfix"></div>
</asp:Content>
