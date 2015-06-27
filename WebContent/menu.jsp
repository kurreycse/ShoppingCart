<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script type="text/javascript">
$(document).ready(function() {
	$('a.login-window').click(function() {
	    
	            //Getting the variable's value from a link 
	    var loginBox = $(this).attr('href');

	    //Fade in the Popup
	    $(loginBox).fadeIn(300);
	    
	    //Set the center alignment padding + border see css style
	    var popMargTop = ($(loginBox).height() + 24) / 2; 
	    var popMargLeft = ($(loginBox).width() + 24) / 2; 
	    
	    $(loginBox).css({ 
	        'margin-top' : -popMargTop,
	        'margin-left' : -popMargLeft
	    });
	    
	    // Add the mask to body
	    $('body').append('<div id="mask"></div>');
	    $('#mask').fadeIn(300);
	    
	    return false;
	});

	// When clicking on the button close or the mask layer the popup closed
	$('a.close, #mask').live('click', function() { 
	  $('#mask , .login-popup').fadeOut(300 , function() {
	    $('#mask').remove();  
	}); 
	return false;
	});
	});

</script>




<body>
<div > 
 
 
 
 
 <!-- <ul id="nav">
      <li><a href="#">Electronics</a></li>
      <li><a href="#">Men</a></li>
      <li><a href="#">Women</a></li>
      <li><a href="#">Books</a></li>
      <li><a href="#">Offers</a></li>
     <li id="login"><a href="#login-box" class="login-window">Login / Sign In</a></li>
     </ul>
           -->



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
            
    <li id="login" ><a href="#login-box" class="login-window" >Login / Sign In</a></li>
</ul>







<div id="login-box" class="login-popup">
<a href="#" class="close"><img src="images/close.png" class="btn_close" title="Close Window" alt="Close" /></a>

<%
String uri = request.getScheme() + "://" +
request.getServerName() + 
("http".equals(request.getScheme()) && request.getServerPort() == 80 || "https".equals(request.getScheme()) && request.getServerPort() == 443 ? "" : ":" + request.getServerPort() ) +
request.getRequestURI() +
(request.getQueryString() != null ? "?" + request.getQueryString() : "");

%>


  <form method="post" class="signin" action="ProductsServlet?id=login&from=<%=request.getRequestURL()+"?"+request.getQueryString()%>" name="login">
        <fieldset class="textbox">
        <label class="username">
        <span>Email Id:</span>
        <input id="username" name="userEmail" value="" type="text" autocomplete="on" placeholder="Username">
        </label>
        <label class="password">
        <span>Password:</span>
        <input id="password" name="password" value="" type="password" placeholder="Password">
        </label>
        <input type="hidden" name="from" value="<%=request.getParameter("from")%>">
        
        <button class="submit button" type="submit">Sign in</button>
        <p>
        <a class="forgot" href="ForgotPass.jsp">Forgot your password?</a> &nbsp; <a class="forgot" href="signup.jsp">Sign Up</a>
        </p>        
        </fieldset>
  </form>
</div>
               
     
		
</div>
</body>
</html>