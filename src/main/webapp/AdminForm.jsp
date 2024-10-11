<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddAdmin</title>
<style>
body {
	display: flex;
	justify-content: center;
	color: #333;
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
		url("https://static.vecteezy.com/system/resources/previews/000/273/542/original/online-food-order-concept-vector.jpg");
	background-size: cover;
	background-position: center;
	opacity: 0.5;
	z-index: -1;
}

.main {
	width: 320px;
	height: 370px;
	background: linear-gradient(to right, #8fd3f4, #84fab0);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: background 0.3s ease, box-shadow 0.3s ease;
	border-radius: 8px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

input {
	border: 2px solid black;
	text-decoration: none;
	text-align: center;
	display: block;
	font-size: 20px;
	margin: 4px;
	padding: 7px;
	width: 218px;
	border-radius: 8px;
	background-color: white;
	color: rgb(43, 10, 10);
}

#abc {
	margin-top: 17px;
}

#btn {
	background: linear-gradient(to right, #ff9966, #ff5e62);
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	border-radius: 5px;
	width: 158px;
	margin-left: 17%;
	margin-top: 23px;
	white: white;
}

h1 {
	font-weight: bold;
	margin-bottom: 35px;
	color: white;
}

#btn:hover {
	background: linear-gradient(to right, #ff5e62, #ff9966);
	box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
	transform: translateY(-2px);
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

footer ul li a {
	color: #fff;
	text-decoration: none;
	font-size: 0.9em;
}
</style>
<script>
	function validateForm(event) {
		var nameInput = document.getElementById('name');
		var emailInput = document.getElementById('email');
		var passwordInput = document.getElementById('password');
		var name = nameInput.value.trim();
		var email= emailInput.value.trim();
		var password = passwordInput.value.trim();

	 	var namePattern = /^[A-Za-z\s]+$/;
        if (name == "" || !namePattern.test(name)) {
        	alert('Please enter a valid name.');
			event.preventDefault();
			return false;
        }
        
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email == "" || !emailPattern.test(email)) {
        	alert('Please enter a valid email address.');
			event.preventDefault();
			return false;
        }
        
        var passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        if (password == "" || !passwordPattern.test(password)) {
            alert('Password must be at least 8 characters long and contain at least one letter and one number including one special character.');
			event.preventDefault();
			return false;
        	
        }
		

		return true;
	}

	document.addEventListener('DOMContentLoaded', function() {
		var form = document.getElementById('registrationForm');
		form.addEventListener('submit', validateForm);
	});
</script>
</head>
<body>
	<header>
		<div class="container">
			<h1>MyFood</h1>
		</div>
	</header>
	<div class="main">
		<h1>Admin Register Form</h1>
		<form:form action="saveadmin" modelAttribute="adminobj" id="registrationForm">
		Enter name: <form:input path="name" id="name" placeholder="Enter Name" required="required" />
		Enter email: <form:input path="email" id="email" placeholder="Enter email" required="required" />
		Enter password: <form:input path="password" id="password" placeholder="Enter password" required="required" />
			<input type="submit" id="btn">
		</form:form>
	</div>
	<footer>
		<div class="container">
			<ul>
				<li><a href="#help">Help</a></li>
				<li><a href="#contact">Contact Us</a></li>
				<li><a href="mailto:admin@hotelmanagement.com">Email</a></li>
				<li><a>Address: 24, Nayapalli, Bhubaneswar</a></li>
			</ul>
		</div>
	</footer>
</body>
</html>