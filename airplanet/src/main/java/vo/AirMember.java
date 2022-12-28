package vo;
//vo.AirMember
public class AirMember {
	private String email;
	private String pass;
	private String name;
	private String phoneNumber;
	private int mileage;
	private String cardInfo;
	
	public AirMember() {}
	
	public AirMember(String email) {
		this.email = email;
	}
	
	public AirMember(String email, String pass) {
		this.email = email;
		this.pass = pass;
	}

	public AirMember(String email, String pass, String name, String phoneNumber) {
		this.email = email;
		this.pass = pass;
		this.name = name;
		this.phoneNumber = phoneNumber;
	}

	public AirMember(String email, String pass, String name, String phoneNumber, int mileage, String cardInfo) {
		this.email = email;
		this.pass = pass;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.mileage = mileage;
		this.cardInfo = cardInfo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getCardInfo() {
		return cardInfo;
	}
	public void setCardInfo(String cardInfo) {
		this.cardInfo = cardInfo;
	}
	
	

}
