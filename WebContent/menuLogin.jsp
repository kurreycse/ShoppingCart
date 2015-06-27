<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="shoppingkart.LoginBean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Kart</title>
</head>

<link rel="stylesheet" href="css/menu.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/down.css">
<link rel="stylesheet" href="css/cssmenu.htc">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript"></script>
<body>
<div>
<ul class="menuH decor1">
    <li style="margin-left:10px; float:left;"><a class="arrow" href="ProductsServlet?id=ELECTRONICS" >Electronics</a>
        <ul >
            <li><a href="ProductsServlet?id=MOBILES">Mobiles</a></li>
            <li><a href="ProductsServlet?id=TELEVISION">Televisions</a></li>
            <li><a href="ProductsServlet?id=WASHINGMACHINE">Washing Machines</a></li>
                            <li><a href="ProductsServlet?id=FRIDGE">Refrigerator</a></li>
                           
            
                </ul>
                  </li>
     <li><a href="ProductsServlet?id=MEN" class="arrow">Men</a>
                <ul>
                    <li><a href="ProductsServlet?id=MENJEAN">Jeans</a></li>
                    
                            <li><a href="ProductsServlet?id=MENTSHIRT">Shirts</a></li>
                            <li><a href="ProductsServlet?id=MENTROUSER">Trousers</a></li>
                            <li><a href="ProductsServlet?id=MENFOOTWEAR">Foot Wear</a></li>
                            
                </ul>
     </li>
     <li><a href="ProductsServlet?id=WOMEN" class="arrow">Women</a>
                <ul>
                    <li><a href="ProductsServlet?id=WOMENJEAN">Jeans</a></li>
                    
                            <li><a href="ProductsServlet?id=WOMENTSHIRT">Shirts</a></li>
                            <li><a href="ProductsServlet?id=WOMENTROUSER">Trousers</a></li>
                            <li><a href="ProductsServlet?id=WOMENFOOTWEAR">Foot Wear</a></li>
                            
                </ul>
     </li> 
      <li><a href="ProductsServlet?id=BOOKS" class="arrow">Books</a>
                <ul>
                    <li><a href="ProductsServlet?id=FICTION">Fiction</a></li>
                    
                            <li><a href="ProductsServlet?id=ENGINEERING">Engineering</a></li>
                            <li><a href="ProductsServlet?id=NOVEL">Novels</a></li>
                        
                            
                </ul>
     </li>  
     <li id="login"><a href="#5" class="arrow">Welcome <%=LoginBean.getEmail()%></a>
		<ul>
			<li><a>My Account</a></li>
			<li><a href="ProductsServlet?id=logout&from=<%=request.getRequestURL()+"?"+request.getQueryString()%>">Log Out</a></li>
		</ul>
	</li>
     
	<!--<li id="cart" ><a href="#cart-box" class="cart-window">My Cart</a>
		
	</li>
--></ul>
</div>




</body>
</html>