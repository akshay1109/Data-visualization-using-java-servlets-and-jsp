import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class controller
 */
@WebServlet("/controller")
public class controller extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String Trimester= req.getParameter("Trim");
        String graph = req.getParameter("graph");
        
        
        req.setAttribute("Trimester",Trimester);
        
        if(graph.equals("Bar Graph")) 
        {
        	String path = "Bargraph";
        	req.getRequestDispatcher("Bargraph.jsp").forward(req, res);
        }
        else if(graph.equals("Line Graph"))
        {
        	String path = "Line Graph";
        	req.getRequestDispatcher("Line2.jsp").forward(req, res);
        }
        else
        {
        	String path = "Pie Diagram";
        	req.getRequestDispatcher("PieChart.jsp").forward(req, res);
        }
    }
}
