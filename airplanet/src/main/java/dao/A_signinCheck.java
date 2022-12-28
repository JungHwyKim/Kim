package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.AirMember;
import vo.DB;

public class A_signinCheck {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public AirMember login(AirMember a) {
		AirMember mem = null;
		String sql = "SELECT * FROM AIRMEMBER WHERE email=? AND pass=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, a.getEmail());
			pstmt.setString(2, a.getPass());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mem = new AirMember(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getString(6)
						);
			}
		} catch (SQLException e) {
			System.out.println("DB에러 : "+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타에러 : "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return mem;
	}
	
	public static void main(String[] args) {
		A_signinCheck ck = new A_signinCheck();
		AirMember m = new AirMember("t711txt@naver.com","1234");
		System.out.println( ck.login(m).getEmail());
	}
	
}
