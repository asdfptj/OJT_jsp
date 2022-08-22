package com.company.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DeleteEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "hr", "hr");
			
			// 3. Query 준비
			// 변수로 치환 할 값을 ?로 일단 적용한다
			// 그리고 4번에서 그 값을 할당한다
			String sql = "delete from emp where id = ?";
			stmt = conn.prepareStatement(sql);
			
			// 4. Query의 ? 값 세팅
			// ?의 순서는 1번부터 시작된다. 값은 DB의 타입과 호환되게 변경해서 입력한다
			// id 	number(6)
			stmt.setInt(1, num);		// 1번째 ?에 num이라는 값을 대입해서 실행하겠다
			
			// insert, update, delete는 executeUpdate()이며 리턴타입은 실행된 쿼리 개수를 나타내는 int 타입이다
			int cnt = stmt.executeUpdate();
			
			// 6. Query 결과 처리
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println(cnt + "개가 삭제되었습니다");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
