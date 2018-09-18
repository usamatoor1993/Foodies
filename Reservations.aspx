<%@ Page Title="" Language="C#" MasterPageFile="~/Foodies.Master" AutoEventWireup="true" CodeBehind="Reservations.aspx.cs" Inherits="Foodies.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #popup {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 400px;
            height: 586px;
            z-index: 2;
            padding: 5px;
        }


        .overlay-back {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
           
        }




        #owl-demo .item {
            /*background: #3fbf79;*/
            color: #FFF;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
        }

        .table-name {
            background-color: black;
            opacity: 0.7;
            color: white;
            box-shadow: 0px 0px 5px #000000;
            text-align: center;
        }

        .shadow {
            box-shadow: 0 0 10px white;
        }

        

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
       
            
      <br /><br /><br />
     <style>
          body {
    background-image: url("Images/bg2.jpg");
    background-color: #cccccc;
    
}
    </style>
       <div class="clearfix"></div>
    <div class="modal fade" id="printorderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <img src="assets/logo.png" class=" img-responsive" height="50" width="50" style=" float:left; margin-top:-10px;" />
          <h4 class="modal-title" id="myModalLabel1">Print Order</h4>
      </div>
      <div class="modal-body">
          <table class="table table-striped">
              <tr>
                  <td>Table-069</td>
                  <td>Imran</td>
                  <td style=" text-align:center;">Paid</td>
                  <td style=" text-align:right;">20-07-2016</td>
              </tr>
          </table>
          <br />
       <table class="table table-striped">
							<thead>
								<tr>
									<th>Name</th>
									<th>Quantity</th>
									<th>Price</th>
                            	</tr>
							</thead>
							<tbody>
                            	<tr>
									<td><asp:Label runat="server" ID="lblName" ></asp:Label></td>
									<td>
                      <asp:TextBox runat="server" TextMode="Number" Width="50px" Text="1" CssClass=" form-control"  AutoPostBack="true"  ID="txtQuantity"></asp:TextBox>

									</td>
									
                                    <td><asp:Label runat="server" ID="LblPrice" >-Rs</asp:Label></td>
                                     
								</tr>
                            	<tr>
									<th></th>
									<th>Total</th>
									<th><asp:Label runat="server" ID="lblTotal" ></asp:Label></th>
								</tr>
							</tbody>
						</table>
  </div>
      <div class="modal-footer">
 <asp:Button runat="server" CssClass="btn btn-info" ID="btnConfirmed" Text="Print Order" />
					
      </div>
    </div>
  </div>
</div>
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
           <asp:Button runat="server"  class="btn btn-info" data-toggle="modal" data-target="#printorderModal" /> 
           <div id="paymentModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Payment: Table no 1</h4>
      </div>
      <div class="modal-body">

          <div class="Waiter Name">
              <div class="col-md-8">
              <asp:label runat="server" Text="WaiterName" Style="margin-left:373px"  ID="lblWaiterName"></asp:label>
          </div>
              </div>
          <br /><br />
          
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
      <div class="Labels2">
          <div class="col-md-3">
              <asp:TextBox runat="server" CssClass="form-control" Placeholder="Discount" ID="txtDiscount"></asp:TextBox>
          </div>
          <div class="col-md-2">
              <asp:Label runat="server" ID="Label17" Style="margin-left:335px" Text="Total"></asp:Label>
          </div>
      </div>
          <br /><br />
          <div class="Labels2">
          <div class="col-md-3">
              <asp:TextBox runat="server" CssClass="form-control" Placeholder="Rec" ID="txtRec"></asp:TextBox> 
          </div>
              <div class="col-md-3">
              <asp:Label runat="server" Text="Bal" ID="lblBal"></asp:Label>
          </div>
              </div>
          <br /><br />
          <div class="textBal">
          
      </div><br />
          <hr />
          <br />
      <div class="Print Button">
          <div class="col-md-2">
              <asp:Button runat="server" ID="Button2" Text="Print" CssClass="form-control btn btn-primary" Style="margin-left:460px" ></asp:Button>
          </div>
          
      </div>
          <br />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
            <asp:Button runat="server" Text="Payment" data-toggle="modal" data-target="#paymentModal"  class="btn btn-success" style="Width:60%;" />
            <div id="addModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add</h4>
      </div>
      <div class="modal-body">

          <div class="Waiter Name">
              <div class="col-md-4">
              <asp:Label runat="server" Text="WaiterName" Style="margin-left:373px"  ID="lblWaiterNameadd"></asp:Label>
          </div>
              </div>
          <br /><br />
          <div class="Main Category">
        <asp:Dropdownlist runat="server" CssClass="form-control" id="Dropdownlist2" >
             <asp:ListItem Value="NULL">Main Category</asp:ListItem>
         <asp:ListItem Value="1">Submitted records</asp:ListItem>
         <asp:ListItem Value="0">Non-Submitted records</asp:ListItem>
        <asp:ListItem Value="2">All records</asp:ListItem>
        </asp:Dropdownlist>
              </div>
          <br />
          <div class="Sub Category">
          <asp:Dropdownlist runat="server" CssClass="form-control" id="Dropdownlist3" >
             <asp:ListItem Value="NULL">Sub Category</asp:ListItem>
         <asp:ListItem Value="1">Submitted records</asp:ListItem>
         <asp:ListItem Value="0">Non-Submitted records</asp:ListItem>
        <asp:ListItem Value="2">All records</asp:ListItem>
        </asp:Dropdownlist>
              </div>
          <br />
          <div class="Labels">
              <div class="col-md-2">
                  <asp:Label runat="server" ID="Label6" Text="Food Name"></asp:Label>
              </div>
              <div class="col-md-2">
                  <asp:Label runat="server" ID="Label7" Text="Qantity"></asp:Label>
              </div>
              <div class="col-md-2">
                  <asp:Label runat="server" ID="Label8" Text="Price Per Each"></asp:Label>
              </div>
                             <div class="col-md-2">
                  <asp:Label runat="server" ID="Label9" Style="margin-left:200px" Text="Total"></asp:Label>
              </div>
          </div>
          <br /><br /><br />
      
          
      
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
         <asp:Button runat="server" Text="Add" data-toggle="modal" data-target="#addModal"  class="btn btn-danger" Style="Width:20%;" /> 

        </div>

                   
    </div>
        



        
        
       </div>

        </div>
 <div class=" clearfix">

 </div>
    <br /> <br /> <br />
</asp:Content>

