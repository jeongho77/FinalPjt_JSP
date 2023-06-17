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
	// 데이터베이스에서 테이블에 있는 레코드를 가져오는 메소드
	//1. 접근제어자
	//2. 반환 데이터 타입
	//3. 입력 매개변수
	public ArrayList<BoardDto> Com_list() { 
		String sql = "SELECT * FROM com_board";
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String title = rs.getString("title");
				int reply_cnt = rs.getInt("reply_cnt");
				String writer = rs.getString("writer");
				String content = rs.getString("CONTENT");
				String view_cnt = rs.getString("view_cnt");
				int like = rs.getInt("like");
				Date date = rs.getDate("REGDATE");
				
				BoardDto dto = new BoardDto(title, reply_cnt, writer, content, view_cnt , like, date);
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
		String sql = "SELECT * FROM com_board WHERE BCODE=?";
		
		try (
			Connection con = getConnection();
				
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString("title");
				int reply_cnt = rs.getInt("reply_cnt");
				String writer = rs.getString("writer");
				String content = rs.getString("CONTENT");
				String view_cnt = rs.getString("view_cnt");
				int like = rs.getInt("like");
				Date date = rs.getDate("REGDATE");
				BoardDto dto = new BoardDto(title , reply_cnt, writer, content , view_cnt,like,date);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
	public void Com_Delete(int bcode) {
		String sql = "DELETE from board where number = ?";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, bcode);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
}
