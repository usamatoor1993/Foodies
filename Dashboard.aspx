<%@ Page Title="" Language="C#" MasterPageFile="~/Foodies.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Foodies.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
    background-image: url("Images/bg2.jpg");
    background-color: #cccccc;
}
        body { padding-top:20px; }
.panel-body .btn:not(.btn-block) { width:120px;margin-bottom:10px; }
    </style>
    <br /><br /><br />
    <div class="container">
    <div class="row">
        <div class="col-md-12 col-md-12 col-sm-12 col-xs-12" >
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-bookmark"></span> Quick Shortcuts</h3>
                </div>
                <div class="panel-body" style="background-color:aqua">
                    <div class="row">
                        <br /><br /> <br /> 
                        <div class="col-xs-12 col-md-12 col-lg-12 col-sm-12">
                     
                           <a href="Orders.aspx" class="btn btn-danger btn-lg" style="height:150px;width:200px; margin-left:15px; " role="button">
                               <span class="glyphicon glyphicon-list-alt" style="margin-top:45px;"></span> <br/>Order</a>
                         
                            
                              <a href="AddCategory.aspx" class="btn btn-warning btn-lg" style="height:150px;width:200px; margin-left:20px;" role="button"><span class="glyphicon glyphicon-bookmark"style="margin-top:45px;" >  </span> <br/>Add Category</a>
                      
                          
                        <a href="AddProduct.aspx" class="btn btn-primary btn-lg" style="height:150px;width:200px; margin-left:20px;" role="button"><span class="glyphicon glyphicon-signal" style="margin-top:45px;" ></span> <br/>Add Product</a>
                         
                            
                            
                           <a href="Addtable.aspx" class="btn btn-primary btn-lg" style="height:150px;width:200px; margin-left:20px; " role="button"><span class="glyphicon glyphicon-comment" style="margin-top:45px;" ></span> <br/>Add Table</a>
          
                        </div>
                        <div class="col-xs-12 col-md-12 col-lg-12 col-sm-12">
                          <a href="Reservations.aspx" class="btn btn-success btn-lg" style="height:150px;width:200px; margin-left:15px;" role="button"><span class="glyphicon glyphicon-user" style="margin-top:45px;" ></span> <br/>Reservations</a>
                          <a href="Deals.aspx" class="btn btn-info btn-lg" style="height:150px;width:200px; margin-left:20px; " role="button"><span class="glyphicon glyphicon-file" style="margin-top:45px;" ></span> <br/>Deals</a>
                          <a href="#" class="btn btn-primary btn-lg" style="height:150px;width:200px; margin-left:20px; " role="button"><span class="glyphicon glyphicon-picture" style="margin-top:45px;" ></span> <br/>Photos</a>
                          <a href="#" class="btn btn-primary btn-lg" style="height:150px;width:200px; margin-left:20px;" role="button"><span class="glyphicon glyphicon-tag" style="margin-top:45px;" ></span> <br/>Tags</a>
                        </div>
                    </div>
                    <br /><br /> <br /><br />
                            </div>
            </div>
        </div>
        
    </div>
        <br />
</div>

</asp:Content>
