<%@page import="com.jsp.hotelmanagementsystem.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Products</title>
<style>
body {
	display: flex;
	background: linear-gradient(180deg, rgba(2, 0, 36, 1) 0%,rgba(9, 121, 101, 1) 35%, rgba(0, 212, 255, 1) 100%);
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

.main{
	width: 100%;
	height: 85%;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top:50px;
	margin-bottom: 0px;
}
#proceed {
	text-align: center;
	display: block;
	font-size: 20px;
	margin: 2px;
	padding: 5px;
	width: 180px;
	border-radius: 8px;
	background-color: rgb(235, 243, 235);
	background: linear-gradient(to right, #11998e, #38ef7d);
	color: white;
	transition: background-color 0.3s, color 0.3s;
}

#proceed:hover {
	color: #f52a07;
	background: linear-gradient(to right, #09f544, #b5b759);
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
	background: linear-gradient(45deg, rgba(45,253,187,1) 0%, rgba(34,193,195,1) 100%);
}

th, td {
	padding: 15px;
	text-align: left;
}

th {
	background: rgba(37,103,250,0.8);
	color: #fff;
}

tr:hover {
	background: rgba(253,187,45,0.2);
}

a {
	text-decoration: none;
	color: #007BFF;
}

a:hover {
	text-decoration: underline;
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
	<div class="main">
		<%
		List<Product> products = (List<Product>) request.getAttribute("productlist");
		%>

		<table cellpadding="20px" border="1">
			<thead>
				<tr>
					<th>Name</th>
					<th>Type</th>
					<th>Cost</th>
					<th>Add</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Product product : products) {
				%>
				<tr>
					<td><%=product.getName()%></td>
					<td><%=product.getType()%></td>
					<td><%=product.getCost()%></td>
					<td><a href="additem?id=<%=product.getId()%>">add</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<h1>${message}</h1>
			<a id="proceed" href="ViewAddedItemsToCustomer.jsp">Proceed To Buy</a>
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