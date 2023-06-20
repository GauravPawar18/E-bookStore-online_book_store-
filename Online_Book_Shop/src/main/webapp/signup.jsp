<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Signup Page</title>
<%@include file="navbar.jsp" %>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
    function checkpassword(){
    	if(document.signup.password.value!=document.signup.confirmpassword.value){
    		alert('Password and Confirm Password field does not match');
    		document.signup.confirmpassword.focus();
    		return false;
    	}
    	return true;
    }
    
    $(document).ready(function(){
    	$('#password').keyup(function() {
    		$('#result').html(checkStrength($('#password').val()))
    		})
    		function checkStrength(password) {
    		var strength = 0
    		if (password.length < 6) {
    		$('#result').removeClass()
    		$('#result').addClass('short')
    		return 'Too short'
    		}
    		if (password.length > 7) strength += 1
    		// If password contains both lower and uppercase characters, increase strength value.
    		if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) strength += 1
    		// If it has numbers and characters, increase strength value.
    		if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/)) strength += 1
    		// If it has one special character, increase strength value.
    		if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
    		// If it has two special characters, increase strength value.
    		if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
    		// Calculated strength value, we can return messages
    		// If value is less than 2
    		if (strength < 2) {
    		$('#result').removeClass()
    		$('#result').addClass('weak')
    		return 'Weak'
    		} else if (strength == 2) {
    		$('#result').removeClass()
    		$('#result').addClass('good')
    		return 'Good'
    		} else {
    		$('#result').removeClass()
    		$('#result').addClass('strong')
    		return 'Strong'
    		}
    		}
    	$("#alertSuccess").hide();
    		$("#errfname").hide();
    		$("#errlname").hide();
    		$("#erremail").hide();  //Initially hiding the error spans
    		$("#errpassword").hide();

    		$("#Rbtn").click(function() {
    			var fname=$("#firstname").val();
    			var lname=$("#lastname").val();
    			var password=$("#password").val(); //triggers on click of register
    			var email=$("#email").val();
    			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    			 var letters = /^[A-Za-z]+$/;

    			 if(fname=="" || fname==null){
    				alert("Firstname cannot be Empty");
    				return false;
    			}if(lname==null || username==""){
    				alert("Lastname cannot be Empty");
    				return false;
    			}else if(password=="" || password==null){
    				alert("Password cannot be Empty");
    				return false;
    				
    			}else if(email=="" || email==null){
    				
    				alert("Email cannot be Empty");
    				return false;
    			}else if(!(email.match(mailformat))){
    				alert("Please Enter Valid Mail ID");

    			return false;
    			}else if(!(username.match(letters))){
    				alert("Pleas Enter only Characters for Username");
    				return false;
    			}else{
    				$("#alertSuccess").show();
    				$("#formid").submit();
    				return true;
    			}
    			
    			});

    		
    		
    		
    		$("#email").change(function(){
    			var email=$("#email").val();

    			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    			if(!(email.match(mailformat))){
    				 $("#erremail").show();


    			return false;
    			}else{
    				 $("#erremail").hide();
    			return true;
    				
    				
    			}
    			
    		});
    		
    		$("#cpassword").change(function(){
    			var password=$("#password").val();
    			var cpassword=$("#cpassword").val();
    			if(!(password==cpassword)){
    				 $("#errpass").show();
    				return false;	
    				
    			}else{
    				 $("#errpass").hide();

    				return true;
    			}		
    		});	
    	});
    $(document).ready(function(){
	    $("#email").blur(function(event){
	        var  email=$(this).val();
	        //alert (email);
	        if(email){
	        	
	        	 var ajax=new XMLHttpRequest();	   
	  		   		ajax.onreadystatechange=function(){		      
	  			       if(ajax.readyState==4){		    	  
	  			    	   document.getElementById("msg1").innerHTML=ajax.responseText;
	  			       }		   
	  		   }; 
	  		   
	  		 	var url ="CheckDuplicateEmail?email="+email;//server side servlet
	  		   	ajax.open("GET",url,true);//initializes request
	  		   	ajax.send(null);//sends request for processing	
	         }
	     });
	    
	    $("#contact").blur(function(event){
	        var  mob=$(this).val();
	        //alert (email);
	        if(mob){
	        	
	        	 var ajax=new XMLHttpRequest();	   
	  		   		ajax.onreadystatechange=function(){		      
	  			       if(ajax.readyState==4){		    	  
	  			    	   document.getElementById("msg2").innerHTML=ajax.responseText;
	  			       }		   
	  		   }; 
	  		   
	  		 	var url ="CheckMobile?mob="+mob;//server side servlet
	  		   	ajax.open("GET",url,true);//initializes request
	  		   	ajax.send(null);//sends request for processing	
	         }
	     });
    });
	
    
  </script>
  
</head>

<body>

    <%
        String msg=request.getParameter("msg");
		if ("validMsg".equals(msg)) {
	%>
	<script>
		alert("Registration Successfully...");
		window.location.assign("login.jsp");
	</script>
	<%
		}
	%>
	<div class="hero-wrap hero-bread" style="background-image: url('images/grocery2.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>User Signup</span></p>
            <h1 class="mb-0 bread">User Signup</h1>
          </div>
        </div>
      </div>
    </div>
	<div class="container my-5">
	 <div class="card-body">
		<h2 style="margin-top: 20px" align="center">Registration Form</h2>
		<hr>

		<div class="container-fluid" style="width: 70%; margin-top: 5%">
			<form method="post" action="signup" name="signup" id="user_signup" onsubmit ="return checkpassword()" enctype="multipart/form-data">
				
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputEmail4">First Name</label> <input type="text"
							class="form-control" placeholder="Enter First Name" name="firstname"
							id="firstname">
							<span id="errfname" class="alert alert-danger col-lg-8 col-md-8 col-sm-8 col-xs-12">Should Contain Only Characters</span>
					</div>
					<div class="form-group col-md-6">
						<label for="inputPassword4">Last Name</label> <input type="text"
							class="form-control" name="lastname" placeholder="Enter Last Name"
							id="lastname">
							<span id="errlname" class="alert alert-danger col-lg-8 col-md-8 col-sm-8 col-xs-12">Should Contain Only Characters</span>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputPassword4">Password</label> <input
							type="password" class="form-control" name="password"
							id="password" placeholder="Enter Password">
							<span id="result"></span>
					</div>
					<div class="form-group col-md-6">
						<label for="inputPassword4">Confirm Password</label> <input
							type="password" class="form-control" name="confirmpassword"
							id="confirmpassword" placeholder="Enter Password Again">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="exampleInputEmail1">Email</label> <input type="email"
							class="form-control" id="email"
							aria-describedby="emailHelp" name="email"
							placeholder="Enter Email">
							<span id="erremail" class="alert alert-danger col-lg-8 col-md-8 col-sm-8 col-xs-12">Invalid Email Address</span>
							<span id="msg1"></span>
					</div>

					<div class="form-group col-md-6">
						<label for="exampleInputPassword1">Contact</label> <input
							type="text" class="form-control" id="contact"
							placeholder="Enter Contact Detail" name="contact">
							<span id="msg2"></span>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="exampleInputPassword1">City</label> <input type="text"
							class="form-control" id="city"
							placeholder="Enter City" name="city">
					</div>

					<div class="form-group col-md-6">
						<label for="exampleInputPassword1">User PIC</label> <input
							type="file" class="form-control" id="img"
							name="img" value="choose file">
					</div>
				</div>
				<div class="form-row">

					<div class="form-group col-md-12">
						<label for="exampleInputPassword1">Full Address</label> <textarea class="form-control" id="address"
							placeholder="Enter Address Detail" name="address"></textarea>
					</div>					
				</div>
				<button type="submit" class="btn btn-primary" id="Rbtn">Submit</button>
			</form>
		</div>
	</div>
	</div>
	
<%@include file="footer.jsp" %>
</body>
</html>
