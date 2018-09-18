<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Try.aspx.cs" Inherits="Foodies.Try" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <style>
          body {
    background-image: url("Images/bg6.png");
    background-color: #cccccc;
    
}
    </style>
      <div class="clearfix"></div>
    <br /><br /><br /><br />
    <br />

    <div class=" col-md-4" style="height:200px; overflow:auto">
        	
    <div class="panel panel-success">
       
        <div class="panel-heading">
                       <asp:Label runat="server" ID-="lblTabID" Text="table id" Visible="false"></asp:Label>
           <b><asp:Label runat="server" Text="table name"  ID-="lblTname"></asp:Label></b>
            <b style=" float:right;">Minutes</b>
        </div>
                    
        <div class="panel-body">
           
           <table class="table table-bordered">
               <tr>
                   <th>Name</th>
                   <th>Price</th>
                   <th>Quantity</th>
                   <th>Amount</th>
               </tr>
               
               <tr>
                   <td><asp:Label runat="server" Text="Name"  ID="lblRname" ></asp:Label></td>
                   <td><asp:Label runat="server" Text="Price"  ID="lblPricee"></asp:Label></td>
                   <td><asp:Label runat="server" Text="qty"  ID="lblqty"></asp:Label></td>
                   <td><asp:Label runat="server" Text="Total"  ID="lbltotall"></asp:Label></td>
               </tr>
               </table>
                

           
            
        </div>
                     
        <div class="panel-footer">
            
           <div id="orderModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Order: Table no 1</h4>
      </div>
      <div class="modal-body">

          <div class="Waiter Name">
              <div class="col-md-4">
              <asp:TextBox runat="server" Placeholder="Waiter Name" Style="margin-left:373px" CssClass="form-control" ID="TextBox2"></asp:TextBox>
          </div>
              </div>
          <br /><br />
          <div class="Main Category">
        <asp:Dropdownlist runat="server" CssClass="form-control" id="Dropdownlist4" >
             <asp:ListItem Value="NULL">Main Category</asp:ListItem>
         <asp:ListItem Value="1">Submitted records</asp:ListItem>
         <asp:ListItem Value="0">Non-Submitted records</asp:ListItem>
        <asp:ListItem Value="2">All records</asp:ListItem>
        </asp:Dropdownlist>
              </div>
          <br />
          <div class="Sub Category">
          <asp:Dropdownlist runat="server" CssClass="form-control" id="Dropdownlist5" >
             <asp:ListItem Value="NULL">Sub Category</asp:ListItem>
         <asp:ListItem Value="1">Submitted records</asp:ListItem>
         <asp:ListItem Value="0">Non-Submitted records</asp:ListItem>
        <asp:ListItem Value="2">All records</asp:ListItem>
        </asp:Dropdownlist>
              </div>
          <br />
          <div class="Labels">
              <div class="col-md-2">
                  <asp:Label runat="server" ID="Label12" Text="Food Name"></asp:Label>
              </div>
              <div class="col-md-2">
                  <asp:Label runat="server" ID="Label13" Text="Qantity"></asp:Label>
              </div>
              <div class="col-md-2">
                  <asp:Label runat="server" ID="Label14" Text="Price Per Each"></asp:Label>
              </div>
                             <div class="col-md-2">
                  <asp:Label runat="server" ID="Label15" Style="margin-left:200px" Text="Total"></asp:Label>
              </div>
          </div>
          <br /><br /><br />
      
          <hr />
          <asp:Button runat="server" Text="Shift"   class="btn btn-primary" Style="Width:20%;" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Hide</button>
      </div>
    </div>

  </div>
</div>
            <asp:Button runat="server" Text="Order" data-toggle="modal" data-target="#orderModal"  class="btn btn-success" style="Width:40%;" />
             
            <asp:Button runat="server" Text="Shift"   class="btn btn-primary" Style="Width:20%;" />
        </div>

                   
    </div>
        



        
        
       </div>

        </div>
 <div class=" clearfix">

 </div>
      <br /><br /><br />
    </div>
    </form>
</body>
</html>
