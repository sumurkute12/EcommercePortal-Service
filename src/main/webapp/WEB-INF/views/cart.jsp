<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="./style.css" />

<body class="otherPageBody">
	<!-- navbar for the pages -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/index">RetailProductManagement</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<a href="/getWishlist">
				<button class="btn btn-outline-danger my-2 mx-5 my-sm-0"
					type="submit">
					<i style="font-size: 20px" class="fa">WishList</i>
				</button>
			</a> </a>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<c:set var="totalPrice" value="${0}" />
			<c:set var="delivery" value="${0}" />
			<c:forEach var="item" items="${cartList}">
				<c:set var="totalPrice"
					value="${totalPrice+(item.product.price*item.quantity)}" />
				<c:set var="delivery"
					value="${delivery+(item.vendor.deliveryCharge*item.quantity)}" />
				<!-- add a single item fech from database  -->
				<div class="col-sm">
					<div class="card my-4 color" style="width: 18rem">
						<img src="${item.product.imageName}"
							class="card-img-top img-height" alt="..." />
						<div class="card-body">
							<h5 class="card-title">${item.product.name}</h5>
							<p class="card-text">${item.product.description}</p>

							<h5 class="price">
								<strong>Price :${item.product.price}</strong>
							</h5>
							<h5 id="price">
								Rating : ${item.product.rating} <i style="font-size: 15px"
									class="fa">&#xf005;</i>
							</h5>
							<div class="form-group edit-rating">
								<div class="right">
									<h5>
										Quantity:<span class="" value="${item.quantity}">${item.quantity}</span>
									</h5>
								</div>
							</div>
							<div>
								<span id="zipCode">Delivering to ZipCode:${item.zipCode}
								</span> <br> <span id="expectedDeliveryDate">Expected
									Delivery Date:${item.deliveryDate} </span>
							</div>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<c:set var="error" value="${errorMessage}" />
	<c:set var="errorHead" value="${errorHead}" />

	<div class="errorDiv">
		<div class="alert">
			<strong>${errorHead}</strong><br>${error}</div>
	</div>

	<div class="table">
		<table id="example" style="width: 100%">
			<thead>
				<tr>
					<th id="price">Price</th>
					<th id="delivery">Delivery Charge</th>
					<th id="total">Total</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${totalPrice}</td>
					<td>${delivery}</td>
					<td>${totalPrice+delivery}</td>
				</tr>
			</tbody>
			<tfoot>

			</tfoot>
		</table>
	</div>

	<!-- close the loop  -->

	
	<!-- footer -->
     <div  style="padding: 2%;background-color: #212529;">
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

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>

	
</body>

</html>
