<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Show</title>
</head>
<body>
	<div class="container d "> 
		<div class="d-flex bd-highlight mb-3">
	  			<div class="p-2 bd-highlight text text-primary" ><h1 class="text text-primary">  Expense Details</h1></div>
	  
	  			<div class="ms-auto p-2 bd-highlight"><a href="/">Go back</a></div>
	</div>
	
	<p> Expense Name:  <c:out value="${allSaveTravels.expenseName}"/></p>
	<p> Description: <c:out value="${allSaveTravels.description}"/></p>
	<p> Vendor:  <c:out value="${allSaveTravels.vendor}"/></p>
	<p>  Amount Spent: $<c:out value="${allSaveTravels.amount}"/></p>
	
	</div>
	
</body>
</html>