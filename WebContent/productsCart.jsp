<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Kart</title>
</head>
<body>
<div id="mainpage"><!--  header file --> <jsp:include
	page="header.jsp"></jsp:include>
<%
	String currentUserSession = null;
	if (session.getAttribute("currentUserSession") != null) {
%>
 <!-- menu file --> <jsp:include page="menuLogin.jsp"></jsp:include>

<div id="main"><!-- Write all the stuffs here.. -->
<table class="products" cellpadding="5" cellspacing="10">
hello
</table>
<%
	}else{
		response.sendRedirect("index.jsp");
	}
		%>
		 
</div>
<!-- footer file --> <jsp:include page="footer.jsp"></jsp:include></div>

</body>
</html>