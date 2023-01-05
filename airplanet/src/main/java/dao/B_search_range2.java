package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.DB;
import vo.FlightAll;
import vo.FlightAll2;
//dao.B_search_range getRangeticket
public class B_search_range2 {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<FlightAll2> getRangeticket2(FlightAll2 fa){
		List<FlightAll2> flist = new ArrayList<FlightAll2>();
		String sql="SELECT DISTINCT f1.flightnumber, f1.departdate, f1.DEPARTAIRPORT , f1.ARRIVEAIRPORT , f1.FLIGHTHOURS, \r\n"
				+ "a1.PACIFICTIME , a2.PACIFICTIME, ar1.AIRLINELOGO, f1.STANDARDFEE , t1.CLASSfee,\r\n"
				+ "f2.FLIGHTNUMBER,f2.DEPARTDATE, f2.FLIGHTHOURS, ar2.AIRLINELOGO, f2.STANDARDFEE , t2.CLASSfee \r\n"
				+ "FROM FLIGHT f1, airport a2, airport a1, ticketOption t1, TICKETOPTION t2, AIRLINE ar1, AIRLINE ar2, FLIGHT f2 \r\n"
				+ "WHERE a1.AIRPORTCODE =f1.DEPARTAIRPORT \r\n"
				+ "AND a2.AIRPORTCODE =f1.ARRIVEAIRPORT \r\n"
				+ "AND t1.FLIGHTNUMBER =f1.FLIGHTNUMBER \r\n"
				+ "AND ar1.AIRLINECODE =f1.AIRLINECODE \r\n"
				+ "AND t1.stock>=1 AND t2.STOCK >=1\r\n"
				+ "AND a2.AIRPORTCODE =f2.DEPARTAIRPORT AND a1.AIRPORTCODE =f2.ARRIVEAIRPORT \r\n"
				+ "AND t2.FLIGHTNUMBER =f2.FLIGHTNUMBER AND ar2.AIRLINECODE =f2.AIRLINECODE \r\n"
				+ "AND TO_CHAR(f1.departdate,'yyyy-mm-dd')= ?\r\n"
				+ "AND TO_CHAR(f2.departdate,'yyyy-mm-dd')= ?\r\n"
				+ "AND (a1.apcity=? OR a1.airportcode=?) \r\n"
				+ "AND (a2.APCITY=? OR a2.AIRPORTCODE=?)\r\n"
				+ "AND substr(t1.optioncode,15,2)=?\r\n"
				+ "AND substr(t2.optioncode,15,2)=?\r\n"
				+ "AND TO_NUMBER(TO_char(f1.departdate,'sssss')) >=? and TO_NUMBER(TO_char(f1.departdate,'sssss')) <=?\r\n"
				+ "AND TO_NUMBER(TO_char(f2.departdate,'sssss')) >=? and TO_NUMBER(TO_char(f2.departdate,'sssss')) <=?\r\n"
				+ "ORDER BY ";
			if(fa.getSort()==1) {
				sql+=" f1.STANDARDFEE+f2.STANDARDFEE";
			}else if(fa.getSort()==2) {
				sql+=" f1.FLIGHTHOURS+f2.FLIGHTHOURS";
			}else if(fa.getSort()==3) {
				sql+=" f1.DEPARTDATE";
			}else if(fa.getSort()==4) {
				sql+=" f2.DEPARTDATE";
			}	
		//ORDER BY는 PreparedStatement으로 사용 X  f.FLIGHTHOURS --f.DEPARTDATE --f.STANDARDFEE

	try {
		con = DB.con();
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, fa.getDepartDate1());
		pstmt.setString(2, fa.getDepartDate2());
		pstmt.setString(3, fa.getDepartLocation());
		pstmt.setString(4, fa.getDepartLocation());
		pstmt.setString(5, fa.getArriveLocation());
		pstmt.setString(6, fa.getArriveLocation());
		pstmt.setString(7, fa.getClassStr());
		pstmt.setString(8, fa.getClassStr());
		pstmt.setInt(9, fa.getFrRange1());
		pstmt.setInt(10, fa.getToRange1());
		pstmt.setInt(11, fa.getFrRange2());
		pstmt.setInt(12, fa.getToRange2());
		rs=pstmt.executeQuery();
		while(rs.next()) {
			flist.add(new FlightAll2(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getFloat(5),
					rs.getInt(6),rs.getInt(7),rs.getString(8),rs.getInt(9),rs.getInt(10),rs.getString(11),rs.getString(12),
					rs.getFloat(13),rs.getString(14),rs.getInt(15),rs.getInt(16)));
		}
		//System.out.println(flist.size());
	
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
		B_search_range2 b = new B_search_range2();
		FlightAll2 fa = new FlightAll2("2022-12-21","2022-12-30","ICN","FUK","ec",0,86400,0,86400,2);
		List<FlightAll2> flist = b.getRangeticket2(fa);
		for(FlightAll2 f:flist) {
			System.out.print(f.getFlightNumber1()+"\t");
			System.out.print(f.getFlightHours1()+"\t");
			System.out.print(f.getDepartDate1()+"\t");
			System.out.print(f.getStandardFee1()+"\t");
			System.out.print(f.getFlightNumber2()+"\t");
			System.out.print(f.getFlightHours2()+"\t");
			System.out.print(f.getDepartDate2()+"\t");
			System.out.print(f.getStandardFee2()+"\n");
		}
		

	}

}
