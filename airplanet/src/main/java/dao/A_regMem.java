package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.DB;

public class A_regMem {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void regMem(String email, String pw, String name, String tel) {
		String sql = "INSERT INTO AIRMEMBER VALUES(?,?,?,?,0,'')";
		try {
			con= DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, tel);
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			System.out.println("DB에러 : "+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback에러 : "+e1.getMessage());
			}
		} catch (Exception e) {
			System.out.println("기타에러 : "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
	
	public static void main(String[] args) {
		
		A_regMem a = new A_regMem();
		a.regMem("kkjjhh31@hanmail.net", "asdqwe123!", "김중휘", "01087264214");
		
	}
	
}
