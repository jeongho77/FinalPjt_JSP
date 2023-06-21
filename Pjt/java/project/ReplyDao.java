
package project;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReplyDao {
	private ReplyDao dao;

	// DBCP 연결하기
	private Connection getConnection() throws Exception{
		InitialContext intCtv = new InitialContext();
		
		DataSource ds = (DataSource) intCtv.lookup("java:comp/env/jdbc/mj"); 
		
		Connection con = ds.getConnection();
		
		return con;
	}
	
	public void Reply_Insert(ReplyDto dto) {
	    String sql = "INSERT INTO com_reply(board_num, writer, content) VALUES(?, ?, ?)";
	    String updateSql = "UPDATE com_board SET reply_cnt = reply_cnt + 1 WHERE number = ?";

	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql);
	         PreparedStatement updateStmt = con.prepareStatement(updateSql)) {

	        pstmt.setInt(1, dto.getB_num());
	        pstmt.setString(2, dto.getWriter());
	        pstmt.setString(3, dto.getContent());
	        pstmt.executeUpdate();

	        // 댓글이 성공적으로 삽입되면 com_board의 reply_cnt 값을 1씩 증가시킴
	        updateStmt.setInt(1, dto.getB_num());
	        updateStmt.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public void Know_Reply_Insert(ReplyDto dto) {
		String sql = "INSERT INTO knowledge_reply(board_num ,writer, content) VALUES(?, ?, ?)";
		String updateSql = "UPDATE knowledge_board SET reply_cnt = reply_cnt + 1 WHERE number = ?";

	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql);
	         PreparedStatement updateStmt = con.prepareStatement(updateSql)) {

	        pstmt.setInt(1, dto.getB_num());
	        pstmt.setString(2, dto.getWriter());
	        pstmt.setString(3, dto.getContent());
	        pstmt.executeUpdate();

	        // 댓글이 성공적으로 삽입되면 com_board의 reply_cnt 값을 1씩 증가시킴
	        updateStmt.setInt(1, dto.getB_num());
	        updateStmt.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public void Qa_Reply_Insert(ReplyDto dto) {
		String sql = "INSERT INTO qa_reply(board_num ,writer, content) VALUES(?, ?, ?)";
		String updateSql = "UPDATE qa_board SET reply_cnt = reply_cnt + 1 WHERE number = ?";

	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql);
	         PreparedStatement updateStmt = con.prepareStatement(updateSql)) {

	        pstmt.setInt(1, dto.getB_num());
	        pstmt.setString(2, dto.getWriter());
	        pstmt.setString(3, dto.getContent());
	        pstmt.executeUpdate();

	        // 댓글이 성공적으로 삽입되면 com_board의 reply_cnt 값을 1씩 증가시킴
	        updateStmt.setInt(1, dto.getB_num());
	        updateStmt.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	// 데이터베이스에서 테이블에 있는 레코드를 가져오는 메소드
	//1. 접근제어자
	//2. 반환 데이터 타입
	//3. 입력 매개변수
	public ArrayList<ReplyDto> Reply_list(int num) { 
		String sql = "SELECT * FROM com_reply where board_num = ? ORDER BY regdate DESC";
		
		ArrayList<ReplyDto> dtos = new ArrayList<ReplyDto>();
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int number = rs.getInt("number");
				int board_num = rs.getInt("board_num");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int like = rs.getInt("like");
				Date date = rs.getDate("regdate");
				
				ReplyDto dto = new ReplyDto(number, board_num, writer, content, like, date);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dtos;
	}
	
	public ArrayList<ReplyDto> Know_Reply_list(int num) { 
		String sql = "SELECT * FROM knowledge_reply where board_num = ? ORDER BY regdate DESC";
		ArrayList<ReplyDto> dtos = new ArrayList<ReplyDto>();
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int number = rs.getInt("number");
				int board_num = rs.getInt("board_num");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int like = rs.getInt("like");
				Date date = rs.getDate("regdate");
				
				ReplyDto dto = new ReplyDto(number,board_num, writer, content, like, date);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dtos;
	}
	
	public ArrayList<ReplyDto> Qa_Reply_list(int num) { 
		String sql = "SELECT * FROM qa_reply where board_num = ? ORDER BY regdate DESC";
		ArrayList<ReplyDto> dtos = new ArrayList<ReplyDto>();
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1,num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int number = rs.getInt("number");
				int board_num = rs.getInt("board_num");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int like = rs.getInt("like");
				Date date = rs.getDate("regdate");
				
				ReplyDto dto = new ReplyDto(number, board_num, writer, content, like, date);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dtos;
	}
	
	//1. 접근제어자      //2. 반환 데이터 타입       //3. 입력 매개변수
	public BoardDto com_update(BoardDto dto){
		String sql = "update com_board set title=? , CONTENT=?  where number = ?";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNumber());
			pstmt.executeQuery();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
	public BoardDto knowledge_update(BoardDto dto){
		String sql = "update knowledge_board set title=? , CONTENT=?  where number = ?";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNumber());
			pstmt.executeQuery();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
	public BoardDto qa_update(BoardDto dto){
		String sql = "update qa_board set title=? , CONTENT=?  where number = ?";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNumber());
			pstmt.executeQuery();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
	public BoardDto Com_getOne(int id){
		String sql = "SELECT * FROM com_board WHERE number=?";
		BoardDto dto = null;
		try (
			Connection con = getConnection();
				
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int number = rs.getInt("number");
				String title = rs.getString("title");
				int reply_cnt = rs.getInt("reply_cnt");
				String writer = rs.getString("writer");
				String content = rs.getString("CONTENT");
				String view_cnt = rs.getString("view_cnt");
				int like = rs.getInt("like");
				Date date = rs.getDate("REGDATE");
				dto = new BoardDto(number, title , reply_cnt, writer, content , view_cnt,like,date);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
	public BoardDto Know_getOne(int id){
		String sql = "SELECT * FROM knowledge_board WHERE number=?";
		BoardDto dto = null;
		try (
			Connection con = getConnection();
				
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int number = rs.getInt("number");
				String title = rs.getString("title");
				int reply_cnt = rs.getInt("reply_cnt");
				String writer = rs.getString("writer");
				String content = rs.getString("CONTENT");
				String view_cnt = rs.getString("view_cnt");
				int like = rs.getInt("like");
				Date date = rs.getDate("REGDATE");
				dto = new BoardDto(number, title , reply_cnt, writer, content , view_cnt,like,date);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
	public BoardDto Qa_getOne(int id){
		String sql = "SELECT * FROM qa_board WHERE number=?";
		BoardDto dto = null;
		try (
			Connection con = getConnection();
				
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int number = rs.getInt("number");
				String title = rs.getString("title");
				int reply_cnt = rs.getInt("reply_cnt");
				String writer = rs.getString("writer");
				String content = rs.getString("CONTENT");
				String view_cnt = rs.getString("view_cnt");
				int like = rs.getInt("like");
				Date date = rs.getDate("REGDATE");
				dto = new BoardDto(number, title , reply_cnt, writer, content , view_cnt,like,date);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
	public void Com_Delete(int number) {
		String sql = "DELETE from com_reply where number = ?";
		System.out.println("안녕");
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void Know_Delete(int number) {
		String sql = "DELETE from knowledge_reply where number = ?";
		System.out.println("안녕");
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}   
	}
	
	public void Qa_Delete(int number) {
		String sql = "DELETE from qa_reply where number = ?";
		System.out.println("안녕");
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
