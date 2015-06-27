<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<style type="text/css">
#header {
	min-height: 125px;
	position: relative;
	background-repeat: no-repeat;
}

#searchbox {
	min-height: 125px;
	position: relative;
	background-repeat: no-repeat;
}
</style>
<body>

<table id="header">
	<tr>
		<td><a href="index.jsp"><img src="images/header.jpg"></a></td>
		<td width="600px" align="right" style="padding-top: 20px"><jsp:include
			page="Search.jsp"></jsp:include></td>
	<%
	String currentUserSession = null;
	if (session.getAttribute("currentUserSession") != null) {
	%>		
			
		<td id="cart2" style="padding-left:300px; padding-top: 30px;" ><jsp:include page="cart.jsp"></jsp:include></td>
		<%} %>
	</tr>
</table>
</body>
</html>