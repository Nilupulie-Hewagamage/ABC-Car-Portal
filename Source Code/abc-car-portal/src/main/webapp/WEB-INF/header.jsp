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


<!-- Navbar -->
<div class="my-4" style="margin-bottom: 0px;">
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
		<div class="container-fluid">
			<a href="cars" class="navbar-brand" data-toggle="tooltip"
				data-placement="top" title="Home"> <img
				src="/images/car-logo.png" height="70" width="80px">
			</a>
			<button type="button" class="navbar-toggler"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">


				<sec:authorize access="!isAuthenticated()">
					<div class="navbar-nav">

						<a href="register_user" class="nav-item nav-link" style="color: MidnightBlue; font-weight: normal;">Register</a> <a
							href="about_us" class="nav-item nav-link" style="color: MidnightBlue;">About Us</a> <a
							href="contact_us" class="nav-item nav-link" style="color: MidnightBlue;">Contact Us</a>
					</div>
					<div class="navbar-nav ms-auto">
						<a href="login" class="nav-item nav-link" style="color: MidnightBlue;">Login</a>
					</div>
				</sec:authorize>


				<sec:authorize access="isAuthenticated()">

					<sec:authorize access="hasRole('Administrator')">
						<div class="navbar-nav">
							<a class="nav-item nav-link" href="cars" style="color: MidnightBlue;">Home</a> <a
								class="nav-item nav-link" href="all_cars" style="color: MidnightBlue;">Car <br> Management</a> <a
								class="nav-item nav-link" href="users" style="color: MidnightBlue;">User <br> Management </a>
						</div>

					</sec:authorize>

					<sec:authorize access="hasAnyRole('Administrator','Users')">

						<div class="navbar-nav px-5" style="width: 70%;">
							<sf:form action="search" method="get" style="width: 80%;">
								<div class="input-group">
									<input type="search" class="form-control rounded"
										placeholder="Search" aria-label="Search" name="keyword"
										aria-describedby="search-addon" />
									<button type="submit" class="btn btn-outline-primary" style="color: MidnightBlue;">search</button>
								</div>
							</sf:form>
						</div>

						<!-- /logout must be a POST request, as csrf is enabled.
			        This ensures that log out requires a CSRF token and that a malicious user cannot forcibly log out your users.-->
						<div class="navbar-nav ms-auto">

							<a class="nav-item nav-link p-3" href="profile" style="color: MidnightBlue;">Profile</a>

							<form action="logout" method="post" style="padding: 7px;">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="submit" name="Logout"
									value="Logout" class="btn btn-primary"></input>
							</form>
						</div>

					</sec:authorize>

				</sec:authorize>

			</div>
		</div>
	</nav>
	
</div>