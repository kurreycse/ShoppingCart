package shoppingkart;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class for Servlet: ElectronicsServlet
 *
 */
 public class ProductsServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    static Properties loadQuery = null;
	static InputStream inputQuery = null;
	static List<ProductsBean> listProducts;
	 List<CartBean> listCartItems;
	 static List<ProductsBean> listProductsSearch;
	static List<RegistrationBean> listUsers;
	HttpSession session = null;
	static RegistrationBean userBean= new RegistrationBean();;
	
	
	private boolean status;
	
	@Override
	public void init() throws ServletException {
		
		super.init();
		loadQuery = new Properties();
		inputQuery =  this.getClass().getResourceAsStream("sql.properties");
		try {
			loadQuery.load(inputQuery);
		} catch (IOException e) {
			System.out.println("Inside catch init: "+ e.getMessage());
		}
		
	}
   
	public ProductsServlet() {
		super();
	}   	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		System.out.println("inside ProductsServlet");
		String id = request.getParameter("id");
		System.out.println(id);
		if( id.equals(null))
		{
			response.sendRedirect("error.jsp");
		}else if( id.equals("logout"))
		{
			String url = request.getParameter("from");
			System.out.println("url ---->"+url);
			try{
				session = request.getSession(false);
				System.out.println("User="+session.getAttribute("currentUserSession"));
				if(session != null){
					
					if(session.getAttribute("listCartItems")!= null){
						System.out.println("inside listCartitems in session");
						List<CartBean> listCart = new ArrayList<CartBean>();
						listCart =(List<CartBean>)session.getAttribute("listCartItems");
						Iterator<CartBean> itr = listCart.iterator();
						while (itr.hasNext()) {
							CartBean cartBean;
				   			cartBean = itr.next();
				   			cartBean.setCart_id(LoginBean.getEmail());
							cartBean.setProduct_cost(cartBean.getProduct_cost());
							cartBean.setProduct_id(cartBean.getProduct_id());
							cartBean.setProduct_image_path(cartBean.getProduct_image_path());
							cartBean.setQuantity(cartBean.getQuantity());
							cartBean.setStatus("1");
							Query.insertCartItems(loadQuery,cartBean);
							System.out.println("inside while inserting cart items");
						}
						listCart.clear();
						listCartItems.clear();
					}
					
					
					
					session.removeAttribute("listCartItems");
					Date date = new Date();
					java.sql.Date sqlDate = new java.sql.Date(date.getTime());
					LoginBean userLoginBean =new LoginBean();
					LoginBean.setLogoutTime(sqlDate);
					try
					{	Query.registerLogoutTime(userLoginBean, loadQuery);
					session.invalidate();
					}catch(Exception e){
						System.out.println(e.getMessage());
					}
					
				}
				
				response.sendRedirect(url);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("cartDetails"))
		{
			try{
				System.out.println("inside try cart");
				session = request.getSession(false);
				session.setAttribute("listCartItems",null);
				LoginBean cartBean=new LoginBean();
				List<CartBean> listCart = new ArrayList<CartBean>();
				listCart = Query.retrieveCartItems(loadQuery, cartBean);
				System.out.println("inside cartDetails"+listCart);
				session.setAttribute("listCartItems", listCart);
				/*if(request.getAttribute("Address")!= null){
					request.setAttribute("Address", "<center><h3>Your Order has been placed Successfully.</h3></center>");
					System.out.println("---------------------");
				}*/
				RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("listCartItems"))
		{
			try{
				System.out.println("inside try ProductsServletListcartitems");
				session = request.getSession(false);
				session.setAttribute("listCartItems",null);
				LoginBean cartBean=new LoginBean();
				List<CartBean> listCart = new ArrayList<CartBean>();
				listCart  = Query.retrieveCartItems(loadQuery, cartBean);
				session.setAttribute("listCartItems", listCart);
				RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
				rd.include(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("addToCart"))
		{
			List<CartBean> listCart = new ArrayList<CartBean>(); 
			session = request.getSession(false);
			if (session.getAttribute("currentUserSession") != null) {
			
			  try{
				System.out.println("inside add to cart");
				CartBean cartBean=new CartBean();
				String str1=request.getParameter("item");
				System.out.println(str1);
				String str2[]=str1.split("polaris");
				cartBean.setCart_id(LoginBean.getEmail());
				cartBean.setProduct_name(str2[0]);
				cartBean.setProduct_cost((Double.parseDouble(request.getParameter("totalCostHidden"))));
				System.out.println(cartBean.getProduct_cost());
				//cartBean.setProduct_cost((Double.parseDouble(str2[1])));
				cartBean.setProduct_id(str2[4]);
				cartBean.setProduct_image_path(str2[2]);
				cartBean.setQuantity(Integer.parseInt(request.getParameter("quantityHidden")));
				System.out.println(cartBean.getQuantity());
				//Adding the new item in listCartItems of session and forwarding to the result.jsp
				if( session.getAttribute("listCartItems")!= null){
					
					listCart = (List<CartBean>)session.getAttribute("listCartItems");
					System.out.println("listcartitems:  "+listCart);
				}/*else{
					listCartItems = new ArrayList<CartBean>();
				}*/
				
				if(	listCart.contains(cartBean) ){
					
				}else{
				listCart.add(cartBean);
				System.out.println("listcartitems:  "+listCart);
				session.setAttribute("listCartItems",null);
				System.out.println("set null in listCartItems attribute");
				session.setAttribute("listCartItems", listCart);
				}
				System.out.println("added attribute"+cartBean.getProduct_name()+"   ---    "+listCart);
				RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
				rd.forward(request, response);
				/*status=Query.insertCartItems(loadQuery,cartBean);
				if(status)
				{
				
				RequestDispatcher rd = request.getRequestDispatcher("ProductsServlet?id=cartDetails");
				rd.forward(request, response);
				}*/
			   }catch(Exception e)
			   	{
				   System.out.println("Error in ProductsServlet : "+e.getMessage());
			   	}
			}else{
				System.out.println("Else of addtocart"+request.getRequestURL()+"?"+request.getQueryString());
				/*request.setAttribute("LoginMessage", "Please login to continue.");
				RequestDispatcher rd = request.getRequestDispatcher("productDescription.jsp"+"?"+request.getQueryString());
				rd.include(request, response);*/
			}
		}else if( id.equals("placeOrder"))
		{
			try{
				
				System.out.println("inside place Order");
				listUsers= Query.fetchUserDetails(loadQuery);
				request.setAttribute("listUsers", listUsers);
				RequestDispatcher rd = request.getRequestDispatcher("placeOrder.jsp");
				rd.forward(request, response);
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("productBean"))
		{
			try{
				session = request.getSession(false);
				System.out.println("inside try proBean");
				ProductsBean pb = (ProductsBean)session.getAttribute("productBean");
				System.out.println(pb.getProductFeature());
				RequestDispatcher rd = request.getRequestDispatcher("productDescription.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("ELECTRONICS"))
		{
			try{
				System.out.println("inside try Electronics");
				listProducts = Query.retrieveProducts(loadQuery,"ELECTRONICS");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.include(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("MOBILES") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "MOBILES");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("FRIDGE") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "FRIDGE");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("WASHINGMACHINE") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "WASHINGMACHINE");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("TELEVISION") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "TELEVISION");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}
		else if( id.equals("MEN") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "MEN");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.include(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("MENTSHIRT") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "MENTSHIRT");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("MENTROUSER") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "MENTROUSER");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("MENJEAN") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "MENJEAN");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("MENFOOTWEAR") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "MENFOOTWEAR");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}
		
		
		else if( id.equals("WOMEN") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "WOMEN");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.include(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}
		else if( id.equals("WOMENTSHIRT") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "WOMENTSHIRT");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("WOMENTROUSER") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "WOMENTROUSER");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("WOMENJEAN") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "WOMENJEAN");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("WOMENFOOTWEAR") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "WOMENFOOTWEAR");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}
		else if( id.equals("BOOKS") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "BOOKS");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.include(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("NOVEL") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "NOVEL");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("FICTION") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "FICTION");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("ENGINEERING") )
		{
			try{
				listProducts = Query.retrieveProducts(loadQuery, "ENGINEERING");
				request.setAttribute("listProducts", listProducts);
				RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
				rd.forward(request, response);
				
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}
	
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("inside ProductsServlet");
		String id = request.getParameter("id");
		System.out.println(id);
		
		if( id.equals("login") )
		{
			System.out.println();
			String url = request.getParameter("from");
			System.out.println("url ---->"+url);
			PrintWriter out = response.getWriter();
			Date date = new Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			System.out.println(sqlDate.getTime());
			LoginBean userLoginBean =new LoginBean();
			LoginBean.setEmail(request.getParameter("userEmail"));
			LoginBean.setPassword(request.getParameter("password"));
			LoginBean.setLoginTime(sqlDate);
			
			try{
			
				status=Query.validate(userLoginBean, loadQuery);
				if(status){
					session = request.getSession(true);
					session.setAttribute("currentUserSession", userLoginBean);
					try{
						System.out.println("login cart");
						/*if(session.getAttribute("listCartItems")!= null){
							session.removeAttribute("listCartItems");
							System.out.println("removed old listCartitems at login");
						}*/
						System.out.println("listCartItems : "+listCartItems);
						//error listcart is always getting no result (check!!!)
						
						listCartItems = Query.retrieveCartItems(loadQuery, userLoginBean);
						System.out.println("after executing query listCart :"+listCartItems);
						session.setAttribute("listCartItems", listCartItems);
						//request.setAttribute("listCartItems", listCartItems);	
					}catch(Exception e)
					{
						System.out.println("Error in CartServlet : "+e.getMessage());
					}
					System.out.println("Login Servlet "+userLoginBean);
					response.sendRedirect(url);
				}
				else{
				
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//					out.println("<b>UserName or Password is wrong!</b>");
					request.setAttribute("LoginError", "Username or Password incorrect.");
					rd.forward(request, response);
				}
				
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
			
			
		}else if( id.equals("newuser")){
			
			System.out.println("Inside Registration Servlet");		
			PrintWriter out = response.getWriter();
			
			RegistrationBean registeruserBean=new RegistrationBean();
			registeruserBean.setFname(request.getParameter("fname"));
			registeruserBean.setLname(request.getParameter("lname"));
			registeruserBean.setEmail(request.getParameter("email"));
			registeruserBean.setPassword(request.getParameter("password"));
			registeruserBean.setMobno(request.getParameter("mobno"));
			registeruserBean.setDob(request.getParameter("dob"));
			registeruserBean.setSex(request.getParameter("sex"));
			registeruserBean.setAddress(request.getParameter("address"));
			registeruserBean.setCartid(request.getParameter("email"));
			registeruserBean.setCust_status(1);
			try{
			    status = Query.register(registeruserBean, loadQuery);
			
			if(status)
			{
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				out.println("<b>Registration Unsuccessful</b>");
				rd.include(request, response);
			}
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}else if( id.equals("address"))
		{
			try{
				
				System.out.println("inside address");
				session = request.getSession(false);
				listCartItems=(List<CartBean>)session.getAttribute("listCartItems");
				System.out.println("when address given: listcartitems"+listCartItems);
				
				Iterator<CartBean> itr = listCartItems.iterator();
				while (itr.hasNext()) {
					CartBean cartBean;
		   			cartBean = itr.next();
		   			System.out.println("cartBean:"+LoginBean.getEmail()+cartBean.getProduct_cost()+cartBean.getProduct_id()
		   					+cartBean.getProduct_image_path()+cartBean.getProduct_name()+cartBean.getQuantity());
		   			cartBean.setCart_id(LoginBean.getEmail());
					cartBean.setProduct_cost(cartBean.getProduct_cost());
					cartBean.setProduct_id(cartBean.getProduct_id());
					cartBean.setProduct_image_path(cartBean.getProduct_image_path());
					cartBean.setProduct_name(cartBean.getProduct_name());
					cartBean.setQuantity(cartBean.getQuantity());
					cartBean.setStatus("0");
					// handle status return variable accordingly
					Query.insertCartItems(loadQuery,cartBean);
				}
				listCartItems.clear();
				System.out.println("after clearing listcartitems : "+listCartItems);
				session.setAttribute("listCartItems",null);
				
				String userAddress = request.getParameter("fname")+"#"+request.getParameter("lname")+"#"+request.getParameter("email")+
					"#"+request.getParameter("mobno")+"#"+request.getParameter("address");
				System.out.println("Updated User Address :"+userAddress);
				boolean flag=Query.updateUserAddress(loadQuery, userAddress);
				if(flag){
					System.out.println("inside if flag---------->>>>");
					//HttpSession sess = request.getSession(false);
					//sess.removeAttribute("listCartItems");
					//request.setAttribute("Address", "<center><h3>Your Order has been placed Successfully.</h3></center>");
					System.out.println("address attribute set");
					//RequestDispatcher rd= request.getRequestDispatcher("ProductsServlet?cartDetails");
					RequestDispatcher rd = request.getRequestDispatcher("orderSuccess.jsp");
					rd.forward(request, response);

				}else{
					RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
					rd.forward(request, response);
				}
			}catch(Exception e)
			{
				System.out.println("Error in ProductsServlet : "+e.getMessage());
			}
		}else if( id.equals("checkUserEmail")){
			
			System.out.println("Inside checkUserEmail ProductsServlet");		
			PrintWriter out = response.getWriter();
			userBean.setEmail(request.getParameter("object"));
			try{
			    status = Query.checkUser(userBean, loadQuery);
			    if(status)
			    {
			    	out.print("authenticUser");
				}else
				{
					out.print("error");
				}
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}else if( id.equals("checkUserMobileNo")){
			
			System.out.println("Inside checkUserMobileNo ProductsServlet");		
			PrintWriter out = response.getWriter();
			userBean.setMobno(request.getParameter("object"));
			try{
			    status = Query.checkUserMobileNo(userBean, loadQuery);
			    if(status)
			    {
			    	out.print("authenticMobileNo");
				}else
				{
					out.print("error");
				}
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}else if( id.equals("checkUserDob")){
			
			System.out.println("Inside checkUserDob ProductsServlet");		
			PrintWriter out = response.getWriter();
			userBean.setDob(request.getParameter("object"));
			try{
			    status = Query.checkUserDob(userBean, loadQuery);
			    if(status)
			    {
			    	out.print("authenticDob");
				}else
				{
					out.print("error");
				}
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}else if( id.equals("fetchPassword")){
			String userPassword="";
			System.out.println("Inside fetchPassword ProductsServlet");		
			PrintWriter out = response.getWriter();
			userBean.setEmail(request.getParameter("object"));
			try{
			  userPassword = Query.fetchUserPassword(userBean, loadQuery);
			  System.out.println("user password in servlet "+userPassword );
			   out.print(userPassword);
				
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}else if( id.equals("addToCart"))
		{
			List<CartBean> listCart = new ArrayList<CartBean>(); 
			session = request.getSession(false);
			if (session.getAttribute("currentUserSession") != null) {
			
				double cost = Double.parseDouble(request.getParameter("totalCostHidden"));
				System.out.println(cost+"--------------------------");
			  try{
				System.out.println("inside add to cart");
				CartBean cartBean=new CartBean();
				String str1=request.getParameter("item");
				System.out.println(str1);
				String str2[]=str1.split("polaris");
				cartBean.setCart_id(LoginBean.getEmail());
				cartBean.setProduct_name(str2[0]);
				cartBean.setProduct_cost((Double.parseDouble(request.getParameter("totalCostHidden"))));
				System.out.println(cartBean.getProduct_cost());
				//cartBean.setProduct_cost((Double.parseDouble(str2[1])));
				cartBean.setProduct_id(str2[4]);
				cartBean.setProduct_image_path(str2[2]);
				cartBean.setQuantity(Integer.parseInt(request.getParameter("quantityHidden")));
				System.out.println(cartBean.getQuantity());
				//Adding the new item in listCartItems of session and forwarding to the result.jsp
				if( session.getAttribute("listCartItems")!= null){
					
					listCart = (List<CartBean>)session.getAttribute("listCartItems");
					System.out.println("listcartitems:  "+listCart);
				}/*else{
					listCartItems = new ArrayList<CartBean>();
				}*/
				
				if(	listCart.contains(cartBean) ){
					
				}else{
				listCart.add(cartBean);
				System.out.println("listcartitems:  "+listCart);
				session.setAttribute("listCartItems",null);
				System.out.println("set null in listCartItems attribute");
				session.setAttribute("listCartItems", listCart);
				}
				System.out.println("added attribute"+cartBean.getProduct_name()+"   ---    "+listCart);
				RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
				rd.forward(request, response);
				/*status=Query.insertCartItems(loadQuery,cartBean);
				if(status)
				{
				
				RequestDispatcher rd = request.getRequestDispatcher("ProductsServlet?id=cartDetails");
				rd.forward(request, response);
				}*/
			   }catch(Exception e)
			   	{
				   System.out.println("Error in ProductsServlet : "+e.getMessage());
			   	}
			}else{
				System.out.println("Else of addtocart"+request.getRequestURL()+"?"+request.getQueryString());
				/*request.setAttribute("LoginMessage", "Please login to continue.");
				RequestDispatcher rd = request.getRequestDispatcher("productDescription.jsp"+"?"+request.getQueryString());
				rd.include(request, response);*/
			}
		}else if( id.equals("search") )
			{
				try{
					int flagSearch = 0;
					String product_name=request.getParameter("str");
					System.out.println(product_name);
				    listProductsSearch = Query.SearchProducts(loadQuery, product_name);
				    if( listProductsSearch.isEmpty())
				    {
				    	flagSearch = 0;
				    }
				    else {
						flagSearch = 1;
					}
				    request.setAttribute("flagSearch", flagSearch);
					System.out.println(listProductsSearch);
					request.setAttribute("listProductsSearch", listProductsSearch);
					RequestDispatcher rd = request.getRequestDispatcher("SearchResults.jsp");
					rd.forward(request, response);
					
				}catch(Exception e)
				{
					System.out.println("Error in ProductsServlet : "+e.getMessage());
				}
			}
		
		
		
	}  	
	   	  	    
}