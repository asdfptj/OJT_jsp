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

public class GetEmpList extends HttpServlet {
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
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			// 1. 클래스 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "hr", "hr");
			
			// 3. Query 준비
			String sql = "select * from emp order by id desc";
			stmt = conn.prepareStatement(sql);
			
			// 4. Query의 ? 값 세팅
			
			// 5. Query 실행
			rs = stmt.executeQuery();
			
			out.println("<table class='table'>");
			out.println("<tr>");
				out.println("<th>ID</th>");
				out.println("<th>Name</th>");
				out.println("<th>Salary</th>");
				out.println("<th>PCT</th>");
				out.println("<th>Hire</th>");
				out.println("<th>Dept</th>");
			out.println("</tr>");
			// 6. Query 결과 처리
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int salary = rs.getInt("salary");
				double pct = rs.getDouble("pct");
				Date hire = rs.getDate("hire");
				int deptid = rs.getInt("deptid");
				
				out.println("<tr>");
					out.println("<td>" + id + "</td>");
					out.println("<td><a href='GetEmp?num=" + id + "'>" + name + "</a></td>");
					out.println("<td>" + salary + "</td>");
					out.println("<td>" + pct + "</td>");
					out.println("<td>" + hire + "</td>");
					out.println("<td>" + deptid + "</td>");
				out.println("</tr>");
			}
			out.println("</table");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 7. 사용한 리소스 닫기
			
			// null check
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
