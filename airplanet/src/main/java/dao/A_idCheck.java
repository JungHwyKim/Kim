package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.AirMember;
import vo.DB;
import vo.Fare;
// dao_A_idCheck
public class A_idCheck{
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public boolean idCheck(String email) {
		boolean check = false;
		String sql = "SELECT * FROM AIRMEMBER WHERE email = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			check = rs.next();
		} catch (SQLException e) {
			System.out.println("DB 에러: "+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return check;
	}
	
	public static void main(String[] args) {
		AirMember am = new AirMember("t711txt@naver.com");
		A_idCheck dao = new A_idCheck();		
		System.out.println(dao.idCheck("t711txt@naver.co"));
	}
}