<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<%@page import="shoppingkart.LoginBean"%>
<%@page import="shoppingkart.RegistrationBean"%>
<%@page import="shoppingkart.CartBean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Kart</title>
</head>
<link rel="stylesheet" href="css/index.css">
<style type="text/css">

#addressform {
  padding-top:20px;
  color: #333;
  font-family: sans-serif;
  font-size: .9em;
  font-weight: 300;
  text-align: left;
  line-height: 40px;
  border-spacing: 5;
  border: 1px solid #428bca;
  width: 500px;
  height: 275px;
  margin: 20px auto;
  border: 2px solid;
  border-radius: 10px;
  border-color: #1C415B;
  font-size: 16px;
}

</style>

<body>
<%
	String currentUserSession = null;
	if (session.getAttribute("currentUserSession") != null) {
%>
	<div id="mainpage"><!--  header file --> <jsp:include page="header.jsp"></jsp:include>
	<!-- menu file --> <jsp:include page="menuLogin.jsp"></jsp:include>

	<div id="main"><!-- Write all the stuffs here.. -->
		<%
	
			ArrayList<RegistrationBean> listUsers = (ArrayList<RegistrationBean>)request.getAttribute("listUsers"); 
		
		%>
		<%for(RegistrationBean a: listUsers)
		{%>
		<form action="ProductsServlet?id=address" method="post" >
		<table id="addressform">
		
		<tr><td>Name</td><td><input type="text" name="fname" value="<%=a.getFname() %>">&nbsp;&nbsp;
							 <input type="text" name="lname" value="<%=a.getLname() %>"></td>
		</tr>
		<tr><td>Email</td><td><input type="text" name="email" value="<%=a.getEmail() %>"></td></tr>
		<tr><td>Mobile Number</td><td><input type="text" name="mobno" value="<%=a.getMobno() %>"></td></tr>
		<tr><td>Delivery Address</td><td><textarea name="address" style="resize:none; width:80%; height: 120%;" ><%=a.getAddress() %></textarea></td></tr>
		<tr align="center"><td colspan="2"><input type="submit" value="Confirm Address" ></td></tr>
		
		</table>
		</form>
	<% }%>
	</div>
	<!-- footer file --> <jsp:include page="footer.jsp"></jsp:include></div>
<%
	} else {
		response.sendRedirect("index.jsp");
	}
%>

</body>
</html>