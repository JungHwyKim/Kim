package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import vo.DB;
import vo.MyPassengerInfo;

public class C_insertPassengerInfo {
	// DB 연결 필드 선언
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 마이페이지에서 개인정보(탑승자정보) 저장하는 메소드
	public void insertMyPassengerInfo(MyPassengerInfo pi) {
		String sql = "INSERT INTO MyPassengerInfo values(?,?,?,?,to_date(?,'yyyy-mm-dd'),?,?,to_date(?,'yyyy-mm-dd'),?,?)";
		try {
			// MyPassengerInfo(String email, String korname, String engsur, String engname, String birthday, String mf,
			// 					String ppnumber, String ppexpire, String nation, String ppnation)
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pi.getEmail());
			pstmt.setString(2, pi.getKorname());
			pstmt.setString(3, pi.getEngsur());
			pstmt.setString(4, pi.getEngname());
			pstmt.setString(5, pi.getBirthday());
			pstmt.setString(6, pi.getMf());
			pstmt.setString(7, pi.getPpnumber());
			pstmt.setString(8, pi.getPpexpire());
			pstmt.setString(9, pi.getNation());
			pstmt.setString(10, pi.getPpnation());
			pstmt.executeUpdate();
			System.out.println("---------------------------------");
			System.out.println("   정보가 성공적으로 저장되었습니다 !");
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
