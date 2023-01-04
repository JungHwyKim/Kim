package vo;

public class FareAll {
	// f.totalPrice, a.airlineName, f.bookingReference, f.resDate, f.resState, fl.departAirport, fl.arriveAirport, fl.flightNumber, fl.departDate, fl.flightHours, LISTAGG(p.korname, ',') WITHIN GROUP(ORDER BY korname) AS korname
	private int totalPrice;
	private String airlineName;
	private String bookingReference;
	private String resDate;
	private String resState;
	private String departAirport;
	private String arriveAirport;
	private String flightNumber;
	private String departDate;
	private float flightHours;
	private String korname;
	private String phoneNumber;
	private String email;
	
	public FareAll() {}


	public FareAll(int totalPrice, String airlineName, String bookingReference, String resDate, String resState,
			String departAirport, String arriveAirport, String flightNumber, String departDate, float flightHours,
			String korname, String phoneNumber, String email) {
		this.totalPrice = totalPrice;
		this.airlineName = airlineName;
		this.bookingReference = bookingReference;
		this.resDate = resDate;
		this.resState = resState;
		this.departAirport = departAirport;
		this.arriveAirport = arriveAirport;
		this.flightNumber = flightNumber;
		this.departDate = departDate;
		this.flightHours = flightHours;
		this.korname = korname;
		this.phoneNumber = phoneNumber;
		this.email = email;
	}

	public FareAll(String bookingReference) {
		this.bookingReference = bookingReference;
	}

	public String getBookingReference() {
		return bookingReference;
	}

	public void setBookingReference(String bookingReference) {
		this.bookingReference = bookingReference;
	}

	public String getAirlineName() {
		return airlineName;
	}

	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
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

	public String getDepartAirport() {
		return departAirport;
	}

	public void setDepartAirport(String departAirport) {
		this.departAirport = departAirport;
	}

	public String getArriveAirport() {
		return arriveAirport;
	}

	public void setArriveAirport(String arriveAirport) {
		this.arriveAirport = arriveAirport;
	}

	public String getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getDepartDate() {
		return departDate;
	}

	public void setDepartDate(String departDate) {
		this.departDate = departDate;
	}

	public String getKorname() {
		return korname;
	}

	public void setKorname(String korname) {
		this.korname = korname;
	}

	public float getFlightHours() {
		return flightHours;
	}

	public void setFlightHours(float flightHours) {
		this.flightHours = flightHours;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhonenumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
