package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import vo.DB;
import vo.MyPassengerInfo;
import vo.TicketOption;

public class D_selectMyPassenger {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MyPassengerInfo select(String email) {
		MyPassengerInfo myinfo=null;
		try {
			con=DB.con();
			String sql="SELECT * FROM mypassengerinfo WHERE email = ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				myinfo=new MyPassengerInfo(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10)
						);
			}
		}  catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반예외:"+e.getMessage());
			}
			finally {
				DB.close(rs, pstmt, con);
			}
		
		return myinfo;
	}
	
	public static void main(String[] args) {
		D_selectMyPassenger dd=new D_selectMyPassenger();
		MyPassengerInfo ii=dd.select("t711txt@naver.com");
		System.out.println(ii.getEmail());

	}

}
