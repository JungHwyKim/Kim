package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.DB;
import vo.FlightAll;

public class B_returnprice {
//dao.B_returnprice  returnMinfeeN
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<FlightAll> returnMinfeeE(FlightAll fa){
		List<FlightAll> flist = new ArrayList<FlightAll>();
		String sql="SELECT DISTINCT f.flightnumber,a1.apnation, f.STANDARDFEE\r\n"
				+ "FROM(SELECT a.apnation, min(ff.standardfee) AS minfee FROM airport a, FLIGHT ff \r\n"
				+ "WHERE ff.departAIRPORT =a.AIRPORTCODE \r\n"
				+ "AND TO_CHAR(ff.departdate,'yyyy-mm-dd')= ? \r\n"  //돌아오는 날짜
				+ "GROUP BY a.APNATION) cm, airport a2, flight f , airport a1, ticketOption t\r\n"
				+ "WHERE cm.minfee = f.STANDARDFEE \r\n" 
				+ "AND f.ARRIVEAIRPORT = a2.airportcode\r\n"
				+ "AND f.DEPARTAIRPORT =a1.airportcode\r\n"
				+ "AND f.flightnumber = t.flightnumber\r\n"
				+ "AND a1.apnation= ? \r\n"		// 출발국가
				+ "AND a2.airportcode= ? \r\n" // 도착지 (현재 있는 곳의 공항코드)
				+ "AND t.stock>=1";
		try {
			con=DB.con();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, fa.getDepartDate());
			pstmt.setString(2, fa.getDepartLocation());
			pstmt.setString(3, fa.getArriveLocation());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				flist.add(new FlightAll(rs.getString(1),rs.getString(2),rs.getInt(3)));
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
	
	public List<FlightAll> returnMinfeeN(FlightAll fa){
			List<FlightAll> flist = new ArrayList<FlightAll>();
			String sql="SELECT DISTINCT  f.flightnumber, a1.apcity, f.standardfee \r\n" // 데이터 뽑을 떄는 apcity => getDepartApnation()로 뽑기
					+ "FROM ( SELECT a.apcity, min(ff.standardfee) AS minfee FROM airport a, FLIGHT ff \r\n"
					+ "WHERE ff.DEPARTAIRPORT =a.AIRPORTCODE \r\n"
					+ "AND TO_CHAR(ff.departdate,'yyyy-mm-dd')= ?\r\n"
					+ "GROUP BY  a.apcity) cm, FLIGHT F, airport a2, airport a1, ticketOption t\r\n"
					+ "WHERE f.standardfee = cm.minfee\r\n"
					+ "AND a1.apcity = cm.apcity\r\n"
					+ "AND f.arriveairport = a2.airportcode\r\n"
					+ "AND f.DEPARTAIRPORT =a1.airportcode\r\n"
					+ "AND f.flightnumber = t.flightnumber\r\n"
					+ "AND a1.apcity=?\r\n"
					+ "AND a2.airportcode=?\r\n"
					+ "AND t.stock>=1";
			try {
				con=DB.con();
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, fa.getDepartDate());
				pstmt.setString(2, fa.getDepartLocation());
				pstmt.setString(3, fa.getArriveLocation());
				rs=pstmt.executeQuery();
				while(rs.next()) {
					flist.add(new FlightAll(rs.getString(1),rs.getString(2),rs.getInt(3)));
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
		B_returnprice b = new B_returnprice();
		FlightAll fa = new FlightAll("2022-12-30","미국","ICN");
		List<FlightAll> flist = b.returnMinfeeN(fa);
		for(FlightAll f:flist) {
			System.out.println(f.getFlightNumber());
			System.out.println(f.getDepartApnation());
		}

	}

}
