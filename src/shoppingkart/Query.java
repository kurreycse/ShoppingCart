package shoppingkart;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;


public class Query {
	
	static Connection con = null;
	static Statement stmt = null;
	static PreparedStatement ps = null;
	static PreparedStatement ps1 = null;
	static PreparedStatement ps2 = null;
	static ResultSet rs = null;
	static boolean status;
	static boolean flag;
	static ProductsBean proBean=null;
	static RegistrationBean userBean=null;
	static List<ProductsBean> listProducts=null;
	static List<RegistrationBean> listUsers=null;
	static CartBean cartBean=null;
	static List<CartBean> listCartItems=null;
		
	public static boolean validate(LoginBean lb, Properties loadQuery) throws SQLException
	{
		try{
			
			con = ConnectionClass.getConnection();
			
			ps = con.prepareStatement(loadQuery.getProperty("validateUser"));
			ps.setString(1,LoginBean.getEmail());  
			ps.setString(2,LoginBean.getPassword());
			
			ResultSet rs=ps.executeQuery();  
			status=rs.next();
				
	       }catch(Exception e)
		     {
	    	   System.out.println(e.getMessage());
		     }
	       if(status){
	    	  ps1 = con.prepareStatement(loadQuery.getProperty("registerLoginTime"));
	    	  ps1.setDate(1,LoginBean.getLoginTime());  
			  ps1.setString(2,LoginBean.getEmail());
			  int rows = ps1.executeUpdate();
			  System.out.println("rows updated "+rows);
	       }
		return status;
}
	
	public static boolean checkUser(RegistrationBean lb, Properties loadQuery) throws SQLException
	{	boolean status=false;
		try{
			
			con = ConnectionClass.getConnection();
			ps = con.prepareStatement(loadQuery.getProperty("checkUser"));
			ps.setString(1,lb.getEmail());  
			ResultSet rs=ps.executeQuery();  
			status=rs.next();
			System.out.println("status inside checkUser"+status);	
	       }catch(Exception e)
		     {
	    	   System.out.println(e.getMessage());
		     }
	       System.out.println("status inside checkUser"+status);	
		return status;
}
	public static boolean checkUserMobileNo(RegistrationBean lb, Properties loadQuery) throws SQLException
	{	boolean status=false;
		try{
			
			con = ConnectionClass.getConnection();
			ps = con.prepareStatement(loadQuery.getProperty("checkUserMobileNo"));
			ps.setString(1,lb.getEmail());  
			ps.setString(2, lb.getMobno());
			ResultSet rs=ps.executeQuery();  
			status=rs.next();
			System.out.println("status inside checkUserMobileNo"+status);	
	       }catch(Exception e)
		     {
	    	   System.out.println(e.getMessage());
		     }
	       System.out.println("status inside checkUserMobileNo"+status);	
		return status;
}
	public static boolean checkUserDob(RegistrationBean lb, Properties loadQuery) throws SQLException
	{	boolean status=false;
		try{
			
			java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(lb.getDob());
			con = ConnectionClass.getConnection();
			ps = con.prepareStatement(loadQuery.getProperty("checkUserDob"));
			ps.setString(1,lb.getEmail());  
			ps.setString(2, lb.getMobno());
			ps.setDate(3, new java.sql.Date(date.getTime()));
			ResultSet rs=ps.executeQuery();  
			status=rs.next();
			System.out.println("status inside checkUser"+status);	
	       }catch(Exception e)
		     {
	    	   System.out.println(e.getMessage());
		     }
	       System.out.println("status inside checkUser"+status);	
		return status;
}
	public static String fetchUserPassword(RegistrationBean lb, Properties loadQuery) throws SQLException
	{	String pass="";
		try{
			
			con = ConnectionClass.getConnection();
			ps = con.prepareStatement(loadQuery.getProperty("checkUser"));
			ps.setString(1,lb.getEmail());  
			ResultSet rs=ps.executeQuery();  
			while(rs.next())
			{
				pass = rs.getString("password");
			}
			
				
	       }catch(Exception e)
		     {
	    	   System.out.println(e.getMessage());
		     }
	       System.out.println("status inside fetchUserPassword"+pass);
		return pass;
}
	public static boolean registerLogoutTime(LoginBean lb, Properties loadQuery) throws SQLException
	{
		try{
			
			con = ConnectionClass.getConnection();
			
			ps = con.prepareStatement(loadQuery.getProperty("registerLogoutTime"));
			ps.setDate(1,LoginBean.getLogoutTime());  
			ps.setString(2,LoginBean.getEmail());
			
			ps.executeUpdate();  
				
	       }catch(Exception e)
		     {
	    	   System.out.println(e.getMessage());
		     }
		return status;
}
	
	public static boolean register(RegistrationBean rb, Properties loadQuery) throws SQLException
	{
		int row1=0, row2=0;
	
		try{
			con = ConnectionClass.getConnection();
			
			ps = con.prepareStatement(loadQuery.getProperty("insertCustomer"));
			ps1 = con.prepareStatement(loadQuery.getProperty("registerCustomer"));
			System.out.println("email"+rb.getEmail());
			 
			java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(rb.getDob());
			
			ps.setString(1,rb.getEmail());
			ps.setString(2,rb.getFname());
			ps.setString(3,rb.getLname());
			ps.setString(4,rb.getMobno());
			ps.setString(5,rb.getAddress());
			ps.setDate(6, new java.sql.Date(date.getTime()));
			ps.setString(7,rb.getSex());
			ps.setInt(8,rb.getCust_status());
			ps.setString(9,rb.getCartid());
			
			ps1.setString(1,rb.getEmail());  
			ps1.setString(2,rb.getPassword());
			ps1.setString(3,null);
			ps1.setString(4,null);
			
			System.out.println("Before Result"+status);
			try{
			row1=ps.executeUpdate();
			row2=ps1.executeUpdate();}
			catch (SQLException e) {
				System.out.println("Inside Catch :"+e.getMessage());
			}
			System.out.println("status"+status);
			System.out.println("Inside Register : "+row1+":"+row2);
			if(row1>0 && row2>0)
			{
				status=true;
			}
			
	       }catch(Exception e)
		     {
			System.out.println(e.getMessage());
		     }
		return status;
}
	

	
	public static List<ProductsBean> retrieveProducts(Properties loadQuery, String productType) throws SQLException
	{
		try{
			
			System.out.println("inside retrieve products");
			con = ConnectionClass.getConnection();
			if( productType.equals("ELECTRONICS")|| productType.equals("MEN") || productType.equals("WOMEN")||productType.equals("BOOKS"))
			{
				System.out.println("inside category");
				ps = con.prepareStatement(loadQuery.getProperty("fetchProducts"));
			}else{
				System.out.println("inside subcategory");
				ps = con.prepareStatement(loadQuery.getProperty("fetchProductsCategory"));
			}
			System.out.println("product type "+productType);
			ps.setString(1,productType);
			//ps = con.prepareStatement(loadQuery.getProperty("fetchElectronicProductsDummy"));
			rs = ps.executeQuery();  
			System.out.println("after execute query()");
			
			listProducts = new ArrayList<ProductsBean>();
			while(rs.next())
			{ System.out.println(rs.getString("product_id"));
				proBean = new ProductsBean();
				proBean.setProductId(rs.getString("product_id"));
				proBean.setProductBrand(rs.getString("product_brand"));
				proBean.setProductCategory(rs.getString("product_category"));
				proBean.setProductCost(rs.getDouble("product_cost"));
				proBean.setProductFeature(rs.getString("product_feature"));
				proBean.setProductImage(rs.getBlob("product_image"));
				proBean.setProductName(rs.getString("product_name"));
				proBean.setProductRating(rs.getInt("product_rating"));
				proBean.setProductImageUrl(rs.getString("product_image_path"));
				proBean.setProductTime(rs.getDate("time"));
				proBean.setVendorId(rs.getString("vendor_id"));
				listProducts.add(proBean);
				System.out.println(proBean.getProductId()+":"+proBean.getProductName()+": "+proBean.getProductImage());
			}
				
	       }catch(Exception e)
		     {
	    	   System.out.println(e.getMessage());
		     }
	       return listProducts;
    }
	
	
	public static List<CartBean> retrieveCartItems(Properties loadQuery, LoginBean cb) throws SQLException
	{
		List<CartBean> listCartItems= new ArrayList<CartBean>();
		try{
			
			System.out.println("inside retrieve cart");
			con = ConnectionClass.getConnection();
			System.out.println(LoginBean.getEmail());
			
			ps = con.prepareStatement(loadQuery.getProperty("fetchCartItems"));
			ps.setString(1,cb.getEmail());
			rs = ps.executeQuery();  
			System.out.println("after execute query()");
			
			
			System.out.println("before adding to list listCartItems :"+listCartItems);
			while(rs.next())
			{ 	System.out.println(rs.getString("product_id")+":"+rs.getDouble("product_cost")+rs.getString("product_image_path"));
				cartBean = new CartBean();
				System.out.println(rs.getString("cart_id"));
				cartBean.setCart_id(rs.getString("cart_id"));
				cartBean.setProduct_name(rs.getString("product_name"));
				cartBean.setProduct_cost(rs.getDouble("product_cost"));
				cartBean.setProduct_id(rs.getString("product_id"));
				cartBean.setQuantity(rs.getInt("quantity"));
				cartBean.setProduct_image_path(rs.getString("product_image_path"));
				listCartItems.add(cartBean);
				//System.out.println(cartBean.getProduct_id()+":"+cartBean.getCart_id()+": "+cartBean.getQuantity());
			}
			System.out.println("after adding to list listCartItems :"+listCartItems);	
	       }catch(Exception e)
		     {
	    	   System.out.println(e.getMessage());
		     }
	       return listCartItems;
    }
	
	
	public static boolean insertCartItems( Properties loadQuery,CartBean cb) throws SQLException
	{
		int row1=0, row2=0;
		boolean status=false;
		try{
			System.out.println("inside cart items");
			con = ConnectionClass.getConnection();
			ps1= con.prepareStatement(loadQuery.getProperty("fetchCartItems"));
			ps1.setString(1,cb.getCart_id());
			rs= ps1.executeQuery();
			while(rs.next()){
				if( rs.getString("product_id").equals(cb.getProduct_id()))
				{
					ps2 = con.prepareStatement(loadQuery.getProperty("updateCartItem"));
					ps2.setString(1, cb.getCart_id());
					ps2.setString(2, cb.getProduct_id());
					row2=ps2.executeUpdate();
				}
			}
			
			if( row2==0)
			{
			ps = con.prepareStatement(loadQuery.getProperty("insertCartItems"));
			System.out.println("email: "+cb.getCart_id());
			Date date = new Date();
			System.out.println(date+"   :  "+cb.getCart_id());
			ps.setString(1,cb.getCart_id());
			ps.setString(2,cb.getProduct_id());
			ps.setInt(3,cb.getQuantity());
			ps.setDouble(4,cb.getProduct_cost());
			ps.setDate(5, new java.sql.Date(date.getTime()));
			ps.setString(6,cb.getStatus());
			System.out.println("Before Result :"+status);
			try{
				row1=ps.executeUpdate();
			   }
			catch (SQLException e) {
				System.out.println("Inside Catch :"+e.getMessage());
			}
			
			System.out.println("Inside insertCartItems rows : "+row1);
			if(row1>0 )
			{
				status=true;
			}
			System.out.println(" after row1 value status: "+status);
	       }
		}catch(Exception e)
		     {
			System.out.println(e.getMessage());
		     }	       
		return status;
}

	
	public static List<RegistrationBean> fetchUserDetails(Properties loadQuery) throws SQLException
	{
		try{
			
			System.out.println("inside fetchUserDetails");
			con = ConnectionClass.getConnection();
			ps = con.prepareStatement(loadQuery.getProperty("fetchUserDetails"));
			ps.setString(1,LoginBean.getEmail());
			//ps = con.prepareStatement(loadQuery.getProperty("fetchElectronicProductsDummy"));
			rs = ps.executeQuery();  
			System.out.println("after execute query()");
			
			listUsers = new ArrayList<RegistrationBean>();
			while(rs.next())
			{ 	System.out.println(rs.getString("email_id"));
				userBean = new RegistrationBean();
				userBean.setAddress(rs.getString("address"));
				userBean.setCartid(rs.getString("cart_id"));
				userBean.setEmail(rs.getString("email_id"));
				userBean.setFname(rs.getString("first_name"));
				userBean.setLname(rs.getString("last_name"));
				userBean.setMobno(rs.getString("mobile_no"));
				listUsers.add(userBean);
				
			}
				
	       }catch(Exception e)
		     {
	    	   System.out.println(e.getMessage());
		     }
	       return listUsers;
    }
	
	public static boolean updateUserAddress(Properties loadQuery, String userAddress) throws SQLException
	{
		int row1=0;
		
		try{
			con = ConnectionClass.getConnection();
			System.out.println("inside updateUserAddress !!!!!!!!!!!");
			ps = con.prepareStatement(loadQuery.getProperty("updateUserAddress"));
			ps.setString(1, userAddress);
			ps.setString(2, LoginBean.getEmail());
			try{
			row1=ps.executeUpdate();
			System.out.println("Between two executeUpdates");
			System.out.println("after ps1 update");
			  }
			catch (SQLException e) {
				System.out.println("Inside Catch :"+e.getMessage());
			}
			System.out.println("Inside updateUserAddress : "+row1+"----->");
			if(row1>0  )
			{
				flag=true;
			}
			System.out.println("flag------------------------->>>"+flag);
	       }catch(Exception e)
		     {
			System.out.println(e.getMessage());
		     }	       
		return flag;
    }
	public static List<ProductsBean>  SearchProducts(Properties loadQuery, String product_name) throws SQLException
	{
		con = ConnectionClass.getConnection();
		ps = con.prepareStatement(loadQuery.getProperty("searchProduct"));
		System.out.println(product_name);
		
		ps.setString(1,"%"+product_name+"%");
		System.out.println("After Set");
		ResultSet rs=ps.executeQuery();
		System.out.println("before execute query()");
		
		listProducts = new ArrayList<ProductsBean>();
		while(rs.next())
		{ System.out.println(rs.getString("product_id"));
			proBean = new ProductsBean();
			
			proBean.setProductBrand(rs.getString("product_brand"));
			
			proBean.setProductCost(rs.getDouble("product_cost"));
			proBean.setProductFeature(rs.getString("product_feature"));
			proBean.setProductImage(rs.getBlob("product_image"));
			proBean.setProductName(rs.getString("product_name"));
			
			proBean.setProductImageUrl(rs.getString("product_image_path"));
			
			listProducts.add(proBean);
			System.out.println(proBean.getProductId()+":"+proBean.getProductName()+": "+proBean.getProductImage());
		}
			
       
       return listProducts;
	}


}
