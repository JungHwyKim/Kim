package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.DB;
import vo.TicketOption;

public class D_selectTicketOption {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//flight테이블 flightNumber 가진 ticketOption 모두 뽑기
	public List<TicketOption> selectAll(TicketOption to) {
		List<TicketOption> optionlist= new ArrayList<TicketOption>(); 
		try {
			con=DB.con();
			String sql="SELECT * FROM ticketOption WHERE flightnumber LIKE '%'||?||'%' AND optioncode LIKE '%'||?||'%' AND stock >=  ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, to.getFlightNumber());
			pstmt.setString(2, to.getOptionCode());
			pstmt.setInt(3, to.getStock());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				optionlist.add(new TicketOption(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return optionlist;
	}
	
	public void updateStock(String flightNumber, int sold) {	//표 팔렸을때
		try {
			con=DB.con();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static void main(String[] args) {
		D_selectTicketOption dd= new D_selectTicketOption();
		TicketOption search=new TicketOption();
		search.setOptionCode("bs");
		for(TicketOption t:dd.selectAll(search)) {
			System.out.println(t.getOptionCode());
		}

	}

}
