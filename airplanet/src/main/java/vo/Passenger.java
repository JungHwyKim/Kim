package vo;

import java.util.Date;

//vo.Passenger
public class Passenger {
	private String bookingReference;
	private String korname;
	private String engsur;
	private String engname;
	private Date birthday;
	private String mf;
	private String ppnumber;
	private Date ppexpire;
	private String nation;
	private String ppnation;
	
	public Passenger() {}
	public Passenger(String bookingReference, String korname, String engsur, String engname, Date birthday, String mf,
			String ppnumber, Date ppexpire, String nation, String ppnation) {
		this.bookingReference = bookingReference;
		this.korname = korname;
		this.engsur = engsur;
		this.engname = engname;
		this.birthday = birthday;
		this.mf = mf;
		this.ppnumber = ppnumber;
		this.ppexpire = ppexpire;
		this.nation = nation;
		this.ppnation = ppnation;
	}
	public String getBookingReference() {
		return bookingReference;
	}
	public void setBookingReference(String bookingReference) {
		this.bookingReference = bookingReference;
	}
	public String getKorname() {
		return korname;
	}
	public void setKorname(String korname) {
		this.korname = korname;
	}
	public String getEngsur() {
		return engsur;
	}
	public void setEngsur(String engsur) {
		this.engsur = engsur;
	}
	public String getEngname() {
		return engname;
	}
	public void setEngname(String engname) {
		this.engname = engname;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getMf() {
		return mf;
	}
	public void setMf(String mf) {
		this.mf = mf;
	}
	public String getPpnumber() {
		return ppnumber;
	}
	public void setPpnumber(String ppnumber) {
		this.ppnumber = ppnumber;
	}
	public Date getPpexpire() {
		return ppexpire;
	}
	public void setPpexpire(Date ppexpire) {
		this.ppexpire = ppexpire;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getPpnation() {
		return ppnation;
	}
	public void setPpnation(String ppnation) {
		this.ppnation = ppnation;
	}
	
	
	
}
