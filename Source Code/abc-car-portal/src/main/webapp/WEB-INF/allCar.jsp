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
	
	<div id="main">
		<div id="header">
			<div class="row-3">
				<div class="inside">
					<h2>
						Car Management
					</h2>
			
				</div>
			</div>
			<div class="extra">
				<img src="images/header-img.png" alt="" />
			</div>
		</div>
		<div id="content">
			<ul class="box-list">
			</ul>
		</div>

	<section>

	<div class="container">
		<h3 style="margin-bottom: 20px;">Car Management</h3>

		<div class="row" style="width: max-content;">
			<div class="col-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">Name</th>
							<th scope="col">Model</th>
							<th scope="col">Price (RM)</th>
							<th scope="col">Seller</th>
							<th scope="col">Action</th>
							<th scope="col">Sell Car?</th>
							<th scope="col">Current Bid (RM)</th>
							<th scope="col">Booking Date</th>
							<th scope="col">Approve Booking?</th>
							<th scope="col">Bidder Name</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cars}" var="c" varStatus="status">
							<tr>
								<th scope="row">${status.count}</th>
								<td>${c.name}</td>
								<td>${c.model}</td>
								<td>${c.price}</td>
								<td><a type="button" class="btn btn-primary"
									href="/view?uid=${c.sellerId}"> <i class="far fa-eye"></i>
								</a></td>
								<td><a type="button" class="btn btn-primary"
									href="/car_detail?cid=${c.id}"> <i class="far fa-eye"></i>
								</a> <!-- Button trigger modal -->
									<button type="button" class="btn btn-success"
										data-bs-toggle="modal"
										data-bs-target="#exampleModal${status.index}">
										<i class="fas fa-edit"></i>
									</button> <!-- Modal -->

									<div class="modal fade" id="exampleModal${status.index}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Edit
														Car Post</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- Car Post Form -->
													<sf:form action="/edit_car?cid=${c.id}" method="post"
														class="was-validated" modelAttribute="car"
														enctype="multipart/form-data">
														<div class="mb-3 mt-3">
															<label for="name" class="d-flex form-label">Name:</label>
															<input type="text" class="form-control"
																placeholder="Enter car name" name="name" path="name"
																required="true" value="${c.name}" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="model" class="d-flex form-label">Model:</label>
															<input type="text" class="form-control"
																placeholder="Enter model" name="model" path="model"
																value="${c.model}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="price" class="d-flex form-label">Price
																(RM):</label> <input type="text" class="form-control" id="price"
																placeholder="Enter car price" name="price" path="price"
																value="${c.price}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="make" class="d-flex form-label">Make
																Year:</label> <input type="text" class="form-control"
																placeholder="Enter make year" name="make" path="make"
																value="${c.make}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="registeration" class="d-flex form-label">Registration
																Date:</label> <input type="text" class="form-control"
																id="registeration"
																placeholder="Enter registeration date"
																name="registeration" path="registeration"
																value="${c.registeration}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<!-- <div class="mb-3">
															<label class="d-flex form-label">Photo:</label> <input
																type="file" class="form-control" name="fileImage"
																id="photo" accept="image/png, image/jpeg"
																required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>-->

														<input type="hidden" name="sellerId" value="${c.sellerId}" />
														<input type="hidden" name="photos" value="${c.photos}" />
														<input type="hidden" name="photoImagePath"
															value="${c.photoImagePath}" />

														<div class="holder"
															style="height: 300px; width: 300px; margin: auto;">
															<img id="imgPreview" src="${c.photoImagePath}"
																alt="image preview" style="width: inherit;" />
														</div>

														<button type="submit" class="btn btn-primary d-flex">Edit</button>
													</sf:form>
													<script>
						            $(document).ready(() => {
						            	
						                $("#photo").change(function () {
						                    const file = this.files[0];
						                    if (file) {
						                        let reader = new FileReader();
						                        reader.onload = function (event) {
						                            $("#imgPreview")
						                              .attr("src", event.target.result);
						                        };
						                        reader.readAsDataURL(file);
						                    }
						                });
						            });
						        </script>
													<!-- Car Post Form -->
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Close</button>

												</div>
											</div>
										</div>

									</div> <a type="button" class="btn btn-danger"
									href="/delete_car?cid=${c.id}"> <i class="far fa-trash-alt"></i>
								</a></td>


								<!-- selling modal -->
								<td>${c.sellStatus}<!-- Button trigger modal -->
									<button type="button" class="btn" data-bs-toggle="modal"
										data-bs-target="#exampleModal2${status.index}">
										<i class="fas fa-edit fa-sm"></i>
									</button> <!-- Modal -->

									<div class="modal fade" id="exampleModal2${status.index}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModal2Label">Set
														Car Sale Status</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- Sale Status Form -->
													<sf:form action="/sale_status?cid=${c.id}" method="post"
														class="was-validated" modelAttribute="biddings">
														<div class="mb-3 mt-3">
															<label for="sellStatus" class="form-label">Sale
																Status:</label> <input type="text" class="form-control"
																placeholder="Enter sale status" name="sellStatus"
																value="${c.sellStatus}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>

														<button type="submit" class="btn btn-primary">Set</button>
													</sf:form>
												</div>
											</div>
										</div>
									</div>

								</td>
								<!-- selling modal -->
								<c:forEach items="${c.biddings}" var="b" begin="0" end="0">

									<td>${b.bidderPrice}</td>
									<td>${b.bookDate}</td>
									<!-- booking modal -->
									<td>${b.bookStatus}<!-- Button trigger modal -->
										<button type="button" class="btn" data-bs-toggle="modal"
											data-bs-target="#exampleModal1${status.index}">
											<i class="fas fa-edit fa-sm"></i>
										</button> <!-- Modal -->

										<div class="modal fade" id="exampleModal1${status.index}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true" role="dialog">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModal1Label">Set
															Booking Status</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">

														<!-- Booking Status Form -->
														<sf:form action="/booking_status?bid=${b.id}"
															method="post" class="was-validated" modelAttribute="book">
															<div class="mb-3 mt-3">
																<label for="bookStatus" class="form-label">Booking
																	Status:</label> <input type="text" class="form-control"
																	placeholder="Enter booking status" name="bookStatus"
																	value="${b.bookStatus}" required="true" />
																<div class="valid-feedback">Valid.</div>
																<div class="invalid-feedback">Please fill out this
																	field.</div>
															</div>

															<button type="submit" class="btn btn-primary">Set</button>
														</sf:form>
													</div>
												</div>
											</div>
										</div> <!-- booking modal -->
									</td>
									<td>${b.bidderName}</td>

								</c:forEach>

							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


	</div>
	</section>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>