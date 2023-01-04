package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import vo.DB;
import vo.Fare;
import vo.Passenger;

//티켓 구매할때 사용되는 메소드 모두

public class D_insertFare {
	
	private Connection con;
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private PreparedStatement pstmt3;
	private ResultSet rs;
	
	public String insertFarePassenger(ArrayList<Fare> farelist,Passenger newpsg) {
		String bookingReference="";
		try {
			con=DB.con();
			con.setAutoCommit(false);
			String sql="INSERT INTO FARE VALUES (?||fare_seq.nextval,?,?,sysdate,?,?,?,?) ";
		for(int i=0;i<farelist.size();i++){
				if(i!=0) {
					sql="INSERT INTO FARE VALUES (?||fare_seq.currval,?,?,sysdate,?,?,?,?) ";
					}
			Fare newfare = farelist.get(i);
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, newfare.getBookingReference());
			pstmt.setString(2, newfare.getOptionCode());
			pstmt.setString(3, newfare.getEmail());
			pstmt.setString(4, newfare.getResState()); 
			pstmt.setString(5, newfare.getCardInfo());
			pstmt.setInt(6, newfare.getCnt());
			pstmt.setInt(7, newfare.getTotalPrice());
			pstmt.executeUpdate();
			}
		
			String sql2="INSERT INTO passenger values(?||fare_seq.currval,?,?,?,to_date(?,'yyyy-mm-dd'),?,?,to_date(?,'yyyy-mm-dd'),?,?)";
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setString(1, newpsg.getBookingReference());
			pstmt2.setString(2, newpsg.getKorname());
			pstmt2.setString(3, newpsg.getEngsur());
			pstmt2.setString(4, newpsg.getEngname());
			pstmt2.setString(5, newpsg.getBirthday());	//1955-05-11
			pstmt2.setString(6, newpsg.getMf());			//M 또는 F 대문자로
			pstmt2.setString(7, newpsg.getPpnumber());
			pstmt2.setString(8, newpsg.getPpexpire());
			pstmt2.setString(9, newpsg.getNation());
			pstmt2.setString(10, newpsg.getPpnation());
			pstmt2.executeUpdate();	
		
			String sql3="SELECT ?||fare_seq.currval FROM dual";
			pstmt3 = con.prepareStatement(sql3);			
			pstmt3.setString(1, newpsg.getBookingReference());
			rs=pstmt3.executeQuery();
			if(rs.next()) {
				bookingReference=rs.getString(1);
			}
			
			con.commit();
		 } catch (SQLException e) {
				System.out.println("insertFareNext SQL예외: "+e.getMessage());
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
			return bookingReference;
		}
	
	public boolean insertFareCurr(Fare newfare) {
		boolean done=false;
		String sql="INSERT INTO FARE VALUES (?||fare_seq.currval,?,?,sysdate,?,?,?,?) ";
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
				System.out.println("insertFareCurr SQL예외: "+e.getMessage());
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
	
	public boolean insertPassenger(Passenger newpsg) {
		boolean done=false;
		String sql="INSERT INTO passenger values(?||fare_seq.currval,?,?,?,to_date(?,'yyyy-mm-dd'),?,?,to_date(?,'yyyy-mm-dd'),?,?)";
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
				System.out.println("insertPassenger SQL예외: "+e.getMessage());
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
	
	public boolean updateStock(String optionCode, int sold) {	//표 팔렸을때 재고 조정
		boolean done=false;
		try {
			con=DB.con();
			con.setAutoCommit(false);
			String sql="UPDATE TICKETOPTION SET stock = (stock - ?) WHERE OPTIONCODE LIKE '%'||?||'%' ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sold);
			pstmt.setString(2, optionCode);			
			if(pstmt.execute()) {
				con.commit();
				done=pstmt.executeUpdate()==1?true:false;
			}
	     } catch (SQLException e) {
			System.out.println("updateStock SQL예외: "+e.getMessage());
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
	
	public boolean updateMileage(String email,int addmileage) {	//마일리지 적립
		boolean done=false;
		try {
			con=DB.con();
			con.setAutoCommit(false);
			String sql="UPDATE AirMember SET mileage = (?+mileage) WHERE email LIKE '%'||?||'%' ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, addmileage);
			pstmt.setString(2, email);			
			if(pstmt.execute()) {
				con.commit();
				done=pstmt.executeUpdate()==1?true:false;
			}
	     } catch (SQLException e) {
			System.out.println("updateMileage SQL예외: "+e.getMessage());
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
		Fare newfare= new Fare("2301011721061001","aaaaaa22122115bs0","abcdee@eemail.com","","1","",1,978000);
		Passenger newPassenger=new Passenger("testing","최박박","chae","ccake","2020-01-11","m","01065543214","2024-11-11","중국","러시아");
		D_insertFare dao=new D_insertFare();
	
		Date dd=new Date();
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyMMddHHmmss");
		System.out.println(dtFormat.format(dd));
		System.out.println("221222172106");
		
		ArrayList<Fare> farelist= new ArrayList<Fare> ();
		farelist.add(new Fare("testing","aaaaaa가는길","abcdee@eemail.com","","1","",1,978000));
		farelist.add(new Fare("testing","aaaaaa오는길","abcdee@eemail.com","","1","",1,120090));
		System.out.println(dao.insertFarePassenger(farelist,newPassenger));
	}

}
