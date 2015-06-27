package shoppingkart;


import java.util.Vector;

public class RegistrationBean {
	private String address;
	private String fname;
	private String lname;
	private String email;
	private String password;
	private String repassword;
	private String mobno;
	private String dob;
	private int cust_status;
	private String cartid;
	private String sex;

	private Vector<String> messages = new Vector<String>();

	public RegistrationBean() {
		address = "";
		fname = "";
		lname = "";
		email = "";
		password = "";
		repassword = "";
		mobno = "";
		dob = "mm/dd/yyyy";
		cust_status = 1;
		cartid = "";
		sex = "";

	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCartid() {
		return cartid;
	}

	public void setCartid(String cartid) {
		this.cartid = getEmail();
	}

	public int getCust_status() {
		return cust_status;
	}

	public void setCust_status(int cust_status) {
		this.cust_status = cust_status;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname.trim();
	}

	public void isFname() {
		if (fname.equals(null) || fname.equals("")) {

			messages.add("Empty First Name");
		} else {
			if (!(fname.matches("[a-zA-z]+([ '-][a-zA-Z]+)*")))

			{
				messages.add("Not a valid first name");
				if (fname.length() < 4) {
					messages.add("Too Small First Name");

				}
			}
		}
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname.trim();
	}

	public void isLname() {
		if (lname.equals(null) || lname.equals(""))

		{

			messages.add("Empty Last Name");
		} else {

			if (!(lname.matches("[a-zA-z]+([ '-][a-zA-Z]+)*"))) {
				messages.add("Not a valid last name");
				if (lname.length() < 4) {
					messages.add("Too Small Last Name");
				}
			}
		}
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email.trim();
	}

	public void isEmail() {
		if (email.equals(null) || email.equals(""))

		{

			messages.add("Empty Email");
		} else {
			if (!(email
					.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})"))) {
				messages.add("Enter a valid Email.");
			}
		}
		/* if ((email.length() == 0) || (email.indexOf("@") < 2 ))
		   {
		       messages.add("Enter a valid email.");
		    }*/
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void isPassword() {
		/* final String str = 
		"((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})";*/
		if (password.equals(null) || password.equals("")) {

			messages.add("Empty Password");
		} else {

			if (!(password.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%?]).{6,20}"))) {
				messages.add("Enter a valid Password");
			}
		}
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public void isRepassword() {
		if (!(password.equals(repassword))) {
			messages.add("Password Do not match");
		}
	}

	public String getMobno() {
		return mobno;
	}

	public void setMobno(String mobno) {
		this.mobno = mobno;
	}

	public void isMobno() {

		if (!(getMobno().matches("\\d{10}"))) {
			messages.add("Enter 10 Digit mobile number");
		}

	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public void isDob() {

		if (dob.contains("mm/dd/yyyy")) {
			messages.add("Enter a valid date");
		}

	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address.trim();
	}

	public void isAddress() {
		//check for @ symbol somewhere in string
		/*if ((email.length() == 0) || (email.indexOf("@") < 2 )) {
		   messages.add("Enter a valid email.");
		}*/
		if (address.equals(null) || address.equals(""))

		{

			messages.add("Empty address");
		} else {
			if (address.length() < 6) {
				messages.add("Address should be 6 characters required");
			}
		}

	}

	public String[] getMessages() {

		isFname();
		isLname();
		isEmail();
		isPassword();
		isRepassword();
		isMobno();
		isDob();
		isAddress();

		return (String[]) messages.toArray(new String[0]);
	}

}
