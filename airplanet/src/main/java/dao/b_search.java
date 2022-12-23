package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.Flight;

public class b_search {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<Flight> getFlight(Flight f) {
		List<Flight> flist = new ArrayList<Flight>();
		String sql = "SELECT ap1.apnation, ap1.apcity, f.flightnumber, f.departdate,f.flighthours,f.standardfee, \r\n"
				+ "t.optioncode,ap2.apnation, ap2.apcity, ap2.apphoto, ar.airlinelogo\r\n"
				+ "FROM airport ap2, flight f, airport ap1, ticketOption t, airline ar \r\n"
				+ "WHERE f.arriveairport=ap2.airportcode\r\n"
				+ "AND f.departairport = ap1.airportcode\r\n"
				+ "AND f.flightnumber = t.flightnumber\r\n"
				+ "AND ar.airlinecode = f.airlinecode\r\n"
				+ "AND ap1.apnation = ?\r\n"
				+ "AND ap1.apcity=?\r\n"
				+ "AND ap2.apnation = ?\r\n"
				+ "AND ap2.apcity=?\r\n"
				+ "AND TO_CHAR(f.departdate,'yyyy-mm-dd')= '2022-12-21' \r\n"
				+ "AND substr(t.optioncode,15,2)= ?\r\n"
				+ "AND t.stock>=1 ";
		
		return flist;

	}
}
