<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Kart - Explore the new way of shopping</title>
</head>
<link rel="stylesheet" href="css/index.css">
<body>
<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server  
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance  
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"  
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility  
	if (session.getAttribute("currentUserSession") != null) {
%>


<div id="mainpage"><!--  header file --> <jsp:include
	page="header.jsp"></jsp:include> <!-- menu file --> <jsp:include
	page="menuLogin.jsp"></jsp:include>

<div id="main"><!-- Write all the stuffs here.. --> <iframe
	src="./slider/imageslider.jsp" width="1415px" scrolling="no"
	height="520px"></iframe></div>

<!-- footer file --> <jsp:include page="footer.jsp"></jsp:include></div>
<%
	} else {
		response.sendRedirect("index.jsp");
	}
%>

</body>
</html>