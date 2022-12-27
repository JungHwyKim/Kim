package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class A_signinCheck {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public boolean memExist(String email, String pw) {
		boolean pass = false;
		String sql = "SELECT * FROM AIRMEMBER WHERE email=? AND pass=?";
		
		return pass;
	}
	
	public static void main(String[] args) {
		
	}
	
}
