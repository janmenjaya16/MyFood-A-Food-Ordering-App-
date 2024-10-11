<%@page import="com.jsp.hotelmanagementsystem.entities.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin options</title>
<style>
body {
	display: flex;
	justify-content: center; background : linear-gradient( to right,
	#4facfe, #00f2fe); color : #333;
	align-items: center;
	height: 100vh;
	margin: 0;
	background: linear-gradient(to right, #4facfe, #00f2fe);
	color: #333;
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

.main {
	border: 2px solid black;
	width: 320px;
	height: 390px;
	background: linear-gradient(to right, #8fd3f4, #84fab0);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: background 0.3s ease, box-shadow 0.3s ease;
	border-radius: 8px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.main a {
	border: 2px solid black;
	text-decoration: none;
	text-align: center;
	display: block;
	font-size: 20px;
	margin: 2px;
	margin-top: -4px;
	padding: 5px;
	width: 180px;
	background: linear-gradient(to right, #ff9966, #ff5e62);
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	border-radius: 5px;
	color: white;
}

.main a:hover {
	background: linear-gradient(to right, #ff5e62, #ff9966);
	box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
	transform: translateY(-2px);
}


#abc {
	margin-top: 17px;
}

h1 {
	font-weight: bold;
	margin-bottom: 34px;
	color: white;
	margin-top: -22px;
}

h1:hover {
	color: #f52a07;
}

.container {
	width: 90%;
	margin: 0 auto;
	max-width: 1200px;
}

header {
	background: linear-gradient(to right, #00c6ff, #0072ff);
	padding: 20px 0;
	width: 100%;
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

header nav a:hover {
	text-decoration: underline;
	color: blue;
}

footer {
	background: linear-gradient(to right, #00c6ff, #0072ff);
	padding: 10px 0;
	position: fixed;
	width: 100%;
	height: 10px;
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

footer ul li p, a {
	color: #fff;
	text-decoration: none;
	font-size: 0.9em;
}

h4 {
	color: red;
}
</style>
</head>
<body>
	<%
	Admin admin = (Admin) session.getAttribute("admininfo");

	if (admin != null) {
	%>
	<header>
		<div class="container">
			<h1>MyFood</h1>
			<nav>
				<a href="AdminOptions.jsp">Home</a>
				<a href="adminlogout">Logout</a>
			</nav>
		</div>
	</header>

	<div class="main">

		<h4>${message}</h4>
		<br>
		<h1>choose an option</h1>
		<a href="fetchunapprovedhotels"> Approve Hotel</a><br> 
		<a href="fetchblockedhotel"> Unblock Hotel</a><br> 
		<a href="fetchunblockedhotel"> Block Hotel</a><br> 
		<a href="adminlogout">logout</a>
	</div>
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
	<%
	} else {
	%>
	<a href="AdminHome.jsp">Login First </a>
	<%
	}
	%>
</body>
</html>