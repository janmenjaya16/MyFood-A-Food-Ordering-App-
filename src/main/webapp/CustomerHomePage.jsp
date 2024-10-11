<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Home Page</title>
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
}

.main:hover {
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.main a {
	border: 2px solid black;
	text-decoration: none;
	text-align: center;
	display: block;
	font-size: 20px;
	margin: 6px;
	padding: 8px;
	width: 180px;
	border-radius: 8px;
	background-color: rgb(235, 243, 235);
	background: linear-gradient(to right, #11998e, #38ef7d);
	color: white;
	transition: background-color 0.3s, color 0.3s;
}

.main a:hover {
	color: #f52a07;
	background: linear-gradient(to right, #09f544, #b5b759);
}

#abc {
	margin-top: 7px;
}

h1 {
	font-weight: bold;
	margin-bottom: 55px;
	color: white;
}

h1:hover {
	color: #f52a07;
}

h2 {
	text-align: center;
	font-weight: bold;
	margin-bottom: 25px;
	color: red;
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
	padding: 20px;
	text-align: center;
	position: fixed;
	width: 100%;
	bottom: 0;
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
			<li><a href="HotelHomepage.jsp">Hotel Login</a></li>
		</ul>
	</div>
	<div class="main">
		<h2>${message}</h2>
		<h1>Customer Home</h1>
		<a href="addcustomer" id="abc">Register</a> <a
			href="CustomerLogin.jsp">Login</a>
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