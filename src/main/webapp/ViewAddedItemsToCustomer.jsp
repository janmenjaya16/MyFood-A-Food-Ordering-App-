<%@page import="java.util.List"%>
<%@page import="com.jsp.hotelmanagementsystem.entities.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Cart</title>
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

.container {
	width: 100%;
	height: 90%;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 50px;
	margin-bottom: 20px;
	opacity: 0.9;
}

h1 {
	text-align: center;
	font-weight: bold;
	margin-bottom: 66px;
	color: white;
}

h1:hover {
	color: #f52a07;
}

table {
	width: 80%;
	border-collapse: collapse;
	margin-top: 20px;
	background: rgb(45,253,198);
background: linear-gradient(0deg, rgba(45,253,198,1) 14%, rgba(34,99,195,1) 72%);
}

tr:hover {
	background-color: rgb(125, 236, 12);
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 15px;
	text-align: left;
}

th {
	background: rgba(37, 103, 250, 0.8);
	color: #fff;
}

.remove-link {
	color: #ff0000;
	text-decoration: none;
}

.remove-link:hover {
	text-decoration: underline;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	margin: 20px 0;
	font-size: 16px;
	color: #fff;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
}

.btn:hover {
	background-color: #0056b3;
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
	padding: 20px;
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
		<h1>Order Summary</h1>
		<%try{ %>
		<%
		List<Item> items = (List<Item>) session.getAttribute("itemlist");
		%>
		<%if(items!=null && !items.isEmpty()){ %>

		<table cellpadding="20px" border="1px">
			<tr>
				<th>NAME</th>
				<th>COST</th>
				<th>TYPE</th>
				<th>QUANTITY</th>
				<th>REMOVE</th>
			</tr>
			<%
			for (Item i : items) {
			%>
			<tr>
				<td><%=i.getName()%></td>
				<td><%=i.getCost()%></td>
				<td><%=i.getType()%></td>
				<td><%=i.getQuantity()%></td>
				<td>< href="removeitem?id=<%=i.getId()%>">Remove</a></td>
			</tr>
			<%
			}
			%>


		</table>
		<div>
		<button><a href="addfoodorder" class="btn">confirm</a></button>
		<button><a href="addfoodorder" class="btn">Confirm</a></button>
	</div>
	<% } else { %>
        <h1>No items are added. Please add at least one item.</h1>
        <% } %>
        <% } catch (Exception e) { %>
        <h1>No items found in this Hotel. Please try another Hotel.</h1>
        <% e.printStackTrace(); %>
        <% } %>
	<div class="footer">
		<p>
			<a href="help">Help</a> | <a href="contact">Contact Us</a>| <a
				href="mailto:admin@myfood.com">Email</a>|Address: 24
			Nayapali, Bhubaneswar
		</p>
	</div>
</body>
</html>