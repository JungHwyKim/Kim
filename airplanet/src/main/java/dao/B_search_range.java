package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.DB;
import vo.FlightAll;
//dao.B_search_range getRangeticket
public class B_search_range {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<FlightAll> getRangeticket(FlightAll fa){
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
				+ "AND TO_NUMBER(TO_char(f.departdate,'sssss')) >= ? and TO_NUMBER(TO_char(f.departdate,'sssss')) <= ?"
				+ "ORDER BY";
			if(fa.getSort()==1) {
				sql+=" f.STANDARDFEE";
			}else if(fa.getSort()==2) {
				sql+=" f.FLIGHTHOURS";
			}else if(fa.getSort()==3) {
				sql+=" f.DEPARTDATE";
			}	
			System.out.println(fa.getSort());
		//ORDER BY는 PreparedStatement으로 사용 X  f.FLIGHTHOURS --f.DEPARTDATE --f.STANDARDFEE

	try {
		con = DB.con();
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, fa.getDepartDate());
		pstmt.setString(2, fa.getDepartLocation());
		pstmt.setString(3, fa.getDepartLocation());
		pstmt.setString(4, fa.getArriveLocation());
		pstmt.setString(5, fa.getArriveLocation());
		pstmt.setString(6, fa.getClassStr());
		pstmt.setInt(7, fa.getFrRange());
		pstmt.setInt(8, fa.getToRange());
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
		B_search_range b = new B_search_range();
		FlightAll fa = new FlightAll("2022-12-21","ICN","FUK","ec",0,86400,2);
		List<FlightAll> flist = b.getRangeticket(fa);
		for(FlightAll f:flist) {
			System.out.print(f.getFlightNumber()+"\t");
			System.out.print(f.getFlightHours()+"\t");
			System.out.print(f.getDepartDate()+"\t");
			System.out.print(f.getStandardFee()+"\n");
		}
		

	}

}
