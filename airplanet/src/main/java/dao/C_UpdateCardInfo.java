package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.AirMember;
import vo.DB;

public class C_UpdateCardInfo {
	// DB 연결 필드 선언
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void UpdateCardInfo(AirMember am) {
		String sql = "UPDATE airMember \r\n"
				+ "	SET cardInfo  = ? \r\n"
				+ "WHERE email = ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, am.getCardInfo());
			pstmt.setString(2, am.getEmail());
			pstmt.executeUpdate();
			System.out.println("---------------------------------");
			System.out.println("정상적으로 등록되었습니다 !");
			System.out.println("---------------------------------");
			con.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 처리: "+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("rollback에러: "+e1.getMessage());
			}
		} catch(Exception e) {
			System.out.println("일반 에러: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
	
	public boolean correct(String cardInfo) {
		boolean isCorrect=false;
		String sql = "SELECT * \r\n"
				+ "FROM airMember \r\n"
				+ "WHERE email = ? ";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cardInfo);
			rs = pstmt.executeQuery(); 
			isCorrect=rs.next();
	
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러: "+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반에러: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return isCorrect;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
