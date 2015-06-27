package propertiesHandling;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Properties;

public class SaveProperties {
	public static void main(String[] args) {

		Properties insertProperties = new Properties();
		OutputStream out = null;
		try{
			out = new FileOutputStream("config.properties");
			insertProperties.setProperty("driver", "oracle.jdbc.driver.OracleDriver");
			insertProperties.setProperty("userName", "LIQ_HSBC5");
			insertProperties.setProperty("password", "LIQ_HSBC5");
			insertProperties.setProperty("connectionUrl", "jdbc:oracle:thin:@172.16.1.122:1521:LIQHSBC");
				
			insertProperties.store(out, null);
			
			
			
		}catch(IOException io)
		{
			System.out.println(io.getMessage());
		}
		finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	 
		}
	}

}