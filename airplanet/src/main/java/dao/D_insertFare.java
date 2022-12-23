package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.DB;
import vo.Fare;

public class D_insertFare {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public boolean insertFare(Fare newfare) {
		boolean done=false;
		String sql="INSERT INTO FARE VALUES (?,?,?,sysdate,?,?,?,?)";
		try {
			con=DB.con();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, newfare.getBookingReference());
			pstmt.setString(2, newfare.getOptionCode());
			pstmt.setString(3, newfare.getEmail());
			pstmt.setString(4, newfare.getResState()); 
			pstmt.setString(5, newfare.getCardInfo());
			pstmt.setInt(6, newfare.getCnt());
			pstmt.setInt(7, newfare.getTotalPrice());
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
		Fare newfare= new Fare("2212221721061001","ICNLAX22122115bs0","abcdee@eemail.com","","1","",1,978000);
		
		D_insertFare dao=new D_insertFare();
		System.out.println(dao.insertFare(newfare));
	}

}
