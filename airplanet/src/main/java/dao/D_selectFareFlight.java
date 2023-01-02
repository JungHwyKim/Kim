package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.DB;
public class D_selectFareFlight {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<String[]> select(String bkrf) {
		List<String[]> list=new ArrayList<String[]> ();
		try {
			con=DB.con();
			String sql="SELECT DISTINCT BOOKINGREFERENCE,RESDATE, OPTIONCODE ,departdate, flighthours, Resstate, flightnumber,deAP.apcity , arAP.apcity, TOTALPRICE, deAP.pacifictime, arAP.pacifictime "
					+ "FROM FARE f, FLIGHT fl,(SELECT AIRPORTCODE ,APcity,pacifictime AS FROM AIRPORT a) deAP,(SELECT AIRPORTCODE ,APcity,pacifictime FROM AIRPORT a) arAP "
					+ "	WHERE substr(f.OPTIONCODE ,0,14)=fl.FLIGHTNUMBER "
					+ "	AND deAP.airportcode=fl.DEPARTAIRPORT "
					+ "	AND arAP.airportcode=fl.ARRIVEAIRPORT "
					+ "	AND f.BOOKINGREFERENCE = ? order by departdate";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bkrf);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String [] arr= new String[12];
				arr[0]=rs.getString(1);		//bookingReference
				arr[1]=rs.getString(2);		//resDate
				arr[2]=rs.getString(3);		//option code
				arr[3]=rs.getString(4);		//depart date
				arr[4]=rs.getString(5);		//flight hours
				arr[5]=rs.getString(6);		//res state
				arr[6]=rs.getString(7);		//flight number
				arr[7]=rs.getString(8);		// 출발지
				arr[8]=rs.getString(9);		//도착지
				arr[9]=rs.getString(10);	//금액
				arr[10]=rs.getString(11);	//출발지 퍼시픽
				arr[11]=rs.getString(12);	//도착지 퍼시픽
				list.add(arr);
			}
		}  catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반예외:"+e.getMessage());
			}
			finally {
				DB.close(rs, pstmt, con);
			}
		
		return list;
	}
	public static void main(String[] args) {
		D_selectFareFlight dao=new D_selectFareFlight();
		for(String[] dd : dao.select("2301022107271096")) {
			System.out.println(dd[0]);
			System.out.println(dd[2]);
			System.out.println(dd[9]);
		};

	}

}
