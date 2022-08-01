import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		Boolean bflag=false;
		
		String user=req.getParameter("uname");
		String password=req.getParameter("pass");
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
		
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/Akshay","root","root");
			  if(conn == null)
			    {
			    	out.println("Failed to establish the connection");
			    }
			  else
			  {
				  out.println(" connection established successfully");
			  }
			
			PreparedStatement ps1 = conn.prepareStatement("select prn,password from MCS_student");
			ResultSet rs = ps1.executeQuery();
		
			while (rs.next())
			{
				if(user.equals(rs.getString(1)) && password.equals(rs.getString(2)))
				{
					bflag=true;
//					 out.println("<hr>" + "</hr>");
//					 out.println("OK");
					 break;
				}
			}
		 	if(bflag==true)
			{
		 		Cookie c1= new Cookie("username",user);
		 		
		 		res.addCookie(c1);
				res.sendRedirect("http://localhost:8083/Data_Visualization/next.html");
			}
			else
			{
				res.sendRedirect("http://localhost:8083/Data_Visualization/login.html");
			}
			
		}
		catch(Exception e)
		{}
	}

}
