<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD NEW ITEM</title>
</head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 mx-auto form p-4">
				<h1 class="display-4 py-2 text-center">INPUT VALUE</h1>
				<div class="px-2">
					<form:form method="post" modelAttribute="ITEM"
						action="/SpringHibernate/customer/saveOrUpdate">
						<form:hidden path="id" />
						<!-- Email input -->
						<div class="form-outline mb-4">
							<label class="form-label" for="form2Example1">First name</label>
							<form:input type="text" path="firstName" id="form2Example1"
								class="form-control" required="required" />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="form2Example1">Last name</label>
							<form:input type="text" path="lastName" id="form2Example1"
								class="form-control" required="required" />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="form2Example1">Email</label>
							<form:input type="email" path="email" id="form2Example1"
								class="form-control" required="required" />
						</div>
						<div class="form-check">
							<label class="form-check-label" for="flexRadioDefault1">Deleted
							</label>
							<form:radiobutton class="form-check-input" value="true"
								path="deleted" />
						</div>
						<div class="form-check">
							<label class="form-check-label" for="flexRadioDefault2">
								Not delete </label>
							<form:radiobutton class="form-check-input" value="false"
								path="deleted" checked="checked" />
						</div>
						<div class="form-group">
							<!-- Button -->
							<div class="form-outline mb-4">
								<form:button class="btn btn-primary">Submit</form:button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>