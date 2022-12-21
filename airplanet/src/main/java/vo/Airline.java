package vo;
//vo.Airline
public class Airline {
	private String airlineCode;
	private String airlineName;
	private String airlineLogo;
	
	public Airline() {}
	public Airline(String airlineCode, String airlineName, String airlineLogo) {
		this.airlineCode = airlineCode;
		this.airlineName = airlineName;
		this.airlineLogo = airlineLogo;
	}
	public String getAirlineCode() {
		return airlineCode;
	}
	public void setAirlineCode(String airlineCode) {
		this.airlineCode = airlineCode;
	}
	public String getAirlineName() {
		return airlineName;
	}
	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}
	public String getAirlineLogo() {
		return airlineLogo;
	}
	public void setAirlineLogo(String airlineLogo) {
		this.airlineLogo = airlineLogo;
	}
	
	
}
