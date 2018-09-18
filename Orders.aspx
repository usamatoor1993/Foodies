<%@ Page Title="" Language="C#" MasterPageFile="~/Foodies.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Foodies.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function openmodel()
        {
            $("#open").modal('show');

        }
        function closemodel()
        {
            $("#open").modal("fade");
        }
    </script>
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
    <style>
          body {
    background-image: url("Images/bg2.jpg");
    background-color: #cccccc;
    
}
    </style>
                    <asp:ScriptManager runat="server" ></asp:ScriptManager>   
    <div id="open" style=" overflow:auto" class="modal fade" role="dialog" tabindex="-1">
  <div class="modal-dialog">
     <asp:UpdatePanel runat="server">
         <ContentTemplate>

         

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Order: Table no <asp:Label runat="server" ID="lblTableID"></asp:Label></h4>
      </div>
      <div class="modal-body">

          <div class="Waiter Name">
              <div class="col-md-4">
              <asp:TextBox runat="server" Placeholder="Waiter Name" Style="margin-left:373px" CssClass="form-control" ID="txtWaiterName" ></asp:TextBox>
          </div>
              </div>
          <br /><br />
            
          <div class="Main Category">
        <asp:Dropdownlist runat="server" CssClass="form-control" ID="ddlOrderMainCategory" AutoPostBack="true" OnSelectedIndexChanged="ddlOrderMainCategory_SelectedIndexChanged" ></asp:Dropdownlist>
                     </div>
                     
          <br />
         
        
          <div class="Sub Category">
          <asp:Dropdownlist runat="server" CssClass="form-control" ID="ddlOrderProducts" ></asp:Dropdownlist>
         
          </div>
          <br />
             <asp:Button runat="server" CssClass="btn btn-success pull-right" Enabled="false" ID="btnAddProducts" Text="Add" OnClick="btnAddProducts_Click" />  
          <br />
          <br />
          
           <div class="col-md-12"  style="overflow:auto;height:180px; " >
          <asp:GridView runat="server" AutoGenerateColumns="false"  ID="gvOrderProducts"  style="width:500px;" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"  OnRowDeleting="gvOrderProducts_RowDeleting"  >
           <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Food Name 
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
                <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                       Price 
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblPrice" Text='<%# Eval("Price") %>'></asp:Label> 
                    
                    </ItemTemplate>
                    
                </asp:TemplateField>
            </Columns>
              <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Quantity 
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox CssClass="form-control"  Style="width:70px;" runat="server" ID="txtOrderQuantity" TextMode="Number" AutoPostBack="true" Text='<%# Eval("Quantity") %>' OnTextChanged="txtOrderQuantity_TextChanged" ></asp:TextBox>
                         
                    </ItemTemplate>
                    
                </asp:TemplateField>
            </Columns>
                <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Total 
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblTotalPrice" Text='<%# Eval("Total_Price") %>'></asp:Label> 
                    </ItemTemplate>
                </asp:TemplateField>
                    
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
         
      
          
          <asp:Button runat="server" Text="Shift" ID="btnshift" Enabled="false"  cssClass="btn btn-primary" Style="Width:20%;" OnClick="btnshift_Click" />
          <asp:Button runat="server" Text="Clear" ID="btnClear" Enabled="false"  cssClass="btn btn-danger" Style="Width:20%;" OnClick="btnClear_Click" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Hide</button>
      </div>
    </div>
      
       </ContentTemplate>
     </asp:UpdatePanel>   
  </div>
</div>
      <div class="clearfix"></div>
    <br /><br /><br /><br /><br /><br />
          
            
     
  <asp:ListView runat="server" ID="lvOrder">      
      <ItemTemplate>
          
    <div class=" col-md-4" style="height:200px; overflow:auto; ">
        	
    <div class="panel panel-success">
       
        <div class="panel-heading">
                       <asp:Label runat="server" ID="lblTabID" Text='<%# Eval ("ID") %>' Visible="false"></asp:Label>
           <h4 style="margin-left:95px;" >  Table no
           <b><asp:Label runat="server"  Text='<%# Eval ("Table_Name") %>'  ID="lblTname"></asp:Label></b>
             </h4>
        </div>
        <div class="panel-body">
           
           
                <a href="<%# string.Format("Orders.aspx?Tid={0}",Eval("ID")) %>"  style="Width:100%;"  class="btn btn-success">Order</a>
                    <%--     <button Text="Order" data-toggle="modal" data-target="#orderModal"  cssClass="btn btn-success" style="Width:40%;"   />
             --%>
            
           
            
        </div>
                     
        <div class="panel-footer">

        </div>

                   
    </div>
        



        
        
       </div>
          
    
                </ItemTemplate>      
          </asp:ListView>
    
 <div class=" clearfix">

 </div>
      
      
  

</asp:Content>
