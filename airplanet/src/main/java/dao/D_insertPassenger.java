package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.Passenger;
import vo.DB;

public class D_insertPassenger {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public boolean insertFare(Passenger newpsg) {
		boolean done=false;
		String sql="INSERT INTO passenger values(?,?,?,?,to_date(?,'yyyy-mm-dd'),?,?,to_date(?,'yyyy-mm-dd'),?,?)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newpsg.getBookingReference());
			pstmt.setString(2, newpsg.getKorname());
			pstmt.setString(3, newpsg.getEngsur());
			pstmt.setString(4, newpsg.getEngname());
			pstmt.setString(5, newpsg.getBirthday());	//1955-05-11
			pstmt.setString(6, newpsg.getMf());			//M 또는 F 대문자로
			pstmt.setString(7, newpsg.getPpnumber());
			pstmt.setString(8, newpsg.getPpexpire());
			pstmt.setString(9, newpsg.getNation());
			pstmt.setString(10, newpsg.getPpnation());
			done=pstmt.executeUpdate()==1?true:false;
			con.commit();
			
		 } catch (SQLException e) {
				System.out.println("SQL예외: "+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					System.out.println("롤백예외:" +e1.getMessage());
				}
				}catch(Exception e) {
					System.out.println("일반예외:"+e.getMessage());
				}
				finally {
					DB.close(rs, pstmt, con);
				}
			return done;
		}
	
	
	public static void main(String[] args) {
		Passenger ps=new Passenger("2212221721061001","김세영","kim","deyoung","2011-11-11","F","01068888888","2030-11-11","한국","한국");
		D_insertPassenger dao= new D_insertPassenger();
		System.out.println(	dao.insertFare(ps));

	}

}
