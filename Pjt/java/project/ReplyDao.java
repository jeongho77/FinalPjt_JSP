
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
	
	public void Com_Insert(ReplyDto dto) {
		String sql = "INSERT INTO com_reply(board_num ,writer, content) VALUES(?, ?, ?)";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		){	
			
			pstmt.setInt(1, dto.getB_num());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
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
	
	
}