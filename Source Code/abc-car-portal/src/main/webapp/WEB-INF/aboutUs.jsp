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
	
	<div class="container my-3" style="width: 800px;padding: 50px;background: url(images/about-bg.jpg)">
	
		 <div class="row">
		    <div class="col">
		      <img alt="" src="images/about.jpg" width="400px" height="600px">
		    </div>
		    
		    <div class="col" style="padding: 130px 0 0 50px">
		    
			<div class="col-15">
			<h2 style="text-align: center;">About ABC Car Portal</h2>
			<br>
			<p style="color: white; text-align: justify;">We provide user with a range of local used cars in Malaysia
				listed at an affordable and negotiable price. User are also able to
				post their unused car for sale online to effectively reach out to
				potential buyer.</p>
			<br>
		</div>
	</div>
	</div>
	</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
