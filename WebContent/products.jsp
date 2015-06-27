<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<body>
<div id="mainpage"><!--  header file --> <jsp:include
	page="header.jsp"></jsp:include>
<%
	String currentUserSession = null;
	if (session.getAttribute("currentUserSession") != null) {
%>
 <!-- menu file --> <jsp:include page="menuLogin.jsp"></jsp:include>

<%
	}else{
		
		%>
		 <!-- menu file --> <jsp:include page="menu.jsp"></jsp:include>
<% 	
	}
%>
<div id="main"><!-- Write all the stuffs here.. -->
<table class="products" cellpadding="5" cellspacing="10">

	<%
		ArrayList<ProductsBean> al = (ArrayList<ProductsBean>) request.getAttribute("listProducts");
			Iterator<ProductsBean> itr = al.iterator();
			while (itr.hasNext()) {
				ProductsBean proBean;
	%><tr>
		<%
			proBean = itr.next();
			
			
		%>
		
		<td >
		<% String str1=proBean.getProductName()+"polaris"+proBean.getProductCost()+"polaris"+proBean.getProductImageUrl()+"polaris"+proBean.getProductFeature()+"polaris"+proBean.getProductId();%> 
		<%= proBean.getProductName() %><br><a href="productDescription.jsp?Obj=<%=str1%>"><img  src="<%=proBean.getProductImageUrl()%>" alt="Smiley face" width="70" height="100"></img>
		</a>
		<br><br><b>Rs. <%= proBean.getProductCost() %></b><br>
		</td>
		
		
		
		<%
		if (itr.hasNext()) 
		{
			proBean = itr.next();
		%>
		<td >
		<% String str2=proBean.getProductName()+"polaris"+proBean.getProductCost()+"polaris"+proBean.getProductImageUrl()+"polaris"+proBean.getProductFeature()+"polaris"+proBean.getProductId();%> 
		<%= proBean.getProductName() %><br><a href="productDescription.jsp?Obj=<%=str2%>">
		<img src="<%=proBean.getProductImageUrl()%>" alt="Smiley face" width="70" height="100"></img></a><br><br><b>Rs. <%= proBean.getProductCost() %></b>
		</td>
		<%
			}
		%>
		<%
			if (itr.hasNext()) {
						proBean = itr.next();
		%>
		<td >
		<% String str3=proBean.getProductName()+"polaris"+proBean.getProductCost()+"polaris"+proBean.getProductImageUrl()+"polaris"+proBean.getProductFeature()+"polaris"+proBean.getProductId();%> 
		<%= proBean.getProductName() %><br><a href="productDescription.jsp?Obj=<%=str3%>">
		<img src="<%=proBean.getProductImageUrl()%>" alt="Smiley face" width="70" height="100"></img></a><br><br><b>Rs. <%= proBean.getProductCost() %></b>
		</td>
		<%
			}
		%>
		<%
			if (itr.hasNext()) {
						proBean = itr.next();
		%>
		<td >
		<% String str4=proBean.getProductName()+"polaris"+proBean.getProductCost()+"polaris"+proBean.getProductImageUrl()+"polaris"+proBean.getProductFeature()+"polaris"+proBean.getProductId();%> 
		<%= proBean.getProductName() %><br><a href="productDescription.jsp?Obj=<%=str4%>">
		<img src="<%=proBean.getProductImageUrl()%>" alt="Smiley face" width="70" height="100"></img></a><br><br><b>Rs. <%= proBean.getProductCost() %></b>
		</td>
		<%
			}
		%>
	</tr>
	<%
		}
	%>
</table>
</div>
<!-- footer file --> <jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>