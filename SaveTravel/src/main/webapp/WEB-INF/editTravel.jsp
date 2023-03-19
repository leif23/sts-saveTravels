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
<meta charset="ISO-8859-1"><link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->

<title>Edit Expenses</title>
</head>
<body>
	<div class="container">
		<div class="d-flex bd-highlight mb-3">
	  			<div class="p-2 bd-highlight text-primary"><h1> Edit Expense</h1></div>
	  
	  			<div class="ms-auto p-2 bd-highlight"><a href="/">Go back</a></div>
	</div>

		<form:form action="/edit/expense/${allSaveTravels.id}" method="put" modelAttribute="travels">
			<input type="hidden" name="_method" value="put "/>
			<div>
				<form:label path="expenseName"> Expense Name:</form:label>
				<form:input path="expenseName"  value="${allSaveTravels.expenseName}"/>
				<form:errors path="expenseName" class="text-danger"/>
			</div>
			<div> 
				<form:label path="Vendor"> Vendor:</form:label>
				<form:input path="Vendor"  value="${allSaveTravels.vendor}"/>
				<form:errors path="Vendor" class="text-danger"/>
			</div>
				<div>
				<form:label path="Amount"> Amount:</form:label>
				<form:input type="number"    path="Amount"  value="${allSaveTravels.amount}"/>
				<form:errors path="Amount" class="text-danger"/>
			</div>
			<div>
				<form:label path="Description">Description:</form:label>
				<form:textarea value="${allSaveTravels.description}" path="Description" width="250px" />
				<form:errors path="Description"  class=" text-danger" /> 
			</div>
			<button type="submit"> Submit</button>
		
		</form:form>
</div>
</body>
</html>