<%@page import="java.util.List"%>
<%@page import="com.jsp.hotelmanagementsystem.entities.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management</title>
<style>
body {
	display: flex;
	background: rgb(238,174,202);
	background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);
	justify-content: center;
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
.center{
	padding: 30px;
	margin-top: 20px;
		
}

table {
	border-collapse: collapse;
	width:800px;
	margin: 20px auto;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	background-color: white;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

a {
	color: #4CAF50;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.links {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.links a {
	margin: 0 10px;
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border-radius: 5px;
}

.links a:hover {
	background-color: #45a049;
}
.center h1 {
	font-weight: bold;
	margin-bottom: 35px;
	text-align:center;
	color: green;
	text-decoration: underline;
}

h1:hover {
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

.content {
	margin-top: 60px; 
	margin-bottom: 40px; 
	padding: 20px;
}

.header h1 {
	font-weight: bold;
	font-size: 50px;
	margin-bottom: 2px;
	color: rgb(131, 58, 180);
	color: linear-gradient(90deg, rgba(131, 58, 180, 1) 8%,
		rgba(253, 29, 29, 1) 50%, rgba(252, 176, 69, 1) 80%,
		rgba(252, 176, 69, 1) 81%);
	margin-top: 2px;
}

.header h1:hover {
	color: rgb(116, 38, 240);
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
	<div class="center">
		<h1>${message}</h1>
		<h1>Product Management</h1>
		<%
		List<Product> p = (List<Product>) request.getAttribute("viewProduct");
		%>
		<table border="1">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Type</th>
				<th>Cost</th>
				<th>Discount</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
			<%
			for (Product product : p) {
			%>
			<tr>
				<td><%=product.getId()%></td>
				<td><%=product.getName()%></td>
				<td><%=product.getType()%></td>
				<td><%=product.getCost()%></td>
				<td><%=product.getDiscount()%></td>
				<td><a href="updateproduct?id=<%=product.getId()%>">Update</a></td>
				<td><a href="deleteproduct?id=<%=product.getId()%>">Delete</a></td>
			</tr>
			<%
			}
			%>
		</table>

	</div>
	<div class="footer">
		<a href="help">Help</a> <a href="contact">Contact Us</a> <a
			href="mailto:admin@myfood.com">Email</a>
		<p>Address: 24 Nayapali, Bhubaneswar</p>
	</div>
</body>
</html>