package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.Airport;
//dao.A_main
public class A_main {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<Airport> getAirport() {
		List<Airport> alist = new ArrayList<>();
		String sql = "SELECT apnation, apcity FROM airport";
		return alist;
	}
			
	
}
