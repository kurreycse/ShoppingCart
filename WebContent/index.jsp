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
<!-- Code to check whether session already exists. If so then auto login the user. -->
<%

response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server  
response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance  
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"  
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility  

    String currentUserSession = null;
	if( session.getAttribute("currentUserSession") != null){
		response.sendRedirect("welcome.jsp");
	}
	else{
%>
<% if(request.getAttribute("LoginError")!=null){
		%>
		<script type="text/javascript">
		alert('Username or Password incorrect');
		</script>
		
		
		<%
}
	%>	



<div id="mainpage"><!--  header file --> <jsp:include page="header.jsp"></jsp:include><!--
				   <!-- menu file --> <jsp:include page="menu.jsp"></jsp:include>

<div id="main"><!-- Write all the stuffs here.. -->
<iframe id="main" src="./slider/imageslider.jsp" scrolling="no"></iframe>

</div>



<!-- footer file --> <jsp:include page="footer.jsp"></jsp:include></div>
<%} %>
</body>
</html>