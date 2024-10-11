<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Customer</title>
<style>
body {
	display: flex;
	background: linear-gradient(180deg, rgba(2, 0, 36, 1) 0%,
		rgba(9, 121, 101, 1) 35%, rgba(0, 212, 255, 1) 100%);
	justify-content: center;
	align-items: center;
	height: 95vh;
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
		url("https://img.freepik.com/free-photo/top-view-cooked-italian-pasta-with-meat-different-seasonings-dark-blue-surface_140725-61957.jpg?t=st=1718822521~exp=1718826121~hmac=40833f32fa3b8d8db30211b4527b02b84920aa68538b906c129ee8ffc6a83052&w=1060");
	background-size: cover;
	background-position: center;
	opacity: 0.6;
	z-index: -1;
}

.main {
	width: 350px;
	height: 370px;
	background: linear-gradient(45deg, rgba(0, 212, 255, 1) 0%,
		rgba(9, 121, 101, 1) 100%);
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease-in-out;
	border-radius: 10px;
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
	margin: -6px;
	padding: 7px width: 218px;
	border-radius: 8px;
	background-color: white;
	color: rgb(43, 10, 10);
}

#abc {
	margin-top: 17px;
}

#btn {
	background: linear-gradient(to right, #11998e, #38ef7d);
	width: 158px;
	margin-left: 17%;
	margin-top: 7px;
	color: white;
}

#btn:hover {
	color: #f52a07;
	background: linear-gradient(to right, #09f544, #b5b759);
}

h1 {
	font-weight: bold;
	margin-bottom: 55px;
	color: white;
}

h1:hover {
	color: #f52a07;
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

<script>
	function validateForm(event) {
		var nameInput = document.getElementById('name');
		var emailInput = document.getElementById('email');
		var passwordInput = document.getElementById('password');
		var mobileInput = document.getElementById('mobile');
		var name = nameInput.value.trim();
		var email= emailInput.value.trim();
		var password = passwordInput.value.trim();
		var mobileNumber = mobileInput.value.trim();

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
		
		var mobileNumberPattern = /^[0-9]{10}$/;
		if (!mobileNumberPattern.test(mobileNumber)) {
			alert('Please enter a valid 10-digit mobile number.');
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
	<div class="header">
		<div class="logo">MyFood</div>
		<ul class="menu">
			<li><a href="CustomerLogin.jsp">Login</a></li>
		</ul>
	</div>

	<div class="main">
		<h1>Customer Register Form</h1>
		<form:form name="registrationForm" action="savecustomer" modelAttribute="customerobj" id="registrationForm">
			<form:input path="name" id="name" placeholder="Enter name" type="text" required="required" />
			<br>
			<form:input path="email" id="email" placeholder="Enter email" type="email" required="required" />
			<br>
			<form:input path="password" id="password" placeholder="Enter password" required="required" />
			<br>
			<form:input path="mobilenumber" id="mobile" placeholder="Enter MobileNum" type="number" required="required" />
			<br>
			<form:input path="address" placeholder="Enter address" required="required" />
			<br>
			<input type="submit" id="btn" value="Register">
		</form:form>
	</div>
	<div class="footer">
		<p>
			<a href="help">Help</a> | <a href="contact">Contact Us</a>| <a
				href="mailto:admin@myfood.com">Email</a>|Address: 24 Nayapali,
			Bhubaneswar
		</p>
	</div>
</body>
</html>