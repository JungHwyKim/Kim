package vo;

import java.util.Date;

//vo.Fare
public class Fare {
	private String bookingReference;
	private String optionCode;
	private String email;
	private String resDate;
	private String resState;
	private String cardInfo;
	private int cnt;
	private int totalPrice;
	
	public Fare() {}
	public Fare(String bookingReference, String optionCode, String email, String resDate, String resState,
			String cardInfo, int cnt, int totalPrice) {
		this.bookingReference = bookingReference;
		this.optionCode = optionCode;
		this.email = email;
		this.resDate = resDate;
		this.resState = resState;
		this.cardInfo = cardInfo;
		this.cnt = cnt;
		this.totalPrice = totalPrice;
	}
	public String getBookingReference() {
		return bookingReference;
	}
	public void setBookingReference(String bookingReference) {
		this.bookingReference = bookingReference;
	}
	public String getOptionCode() {
		return optionCode;
	}
	public void setOptionCode(String optionCode) {
		this.optionCode = optionCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public String getResState() {
		return resState;
	}
	public void setResState(String resState) {
		this.resState = resState;
	}
	public String getCardInfo() {
		return cardInfo;
	}
	public void setCardInfo(String cardInfo) {
		this.cardInfo = cardInfo;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
	
	
	
}
