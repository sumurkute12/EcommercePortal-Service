<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Page Not Found</title>
<link rel="stylesheet" href="./notfound.css" />

</head>
<body class="background"  onload="fillPage()">

	<div class="content">
	<div>
	<img src="https://i.pinimg.com/originals/bf/d5/9b/bfd59b9ae67716222ac0c06d35cf21a6.gif" alt="">
	</div>
			<br>
			<c:set var="error" value="${errorDto}" />
			<br>
		<div id="message">Messaage : ${error.message}</div>
		<div id="status">Status : ${error.status}</div>
		<div id="path"></div>
	</div>
	
</body>
<script type="text/javascript">
	<c:set var="error" value="${errorDto}"/>
	var errorStr='${error.message}';
	function fillPage()
	{
		//alert(typeof(errorStr));
		var str=errorStr.substring(7,errorStr.length-1);
		//alert(str);
		var error=JSON.parse(str);
		document.getElementById("message").innerHTML='Message : '+error.message;
		document.getElementById("status").innerHTML='Status : '+error.status;
		
	}
	 window.onload = fillPage;
</script>
</html>
