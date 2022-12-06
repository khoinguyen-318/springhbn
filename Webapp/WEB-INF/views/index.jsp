<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
	<nav class="navbar bg-light">
		<div class="container-fluid">
			<a class="navbar-brand">Welcome <b><c:out
						value="${pageContext.request.remoteUser}" /></b></a>
			<form class="navbar-brand"
				action="<%=request.getContextPath()%>/logout" method="POST">
				<input class="form-control" type="submit" value="Logout" /> <input
					type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<form method="get" class="d-flex" role="search" action="<c:url value="/customer/" />">
				<input class="form-control me-2" name="q" type="text" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<section class="intro">
		<div class="bg-image h-100"
			style="background-image: url('<c:url value="/resources/background.jpg')" />;">
			<div class="mask d-flex align-items-center h-100"
				style="background-color: rgba(0, 0, 0, .25);">
				<div class="container">
					<a href="<c:url value="/customer/addForm" />" type="button"
						class="btn btn-warning">ADD NEW</a> <br>
					<div class="row justify-content-center">
						<div class="col-12">
							<div class="card bg-dark shadow-2-strong">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-dark table-borderless mb-0">
											<thead>
												<tr>
													<th scope="col">FIRST-NAME</th>
													<th scope="col">LAST-NAME</th>
													<th scope="col">EMAIL</th>
													<th scope="col">DELETED</th>
													<th scope="col">ACTION</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="temp" items="${LIST}">
													<!-- construct an "update" link with customer id -->
													<c:url var="updateLink" value="/customer/updateForm">
														<c:param name="id" value="${temp.id}" />
													</c:url>

													<!-- construct an "delete" link with customer id -->
													<c:url var="deleteLink" value="/customer/delete">
														<c:param name="id" value="${temp.id}" />
													</c:url>
													<tr>
														<td>${temp.firstName}</td>
														<td>${temp.lastName}</td>
														<td>${temp.email}</td>
														<td>${temp.deleted ? 'DELETE' : 'NOT DELETE'}</td>
														<td>
															<!-- display the update link --> <a href="${updateLink}">Update</a>
															| <a href="${deleteLink}"
															onclick="if (!(confirm('Are you sure you want to delete this?'))) return false">Delete</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>