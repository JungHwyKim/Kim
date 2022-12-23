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
	
	public boolean updateStock(String flightNumber, int sold) {	//표 팔렸을때
		boolean done=false;
		try {
			con=DB.con();
			con.setAutoCommit(false);
			String sql="UPDATE TICKETOPTION SET stock = (stock - ?) WHERE OPTIONCODE LIKE '%'||?||'%' ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sold);
			pstmt.setString(2, flightNumber);			
			if(pstmt.execute()) {
				con.commit();
				done=pstmt.executeUpdate()==1?true:false;
			}
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
		D_selectTicketOption dd= new D_selectTicketOption();
		TicketOption search=new TicketOption();
		search.setOptionCode("bs");
		for(TicketOption t:dd.selectAll(search)) {
			System.out.println(t.getOptionCode());
		}
		System.out.println(dd.updateStock("LAXSFO22122123bs0", 2));
		

	}

}
