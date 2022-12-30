package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.Airport;
import vo.DB;

public class A_searchAp {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<Airport> search(String a) {
		List<Airport> ap = new ArrayList<>();
		String sql = "SELECT APNATION, APCITY FROM airport WHERE APNATION LIKE '%'||?||'%' OR APCITY LIKE '%'||?||'%'";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.setString(2, a);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Airport air = new Airport(rs.getString(1),
										rs.getString(2)
						);
				ap.add(air);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ap;
	}
	
	public static void main(String[] args) {
		A_searchAp ap = new A_searchAp();
		List<Airport> a = ap.search("미");
		for(Airport e : a) {
			System.out.print(e.getApNation()+"\t");
			System.out.print(e.getApCity()+"\t");
		}
	}
	
}
