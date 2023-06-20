package com.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.book.dao.DbConnect;

/**
 * Servlet implementation class CheckDuplicateEmail
 */
@WebServlet("/CheckDuplicateEmail")
public class CheckDuplicateEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckDuplicateEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
			super.service(req, resp);
			
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		String email=req.getParameter("email");
		if(email!=null) {
		
		Connection con=DbConnect.Connect();;
		
		String qry="select email from users where email='"+email+"'";
		//out.print(qry);
		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(qry);
//			out.print(rs.next());
			if(rs.next()) {
//				out.print("b1");
				out.println("<b><font color=red>Email already in Use!!!</font></b>");
			}
			else
			{
//				out.print("a");
				out.println("<b><font color=green>Email Available!!!</font></b>");
			}	
//			out.print("a1");
		} 
		catch (SQLException e) {

			out.println(e);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
