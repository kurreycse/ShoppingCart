package shoppingkart;

import java.sql.Date;

import shoppingkart.LoginBean;

public class LoginBean {

	private static String email;
	private static String password;
	private static Date loginTime;
	private static Date logoutTime;
	

	public static String getEmail() {
		return email;
	}
	public static void setEmail(String email) {
		LoginBean.email = email;
	}
	public static String getPassword() {
		return password;
	}
	public static void setPassword(String password) {
		LoginBean.password = password;
	}
	public static Date getLoginTime() {
		return loginTime;
	}
	public static void setLoginTime(Date loginTime) {
		LoginBean.loginTime = loginTime;
	}
	public static Date getLogoutTime() {
		return logoutTime;
	}
	public static void setLogoutTime(Date logoutTime) {
		LoginBean.logoutTime = logoutTime;
	}






}

