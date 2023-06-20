<%@page import="com.book.model.UsersDtls"%>
<%@page import="com.book.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.book.dao.DbConnect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" 	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>

<link rel="stylesheet" href="../component/sidebar.css">
<script type="text/javascript" src="../js1/sidebar.js"></script>

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
<%@include file="sidebar.jsp" %> 

	<!-- content placeholder start -->

	<div class="page-content p-4" id="content">
		<a data-toggle="modal" data-target="#exampleModalCenter"
			title="logout" class="text-white float-right"></a>


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
    <%
		String msg = request.getParameter("msg");
		if ("deleted".equals(msg)) {
	%>
	<script>
		alert("Record Deleted Successfully!!");
		window.location.assign("view_User.jsp");
	</script>
	<%
		}
	%>
		<div class="container card shadow m-5">
			<div class="card-body">
				<h5 class="p-2" style="border-bottom: 2px solid orange">View Users</h5>

				<div class="container mt-5">
					<h1 class="text-success text-center"></h1>

					<table id="example" class="table table-striped table-bordered" style="width:100%">
						<thead style="background-color: #993876;">
							<tr>
								<th>S.No</th>
								<th>User Name</th>
								<th>Image</th>
								<th>Email</th>
								<th>Contact</th>
								<th>City</th>
								<th>Address</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody style="overflow: scroll">
                            <%
							    int i=0;
								for (UsersDtls u : UsersDAO.getUsers(false,false)) {
									i++;
							%>
							
							<tr>
								<td><%=i%></td>
								<td><%= u.getFirstname() %></td>
								<td><img width='100' height='100' src='../images1/<%= u.getImg()%>'></td>
								<td><%=u.getEmail()%></td>
								<td><%=u.getContact()%></td>
								<td><%=u.getCity()%></td>
								<td><%=u.getAddress()%></td>
								<td></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>



