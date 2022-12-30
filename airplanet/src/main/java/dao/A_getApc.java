package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.DB;

public class A_getApc {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public String apCode(String city) {
		String c = "";
		String sql = "SELECT airportcode FROM airport WHERE APCITY = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, city);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				c = rs.getString("airportcode");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	
	public static void main(String[] args) {
		A_getApc apc = new A_getApc();
		System.out.println(apc.apCode("LA"));
	}
}
