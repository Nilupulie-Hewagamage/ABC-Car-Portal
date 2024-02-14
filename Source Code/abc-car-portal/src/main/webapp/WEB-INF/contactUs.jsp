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
	
	<div class="container my-3" style="width: 800px;padding: 50px;background: url(images/contact-bg.jpg)">
	
		 <div class="row">
		    <div class="col">
		      <img alt="" src="images/contact.jpg" width="400px" height="600px">
		    </div>
		    
		    <div class="col" style="padding: 130px 0 0 50px">
		    
			<div class="col-15">
			<h2>Contact Us</h2>
			<p style="color: white;">Contact us and we'll get back to you within 24 hours.</p>
			<p style="color: white;">
				<span class="glyphicon glyphicon-map-marker"></span> <i class="fas fa-home me-3"></i>  Malaysia, MY 10012, MY
			</p>
			<p style="color: white;">
				<span class="glyphicon glyphicon-phone"></span> <i class="fas fa-phone me-3"></i> + 01 234 567 88
			</p>
			<p style="color: white;">
				<span class="glyphicon glyphicon-envelope"></span> <i class="fas fa-envelope me-3"></i>
				contact@abccar.com
			</p>
		</div>
	</div>
	</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
