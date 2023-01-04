package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.AirMember;
import vo.DB;
import vo.Fare;

public class C_cancelPassenger {
	// DB 연결 필드 선언
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void deletePassenger(String korname) {
		String sql = "DELETE FROM passenger WHERE korname = ? ";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, korname);
			System.out.println("삭제건수: "+pstmt.executeUpdate());
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
	
	public void UpdatePrice(int totalPrice, String bookingReference) {
		String sql = "UPDATE fare \r\n"
				+ "SET totalPrice = ? \r\n"
				+ "WHERE bookingReference = ? ";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, totalPrice);
			pstmt.setString(2, bookingReference);
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
	
	public void UpdateFare(int cnt, String bookingReference) {
		String sql = "UPDATE fare \r\n"
				+ "SET cnt = cnt - ? \r\n"
				+ "WHERE bookingReference = ? ";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cnt);
			pstmt.setString(2, bookingReference);
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

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
