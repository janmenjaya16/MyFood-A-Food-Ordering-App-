<%@page import="com.jsp.hotelmanagementsystem.entities.Item"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.hotelmanagementsystem.entities.FoodOrder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill Summary</title>
<style>
body {
	font-family: Arial, sans-serif;
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

.container {
	width: 80%;
	margin: 0 auto;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	margin-top: 50px;
}

h1, h2 {
	color: #333;
}
h1:hover{
	color: #f52a07;
}

.info {
	margin-bottom: 20px;
}

.info h2 {
	margin: 5px 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 15px;
	text-align: left;
}

th {
	background-color: #f4f4f4;
}

.total {
	text-align: right;
	padding-top: 20px;
	font-size: 1.2em;
	font-weight: bold;
}

.header {
	background: linear-gradient(90deg, rgba(2, 0, 36, 1) 0%,
		rgba(9, 121, 101, 1) 35%, rgba(0, 212, 255, 1) 100%);
	padding: 10px ;
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
}

.header .menu li {
	margin-right: 20px;
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
</style>
</head>
<body>
	<div class="header">
		<div class="logo">MyFood</div>
		<ul class="menu">
			<li><a href="CustomerOptions.jsp">home</a></li>
			<li><a href="customerlogout">Logout</a></li>
		</ul>
	</div>
	
	<div class="container">
		<div class="info">
			<%
			FoodOrder foodorder = (FoodOrder) request.getAttribute("foodorderobj");
			if (foodorder != null) {
			%>
			<h1>Order Summary</h1>
			<h2>
				Ordered for:
				<%=foodorder.getName()%></h2>
			<h2>
				Mobile Number:
				<%=foodorder.getMobilenumber()%></h2>
			<h2>
				Address:
				<%=foodorder.getAddress()%></h2>
			<%
			} else {
			%>
			<h2>No food order information available.</h2>
			<%
			}
			List<Item> items = (List<Item>) session.getAttribute("itemlist");
			if (items != null && !items.isEmpty()) {
			%>
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>Cost</th>
						<th>Quantity</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Item i : items) {
					%>
					<tr>
						<td><%=i.getName()%></td>
						<td><%=i.getType()%></td>
						<td><%=i.getCost()%></td>
						<td><%=i.getQuantity()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			} else {
			%>
			<h2>No items found.</h2>
			<%
			}
			if (foodorder != null) {
			%>
			<div class="total">
				Total Cost:
				<%=foodorder.getTotalprice()%>
				<% double gst=(((foodorder.getTotalprice())*18)/100); %>
				Total gst is:<%=gst%>
				After gst Total price u hve to pay is<%=foodorder.getTotalprice()+gst %>
			</div>
			<%
			}
			%>
		</div>
	</div>
	
	<div class="footer">
		<p>
			<a href="help">Help</a> | <a href="contact">Contact Us</a>| <a
				href="mailto:admin@myfood.com">Email</a>|Address: 24
			Nayapali, Bhubaneswar
		</p>
	</div>
</body>
</html>