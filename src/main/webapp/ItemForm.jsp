<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Item Form</title>
<style>
body {
	display: flex;
	background: linear-gradient(180deg, rgba(2, 0, 36, 1) 0%,
		rgba(9, 121, 101, 1) 35%, rgba(0, 212, 255, 1) 100%);
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

body::before{
	content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
	background-image:url("https://img.freepik.com/free-photo/top-view-cooked-italian-pasta-with-meat-different-seasonings-dark-blue-surface_140725-61957.jpg?t=st=1718822521~exp=1718826121~hmac=40833f32fa3b8d8db30211b4527b02b84920aa68538b906c129ee8ffc6a83052&w=1060");
	background-size:cover;
	background-position:center;
	opacity: 0.6;
	z-index: -1;
}

.main {
	width: 320px;
	height: 370px;
	background: linear-gradient(45deg, rgba(0, 212, 255, 1) 0%,
		rgba(9, 121, 101, 1) 100%);
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease-in-out;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	opacity: 0.9;
}

input {
	border: 2px solid black;
	text-decoration: none;
	text-align: center;
	display: block;
	font-size: 20px;
	margin: 0px;
	padding: 7px;
	width: 218px;
	border-radius: 8px;
	background-color: white;
	color: rgb(43, 10, 10);
}

#btn {
	background: linear-gradient(to right, #11998e, #38ef7d);
	width: 158px;
	margin-left: 17%;
	margin-top: 10px;
	white: white;
}

h1 {
	font-weight: bold;
	margin-top: -2px;
	margin-bottom: 20px;
	color: white;
}

h1:hover {
	color: #f52a07;
}

.header {
	background: linear-gradient(90deg, rgba(2, 0, 36, 1) 0%,
		rgba(9, 121, 101, 1) 35%, rgba(0, 212, 255, 1) 100%);
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: fixed;
	width: 100%;
	top: 0;
	z-index: 1000;
	opacity: 0.8;
}

.header .logo {
	font-size: 24px;
	font-weight: bold;
	color: white;
	transition: color 0.3s ease-in-out;
	text-decoration: none;
}

.header .logo:hover {
	color: #ff7e5f;
}

.header .menu {
	list-style: none;
	display: flex;
	margin: 0;
	padding: 0;
	margin-right: 30px;
}

.header .menu li {
	margin-left: 20px;
}

.header .menu li a {
	text-decoration: none;
	color: white;
	font-size: 16px;
}

.header .menu li a:hover {
	text-decoration: underline;
}

.footer {
	background: linear-gradient(180deg, rgba(0, 212, 255, 1) 0%,
		rgba(9, 121, 101, 1) 35%, rgba(2, 0, 36, 1) 100%);
	color: white;
	padding: 10px;
	text-align: center;
	position: fixed;
	width: 100%;
	bottom: 0;
	opacity: 0.9;
}

.footer a {
	color: white;
	text-decoration: none;
}

.footer a:hover {
	text-decoration: underline;
}

.quantity-controls {
	display: flex;
	align-items: center;
	justify-content: center;
}

.quantity-controls button {
	padding: 5px;
	margin: 0 5px;
	border: none;
	background-color: #34C759;
	color: white;
	cursor: pointer;
	font-size: 16px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.quantity-controls button:hover {
	background-color: #2D7F3A;
}

.quantity-controls input {
	width: 50px;
	text-align: center;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 5px;
	font-size: 16px;
}

#btn {
	background: linear-gradient(to right, #11998e, #38ef7d);
	width: 158px;
	margin-left: 17%;
	margin-top: 10px;
	color: white;
}

#btn:hover {
	color: #f52a07;
	background: linear-gradient(to right, #09f544, #b5b759);
	cursor: pointer;
}

</style>
<script>
	function increaseQuantity(itemId) {
		var quantityInput = document.getElementById('quantity-' + itemId);
		var currentValue = parseInt(quantityInput.value);
		quantityInput.value = currentValue + 1;
	}

	function decreaseQuantity(itemId) {
		var quantityInput = document.getElementById('quantity-' + itemId);
		var currentValue = parseInt(quantityInput.value);
		if (currentValue > 1) {
			quantityInput.value = currentValue - 1;
		}
	}
</script>
</head>
<body>
	<div class="header">
		<div class="logo">MyFood</div>
		<ul class="menu">
			<li><a href="CustomerOptions.jsp">home</a></li>
			<li><a href="customerlogout">Logout</a></li>
		</ul>
	</div>
	<div class="main">
		<h1>Select Quantity</h1>
		<form:form action="saveItemToOrder" modelAttribute="itemobj">
		Name: <form:input path="name" readonly="true" />
		Type: <form:input path="type" readonly="true" />
		Cost: <form:input path="cost" readonly="true" />
		Quantity:  <div class="quantity-controls">
				<button type="button" onclick="decreaseQuantity('food')">-</button>
				<form:input path="quantity" type="text" id="quantity-food" value="1"
					readonly="readonly" />
				<button type="button" onclick="increaseQuantity('food')">+</button>
			</div>
			<input type="submit" id="btn">
		</form:form>
	</div>
	<div class="footer">
		<p>
			<a href="help">Help</a> | <a href="contact">Contact Us</a>| <a
				href="mailto:admin@myfood.com">Email</a>|Address: 24 Nayapali,
			Bhubaneswar
		</p>
	</div>
</body>
</html>