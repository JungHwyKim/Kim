package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.DB;
import vo.FlightAll;
//dao.B_search_detail getMinfeeC
public class B_search_detail {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<FlightAll> getMinfeeC(FlightAll fa){
		List<FlightAll> flist = new ArrayList<FlightAll>();
		String sql="SELECT DISTINCT  f.flightnumber, f.departdate, f.DEPARTAIRPORT , f.ARRIVEAIRPORT , f.FLIGHTHOURS, \r\n"
				+ "a1.PACIFICTIME , a2.PACIFICTIME, ar.AIRLINELOGO, f.STANDARDFEE , t.CLASSfee  \r\n"
				+ "FROM FLIGHT f, airport a2, airport a1, ticketOption t, AIRLINE ar \r\n"
				+ "WHERE a1.AIRPORTCODE =f.DEPARTAIRPORT \r\n"
				+ "AND a2.AIRPORTCODE =f.ARRIVEAIRPORT \r\n"
				+ "AND t.FLIGHTNUMBER =f.FLIGHTNUMBER \r\n"
				+ "AND ar.AIRLINECODE =f.AIRLINECODE \r\n"
				+ "AND t.stock>=1\r\n"
				+ "AND TO_CHAR(f.departdate,'yyyy-mm-dd')= ?\r\n"
				+ "AND (a1.apcity=? OR a1.AIRPORTCODE=?) \r\n"
				+ "AND (a2.APCITY=? OR a2.AIRPORTCODE=?)\r\n"
				+ "AND substr(t.optioncode,15,2)=?"
				+ "ORDER BY f.STANDARDFEE ";
	
	try {
		con = DB.con();
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, fa.getDepartDate());
		pstmt.setString(2, fa.getDepartLocation());
		pstmt.setString(3, fa.getDepartLocation());
		pstmt.setString(4, fa.getArriveLocation());
		pstmt.setString(5, fa.getArriveLocation());
		pstmt.setString(6, fa.getClassStr());
		rs=pstmt.executeQuery();
		while(rs.next()) {
			flist.add(new FlightAll(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getFloat(5),
					rs.getInt(6),rs.getInt(7),rs.getString(8),rs.getInt(9),rs.getInt(10)));
		}
	
	
		}  catch (SQLException e) {
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
		B_search_detail b = new B_search_detail();
		FlightAll fa = new FlightAll("2022-12-21","인천","LA","ec");
		List<FlightAll> flist = b.getMinfeeC(fa);
		for(FlightAll f:flist) {
			System.out.println(f.getAirlinelogo());
		}
		

	}

}
