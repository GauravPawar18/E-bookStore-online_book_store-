<%@page import="com.book.dao.CategoryDAO"%>
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

@-webkit-keyframes glow {
  from { 
  text-shadow :0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073,
	0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
  }

  to {
	text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px
		#ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
  }
}
</style>
</head>

<body>
	<%@include file="sidebar.jsp" %> 

	<!-- content placeholder start -->

	<div class="page-content p-4" id="content">
		<a data-toggle="modal" data-target="#exampleModalCenter" title="logout" class="text-white float-right">
			</a>

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
  <%
    String msg=request.getParameter("msg");
    if("valid".equals(msg))
    {
  %>
    <script>
		alert("New Product Add Successfully..");
		window.location.assign("viewProduct.jsp");
	</script>  	
  <%
    }
  %>
<div class="container card shadow m-5">
		<div class="card-body">
			<h5 class="p-2" style="border-bottom: 2px solid orange">Add New Product</h5>
             <br>
 <div class="row">
    <div class="col-sm-12">
        <form method="post" enctype="multipart/form-data" action="../Upload">
            <div class="form-row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Product Name</label>   
                        <input type="text" name="pname" class="form-control" placeholder="Product Name" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Product Category</label>   
                        <select name="pcat" class="form-control" required>
                        <%
                                     try
                                      {
                                    	Connection con= DbConnect.Connect();
	                                    Statement st = con.createStatement();
	                                    ResultSet rs = st.executeQuery("select catname from category");
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
                        <label>Product Price</label>   
                        <input type="text" name="price" class="form-control" placeholder="Product Price" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Product Photo</label>   
                        <input type="file" name="pic" accept=".jpg,.png" class="custom-control" required>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Discount Price</label>   
                        <input type="text" name="dprice" class="form-control" placeholder="Discount Price" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Discount Remarks</label>   
                        <input type="text" name="remarks" class="form-control" placeholder="Discount Remarks" required>
                    </div>
                </div>
            </div>
                        
            <div class="form-group">
                <label>Description</label>
                <textarea rows="4" class="form-control" style="resize: none" name="descr" required></textarea>
            </div>
            <input type="submit" value="Save Product" class="btn btn-primary float-right">
        </form>
    </div>
</div>			


</body>
</html>