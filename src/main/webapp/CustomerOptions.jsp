<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Options</title>
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
	opacity: 0.5;
	z-index: -1;
}

.main {
	width: 370px;
	height: 420px;
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

.main a {
	text-decoration: none;
	text-align: center;
	display: block;
	font-size: 24px;
	margin: 2px;
	margin-top: -4px;
	padding: 12px;
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
	border: 2px solid white;
}

h1:hover {
	color: #f52a07;
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

h2 {
	font-weight: bold;
	margin-bottom: 24px;
	color: red;
	margin-top: -22px;
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
	<%
	Integer customer_id = (Integer) session.getAttribute("customerinfo");
	%>

	<%
	if (customer_id != null) {
	%>
	<div class="header">
		<div class="logo">MyFood</div>
		<ul class="menu">
			<li><a href="customerlogout">logout</a></li>
		</ul>
	</div>
	<div class="main">
		<h2>${message}</h2>
		<h1>Choose An Option</h1>
		<a href="fetchproductbyhotelname">View Product By Hotel</a><br> <a
			href="fetchallproducts">Buy Food</a><br> <a
			href="ReadPriceRange.jsp">View Products in Range</a>
	</div>
	<div class="footer">
		<p>
			<a href="help">Help</a> | <a href="contact">Contact Us</a>| <a
				href="mailto:admin@myfood.com">Email</a>|Address: 24
			Nayapali, Bhubaneswar
		</p>
	</div>
	<%
	} else {
	%>
	<div class="header">
		<div class="logo">MyFood</div>
	</div>
	<div class="main">
		<a href="CustomerHomePage.jsp">Login First</a>
	</div>
	<div class="footer">
		<p>
			<a href="help">Help</a> | <a href="contact">Contact Us</a>| <a
				href="mailto:myfood@gmail.com">myfood@gmail.com</a>|Address: 24
			Nayapali, Bhubaneswar
		</p>
	</div>
	<%
	}
	%>
</body>
</html>