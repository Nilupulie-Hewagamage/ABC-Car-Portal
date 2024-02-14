<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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


	<div class="container my-3" style="width: 800px;padding: 50px;background: url(images/login-bg.jpg)">
	
		 <div class="row">
		    <div class="col">
		      <img alt="" src="images/register.jpg" width="400px" height="600px">
		    </div>
		    <div class="col" style="padding: 130px 0 0 50px">
		      <c:if test="${error_string != null}">

			<div class="alert alert-danger">${error_string} Click here to <a href="register_user">
			Register</a></div>

		</c:if>
		<h3 style="color:white;">Sign In</h3>

		<c:url var="post_url" value="/login" />
		<form action="${post_url}" method="post" class="was-validated">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

			<div class="mb-3 mt-3">
				<label for="username" class="form-label" style="color:white;">Username:</label> <input
					type="text" class="form-control" id="userName"
					placeholder="Enter username" name="username" value="" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label" style="color:white;">Password:</label> <input
					type="password" class="form-control" id="password"
					placeholder="Enter password" name="password" value="" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>

			<input type="submit" name="Login" value="Sign In"
				class="btn btn-primary"></input>
		</form>

		<p style="color:white;">New User? Click here to <a href="register_user" >Register</a></p>
		<div style="margin: 80px;"></div>
		    </div>
 		</div>

		

	</div>





	<%@ include file="footer.jsp"%>

</body>
</html>
