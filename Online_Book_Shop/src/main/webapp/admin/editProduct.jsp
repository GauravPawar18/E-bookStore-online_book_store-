<%@page import="com.book.model.Product"%>
<%@page import="com.book.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.book.dao.DbConnect"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<link rel="stylesheet" href="../component/sidebar.css">
<script type="text/javascript"
	src="../js1/sidebar.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
<title>Admin Dashboard</title>

<style type="text/css">
.nav-item {
	padding: 3px !important;
}

.list-group-item {
	padding: 8px !important;
}

.container1 {
	background-color: lightgrey;
	border-radius: 8px;
}

h2, h4 {
	padding: 3px;
}

.mydiv:hover {
	transform: translateY(-10px)
}

.glow {
	font-size: 80px;
	color: #fff;
	text-align: center;
	-webkit-animation: glow 1s ease-in-out infinite alternate;
}

@
-webkit-keyframes glow {from { text-shadow :0010px#fff, 0020px#fff, 0030px#e60073,
	0040px#e60073, 0050px#e60073, 0060px#e60073, 0070px#e60073;
	
}

to {
	text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px
		#ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
}
}
</style>
</head>

<body>
	<!-- Vertical navbar start -->
	<%@include file="sidebar.jsp" %> 

	<!-- Vertical navbar end -->

	<!-- content placeholder start -->

	<div class="page-content p-4" id="content">
		<a data-toggle="modal" data-target="#exampleModalCenter"
			title="logout" class="text-white float-right"><i
			class="fas fa-power-off"></i> <b>Logout</b></a>

		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fas fa-bars mr-2"></i> <small
				class="text-uppercase font-weight-bold">Toggle</small>
		</button>

		<!-- Logout Model -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle"></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<h4>Do You Want to Logout</h4>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<a href="../logout" type="button"
								class="btn btn-primary text-white">Logout</a>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- Close Logout Model -->

<div class="container card shadow m-5">
  <%
    String msg=request.getParameter("msg");
    if("valid".equals(msg))
    {
  %>
    <script>
		alert("Product Updated Successfully");
		window.location.assign("viewProduct.jsp");
	</script>  	
  <%
    }
  %>
  <div class="card-body">
	<h5 class="p-2" style="border-bottom: 2px solid orange">Edit Product</h5>
               <%
                    String pcat="";
					int prodid = Integer.parseInt(request.getParameter("prodid"));
                    ProductDAO dao= new ProductDAO(DbConnect.Connect());
					Product p =dao.getProductById(prodid);
					pcat=p.getPcat();
					
				%>
<div class="row">
    <div class="col-sm-12">
        <h4 class="text-center mb-2 border-bottom pb-2">Edit Product with id : <%= prodid%></h4>
        <form method="post" enctype="multipart/form-data" action="../UpdatePro">
            <input type="hidden" name="prodid" value="<%= prodid%>">
            <div class="form-row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Product Name</label>   
                        <input type="text" name="pname" class="form-control" value="<%= p.getPname()%>">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Product Category</label>   
                        <select name="pcat" class="form-control">
                            <%
                                     try
                                      {
                                    	
                                    	Connection con= DbConnect.Connect();
	                                    Statement st = con.createStatement();
	                                    ResultSet rs = st.executeQuery("select catname from category");
	                                    %>
	                                    <option value="<%=pcat%>"><%=pcat%></option>
	                                    <% 
	                                    while(rs.next())
	                                    {
	                                   %>
	                                    <option value="<%=rs.getString("catname")%>"><%=rs.getString("catname")%></option>
	                                   <%
	                                    }
                                     }

								catch(Exception e){
									System.out.println(e);
                                }
								%>
                         </select> 
                    </div>
                </div>
            </div>
            <div class="form-row"> 
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Description</label>
                        <textarea rows="4" class="form-control" style="resize: none" name="descr"><%= p.getDescr()%></textarea>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <img src="../images2/<%= p.getPhoto()%>" width="100" height="100" class="float-right">
                        <label>Product Photo</label>   
                        <input type="file" name="pic" accept=".jpg,.png" class="custom-control">                        
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Product Price</label>   
                        <input type="text" name="price" class="form-control" value="<%= p.getPrice()%>">
                    </div>
                </div>                    
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Discount Price</label>   
                        <input type="text" name="dprice" class="form-control" value="<%= p.getDisc_price()%>">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Discount Remarks</label>   
                        <input type="text" name="remarks" class="form-control" value="<%= p.getRemarks()%>">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Featured Product</label>   
                        <select name="featured" class="form-control">
                            <option <%= p.getFeatured().equals("Yes") ? "selected" :""%> >Yes</option>
                            <option <%= p.getFeatured().equals("No") ? "selected" :""%>>No</option>
                        </select>
                    </div>
                </div>                    
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Stock</label>   
                        <select name="instock" class="form-control">
                            <option <%= p.getInstock().equals("In Stock") ? "selected" :""%> >In Stock</option>
                            <option <%= p.getInstock().equals("Out of Stock") ? "selected" :""%>>Out of Stock</option>
                        </select>
                    </div>
                </div>  
                    <div class="col-sm-4">
                        <input type="submit" value="Save Product" class="btn btn-primary float-right mt-4">
                    </div>
            </div>            
        </form>
    </div>
</div>

</div>
</div>
</div>
</body>
</html>