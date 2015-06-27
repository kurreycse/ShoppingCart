<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shoppingkart.ProductsBean"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>

<link rel="stylesheet" href="css/products1.css" />

<div id="main"><!-- Write all the stuffs here.. -->
<%! int ctr=0;%>
  <% if(ctr==0)
   {
        ctr++;
        if(request.getParameter("q")!=null)
       {
	   String name=request.getParameter("q");
	   String str1=new StringBuffer(name.length()).append(Character.toTitleCase(name.charAt(0))).append(name.substring(1)).toString();
       
	   RequestDispatcher rd=request.getRequestDispatcher("ProductsServlet?id=search&str="+str1);	
       rd.forward(request, response);
  
       }
   }
  if(request.getAttribute("flagSearch")!=null)
  {
  
if(request.getAttribute("listProductsSearch")!=null && Integer.parseInt(request.getAttribute("flagSearch").toString()) == 1)
{


%>


<table class="products" cellpadding="5" cellspacing="50px">




	<%
		ArrayList<ProductsBean> al = (ArrayList<ProductsBean>) request.getAttribute("listProductsSearch");
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
			
			ctr=0;
			%></table><%
}
else
{%>
<center style="color: red;">No Products Found With The Given Name.</center>

<%
ctr=0;
}
  }
%>
