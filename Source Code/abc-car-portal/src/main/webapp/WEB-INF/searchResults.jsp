<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


	<div class="container">


		<c:if test="${empty searchCar}">

			<div class="alert alert-danger">No search results found for
			${keyword}</div>

		</c:if>
		<!-- list of all cars posted -->
		<div class="row" style="gap: 60px;">

			<c:forEach items="${searchCar}" var="c">

				<div class="card" style="width: 400px">
					<img class="card-img-top" src="${c.photoImagePath}"
						alt="${c.photos}" style="width: 100%">
					<div class="card-body">
						<h4 class="card-title">${c.name}</h4>
						<p class="card-text">
							<i class="fas fa-tags"></i>&nbsp;RM ${c.price}
						</p>

						<!--<a href="#" class="btn"
							style="background-color: red; margin-right: 40px;">Book a
							Test Drive</a>-->
						<a href="/car_detail?cid=${c.id}" class="btn btn-primary">View
							Car Details</a>
					</div>
				</div>
			</c:forEach>

		</div>
		<!-- list of all cars posted -->
	</div>



	<%@ include file="footer.jsp"%>
</body>
</html>