<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<!--  Enable Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!--  Access the Static Resources without using spring URL -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/style.css" rel="stylesheet" />
<link href="/css/style2.css" rel="stylesheet"/>
<script src="/js/script.js"></script>
<script src="/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="/js/cufon-yui.js" type="text/javascript"></script>
<script src="/js/cufon-replace.js" type="text/javascript"></script>
<script src="/js/Myriad_Pro_400.font.js" type="text/javascript"></script>
<script src="/js/Myriad_Pro_600.font.js" type="text/javascript"></script>
<script src="/js/NewsGoth_BT_400.font.js" type="text/javascript"></script>
<script src="/js/NewsGoth_BT_700.font.js" type="text/javascript"></script>
<script src="/js/NewsGoth_Dm_BT_400.font.js" type="text/javascript"></script>
<script src="/js/script2.js" type="text/javascript"></script>

</head>

<body>



	<%@ include file="header.jsp"%>


	<div class="container my-3" style="width: 800px;padding: 50px; background: url(images/login-bg.jpg)">
	
	<div class="row">
		    <div class="col">
		      <img alt="" src="images/login.jpg" width="400px" height="600px">
		    </div>
		    <div class="col" style="padding: 40px 0 0 30px" style="background-color: white;">

		<c:if test="${success_register != null}">

			<div class="alert alert-success">${success_register} Click here to <a href="login">
			Sign In</a> </div>

		</c:if>
		<h3 style="color:white;">Register</h3>

		
		<sf:form action="register" method="post" class="was-validated" modelAttribute="user">
			
			<div class="mb-3 mt-3">
				<label for="name" class="form-label" style="color:white;">Name:</label> <sf:input
					type="text" class="form-control" 
					placeholder="Enter name" name="name" path="name" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="mb-3">
				<label for="userName" class="form-label" style="color:white;">Username:</label> <sf:input
					type="text" class="form-control" id="userName"
					placeholder="Enter username" name="userName" path="userName" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="mb-3">
				<label for="email" class="form-label" style="color:white;">Email:</label> <sf:input
					type="email" class="form-control" 
					placeholder="Enter username" name="email" path="email" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label" style="color:white;">Password:</label> <sf:input
					type="password" class="form-control" id="password"
					placeholder="Enter password" name="password" path="password" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>

			<input type="submit" value="Register"
				class="btn btn-primary" />
		</sf:form>

		<div style="margin: 80px;"></div>
		</div>
		</div>

	</div>





	<%@ include file="footer.jsp"%>

</body>
</html>
