<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Facebook</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	body{
		margin:0;
	}
</style>
</head>
<body>
	
	<c:set var = "auth" scope = "session" value = "${auth}"/>
      <c:choose>
         
         <c:when test = "${auth > 0}">
         	<!-- <a href="logout">LOGOUT</a> -->
            
            <div style="max-width:800px;height:100%;display:block;margin:0 auto;">
			<img alt="image"  src="<c:url value="resources/img/telenor.jpg" />" style="width:100%;">
			 <div style="padding:25px;">
			<form method="post" action="telenor">
				<div class="form-group">
					<label>Name</label>
					<input id="myInput" type="text" class="form-control" name="name" placeholder="Enter name" required>
				</div>
				<div class="form-group">
					<label>Email</label>
					<input type="text" class="form-control" name="email" placeholder="Enter Email" required>
				</div>
				<div class="form-group">
					<label>Phone Number</label>
					<input type="number" class="form-control" name="phone" placeholder="Enter Phone Number" required>
				</div>
				<div class="form-group">
					<input type="submit" id="registerbtn" class="form-control" value="Register" name="" style="background-color:#3b5998;color:#AAA;">
				</div>
			</form>
			</div>
			</div>
         </c:when>
         
         <c:otherwise>
            <div style="max-width:800px;height:100%;display:block;margin:0 auto;">
			 <img alt="image"  src="<c:url value="resources/img/fb.PNG" />" style="width:100%;">
			 <div style="padding:25px;">
			 <form action="login" method="post">
			 		<input id="myInput2"  type="text" name="name" style="height:45px;" class="form-control" placeholder="Email or phone number" required>
			 		<input type="password" name="password" style="height:45px;" class="form-control" placeholder="Password" required>
			 	
			 		<input type="submit" id="registerbtn2" style="background-color:#3b5998;color:#AAA;margin-top:20px;" class="form-control btn-primary" value="Log In" placeholder="Password">
			 		<p style="margin-top:30px;font-size:14px;color:#3b5998;text-align:center;font-weight:bold;">Forget Password?</p>
			 		<p style="font-size:14px;color:#3b5998;text-align:center;font-weight:bold;">Back</p>
			 </form>
			 </div>
         </c:otherwise>
      </c:choose>
	
	 </div>
	<h1></h1>
	<script>
	$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    document.getElementById("registerbtn").style.color = "white";
	  });
	  $("#myInput2").on("keyup", function() {
		    document.getElementById("registerbtn2").style.color = "white";
		  });
	});
	
	</script>
</body>
</html>