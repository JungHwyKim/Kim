package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.DB;
import vo.FlightAll;

public class D_FlightAll {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public FlightAll selectFlight(String flightnumber) {
		FlightAll newflight=null;
		try {
			con=DB.con();
			String sql="SELECT * FROM flight WHERE FLIGHTNUMBER = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, flightnumber);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				newflight= new FlightAll(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getFloat(6),rs.getInt(7));
			}
		}  catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반예외:"+e.getMessage());
			}
			finally {
				DB.close(rs, pstmt, con);
			}
		
		return newflight;
	}
	
	public FlightAll selectDepartAirport(FlightAll newflight) {
		try {
			con=DB.con();
			String sql="SELECT * FROM AIRPORT a WHERE AIRPORTCODE = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, newflight.getDepartAirportcode());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				newflight.setDepartApnation(rs.getString(2));
				newflight.setDepartApcity(rs.getString(3));
				newflight.setDepartPacifictime(rs.getInt(4));
			}
		}  catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반예외:"+e.getMessage());
			}
			finally {
				DB.close(rs, pstmt, con);
			}
		
		return newflight;
	}
		
	public FlightAll selectArriveAirport(FlightAll newflight) {
		try {
			con=DB.con();
			String sql="SELECT * FROM AIRPORT a WHERE AIRPORTCODE = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, newflight.getArriveAirportcode());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				newflight.setArriveApnation(rs.getString(2));
				newflight.setArriveApcity(rs.getString(3));
				newflight.setArrivePacifictime(rs.getInt(4));
				newflight.setArriveApphoto(rs.getString(5));
			}
		}  catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반예외:"+e.getMessage());
			}
			finally {
				DB.close(rs, pstmt, con);
			}
		
		return newflight;
	}
	
	public FlightAll selectAirline(FlightAll newflight) {
		try {
			con=DB.con();
			String sql="SELECT * FROM airline WHERE AIRLINECODE = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, newflight.getAirlineCode());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				newflight.setAirlineName(rs.getString("AIRLINENAME"));
				newflight.setAirlinelogo(rs.getString("AIRLINELOGO"));
			}
		}  catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반예외:"+e.getMessage());
			}
			finally {
				DB.close(rs, pstmt, con);
			}
		
		return newflight;
	}
	
	public String selectAirportCode(String arriveLocation) {
		String sql="SELECT airportcode FROM AIRPORT a WHERE apcity = upper( ? ) OR AIRPORTCODE = upper( ? )";
		String airportcode=null;
		try  {
			con=DB.con();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, arriveLocation);
			pstmt.setString(2, arriveLocation );
			rs=pstmt.executeQuery();
			if(rs.next()) {
				airportcode=rs.getString(1);
			}
		}  catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반예외:"+e.getMessage());
			}
			finally {
				DB.close(rs, pstmt, con);
			}
		return airportcode;
	}
	

	public static void main(String[] args) {
		D_FlightAll fallDao=new D_FlightAll();
		FlightAll flight1 = fallDao.selectFlight("SFOICN23012011");
		System.out.println(flight1.getAirlineCode());
		System.out.println(flight1.getArriveApcity());
		System.out.println(flight1.getStandardFee());
		System.out.println(flight1.getDepartAirportcode());
		System.out.println(flight1.getArriveAirportcode());
	}

}
