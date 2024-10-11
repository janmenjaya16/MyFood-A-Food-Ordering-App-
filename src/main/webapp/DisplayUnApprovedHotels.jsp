<%@page import="com.jsp.hotelmanagementsystem.entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Unapproved Hotels</title>
<style>
body {
	display: flex;
	justify-content:center;
	background: linear-gradient(to right, #4facfe, #00f2fe);
    color: #333;
	align-items: flex-start;
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
		url("https://static.vecteezy.com/system/resources/previews/000/273/542/original/online-food-order-concept-vector.jpg");
	background-size: cover;
	background-position: center;
	opacity: 0.5;
	z-index: -1;
}

table {
	width: 80%;
	border-collapse: collapse;
	background-color: #fff;
	margin-top: 100px;
}

th, td {
	padding: 15px;
	text-align: left;
}

th {
	background-color: #057;
	color: #fff;
}

tr:hover {
	background-color: #ddd;
}

table a {
	text-decoration: none;
	background: linear-gradient(to right, #ff9966, #ff5e62);
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	border-radius: 5px;
	color: white;
	padding: 1.5px;
}

table a:hover {
	background: linear-gradient(to right, #ff5e62, #ff9966);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
    transform: translateY(-2px);
}
.container {
    width: 90%;
    margin: 0 auto;
    max-width: 1200px;
}

header {
    background:  linear-gradient(to right, #00c6ff, #0072ff);
    padding: 20px 0;
    width:100%;
    top: 0;
    position: fixed;
    z-index: 1000;
}

header .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header h1 {
    margin: 0;
    font-size: 1.5em;
    color: #123;
}

header nav a {
    color: #fff;
    text-decoration: none;
    font-size: 1em;
    margin-left: 20px;
}

header nav a:hover{
	text-decoration: underline;
	color: blue;
}

footer {
    background: linear-gradient(to right, #00c6ff, #0072ff);
    padding: 10px 0;
    position: fixed;
    width: 100%;
    height:10px;
    bottom: 0;
}

footer .container {
    display: flex;
    justify-content: center;
}

footer ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
}

footer ul li {
    margin: 0 10px;
}

footer ul li p, a{
    color: #fff;
    text-decoration: none;
    font-size: 0.9em;
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<h1>MyFood</h1>
			<nav>
				<a href="AdminOptions.jsp">Home</a>
				<a href="adminlogout">Logout</a>
			</nav>
		</div>
	</header>
	<%
	List<Hotel> hotels = (List<Hotel>) request.getAttribute("unapprovedhotels");
	%>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Address</th>
				<th>MobileNumber</th>
				<th>Status</th>
				<th>Approve</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Hotel h : hotels) {
			%>
			<tr>
				<td><%=h.getId()%></td>
				<td><%=h.getName()%></td>
				<td><%=h.getEmail()%></td>
				<td><%=h.getAddress()%></td>
				<td><%=h.getMobilenumber()%></td>
				<td><%=h.getStatus()%></td>
				<td><a href="approvehotel?id=<%=h.getId()%>">approve</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	
	<footer>
		<div class="container">
			<ul>
				<li><a href="#help">Help</a></li>
				<li><a href="#contact">Contact Us</a></li>
				<li><a href="mailto:admin@myfood.com">Email</a></li>
				<li><a>Address: 24, Nayapalli, Bhubaneswar</a></li>
			</ul>
		</div>
	</footer>

</body>
</html>