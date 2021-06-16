<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Retail Products</title>
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/style.css" />
<body class="img-background">
	<!-- navbar for the pages -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/login">RetailProductManagement</a>
	</nav>
	<!-- login form for the user -->
	<div class="center" style="background-color:transparent">
		<form:form method="post" action="/authenticate" modelAttribute="login">
			<div class="text-danger">${error}</div>
			<div class="form-group">
				<form:label class="text-white" path="username">User Name</form:label>
				<form:input type="text" class="form-control" path="username" />
				
			</div>
			<div class="form-group">
				<form:label class="text-white " path="password">Password </form:label>
				<form:input type="password" class="form-control" id="password"
					path="password" />
			</div>
			<div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form:form>
	</div>
		
	<!-- footer -->
     <div  style="padding: 2%;background-color: #212529;margin-top:8%">
        <div class="container">
            <div class="row">
                <div class="col-md-3 topmargin" >                                        
                    <h5 class="card-title text-white"><i class="fa fa-home fa-fw" aria-hidden="true"></i>&nbsp;RPMS</h5>
                    <div class="text-muted" style="color:whitesmoke;text-decoration:none;">
                    1355 Market St, Suite 900<br>
                    San Francisco, CA 94103<br>
                    P: (123) 456-7890 <br>
                    xyz@gmail.com
                    </div>                   
                </div>
                <div class=" col-md-2 topmargin" >                      
                   <h5 class="card-title text-white"><i class="fa fa-building fa-fw" aria-hidden="true"></i>&nbsp;Products</h5>
                    <div class="text-muted" style="color:whitesmoke;text-decoration:none;">
                    Top Selling<br>
                    Latest<br>
                    </div>           
                </div>
                <div class=" col-md-2 topmargin" >
                    <h5 class="card-title text-white"><i class="fa fa-link fa-fw" aria-hidden="true"></i>&nbsp;Links</h5>
                    <div class="text-muted" style="color:whitesmoke;text-decoration:none;">
                    Who We Are<br>
                    Contact<br>
                    </div>   
                </div>
                <div class=" col-md-4 topmargin" >
                    <h5 class="card-title text-white"><i class="fa fa-newspaper fa-fw" aria-hidden="true"></i>&nbsp;Latest News</h5>
                    <div class="text-muted" style="color:whitesmoke;text-decoration:none;">
                        If you have any suggestions for the next updates, let us know.<br>
                        If you have any suggestions for the next updates, let us know.<br>
                    </div>            
               
                </div>
            </div>
            <br>
            <hr style="background-color:#777;">
            <p class="text-muted">© Copyright 2020. All Rights Reserved.</p>
        </div>
    </div>   
<!-- Footer Bar Ends Here -->
</body>
</html>
