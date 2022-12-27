package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.DB;
import vo.AirMember;

public class D_selectAirMember {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public AirMember selectOneSpecific(String email,String pass) {
		AirMember mem =  new AirMember();
		try {
			con=DB.con();
			String sql="SELECT * FROM airMember WHERE email LIKE '%'||?||'%' and pass LIKE '%'||?||'%' ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			mem = new AirMember(email,pass,rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6));}
			
		}  catch (SQLException e) {
			System.out.println("selectOneSpecific SQL예외: "+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반예외:"+e.getMessage());
			}
			finally {
				DB.close(rs, pstmt, con);
			}
		return mem;
	}
	

	public static void main(String[] args) {
		D_selectAirMember dm=new D_selectAirMember();
		AirMember im =	dm.selectOneSpecific("t711txt@naver.com", "1234");
		System.out.println(im.getName());

	}

}
