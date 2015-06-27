package shoppingkart;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class ConnectionClass {

	static Connection con = null;
	static Statement stmt = null;
	static PreparedStatement ps = null;
	static PreparedStatement ps1 = null;
	static ResultSet rs = null;
	static boolean status;

	//Class to get Connection Object
	public static Connection getConnection()
	{
		try{
			System.out.println("inside connection try");
			Properties loadProperties=new Properties();
			InputStream in = ConnectionClass.class.getResourceAsStream("config.properties");
			loadProperties.load(in);
			
			Class.forName(loadProperties.getProperty("driver")); //register drivers.
			con = DriverManager.getConnection(loadProperties.getProperty("connectionUrl"),
					loadProperties.getProperty("userName"), 
					loadProperties.getProperty("password"));

		}catch(Exception e)
		{
			System.out.println("Inside Catch: "+e.getMessage());
		}

		return con;	
	}




}
