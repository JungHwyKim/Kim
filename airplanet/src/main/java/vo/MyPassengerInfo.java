package vo;

import java.util.Date;

//vo.MyPassengerInfo
public class MyPassengerInfo {
	private String email;
	private String korname;
	private String engsur;
	private String engname;
	private String birthday;
	private String mf;
	private String ppnumber;
	private String ppexpire;
	private String nation;
	private String ppnation;
	
	public MyPassengerInfo() {}
	public MyPassengerInfo(String email, String korname, String engsur, String engname, String birthday, String mf,
			String ppnumber, String ppexpire, String nation, String ppnation) {
		this.email = email;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
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
	public String getPpexpire() {
		return ppexpire;
	}
	public void setPpexpire(String ppexpire) {
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
