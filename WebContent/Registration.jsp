<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="RegistrationServlet" name="StudentRegistration" method="post">

<table cellpadding="2" width="40%"  align="center"
cellspacing="2">

<tr>
<td colspan=2>
<center><font size=4><b>Customer Registration Form</b></font></center>
</td>
</tr>

<tr>
<td>Name</td>
<td><input type=text name=uname id="textname" size="30"></td>
</tr>
<tr>
<td>Email Id</td>
<td><input type="text" name="emailid" id="emailid" size="30"></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" name="password" id="pass" size="30"></td>
</tr>
<tr>
<td>Re-Password</td>
<td><input type="password" name="repassword" id="re-pass" size="30"></td>
</tr>
<tr>
<td><input type="reset"></td>
<td colspan="2"><input type="submit" value="Submit Form" /></td>
</tr>
</table>
</form>
</body>
</html>