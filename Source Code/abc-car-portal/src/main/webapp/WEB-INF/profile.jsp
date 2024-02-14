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

	<section> <c:forEach items="${user}" var="u">
		<c:set var="id" value="${u.id}"></c:set>
		<c:set var="name" value="${u.name}"></c:set>
		<c:set var="uname" value="${u.userName}"></c:set>
		<c:set var="email" value="${u.email}"></c:set>
		<c:set var="mobile" value="${u.mobile}"></c:set>
		<c:set var="address" value="${u.address}"></c:set>
	</c:forEach>
	<div class="container">

		<div class="row">
			<h3 style="margin-bottom: 20px;">
				User Profile
				<!-- Button trigger modal -->
				<button type="button" class="btn" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<i class="fas fa-edit fa-sm"></i>
				</button>
			</h3>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Update User</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<!-- User Update Form -->
							<sf:form action="update" method="post" class="was-validated"
								modelAttribute="user">
								<div class="mb-3 mt-3">
									<label for="name" class="form-label">Name:</label> <input
										type="text" class="form-control" placeholder="Enter name"
										name="name" path="name" value="${name}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="userName" class="form-label">Username:</label> <input
										type="text" class="form-control" id="userName"
										placeholder="Enter username" name="userName" path="userName"
										value="${uname}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="email" class="form-label">Email:</label> <input
										type="email" class="form-control" placeholder="Enter username"
										name="email" path="email" value="${email}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="mobile" class="form-label">Mobile:</label> <input
										type="text" class="form-control" id="mobile"
										placeholder="Enter mobile" name="mobile" path="mobile"
										value="${mobile}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="address" class="form-label">Address:</label> <input
										type="text" class="form-control" id="address"
										placeholder="Enter address" name="address" path="address"
										value="${address}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>

								<button type="submit" class="btn btn-primary">Update</button>
							</sf:form>
							<!-- User Update Form -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>

						</div>
					</div>
				</div>

			</div>

		</div>

		<div class="row">

			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-body text-center" style="height: 284px;">
						<img src="/images/img_avatar3.png" alt="avatar"
							class="rounded-circle img-fluid" style="width: 150px;">
						<h5 class="my-3">${name}</h5>
						<p class="text-muted mb-1">${address}</p>

					</div>
				</div>

			</div>
			<div class="col-lg-8">
				<div class="card mb-4">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Full Name</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${name}</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Email</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${email}</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Username</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${uname}</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Mobile</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${mobile}</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Address</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${address}</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>



		<div class="row p-3">
			<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button class="nav-link active" id="nav-home-tab"
					data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
					role="tab" aria-controls="nav-home" aria-selected="true">Post
					Status</button>
				<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
					data-bs-target="#nav-profile" type="button" role="tab"
					aria-controls="nav-profile" aria-selected="false">Booking
					Status</button>

			</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">
					<c:if test="${not empty cars}">
						<div class="container">
							<div class="row">
								<div class="col-12">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th scope="col">Post</th>
												<th scope="col">Car</th>
												<th scope="col">Post Date</th>
												<th scope="col">Action</th>
												<th scope="col">Current Bid (RM)</th>
												<th scope="col">Bidder Name</th>
												<th scope="col">Sale status</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cars}" var="c" varStatus="status">
												<tr>
													<th scope="row">${status.count}</th>
													<td>${c.name}</td>
													<td>${c.postDate}</td>
													<td>
														<!-- view car --> <a type="button" class="btn btn-primary"
														href="/car_detail?cid=${c.id}"> <i class="far fa-eye"></i>
													</a> <!-- view car --> <!-- edit car --> <!-- <button type="button" class="btn btn-success">
														<i class="fas fa-edit"></i>
													</button> --> <!-- edit car --> <!-- delete car --> <a
														type="button" class="btn btn-danger"
														href="/deletecar?cid=${c.id}"> <i
															class="far fa-trash-alt"></i>
													</a> <!-- delete car -->
													</td>
													<c:forEach items="${c.biddings}" var="b" begin="0" end="0">
														<c:set var="bidPrice" value="${b.bidderPrice}"></c:set>
														<c:if test="${bidPrice > 0}">
															<td>${b.bidderPrice}</td>
															<td>${b.bidderName}</td>

														</c:if>
														<td>${c.sellStatus}</td>
													</c:forEach>

												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>

							<!-- end of row -->
						</div>
					</c:if>
				</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">
					<c:if test="${not empty cars}">
						<div class="container">
							<div class="row">
								<div class="col-12">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">Car</th>
												<th scope="col">Book Date</th>
												<th scope="col">Book By</th>
												<th scope="col">Book Status</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cars}" var="c" varStatus="status">
												<c:forEach items="${c.biddings}" var="b">
													<c:set var="bookDate" value="${b.bookDate}"></c:set>
													<c:if test="${bookDate != null}">
														<tr>
															<th scope="row">${status.count}</th>
															<td>${c.name}</td>
															<td>${b.bookDate}</td>
															<td>${b.bidderName}</td>
															<td>${b.bookStatus}</td>
														</tr>
													</c:if>
												</c:forEach>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</c:if>

					<c:if test="${empty cars}">
						<div class="container">
							<div class="row">
								<div class="col-12">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">Book Date</th>
												<th scope="col">Car</th>
												<th scope="col">Book Status</th>
												<th scope="col">View Car</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${bids}" var="b" varStatus="status">
												<c:set var="bookDate" value="${b.bookDate}"></c:set>
												<c:if test="${bookDate != null}">
													<tr>
														<th scope="row">${status.count}</th>
														<td>${b.bookDate}</td>
														<td>${b.car.name}</td>
														<td>${b.bookStatus}</td>
														<td>
															<!-- view car --> <a type="button"
															class="btn btn-primary" href="/car_detail?cid=${b.car.id}">
																<i class="far fa-eye"></i>
														</a> <!-- view car -->
														</td>
													</tr>
												</c:if>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</c:if>


				</div>

			</div>
		</div>
	</div>
	</section>


	<%@ include file="footer.jsp"%>
</body>
</html>