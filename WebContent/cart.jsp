<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shoppingkart.*"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>

<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title></title>
		<meta name="description" content="Fullscreen Overlay Styles &amp; Effects" />
		<meta name="keywords" content="fullscreen overlay, overlay menu, inspiration, styles, effect, css" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/style7.css" />
  		<script src="js/modernizr.custom.js"></script>

<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-7243260-2']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>

	</head>
	<body>
	  <button  class="container1 action-button shadow animate blue" id="trigger-overlay" type="button">Cart</button>
	<!-- open/close -->
		<div class="overlay overlay-contentpush"  >
			<button type="button" class="overlay-close">Close</button>
			<h3 align="center" align="center" style="color: #000000;font-size: 20px">Cart Items</h3>
			<nav>
				<!-- Write the cart items here -->
				<table align="center" id="carttable" >
				<%
				if( session.getAttribute("listCartItems")!= null){
				
		ArrayList<CartBean> al = (ArrayList<CartBean>) session.getAttribute("listCartItems");
			Iterator<CartBean> itr = al.iterator();
			while (itr.hasNext()) {
				CartBean cartBean;
	   %><tr color="#CCE0FF">
		<%cartBean = itr.next();%>
		<td ><img  src="<%=cartBean.getProduct_image_path()%>" alt="Smiley face" width="70" height="100"></img></td><td align="left"><%=cartBean.getProduct_name()%></td><td align="right" style="color:#1C415B"><b>Rs. <%=cartBean.getProduct_cost()%></b></td>
	   	</tr>
		<%} 
			%><tr><td>
	<button onclick="window.location.href='welcome.jsp'" class="action-button shadow animate blue" type="button">Continue Shopping</button></td><td><button onclick="window.location.href='ProductsServlet?id=placeOrder'" class="action-button shadow animate blue" type="button">Place Order</button></td></tr>
	<%
	}else{
					%>
					<tr><td colspan="2">No items in Cart.</td></tr>
					<tr><td colspan="2">
	<button onclick="window.location.href='welcome.jsp'" class="action-button shadow animate blue" type="button">Continue Shopping</button>
	</td></tr>
					<%
					
					
				}%>
		
		
			
		</table>
			</nav>
		</div>
		<script src="js/classie.js"></script>
		<script src="js/demo7.js"></script>
		

	</body>
</html>