package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.DB;
import vo.Fare;

public class C_selectFare {
	// DB 연결 필드 선언
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 마이페이지에서 예약번호 검색시 일치하는 예약내역 조회 메소드
	public List<Fare> getFareList(Fare sch) {
		List<Fare> flist = new ArrayList<Fare>();
		// LISTAGG 함수 사용하여 동일한 항공편에 탑승자 정보를 ,로 구분하여 한 결과로 나타내게 함
		// 항공노선, 옵션별상품, fare, 탑승자 정보 테이블 join
		String sql = "SELECT f.bookingReference, f.resDate, f.resState, fl.departAirport, fl.arriveAirport, fl.flightNumber, fl.departDate, fl.flightHours, LISTAGG(p.korname, ',') WITHIN GROUP(ORDER BY korname) AS korname\r\n"
				+ "FROM fare f, passenger p, flight fl, ticketOption ti\r\n"
				+ "WHERE f.bookingReference = p.bookingReference AND fl.flightNumber = ti.flightNumber AND \r\n"
				+ "ti.optionCode = f.optionCode and\r\n"
				+ "f.bookingReference = ? \r\n"
				+ "GROUP BY f.bookingReference, f.resDate, f.resState, fl.departAirport, fl.arriveAirport, fl.flightNumber, fl.departDate, fl.flightHours";
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
