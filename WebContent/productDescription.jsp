<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shoppingkart.ProductsBean"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Kart - Electronic Products</title>
</head>
<link rel="stylesheet" href="css/products.css" />
<link rel="stylesheet" href="css/index.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script >
	
	$(document).ready(function(){

  $("input[id=quantity]").keyup(function(){
  		var quantity = $("#quantity").val();
  		var costPerUnit = $("#costPerUnit").val();
  		if(quantity ==''){
  			alert("Quantity can not be left blank.");
  			$("#submit").hide();
  			$("#quantity").focus();
  			
  		}else if(quantity <= 0){
  			alert("Quantity can not be Zero or Negative.");
  			$("#submit").hide();
  			$("#quantity").focus();
  		}
  		else{
  		
  			$("input[id=quantityHidden]").val(quantity);
  			$("input[id=totalCostHidden]").val(costPerUnit*quantity);
  			$("#submit").show();
  			
  			}
  });
});

</script>

<body onload="func();">
<div id="mainpage"><!--  header file --> <jsp:include
	page="header.jsp"></jsp:include>
<%	
	String currentUserSession = null;
	if( session.getAttribute("currentUserSession") != null){
		%>
 <!-- menu file --> <jsp:include page="menuLogin.jsp"></jsp:include>
<%}
	else{
	%>	<!-- menu file --> <jsp:include page="menu.jsp"></jsp:include>
	<%
	}
	    %>


<div id="main"><!-- Write all the stuffs here.. -->
<%
       
			//HttpSession sessi=request.getSession(false);
	        String str1=request.getParameter("Obj");
			String str2[]=str1.split("polaris");
       	%>
<form method="post" action="ProductsServlet?id=addToCart&item=<%=str1 %>">
	<table class="prospec" cellpadding="5" cellspacing="50" align="center">
      	<tr>
       	<td><input type="hidden" id="quantityHidden" class="quantityHidden" name="quantityHidden" ><br/>
       		<input type="hidden" id="totalCostHidden" class="totalCostHidden" name="totalCostHidden">
       	
       	</td>
       	<td style="padding-left: 20%;" id="img" width="40%" height="60%" align="left"><img style="height: 100% ;width: 100%" src="<%=str2[2]%>" alt="Smiley face" width="130" height="120"></img></td>
       	<td  style="padding-right: 20%;" align="right" style="width: 100px"><%= str2[0]%><br/>
       	<b>Rs.<input type="text" id="costPerUnit" class="costPerUnit" value="<%= str2[1] %>" disabled="disabled"></b>
       	<br/><br/><b>Features</b><br/><%=str2[3] %>
       	<br>Quantity: <input type="number" id="quantity" class="quantity" value="0" maxlength="1" ><br/>
       	<br/>
       	<hr>
       	<div style="float: right;">
       	<%if(session.getAttribute("currentUserSession") != null){ %>
       			<input type="submit" id="submit" class="action-button shadow animate blue" value="Add to Cart" style="display:none;">
       	<%}else
       	{ %>Please Login to continue
       	
       	<%} %>
       	</div>
       	
       	</td>
       	
       	</tr>	

	</table>
</form>
</div>
<!-- footer file --> <jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>