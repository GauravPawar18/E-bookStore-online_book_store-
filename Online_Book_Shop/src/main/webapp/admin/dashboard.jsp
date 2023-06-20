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
<title>Admin Dashboard</title>

<style type="text/css">
.nav-item {
	padding: 3px !important;
}

.list-group-item {
	padding: 8px !important;
}

.container1 {
	background-color: #f8bbd0 ;
	border-radius: 8px;
}

h2, h4 {
	padding: 3px;
}

.mydiv:hover {
	transform: translateY(-10px)
}
</style>
</head>

<body>
<%@include file="sidebar.jsp" %> 
	<!-- Vertical navbar start -->
<!-- 	<div class="bg-white vertical-nav" id="sidebar"> -->

<!-- 		<div class="bg-light py-4 px-3 mb-1"> -->
<!-- 			<p class="font-weight-bold text-uppercase px-3 sidebar-title text-center"><span style="color:green">Book</span> <span style="color:red">MyBook</span></p> -->

<!-- 			<div class="media d-flex align-items-center"> -->
<!-- 				<img src="../images/admin.png" width="90" height="90" -->
<!-- 					class="mr-3 rounded-circle img-thumbnail shadow-sm"> -->

<!-- 				<div class="media-body"> -->
<!-- 					<h4 class="mb-0">Admin</h4> -->
<!-- 					<p class="text-muted mb-0">admin@gmail.com</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

<!-- 		<ul class="nav flex-column bg-white"> -->

<!-- 			<li class="nav-item"><a href="dashboard.jsp" -->
<!-- 				class="nav-link text-dark bg-light"> <i -->
<!-- 					class="fas fa-tachometer-alt fa-fw mr-3 text-primary"></i> -->
<!-- 					Dashboard -->
<!-- 			</a></li> -->
			
<!-- 			<li class="nav-item"><a href="view_Booking.jsp" -->
<!-- 				class="nav-link text-dark bg-light"><i class="fas fa-book-reader fa-fw mr-3 text-primary"></i> -->
<!-- 					View Booking -->
<!-- 			</a></li> -->

<!-- 			<li class="nav-item dropdown"><a href="" -->
<!-- 				class="nav-link dropdown-toggle text-dark bg-light" id="navbardrop" -->
<!-- 				data-toggle="dropdown"> <i class="fab fa-product-hunt fa-fw mr-3 text-primary"></i> Product</a> -->

<!-- 				<div class="dropdown-menu"> -->
<!-- 					<a href="addProduct.jsp" class="dropdown-item">Add Product</a>  -->
<!-- 					<a href="viewProduct.jsp" class="dropdown-item">View Product</a> -->
<!-- 				</div> -->
<!-- 			</li> -->
				
<!-- 			<li class="nav-item"><a href="../logout" -->
<!-- 				class="nav-link text-dark bg-light"> <i -->
<!-- 					class="fas fa-power-off fa-fw mr-3 text-primary"></i> -->
<!-- 					Logout -->
<!-- 			</a></li> -->
			
<!-- 		</ul> -->
<!-- 	</div> -->

	<!-- Vertical navbar end -->

	<!-- content placeholder start -->

	<div class="page-content p-4" id="content">
		<a data-toggle="modal" data-target="#exampleModalCenter" title="logout" class="text-white float-right"></a>

<!-- Logout Model -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="text-center">
        <h4>Do You Want to Logout</h4>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
        </div>
      </div>
     </div> 
    </div>
  </div>
<!-- Close Logout Model -->

		
	<!-- Start Show All Data through Box -->
	<div class="container mt-5">
		<div class="row"> 
       <%
			try {
				int count = 0;
				Connection con = DbConnect.Connect();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from users");
				while (rs.next()) {
					count++;
				}
		%>     
			<div class="col-sm-4 text-center mydiv">
			   <div class="container1">
				  <div class="card-body">
				    <h4 class="text-danger">Total Customer</h4>
				 	<h2 class="text-primary"><%out.print(count);%></h2> 
				  </div>
				
				  <div class="card-footer">
				    <a href="view_User.jsp">View Details >>></a>				   
				  </div>
			   </div>
			</div>
        <%
			
		%> 
                    
        	<div class="col-sm-4 text-center mydiv">
		 <%
				    int count1 = 0;
					ResultSet rs1 = st.executeQuery("SELECT * from orders");
					while (rs1.next()) {
						count1++;
					}
		 %>     
		      
				<div class="container1">
				<div class="card-body">
					<h4 class="text-danger">Total Booking</h4>
					<h2 class="text-primary"><%out.print(count1);%></h2>
				</div>
				<div class="card-footer">
				   <a href="view_Booking.jsp">View Details >>></a>				   
				</div>
			</div>
			</div>

			<div class="col-sm-4 text-center mydiv"> 
		    <%
				    int count2 = 0;
					ResultSet rs2 = st.executeQuery("SELECT * from products");
					while (rs2.next()) {
						count2++;
					}
			%>  
				<div class="container1">
				  <div class="card-body">
				    <h4 class="text-danger">Total Product</h4>
					<h2 class="text-primary"><%out.print(count2);%></h2>					
				</div>
				<div class="card-footer">
				   <a href="viewProduct.jsp">View Details >>></a>				   
				</div>
			</div>
			</div>
		 </div>
	</div>	
    <%
		} catch (Exception e) {
			System.out.println(e);
		}
	%> 
  
	<!-- End Show All Data through Box -->
	</div>
	


</body>
</html>