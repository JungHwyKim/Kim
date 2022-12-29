package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.DB;
import vo.FlightAll;
//dao.B_searchnation  getMinfeeN
public class B_searchnation {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<FlightAll> getMinfeeN(FlightAll f) {
		List<FlightAll> flist = new ArrayList<FlightAll>();
		String sql = "SELECT DISTINCT  a2.apcity, f.standardfee, a2.apphoto\r\n"
				+ "FROM ( SELECT a.apcity, min(ff.standardfee) AS minfee "
				+ "FROM airport a, FLIGHT ff \r\n"
				+ "WHERE ff.ARRIVEAIRPORT =a.AIRPORTCODE \r\n"
				+ "AND TO_CHAR(ff.departdate,'yyyy-mm-dd')= ?\r\n"
				+ "GROUP BY  a.apcity) cm, FLIGHT F, airport a2, airport a1, ticketOption t\r\n"
				+ "WHERE f.standardfee = cm.minfee\r\n"
				+ "AND a2.apcity = cm.apcity\r\n"
				+ "AND f.arriveairport = a2.airportcode\r\n"
				+ "AND f.DEPARTAIRPORT =a1.airportcode\r\n"
				+ "AND f.flightnumber = t.flightnumber\r\n"
				+ "AND (a1.apcity=? OR a1.AIRPORTCODE=?) \r\n"
				+ "AND t.stock>=1\r\n"
				+ "AND a2.apnation=?"
				+ "ORDER BY f.standardfee ";
		try {
			con=DB.con();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, f.getDepartDate());
			pstmt.setString(2, f.getDepartLocation());
			pstmt.setString(3, f.getDepartLocation());
			pstmt.setString(4, f.getArriveLocation());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				flist.add(new FlightAll(rs.getString(1),rs.getInt(2),rs.getString(3)));
			}
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
		}catch(Exception e) {
			System.out.println("일반예외:"+e.getMessage());
		}
		finally {
			DB.close(rs, pstmt, con);
		}
	return flist;
}
	
	
	public static void main(String[] args) {
		B_searchnation b = new B_searchnation();
		FlightAll fa = new FlightAll("2022-12-21","인천","미국");
		List<FlightAll> flist =b.getMinfeeN(fa);
		for(FlightAll f : flist) {
			System.out.println(f.getArriveApcity());
			System.out.println(f.getStandardFee());
			System.out.println(f.getArriveApphoto());
		}
		
	}
	
	
}

	