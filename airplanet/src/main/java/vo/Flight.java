package vo;

//vo.Flight
public class Flight {
	private String flightNumber;
	private String airlineCode;
	private String departAirport;
	private String departDate;
	private String arriveAirport;
	private float flightHours;
	private int standardFee;
	
	public Flight() {}
	public Flight(String flightNumber, String airlineCode, String departAirport, String departDate, String arriveAirport,
			float flightHours, int standardFee) {
		this.flightNumber = flightNumber;
		this.airlineCode = airlineCode;
		this.departAirport = departAirport;
		this.departDate = departDate;
		this.arriveAirport = arriveAirport;
		this.flightHours = flightHours;
		this.standardFee = standardFee;
	}
	public String getFlightNumber() {
		return flightNumber;
	}
	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}
	public String getAirlineCode() {
		return airlineCode;
	}
	public void setAirlineCode(String airlineCode) {
		this.airlineCode = airlineCode;
	}
	public String getDepartAirport() {
		return departAirport;
	}
	public void setDepartAirport(String departAirport) {
		this.departAirport = departAirport;
	}
	public String getDepartDate() {
		return departDate;
	}
	public void setDepartDate(String departDate) {
		this.departDate = departDate;
	}
	public String getArriveAirport() {
		return arriveAirport;
	}
	public void setArriveAirport(String arriveAirport) {
		this.arriveAirport = arriveAirport;
	}
	public float getFlightHours() {
		return flightHours;
	}
	public void setFlightHours(float flightHours) {
		this.flightHours = flightHours;
	}
	public int getStandardFee() {
		return standardFee;
	}
	public void setStandardFee(int standardFee) {
		this.standardFee = standardFee;
	}
	
	
	
	
}
