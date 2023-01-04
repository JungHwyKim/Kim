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
	
	//flightNumber, 옵션, 재고로 검색
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
		}  catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반예외:"+e.getMessage());
			}
			finally {
				DB.close(rs, pstmt, con);
			}
		return optionlist;
	}
	
	//티켓옵션으로 특정 티켓 검색
	public TicketOption selectOneSpecific(String optioncode) {
		TicketOption thisticket =  new TicketOption();
		try {
			con=DB.con();
			String sql="SELECT * FROM ticketOption WHERE optioncode LIKE '%'||?||'%'";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, optioncode);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			thisticket = new TicketOption(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5));}
			
		}  catch (SQLException e) {
			System.out.println("selectOneSpecific SQL예외: "+e.getMessage());
			}catch(Exception e) {
				System.out.println("일반예외:"+e.getMessage());
			}
			finally {
				DB.close(rs, pstmt, con);
			}
		return thisticket;
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
