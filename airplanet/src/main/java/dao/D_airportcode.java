package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.DB;

public class D_airportcode {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
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
		D_airportcode dd = new D_airportcode();
		System.out.println(dd.selectAirportCode("la"));
		
	}
}
