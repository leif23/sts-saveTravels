<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->

<meta charset="ISO-8859-1">
<title>DashBoard</title>
</head>
<body>

	<div class ="container">
		 <div>
		 <h1 class="text text-primary"> Save Travels</h1>
		 	<table class="table table-striped table-hover">
				<thead class="table-dark">
						<tr>
						<td>Expense</td>
						<td>Vendor</td>
						<td> Amount</td>
						<td>Action</td>
					</tr>
				</thead>
				<tbody>
				
	<!-- loop through  table travels  -->
			<c:forEach var="travelList" items="${allSaveTravel}">
						<tr>
							<td> <a href="/show/${travelList.id}"> <c:out value="${travelList.expenseName}"/> </a></td>
							<td><c:out value="${travelList.vendor}"/> </td>
							<td> <p>$<c:out value="${travelList.amount}"/> </p></td>
							<td> <a href ="/edit/${travelList.id}">Edit</a> <a  href="/delete/${travelList.id}"class="btn btn-danger">Delete</a></td>
								
						</tr>
			</c:forEach>
					<!-- end here -->
				</tbody>
				
			</table>
		</div>
		<div>
		<h1> Add an expense</h1>
		<form:form action="/create/expense" method="post" modelAttribute="travels">
			<div>
				<form:label path="expenseName"> Expense Name:</form:label>
				<form:input path="expenseName" />
				<form:errors path="expenseName" class="text-danger"/>
			</div>
			<div> 
				<form:label path="Vendor"> Vendor:</form:label>
				<form:input path="Vendor" />
				<form:errors path="Vendor"  class="text-danger"/>
			</div>
				<div>
				<form:label path="Amount"> Amount:</form:label>
				<form:input type="number"  path="Amount" /><br/>
				<form:errors path="Amount" class="text-danger"/>
			</div>
			<div>
				<form:label path="Description">Description:</form:label>
				<form:textarea path="Description" width="250px"/>
				<form:errors path="Description"  class="text-danger" /> 
			</div>
			<button type="submit"> Submit</button>
		
		</form:form>
						
		</div>
		
	</div>
</body>
</html>

