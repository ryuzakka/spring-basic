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
	
	public String write_dto(BoardDto dto) throws Exception {
		String sql = "";

		sql = "insert into board";
		sql += "(title,name,pwd,content,writeday) ";
		sql += "values(?,?,?,?,now())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getTitle());
		pstmt.setString(2, dto.getName());
		pstmt.setString(3, dto.getPwd());
		pstmt.setString(4, dto.getContent());
		pstmt.executeUpdate();
		
		close();
		
		return "redirect:/list";
	}
	
	public String list(Model model) throws Exception {
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
		
		model.addAttribute("list", list);
		
		return "/list";
	}
	
	public String readnum(HttpServletRequest req) throws Exception {
		String id = req.getParameter("id");
		
		String sql = "";
		sql = "update board set readnum=readnum+1 where id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		
		close();

		return "redirect:/content?id="+id;
	}
	
	public String content(HttpServletRequest req, Model model, int type) throws Exception {
		String id = req.getParameter("id");
		
		String sql = "";
		sql = "select * from board where id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		BoardDto dto = new BoardDto();
		dto.setId(rs.getInt("id"));
		dto.setTitle(rs.getString("title"));
		dto.setName(rs.getString("name"));
		dto.setPwd(rs.getString("pwd"));
		dto.setReadnum(rs.getInt("readnum"));
		dto.setWriteday(rs.getString("writeday"));
		if(type == 1) {			
			dto.setContent(rs.getString("content").replace("\r\n", "<br>"));
			model.addAttribute("content", dto);
			
			return "/content";
		}
		else {			
			dto.setContent(rs.getString("content"));
			model.addAttribute("content", dto);

			return "/update";
		}
		
	}
	
	public String delete(HttpServletRequest req) throws Exception {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String sql = "";
		
		if(pwdCheck(id, pwd) == 1) {			
			sql = "delete from board where id=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();

			close();
			
			return "redirect:/list";
		} else {
			//System.out.println("비밀번호 틀림");
			close();
			
			return "redirect:/content?err=1&id="+id;
		}
		
	}
	
	public String update(HttpServletRequest req) throws Exception {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String sql = "";
		
		if(pwdCheck(id, pwd) == 1) {			
			sql = "update board set ";
			sql += "title=?, name=?, content=?, writeday=now() ";
			sql += "where id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("title"));
			pstmt.setString(2, req.getParameter("name"));
			pstmt.setString(3, req.getParameter("content"));
			pstmt.setString(4, id);
			pstmt.executeUpdate();

			close();
			
			return "redirect:content?id="+req.getParameter("id");
		} else {
			//System.out.println("비밀번호 틀림");
			close();
			
			return "redirect:update?err=1&id="+req.getParameter("id");
		}
		
	}
	
	public int pwdCheck(String id, String pwd) throws Exception {
		String sql = "";
		
		sql = "select * from board where id=? and pwd=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			rs.close();
			return 1; 
		} else {
			rs.close();
			return 0;
		}
	}
	
	
}
