<%@page import="org.omg.PortableInterceptor.ForwardRequest"%>
<% int ctr=Integer.parseInt(request.getParameter("counter")); %> 
<%
 if(session.getAttribute("currentUserSession") != null) { 
	response.sendRedirect("index.jsp"); 
 }else
 {
//out.print(ctr);
if(ctr==0)
{
	
ctr++;
%>
<style type="text/css">

#register {
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
  margin: 20px auto;
  border: 2px solid;
  border-radius: 10px;
  border-color: #1C415B;
  font-size: 16px;
}

</style>


 <form action="userinfo.jsp?counter=<%=ctr %>"   method="post">
 
<table id="register">

<tr><td>Name</td><td><input type="text" name="fname"  placeholder="John"> &nbsp;&nbsp;
                     <input type="text" name="lname" placeholder="Walker" >
            </td></tr>
<tr><td>Email</td><td><input type="text" name="email"  placeholder="JohnDoe@abc.com"></td></tr>
<tr><td>Password</td><td><input type="password" name="password" placeholder="*******"  ></td></tr>

<tr><td>Re-Password</td><td><input type="password" name="repassword" placeholder="*******"  ></td></tr>
<tr><td>Mobile Number</td><td><input type="text" name="mobno" placeholder="7895561235"></td></tr>

<tr><td>DOB</td><td><input type="date" name="dob" placeholder="(mm/dd/yyyy)" ></td></tr>
<tr><td>Gender</td><td><input type="radio" name="sex" value="Male" checked="checked">Male<input type="radio" name="sex" value="Female" >Female</td></tr>

<tr><td>Address</td><td><textarea name="address" placeholder="Enter Your Address(3 Lines)"></textarea></td></tr>

<tr align="center"><td colspan="2"><input type="submit" value="Register"/></td></tr>
</table> 
</form>

<% }
else
{//out.print(ctr);
%>

<jsp:useBean id="validBean" class="shoppingkart.RegistrationBean" scope="request">
   <jsp:setProperty name="validBean" property="*"/>
   </jsp:useBean>
<html>
<link rel="stylesheet" href="css/index.css">
  
   <style>
   #register {
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
  margin: 20px auto;
  border: 2px solid;
  border-radius: 10px;
  border-color: #1C415B;
  font-size: 16px;
}
</style>
 <body> 
<div id="mainpage"><!--  header file --> <jsp:include
	page="header.jsp"></jsp:include> <!-- menu file --> <jsp:include
	page="menu.jsp"></jsp:include>
	<div id="main">
      <!-- Any validation error messages -->
      <% String[] messages = validBean.getMessages();
      if (messages != null && messages.length > 0) {
         %>
         <b>Please change the following fields:</b>
         <ul>
            <%for (int i=0; i < messages.length; i++) {
            out.println("<li>" + messages[i] +
            "</li>");
          }%>
         </ul>
         
      <% } 
      else {
         //Valid form!
         //transfer data from validation bean to memory
     //  
        %>
     <jsp:forward page="ProductsServlet?id=newuser" />
    	
        
       <%   } %>

      <form action="userinfo.jsp?counter=<%=ctr%>" method="post">
        <table id="register">
        <tr><td>Name</td><td><input type="text" name="fname" placeholder="John" value='<jsp:getProperty name="validBean" property="fname" />'> &nbsp;&nbsp;
        
           <input type="text" name="lname" value='<jsp:getProperty name="validBean" property="lname" />' placeholder="Walker"></td></tr>
           
       <tr><td>Email</td><td><input type="text" name="email"  placeholder="JohnDoe@abc.com" value='<jsp:getProperty name="validBean" property="email" />' ></td></tr>
      <tr><td>Password</td><td><input type="password" name="password" placeholder="*******"   value='<jsp:getProperty name="validBean" property="password" />'  ></td></tr>

      <tr><td>Re-Password</td><td><input type="password" name="repassword" placeholder="*******"    value='<jsp:getProperty name="validBean" property="repassword" />'></td></tr>
        <tr><td>Mobile Number</td><td><input type="text" name="mobno" placeholder="7895561235" value='<jsp:getProperty name="validBean" property="mobno" />'></td></tr>
        
       <tr><td>DOB</td><td><input type="date" name="dob" placeholder="(mm/dd/yyyy)" value='<jsp:getProperty name="validBean" property="dob" />'></td></tr>
        <tr><td>Gender</td><td><input type="radio" name="sex" value="Male" checked="checked">Male<input type="radio" name="sex" value="Female" >Female</td></tr>
       <tr><td>Address</td><td><textarea name="address" placeholder="Enter Your Address(3 Lines)"><jsp:getProperty name="validBean" property="address" /></textarea>
        </td></tr>
         
        <tr align="center"><td colspan="2"> <input type="submit" value="Register"
         /></td></tr>
</table>

      </form>
      </div>

<!-- footer file --> <jsp:include page="footer.jsp"></jsp:include></div>


   </body>
</html>
<% }
}%>