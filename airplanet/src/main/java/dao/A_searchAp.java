package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.DB;

public class A_searchAp {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public String selectCity(String apnation,String apcity) {
		String sch = "";
		String sql = "SELECT APNATION, APCITY FROM airport WHERE APNATION LIKE '%'||?||'%' AND APCITY LIKE '%'||?||'%'";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, apnation);
			pstmt.setString(2, apcity);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				sch += rs.getString(1)+" "+rs.getString(2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sch;
	}
	
	public static void main(String[] args) {
		A_searchAp ap = new A_searchAp();
		//System.out.println(ap.selectCity("서", "")); 
		System.out.println(ap.selectCity("", ""));
	}
	
}
