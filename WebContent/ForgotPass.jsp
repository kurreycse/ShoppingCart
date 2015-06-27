<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="shoppingkart.LoginBean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Kart</title>
</head>
<script type="text/javascript">
function openModal() {
        document.getElementById('modal').style.display = 'block';
        document.getElementById('fade').style.display = 'block';
}

function closeModal() {
    document.getElementById('modal').style.display = 'none';
    document.getElementById('fade').style.display = 'none';
}

</script>
<link rel="stylesheet" href="css/loader.css">
<link rel="stylesheet" type="text/css" href="css/ForgotPass.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script>


function showUser()
{ 
	var str=document.getElementById("emailInput").value;
	var xreq;
	openModal();
	if(str=="")
	{
		document.getElementById("headerText").innerHTML="No email id entered.";
		document.getElementById("error").style.visibility="visible";
		
		document.getElementById("mobileNo").style.visibility="collapse";
		document.getElementById("dob").style.visibility="collapse";
		document.getElementById("passwordSubmit").style.visibility="collapse";
		return;
	}
	if(window.XMLHttpRequest)
	{
		xreq=new XMLHttpRequest();
	}
	else
	{
		xreq=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xreq.onreadystatechange=function ()
	{
		if((xreq.readyState==4) && (xreq.status==200))
		{	closeModal();
			if(xreq.responseText=="error"){
			
				document.getElementById("headerText").innerHTML = str+" is not registered with us.!";
				document.getElementById("error").style.visibility="visible";
				
				document.getElementById("mobileNo").style.visibility="collapse";
				document.getElementById("dob").style.visibility="collapse";
				document.getElementById("passwordSubmit").style.visibility="collapse";
				return;
				
			}else if(xreq.responseText=="authenticUser"){
				document.getElementById("emailInput").disabled="true"
				
				document.getElementById("error").style.visibility="collapse";
				document.getElementById("dob").style.visibility="collapse";
				document.getElementById("passwordSubmit").style.visibility="collapse";
				
				document.getElementById("mobileNo").style.visibility="visible";				
			}
		}
	};
	xreq.open("POST","ProductsServlet?id=checkUserEmail&object="+str,"true");
	xreq.send(str);
}

function showMobileNo()
{   var userEmail = document.getElementById("emailInput").value;
	var str=document.getElementById("mobileNoInput").value;
	openModal();
	var xreq;
	if(str=="")
	{	
		document.getElementById("error").innerHTML="No Mobile Number entered.";
		document.getElementById("dob").style.visibility="collapse";
		document.getElementById("passwordSubmit").style.visibility="collapse";
		return;
	}
	if(window.XMLHttpRequest)
	{
		xreq=new XMLHttpRequest();
	}
	else
	{
		xreq=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xreq.onreadystatechange=function ()
	{
		if((xreq.readyState==4) && (xreq.status==200))
		{	closeModal();
			if(xreq.responseText=="error"){
			
				document.getElementById("headerText").innerHTML = str+" is not registered for "+userEmail+" .!";
				document.getElementById("error").style.visibility="visible";
				document.getElementById("dob").style.visibility="collapse";
				document.getElementById("passwordSubmit").style.visibility="collapse";
				return;
				
			}else if(xreq.responseText=="authenticMobileNo") {
				document.getElementById("emailInput").disabled="true"
				document.getElementById("mobileNoInput").disabled="true"
				document.getElementById("dob").style.visibility="visible";
				
				document.getElementById("error").style.visibility="collapse";
				document.getElementById("passwordSubmit").style.visibility="collapse";
				
			}
		}
	};
	xreq.open("POST","ProductsServlet?id=checkUserMobileNo&object="+str,"true");
	xreq.send(str);
}
function showDob()
{ 	openModal();
	var userEmail = document.getElementById("emailInput").value;
	var str=document.getElementById("dobInput").value;
	var xreq;
	if(str=="")
	{
		document.getElementById("error").innerHTML="No input for Date of Birth.";
		document.getElementById("passwordSubmit").style.visibility="collapse";
		return;
	}
	if(window.XMLHttpRequest)
	{
		xreq=new XMLHttpRequest();
	}
	else
	{
		xreq=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xreq.onreadystatechange=function ()
	{
		if((xreq.readyState==4) && (xreq.status==200))
		{	closeModal();
			if(xreq.responseText=="error"){
			
				document.getElementById("headerText").innerHTML = str+" is not the correct Date Of Birth for "+userEmail+" .!";
				document.getElementById("error").style.visibility="visible";
				document.getElementById("passwordSubmit").style.visibility="collapse";
				return;
				
			}else if(xreq.responseText=="authenticDob") {
				document.getElementById("emailInput").disabled="true"
				document.getElementById("mobileNoInput").disabled="true"
				document.getElementById("dobInput").disabled="true"
				
				document.getElementById("error").style.visibility="collapse";
				
				document.getElementById("passwordSubmit").style.visibility="visible";
			}
		}
	};
	xreq.open("POST","ProductsServlet?id=checkUserDob&object="+str,"true");
	xreq.send(str);
}
function showPassword()
{ 	openModal();
	var xreq;
	var userEmail = document.getElementById("emailInput").value;
	if(window.XMLHttpRequest)
	{
		xreq=new XMLHttpRequest();
	}
	else
	{
		xreq=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xreq.onreadystatechange=function ()
	{
		if((xreq.readyState==4) && (xreq.status==200))
		{
				closeModal();
			
				
				document.getElementById("emailInput").disabled="true";
				document.getElementById("mobileNoInput").disabled="true";
				document.getElementById("dobInput").disabled="true";
				document.getElementById("passwordSubmit").style.visibility="collapse";
				document.getElementById("headerText").innerHTML="Your password is : "+xreq.responseText;
				document.getElementById("error").style.visibility="visible";
				
		}
	};
	xreq.open("POST","ProductsServlet?id=fetchPassword&object="+userEmail,"true");
	xreq.send(userEmail);
}


</script>
<body>
<%
	if (session.getAttribute("currentUserSession") != null) {
		response.sendRedirect("welcome.jsp");
	} else {
%>
<div id="mainpage"><!--  header file --> <jsp:include
	page="header.jsp"></jsp:include> <!-- menu file --> <jsp:include
	page="menu.jsp"></jsp:include>

<div id="main"><!-- Write all the stuffs here.. --> 
	
		<table id="passwordForm">
		<tr align="center" >
			<td>Email</td> 
			<td><input type="email" id="emailInput" placeholder="JohnDoe@abc.com"></td>
			<td colspan="2"><input type="submit" id="emailSubmit" value="Find" onclick="showUser()" ></td>
		</tr>

		<tr align="center" id="mobileNo" >
			<td >Mobile Number</td>
			<td><input type="number" id="mobileNoInput" placeholder="7895561235" ></td>
			<td colspan="2"><input type="submit" id="mobileNoSubmit" value="Check" onclick="showMobileNo()"></td>
		</tr>
			
		
		<tr align="center" id="dob">
			<td>Date Of Birth</td>
			<td><input type="date" id="dobInput" placeholder="(mm/dd/yyyy)" ></td>
			<td colspan="2"><input type="submit" id="dobSubmit" value="Check" onclick="showDob()" ></td>
		</tr>
		
		<tr id="passwordSubmit"  align="center">
			<td  colspan="3"><input type="submit" id="passwordSubmit" value="Get Password"  onclick="showPassword()"></td>
		</tr>
		
		<tr  id="error" align="center">
			<td colspan="3" id="headerText" align="center"><input type="text" disabled="disabled"></td>
		</tr>
		
		</table>
</div>
	<div id="fade"></div>
        <div id="modal">
            <img id="loader" src="images/loading.gif" />
        </div>
<!-- footer file --> <jsp:include page="footer.jsp"></jsp:include></div>
<%
	
		
	}
%>

</body>
</html>