<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shoppingkart.*"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Kart</title>
</head>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<link rel="stylesheet" type="text/css" href="css/cart.css" />


<link rel="stylesheet" href="css/index.css">
<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/style7.css" />
<body>
<div id="mainpage"><!--  header file --> <jsp:include
	page="header.jsp"></jsp:include>
<%
	
	String currentUserSession = null;
	if (session.getAttribute("currentUserSession") != null) {
%>


 <!-- menu file --> <jsp:include
	page="menuLogin.jsp"></jsp:include>

<div id="main"><!-- Write all the stuffs here.. --> 
<h3 align="center" style="color: #000000;font-size: 20px">Cart Items</h3>
<table align="center" cellspacing="10px" border="1px solid" cellpadding="10px" >
				<%
		ArrayList<CartBean> al = (ArrayList<CartBean>) session.getAttribute("listCartItems");
			Iterator<CartBean> itr = al.iterator();
			while (itr.hasNext()) {
				CartBean cartBean;
	   %><tr style="color='#CCE0FF';">
		<%cartBean = itr.next();%>
		<td ><img  src="<%=cartBean.getProduct_image_path()%>" alt="Smiley face" width="70" height="100"></img></td>
		<td align="left"><%=cartBean.getProduct_name()%></td>
		<td align="right"  style="color:#1C415B"><%=cartBean.getQuantity()%></td>
		<td align="right"  style="color:#1C415B"><%=cartBean.getProduct_cost()%></td>
	   	</tr>
		<%} %>
		<tr><td colspan="3" id="error" align="center"><input id="headerText"  type="text" disabled="disabled" visibility="collapse" width="30px;"></td></tr>
		</table>
	
<br><br><center><button  onclick="window.location.href='welcome.jsp'" class="action-button shadow animate blue" type="button">Continue Shopping</button><button onclick="window.location.href='ProductsServlet?id=placeOrder'"  class="action-button shadow animate blue" type="button">Place Order</button></center>


</div>

<!-- footer file --> <jsp:include page="footer.jsp"></jsp:include></div>
<%
	} else {
		response.sendRedirect("index.jsp");
	}
%>
</body>
</html>