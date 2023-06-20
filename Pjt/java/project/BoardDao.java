/*================================================
 * user : mj
 * date : 2023. 5. 10.
 * file_name : LoginDao.java
 * comments :
 		- insertLogin() : login 테이블에 접근하여 CRUD 기능 처리
 		- list() : login 테이블의 데이터를 가져옴
 		- getOne() : 특정 레코드만 검색하여 가져옴
 		
================================================*/
package project;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private BoardDto dto;

	// DBCP 연결하기
	private Connection getConnection() throws Exception{ 
		InitialContext intCtv = new InitialContext();
		
		DataSource ds = (DataSource) intCtv.lookup("java:comp/env/jdbc/mj"); 
		
		Connection con = ds.getConnection();
		
		return con;
	}
	
	public void com_like(int i){
		String sql = "update com_board set `like` = `like` + 1 where number = ?";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, i);
			pstmt.executeQuery();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return;
	} 
	
	public void com_view(int i){
		String sql = "update com_board set `view_cnt` = `view_cnt` + 1 where number = ?";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, i);
			pstmt.executeQuery();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return;
	}
	
	public void Com_Insert(BoardDto dto) {
		String sql = "INSERT INTO com_board(title, content) VALUES(?, ?)";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		){	
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void Know_Insert(BoardDto dto) {
		String sql = "INSERT INTO knowledge_board(title, content) VALUES(?, ?)";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		){	
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void Qa_Insert(BoardDto dto) {
		String sql = "INSERT INTO qa_board(title, content) VALUES(?, ?)";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		){	
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	// 데이터베이스에서 테이블에 있는 레코드를 가져오는 메소드
	//1. 접근제어자
	//2. 반환 데이터 타입
	//3. 입력 매개변수
	public ArrayList<BoardDto> Com_list() { 
		String sql = "SELECT * FROM com_board ORDER BY regdate DESC";
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int number = rs.getInt("number");
				String title = rs.getString("title");
				int reply_cnt = rs.getInt("reply_cnt");
				String writer = rs.getString("writer");
				String content = rs.getString("CONTENT");
				String view_cnt = rs.getString("view_cnt");
				int like = rs.getInt("like");
				Date date = rs.getDate("REGDATE");
				
				BoardDto dto = new BoardDto(number, title, reply_cnt, writer, content, view_cnt , like, date);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dtos;
	}
	
	public ArrayList<BoardDto> Know_list() { 
		String sql = "SELECT * FROM knowledge_board ORDER BY regdate DESC";
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int number = rs.getInt("number");
				String title = rs.getString("title");
				int reply_cnt = rs.getInt("reply_cnt");
				String writer = rs.getString("writer");
				String content = rs.getString("CONTENT");
				String view_cnt = rs.getString("view_cnt");
				int like = rs.getInt("like");
				Date date = rs.getDate("REGDATE");
				
				BoardDto dto = new BoardDto(number, title, reply_cnt, writer, content, view_cnt , like, date);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dtos;
	}
	
	public ArrayList<BoardDto> Qa_list() { 
		String sql = "SELECT * FROM qa_board ORDER BY regdate DESC";
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int number = rs.getInt("number");
				String title = rs.getString("title");
				int reply_cnt = rs.getInt("reply_cnt");
				String writer = rs.getString("writer");
				String content = rs.getString("CONTENT");
				String view_cnt = rs.getString("view_cnt");
				int like = rs.getInt("like");
				Date date = rs.getDate("REGDATE");
				
				BoardDto dto = new BoardDto(number, title, reply_cnt, writer, content, view_cnt , like, date);
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
	
	public BoardDto know_update(BoardDto dto){
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
		String sql = "DELETE from com_board where number = ?";
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
		String sql = "DELETE from knowledge_board where number = ?";
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
		String sql = "DELETE from qa_board where number = ?";
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
