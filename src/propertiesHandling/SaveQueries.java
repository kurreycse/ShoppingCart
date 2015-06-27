package propertiesHandling;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Properties;

public class SaveQueries {
	public static void main(String[] args) {

		Properties insertProperties = new Properties();
		OutputStream out = null;
		try{
			out = new FileOutputStream("sql.properties");
			
			insertProperties.setProperty("validateUser","select * from SK_Login where EMAIL = ? AND PASSWORD= ?");
			insertProperties.setProperty("registerUser","insert into SK_Registration values(?,?,?,?,?,?,?,?,?)");
			insertProperties.setProperty("insertLogin","insert into SK_Login values(?,?)");
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