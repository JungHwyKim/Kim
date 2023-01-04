package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.DB;
import vo.FareAll;

public class C_selectFare2 {
	// DB 연결 필드 선언
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 마이페이지에서 예약번호 검색시 일치하는 예약내역 조회 메소드
	public List<FareAll> getFareList02(FareAll sch) {
		List<FareAll> flist = new ArrayList<FareAll>();
		// LISTAGG 함수 사용하여 동일한 항공편에 탑승자 정보를 ,로 구분하여 한 결과로 나타내게 함
		// 항공노선, 옵션별상품, fare, 탑승자 정보 테이블 join
		String sql = "SELECT f.totalPrice, a.airlineName, f.bookingReference, f.resDate, f.resState, fl.departAirport, fl.arriveAirport, fl.flightNumber, fl.departDate, fl.flightHours, p.korname, ar.phonenumber, ar.email\r\n"
				+ "FROM airline a, fare f, passenger p, flight fl, ticketOption ti, airMember ar\r\n"
				+ "WHERE f.bookingReference = p.bookingReference AND fl.flightNumber = ti.flightNumber AND \r\n"
				+ "ti.optionCode = f.optionCode AND a.airlineCode = fl.airlineCode AND ar.email = f.email and\r\n"
				+ "f.bookingReference = ?";
		System.out.println(sql);
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getBookingReference());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				flist.add(new FareAll( rs.getInt(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7),
									rs.getString(8),
									rs.getString(9),
									rs.getFloat(10),
									rs.getString(11),
									rs.getString(12),
									rs.getString(13)
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
