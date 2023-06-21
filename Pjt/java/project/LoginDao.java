package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDao {
	// DBCP로 데이터베이스에 접근하여 Connection을 얻어오는 메소드
		// 1. 접근제어자
		// 2. 반환 데이터타입
		// 3. 입력 매개변수
		private Connection getConnection() throws Exception{
			InitialContext intCtv = new InitialContext();
			
			DataSource ds = (DataSource) intCtv.lookup("java:comp/env/jdbc/mj"); //한번에 연결되네? 왜?
			
			Connection con = ds.getConnection();
			
			return con;
		}
		// 폼에서 가져온 데이터를 DB의 member 테이블에 저장
		public void insertLogin(LoginDto dto) { //그냥 객체 생성인 듯
			//1. Connection 가져오기
			
			//2. 커넥션을 통해
			String sql = "INSERT INTO user(email, name, pwd, nickname) VALUES(?, ?, ?, ?)";
			try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			)
			{
				pstmt.setString(1, dto.getEmail());
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getPwd());
				pstmt.setString(4, dto.getNickname());
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		// 데이터베이스에서 테이블에 있는 레코드를 가져오는 메소드
		// 1. 접근제어자
		// 2. 반환 데이터타입
		// 3. 입력 매개변수
		public ArrayList<LoginDto> list() { 
		      String sql = "SELECT * FROM user";
		      ArrayList<LoginDto> dtos = new ArrayList<LoginDto>();
		      
		      try (
		         Connection con = getConnection();
		         PreparedStatement pstmt = con.prepareStatement(sql);
		      ) {
		         ResultSet rs = pstmt.executeQuery();
		         while(rs.next()) {
		            String email = rs.getString("email");
		            String name = rs.getString("name");
		            String pwd = rs.getString("pwd");
		            String nickname = rs.getString("nickname");
		            
		            LoginDto dto = new LoginDto(email, name, pwd, nickname);
		            
		            dtos.add(dto);
		         }
		         
		      } catch (Exception e) {
		         // TODO: handle exception
		         e.printStackTrace();
		      }
		      return dtos;
		   }
		
		public LoginDto login(String email, String pwd) {
			String sql = "SELECT * FROM user WHERE email=? AND pwd=?";
			LoginDto dto = null;
			
			try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) {
				pstmt.setString(1, email);
				pstmt.setString(2, pwd);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String email2 = rs.getString("email");
		            String pwd2 = rs.getString("pwd");
		            String nickname = rs.getString("nickname");
		            
					dto = new LoginDto(email2, pwd2, nickname);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return dto;
		}
		// 1. 접근제어자
		// 2. 반환 데이터타입
		// 3. 입력 매개변수
		public LoginDto getOne(String email){
		      String sql = "SELECT * FROM user WHERE email=?";
		      LoginDto dto = new LoginDto();
		      
		      try (
		         Connection con = getConnection();
		         PreparedStatement pstmt = con.prepareStatement(sql);
		      ) {
		         pstmt.setString(1, email);
		         ResultSet rs = pstmt.executeQuery();
		         
		         if(rs.next()) {
		        	 String name = rs.getString("name");
		            String pwd = rs.getString("pwd");
		            String nickname = rs.getString("nickname");
					dto = new LoginDto(email, name, pwd, nickname);
		         }
		         
		      } catch (Exception e) {
		         // TODO: handle exception
		         e.printStackTrace();
		      }
		      return dto;
		   }
		
		public LoginDto Update(LoginDto Dto) {
			String sql = "UPDATE user set name=?, pwd=?, nickname=?, email = ? where nickname=?";
			System.out.println("하이");
			LoginDto dto = new LoginDto();
			try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) {
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getPwd());
					pstmt.setString(3, dto.getNickname());
					pstmt.setString(4, dto.getEmail());
					pstmt.setString(5, dto.getA());
				
					int i = pstmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			return dto;
		}
		
		public void Delete(String email) {
		      String sql = "DELETE from user where email = ?";
		      System.out.println(email);
		      try (
		         Connection con = getConnection();
		         PreparedStatement pstmt = con.prepareStatement(sql);
		      ) {
		         pstmt.setString(1, email);
		         ResultSet i = pstmt.executeQuery();
		         
		      } catch (Exception e) {
		         // TODO: handle exception
		         e.printStackTrace();
		      }
		   }
}
