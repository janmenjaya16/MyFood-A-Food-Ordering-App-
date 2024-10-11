<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read price Range</title>
<style>
body {
	display:flex;
	background: linear-gradient(180deg, rgba(2, 0, 36, 1) 0%,
		rgba(9, 121, 101, 1) 35%, rgba(0, 212, 255, 1) 100%);
	height: 100hv;
	justify-content: center;
	align-items: center;
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
.main {
	width: 400px;
	height: 200px;
	margin:250px;
	background: linear-gradient(45deg, rgba(0, 212, 255, 1) 0%,
		rgba(9, 121, 101, 1) 100%);
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease-in-out;
	opacity: 0.9;
}
.main h1{
	margin-left: 70px;
	font-weight: bold;
	margin-bottom: 34px;
	color: white;
	margin-top: 10px;
}
.main h1:hover{
	color: #f52a07;
}

#btn{
	margin-left: 150px;
	margin-top: 15px;
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
	padding: 15px;
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
[slider] {
  position: relative;
  height: 14px;
  border-radius: 10px;
  text-align: left;
  margin: 45px 0 10px 0;
}

[slider] > div {
  position: absolute;
  left: 13px;
  right: 15px;
  height: 14px;
}

[slider] > div > [inverse-left] {
  position: absolute;
  left: 0;
  height: 14px;
  border-radius: 10px;
  background-color: #CCC;
  margin: 0 7px;
}

[slider] > div > [inverse-right] {
  position: absolute;
  right: 0;
  height: 14px;
  border-radius: 10px;
  background-color: #CCC;
  margin: 0 7px;
}

[slider] > div > [range] {
  position: absolute;
  left: 0;
  height: 14px;
  border-radius: 14px;
  background-color: #1ABC9C;
}

[slider] > div > [thumb] {
  position: absolute;
  top: -7px;
  z-index: 2;
  height: 28px;
  width: 28px;
  text-align: left;
  margin-left: -11px;
  cursor: pointer;
  box-shadow: 0 3px 8px rgba(0, 0, 0, 0.4);
  background-color: #FFF;
  border-radius: 50%;
  outline: none;
}

[slider] > input[type=range] {
  position: absolute;
  pointer-events: none;
  -webkit-appearance: none;
  z-index: 3;
  height: 14px;
  top: -2px;
  width: 100%;
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
  filter: alpha(opacity=0);
  -moz-opacity: 0;
  -khtml-opacity: 0;
  opacity: 0;
}

div[slider] > input[type=range]::-ms-track {
  -webkit-appearance: none;
  background: transparent;
  color: transparent;
}

div[slider] > input[type=range]::-moz-range-track {
  -moz-appearance: none;
  background: transparent;
  color: transparent;
}

div[slider] > input[type=range]:focus::-webkit-slider-runnable-track {
  background: transparent;
  border: transparent;
}

div[slider] > input[type=range]:focus {
  outline: none;
}

div[slider] > input[type=range]::-ms-thumb {
  pointer-events: all;
  width: 28px;
  height: 28px;
  border-radius: 0px;
  border: 0 none;
  background: red;
}

div[slider] > input[type=range]::-moz-range-thumb {
  pointer-events: all;
  width: 28px;
  height: 28px;
  border-radius: 0px;
  border: 0 none;
  background: red;
}

div[slider] > input[type=range]::-webkit-slider-thumb {
  pointer-events: all;
  width: 28px;
  height: 28px;
  border-radius: 0px;
  border: 0 none;
  background: red;
  -webkit-appearance: none;
}

div[slider] > input[type=range]::-ms-fill-lower {
  background: transparent;
  border: 0 none;
}

div[slider] > input[type=range]::-ms-fill-upper {
  background: transparent;
  border: 0 none;
}

div[slider] > input[type=range]::-ms-tooltip {
  display: none;
}

[slider] > div > [sign] {
  opacity: 0;
  position: absolute;
  margin-left: -11px;
  top: -39px;
  z-index:3;
  background-color: #1ABC9C;
  color: #fff;
  width: 28px;
  height: 28px;
  border-radius: 28px;
  -webkit-border-radius: 28px;
  align-items: center;
  -webkit-justify-content: center;
  justify-content: center;
  text-align: center;
}

[slider] > div > [sign]:after {
  position: absolute;
  content: '';
  left: 0;
  border-radius: 16px;
  top: 19px;
  border-left: 14px solid transparent;
  border-right: 14px solid transparent;
  border-top-width: 16px;
  border-top-style: solid;
  border-top-color: #1ABC9C;
}

[slider] > div > [sign] > span {
  font-size: 12px;
  font-weight: 700;
  line-height: 28px;
}

[slider]:hover > div > [sign] {
  opacity: 1;
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
		<h1>Choose The Range</h1>
		<form action="fetchproductsbetweenpricerange">
			<div slider id="slider-distance">
				<div>
					<div inverse-left style="width: 70%;"></div>
					<div inverse-right style="width: 70%;"></div>
					<div range style="left: 30%; right: 40%;"></div>
					<span thumb style="left: 30%;"></span> <span thumb
						style="left: 60%;"></span>
					<div sign style="left: 30%;">
						<span id="value">300</span>
					</div>
					<div sign style="left: 60%;">
						<span id="value">600</span>
					</div>
				</div>
				<input type="range" tabindex="0" value="300" max="1000" min="0"
					step="1"
					oninput="
  this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
  var children = this.parentNode.childNodes[1].childNodes;
  children[1].style.width=value+'%';
  children[5].style.left=value+'%';
  children[7].style.left=value+'%';children[11].style.left=value+'%';
  children[11].childNodes[1].innerHTML=this.value;" name="minPrice" />

				<input type="range" tabindex="0" value="600" max="1000" min="0"
					step="1"
					oninput="
  this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
  var children = this.parentNode.childNodes[1].childNodes;
  children[3].style.width=(100-value)+'%';
  children[5].style.right=(100-value)+'%';
  children[9].style.left=value+'%';children[13].style.left=value+'%';
  children[13].childNodes[1].innerHTML=this.value;" name="maxPrice"/><br><br>
  
  			<input type="submit" id="btn">
			</div>
		</form>
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