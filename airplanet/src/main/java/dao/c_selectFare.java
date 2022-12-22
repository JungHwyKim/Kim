package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.DB;
import vo.Fare;

public class c_selectFare {
	// DB 연결 필드 선언
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 마이페이지에서 예약번호 검색시 일치하는 예약내역 조회 메소드
	public List<Fare> getFareList(Fare sch) {
		List<Fare> flist = new ArrayList<Fare>();
		String sql = "SELECT * FROM fare WHERE bookingReference = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getBookingReference());
			rs = pstmt.executeQuery();
			// Fare(String bookingReference, String optionCode, String email, String resDate, String resState,
			//		String cardInfo, int cnt, int totalPrice)
			while(rs.next()) {
				flist.add(new Fare( rs.getString("bookingReference"),
									rs.getString("optionCode"),
									rs.getString("email"),
									rs.getString("resDate"),
									rs.getString("resState"),
									rs.getString("cardInfo"),
									rs.getInt("cnt"),
									rs.getInt("totalPrice")
							));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러: "+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return flist;
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
