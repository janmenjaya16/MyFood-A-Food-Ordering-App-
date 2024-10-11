<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Discount Update</title>
<style >
body {
	display: flex;
	background: rgb(238,174,202);
	background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

body::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image:
		url("https://img.freepik.com/free-photo/delicious-cupcakes-vinyl_23-2147609654.jpg?t=st=1718909902~exp=1718913502~hmac=5b63676a3d9c1dada6356714cdfbd139d29347da8c3fde9920e3c87b01a119b4&w=1060");
	background-size: cover;
	background-position: center;
	opacity: 0.6;
	z-index: -1;
}

form {
	padding: 30px;
	background-color: rgb(23, 177, 147);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	border-radius: 8px;
	transition: background-color 0.6s;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	opacity: 0.9;
}

input[type="number"] {
	border: 2px solid black;
	text-decoration: none;
	text-align: center;
	display: block;
	font-size: 20px;
	margin: 5px;
	padding: 7px;
	width: 250px;
	border-radius: 8px;
	background-color: white;
	color: rgb(43, 10, 10);
}

input[type="submit"] {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background: linear-gradient(to right, #11998e, #38ef7d);
	color: white;
	cursor: pointer;
	font-size: 16px;
	display: block;
	margin: 0 auto;
}

input[type="submit"]:hover {
	background: linear-gradient(to right, #09f544, #b5b759);
	color: #f52a07;
}

.header, .footer {
	background-color: rgb(23, 125, 147);
	color: white;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header {
	position: fixed;
	width: 100%;
	top: 0;
	z-index: 1000;
}

.footer {
	position: fixed;
	width: 100%;
	bottom: 0;
}

.header .left-links, .header .right-links, .footer a {
	display: flex;
	align-items: center;
}

.header .right-links a {
	margin-left: auto;
}

.header a, .footer a {
	color: white;
	text-decoration: none;
	padding: 14px 20px;
	display: inline-block;
}

.header a:hover, .footer a:hover {
	background-color: #575757;
}

.header h1{
	font-weight: bold;
	font-size: 50px;
	margin-bottom: 2px;
	color: rgb(131,58,180);
	color: linear-gradient(90deg, rgba(131,58,180,1) 8%, rgba(253,29,29,1) 50%, rgba(252,176,69,1) 80%, rgba(252,176,69,1) 81%);
	margin-top: 2px;
}
.header h1:hover {
	color:rgb(116, 38, 240	); 
}
</style>
</head>
<body>
	<div class="header">
		<div class="left-links">
			<a href="HotelOptions.jsp">Home</a>
		</div>
			<h1>My Food</h1>
		<div class="right-links">
			<a href="hotellogout">Logout</a>
		</div>
	</div>
	
	<form action="addDiscount">
		<input type="number" name="discount" placeholder="Enter additional discount" required="required">
		<input type="submit">
	</form>
	
	<div class="footer">
		<a href="help">Help</a> 
		<a href="contact">Contact Us</a> 
		<a href="mailto:admin@myfood.com">Email</a>
		<p>Address: 24 Nayapali, Bhubaneswar</p>
	</div>
</body>
</html>