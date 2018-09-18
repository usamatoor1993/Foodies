<%@ Page Title="" Language="C#" MasterPageFile="~/Foodies.Master" AutoEventWireup="true" CodeBehind="Addtable.aspx.cs" Inherits="Foodies.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br /><br /><br /> <br />
         <style>
          body {
    background-image: url("Images/bg2.jpg");
    background-color: #cccccc;
    
}
    </style>
  <div class="col-lg-1">
          
          <center><h3 style="color:#f89c0a; background-color:#a4efed; height:28px; width:200px;"  >  Add Table </h3></center>
        </div>
    <br />
    <div class="col-md-6">
        <asp:TextBox runat="server" CssClass="form-control" Placeholder="Table No" ID="txtTable" Style="margin-left:230px;" TextMode="Number" Required ></asp:TextBox>
        </div>
    
    <br /><br />
    <div class="col-md-6">
    <asp:Button runat="server" CssClass="btn btn-success form-control" ID="btnAddTable" Text="Add" Style="margin-left:230px;" OnClick="btnAddTable_Click" />
        </div>
        <br /><br /><br />
        <div class="col-md-3" style="overflow:auto; height:100px; margin-left:320px;">
            <asp:GridView runat="server" AutoGenerateColumns="false" ID="gvTable" Style="width:210px; " BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnRowEditing="gvTable_RowEditing" OnRowDeleting="gvTable_RowDeleting" OnRowCancelingEdit="gvTable_RowCancelingEdit" OnRowUpdating="gvTable_RowUpdating" >
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                     <center>   Table Name </center>
                    </HeaderTemplate>
                    <ItemTemplate>
                       <center> <asp:Label runat="server" Text='<%# Eval("Table_Name") %>'></asp:Label> </center>
                        <asp:Label runat="server" ID="lblid" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label runat="server" ID="lblid" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                        <asp:TextBox runat="server" ID="txtEditTableName"  Text='<%# Eval("Table_Name") %>'></asp:TextBox>
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
    <br /><br /><br /><br /><br /><br />
</asp:Content>
