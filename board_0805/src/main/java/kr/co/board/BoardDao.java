package kr.co.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public class BoardDao {

	Connection conn;
	PreparedStatement pstmt;
	
	public BoardDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/second";
		conn = DriverManager.getConnection(db, "root", "5032");
	}
	
	public void close() throws Exception {
		pstmt.close();
		conn.close();
	}
	
	
	public void write_req(HttpServletRequest req) throws Exception {
		String sql = "";
		
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String pwd = req.getParameter("pwd");
		String content = req.getParameter("content");
		
		sql = "insert into board";
		sql += "(title,name,pwd,content,writeday) ";
		sql += "values(?,?,?,?,now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, name);
		pstmt.setString(3, pwd);
		pstmt.setString(4, content);
		pstmt.executeUpdate();
		
		close();		
		
	}
	
	public void write_dto(BoardDto dto) throws Exception {
		String sql = "";

		sql = "insert into board";
		sql += "(title,name,pwd,content,writeday) ";
		sql += "values(?,?,?,?,now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getTitle());
		pstmt.setString(2, dto.getName());
		pstmt.setString(3, dto.getName());
		pstmt.setString(4, dto.getContent());
		pstmt.executeUpdate();
		
		close();
	}
	
	public ArrayList<BoardDto> list() throws Exception {
		String sql = "";
		
		sql = "select * from board order by id desc";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		while(rs.next()) {
			BoardDto dto = new BoardDto();
			dto.setId(rs.getInt("id"));
			dto.setTitle(rs.getString("title"));
			dto.setName(rs.getString("name"));
			dto.setReadnum(rs.getInt("readnum"));
			dto.setWriteday(rs.getString("writeday"));
			list.add(dto);
		}
		
		rs.close();
		close();
		
		return list;
	}
	
	
}
