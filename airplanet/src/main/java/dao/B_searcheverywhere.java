package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.DB;
import vo.FlightAll;

public class B_searcheverywhere {
//dao.B_searcheverywhere  getMinfeeE
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<FlightAll> getMinfeeE(FlightAll fa){
		List<FlightAll> flist = new ArrayList<FlightAll>();	
		String sql="SELECT DISTINCT a2.apnation, f.STANDARDFEE \r\n"
				+ "FROM(SELECT a.apnation, min(ff.standardfee) AS minfee "
				+ "FROM airport a, FLIGHT ff \r\n"
				+ "WHERE ff.ARRIVEAIRPORT =a.AIRPORTCODE \r\n"
				+ "AND TO_CHAR(ff.departdate,'yyyy-mm-dd')= ?\r\n"
				+ "GROUP BY a.APNATION) cm, airport a2, flight f , airport a1, ticketOption t\r\n"
				+ "WHERE cm.minfee = f.STANDARDFEE \r\n"
				+ "AND f.ARRIVEAIRPORT = a2.airportcode\r\n"
				+ "AND f.DEPARTAIRPORT =a1.airportcode\r\n"
				+ "AND f.flightnumber = t.flightnumber\r\n"
				+ "AND (a1.apcity=? OR a1.AIRPORTCODE=?) \r\n"
				+ "AND t.stock>=1"
				+ "ORDER BY f.standardfee";
		try {
			con=DB.con();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, fa.getDepartDate());
			pstmt.setString(2, fa.getDepartLocation());
			pstmt.setString(3, fa.getDepartLocation());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				flist.add(new FlightAll(rs.getString(1),rs.getInt(2)));
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
		B_searcheverywhere b = new B_searcheverywhere();
		FlightAll fa = new FlightAll("2022-12-21","인천");
		List<FlightAll> flist =b.getMinfeeE(fa);
		for(FlightAll f : flist) {
			System.out.print(f.getArriveApnation());
			System.out.print(f.getArriveApcity());
			System.out.print(f.getArriveAirportcode());
			System.out.print(f.getArriveLocation());
			System.out.print(f.getArriveApnation());
			System.out.print(f.getStandardFee());
		}
	}

}
