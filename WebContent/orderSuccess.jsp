<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Kart</title>
</head>
<link rel="stylesheet" href="css/index.css">
<body>
<%
	String currentUserSession = null;
	if (session.getAttribute("currentUserSession") != null) {
%>
	<div id="mainpage"><!--  header file --> <jsp:include page="header.jsp"></jsp:include>
	<!-- menu file --> <jsp:include page="menuLogin.jsp"></jsp:include>

	<div id="main">
	<center><h3>Your Order has been placed Successfully.</h3></center>

	</div>
	<!-- footer file --> <jsp:include page="footer.jsp"></jsp:include></div>
<%
	} else {
		response.sendRedirect("index.jsp");
	}
%>

</body>
</html>
