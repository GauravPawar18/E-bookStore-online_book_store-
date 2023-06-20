<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<body>
<!-- Vertical navbar start -->
	<div class="bg-white vertical-nav" id="sidebar">

		<div class="bg-light py-4 px-3 mb-1">
			<p class="font-weight-bold text-uppercase px-3 sidebar-title text-center"><span style="color:green">Online Book</span> <span style="color:red">Shop</span></p>

			<div class="media d-flex align-items-center">
				<img src="../images/admin.png" width="90" height="90"
					class="mr-3 rounded-circle img-thumbnail shadow-sm">

				<div class="media-body">
					<h4 class="mb-0">Admin</h4>
					<p class="text-muted mb-0">admin@gmail.com</p>
				</div>
			</div>
		</div>

		<ul class="nav flex-column bg-white">

			<li class="nav-item"><a href="dashboard.jsp"
				class="nav-link text-dark bg-light"> <i
					class="fas fa-tachometer-alt fa-fw mr-3 text-primary"></i>
					Dashboard
			</a></li>
			
						<li class="nav-item"><a href="view_User.jsp"
				class="nav-link text-dark bg-light"><i class="fas fa-users fa-fw mr-3 text-primary"></i> 
					View User
			</a></li>
			
			<li class="nav-item"><a href="view_Booking.jsp"
				class="nav-link text-dark bg-light"><i class="fas fa-book-reader fa-fw mr-3 text-primary"></i>
					View Booking
			</a></li>
			
			<!-- <li class="nav-item"><a href="view_Feedback.jsp"
				class="nav-link text-dark bg-light"> <i class="fas fa-comment-dots fa-fw mr-3 text-primary"></i>
					View FeedBack
			</a></li> -->

			<li class="nav-item dropdown"><a href=""
				class="nav-link dropdown-toggle text-dark bg-light" id="navbardrop"
				data-toggle="dropdown"> <i class="fab fa-product-hunt fa-fw mr-3 text-primary"></i> Product</a>

				<div class="dropdown-menu">
					<a href="addProduct.jsp" class="dropdown-item">Add Product</a> 
					<a href="viewProduct.jsp" class="dropdown-item">View Product</a>
				</div>
			</li>
			
			<!-- <li class="nav-item dropdown"><a href=""
				class="nav-link dropdown-toggle text-dark bg-light" id="navbardrop"
				data-toggle="dropdown"> <i class="fab fa-codepen fa-fw mr-3 text-primary"></i> Category</a>

				<div class="dropdown-menu">
					<a href="addCategory.jsp" class="dropdown-item">Add Category</a> 
					<a href="viewCategory.jsp" class="dropdown-item">View Category</a>
				</div>
			</li> -->
			
			
			
			
			   				
				<!-- <li class="nav-item dropdown"><a href=""
				class="nav-link dropdown-toggle text-dark bg-light" id="navbardrop"
				data-toggle="dropdown"> <i
					class="fas fa-cloud-moon-rain fa-fw mr-3 text-primary"></i> Report</a>

				<div class="dropdown-menu">
					<a href="betweenBookingQueries.jsp" class="dropdown-item">Booking B/W Dates</a>
				</div></li> -->
			
			<li class="nav-item"><a href="changePassword.jsp"
				class="nav-link text-dark bg-light"> <i class="fas fa-cog fa-fw mr-3 text-primary"></i> 
					Change Password
			</a></li>
				
			<li class="nav-item"><a href="../logout"
				class="nav-link text-dark bg-light"> <i
					class="fas fa-power-off fa-fw mr-3 text-primary"></i>
					Logout
			</a></li>
			
		</ul>
	</div>

	<!-- Vertical navbar end -->

	<!-- content placeholder start -->

	<div class="page-content p-4" id="content">
		<a data-toggle="modal" data-target="#exampleModalCenter" title="logout" class="text-white float-right"><i
			class="fas fa-power-off"></i> <b>Logout</b></a>

		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fas fa-bars mr-2"></i> <small
				class="text-uppercase font-weight-bold"></small>
		</button>
	</div>

</body>
</html>