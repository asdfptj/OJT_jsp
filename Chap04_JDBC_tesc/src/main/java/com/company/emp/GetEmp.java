package com.company.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// HTML 출력 준비
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Get Employee List</title>");
		out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0-beta1/css/bootstrap.min.css'>");
		out.println("</head>");
		out.println("<body>");
		out.println("<div class='card-body'>");
		out.println("<h1>Get Emp List</h1>");
		
		
		String num = request.getParameter("num");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "hr", "hr");
			
			// 3. Query 준비
			String sql = "select * from emp where id = " + num;
			stmt = conn.prepareStatement(sql);
			
			// 4. Query의 ? 값 세팅
			
			rs = stmt.executeQuery();
			
			out.println("<table class='table'>");
			// 6. Query 결과 처리
			if (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int salary = rs.getInt("salary");
				double pct = rs.getDouble("pct");
				Date hire = rs.getDate("hire");
				int deptid = rs.getInt("deptid");
				
				out.println("<tr>");
					out.println("<th>ID</th><td>" + id + "</td>");
				out.println("</tr>");
				out.println("<tr>");
					out.println("<th>Name</th><td>" + name + "</td>");
				out.println("</tr>");
				out.println("<tr>");
					out.println("<th>Salary</th><td>" + salary + "</td>");
				out.println("</tr>");
				out.println("<tr>");
					out.println("<th>PCT</th><td>" + pct + "</td>");
				out.println("</tr>");
				out.println("<tr>");
					out.println("<th>HIRE</th><td>" + hire + "</td>");
				out.println("</tr>");
				out.println("<tr>");
					out.println("<th>DEPT</th><td>" + deptid + "</td>");
				out.println("</tr>");
			} else {
				out.println("<tr>");
					out.println("<td colspan='2'>해당 유저가 존재하지 않습니다.</td>");
				out.println("</tr>");
			}
			
			out.println("<tr>");
				out.println("<td colspan='2'>"
						+ "<a href='GetEmpList'>목록</a> | "
						+ "<a href='DeleteEmp?num=" + num + "'>삭제</a> | "
						+ "</td>");
			out.println("</tr>");
		
			out.println("</table>");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {		// null이변 객체가 대입되지 않았으므로 닫을 것이 없다
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
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
		
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
