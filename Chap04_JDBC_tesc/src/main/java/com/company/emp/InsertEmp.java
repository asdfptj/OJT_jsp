package com.company.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post는 encoding에 맞추어 받아와야 한다. 반드시 받기 전에 기술
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		int salary = Integer.parseInt(request.getParameter("salary"));
		double pct = Double.parseDouble(request.getParameter("pct"));
		Date hire = Date.valueOf(request.getParameter("hire"));
		int deptid = Integer.parseInt(request.getParameter("deptid"));
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "hr", "hr");
			
			String sql = "insert into emp(id, name, salary, pct, hire, deptid)"
					+ "values((select nvl(max(id), 0) + 1 from emp), ?, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, name);
			stmt.setInt(2, salary);
			stmt.setDouble(3, pct);
			stmt.setDate(4, hire);
			stmt.setInt(5, deptid);
			
			int cnt = stmt.executeUpdate();
			
			if(cnt != 0) conn.commit();
			else conn.rollback();
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println(cnt + "개가 입력되었습니다");
			out.println("<a href='GetEmpList'>목록</a>");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {		// null이변 객체가 대입되지 않았으므로 닫을 것이 없다
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if (conn != null) {		// null이변 객체가 대입되지 않았으므로 닫을 것이 없다
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

}






