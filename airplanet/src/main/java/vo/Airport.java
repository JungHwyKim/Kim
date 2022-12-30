package vo;
//vo.Airport
public class Airport {
	private String airportCode;
	private String apNation;
	private String apCity;
	private float pacificTime;
	private String asPhoto;
	
	public Airport() {}
	
	public Airport(String apNation) {
		this.apNation = apNation;
	}

	public Airport(String apNation, String apCity) {
		this.apNation = apNation;
		this.apCity = apCity;
	}

	public Airport(String airportCode, String apNation, String apCity, float pacificTime, String asPhoto) {
		this.airportCode = airportCode;
		this.apNation = apNation;
		this.apCity = apCity;
		this.pacificTime = pacificTime;
		this.asPhoto = asPhoto;
	}
	public String getAirportCode() {
		return airportCode;
	}
	public void setAirportCode(String airportCode) {
		this.airportCode = airportCode;
	}
	public String getApNation() {
		return apNation;
	}
	public void setApNation(String apNation) {
		this.apNation = apNation;
	}
	public String getApCity() {
		return apCity;
	}
	public void setApCity(String apCity) {
		this.apCity = apCity;
	}
	public float getPacificTime() {
		return pacificTime;
	}
	public void setPacificTime(float pacificTime) {
		this.pacificTime = pacificTime;
	}
	public String getAsPhoto() {
		return asPhoto;
	}
	public void setAsPhoto(String asPhoto) {
		this.asPhoto = asPhoto;
	}
	
	
}
