package vo;
//Flight, Airline, Airport, TicketOption 테이블 4개 join해서 쓸 클래스
//vo.FlightAll
public class FlightAll {
	private String departApnation;
	private String departApcity;
	private int departPacifictime;
	private String departAirportcode;
	private String flightNumber;
	private String departDate;
	private float flightHours;
	private int standardFee;
	private int classfee;
	private String optioncode;
	private String arriveApnation;
	private String arriveApcity;
	private int arrivePacifictime;
	private String arriveAirportcode;
	private String arriveApphoto;
	private String airlinelogo;
	private String classStr; // 검색(좌석)
	private String departLocation; // 검색(출발지)
	private String arriveLocation; // 검색(도착지)
	
	public FlightAll() {}

	
	
	
	public FlightAll( String departLocation, String arriveLocation,String departDate, String classStr) {
		this.departDate = departDate;
		this.classStr = classStr;
		this.departLocation = departLocation;
		this.arriveLocation = arriveLocation;
	}




	public FlightAll(String departApnation, String departApcity, int departPacifictime, String departAirportcode,
			String flightNumber, String departDate, float flightHours, int standardFee, int classfee, String optioncode,
			String arriveApnation, String arriveApcity, int arrivePacifictime, String arriveAirportcode,
			String arriveApphoto, String airlinelogo) {
		this.departApnation = departApnation;
		this.departApcity = departApcity;
		this.departPacifictime = departPacifictime;
		this.departAirportcode = departAirportcode;
		this.flightNumber = flightNumber;
		this.departDate = departDate;
		this.flightHours = flightHours;
		this.standardFee = standardFee;
		this.classfee = classfee;
		this.optioncode = optioncode;
		this.arriveApnation = arriveApnation;
		this.arriveApcity = arriveApcity;
		this.arrivePacifictime = arrivePacifictime;
		this.arriveAirportcode = arriveAirportcode;
		this.arriveApphoto = arriveApphoto;
		this.airlinelogo = airlinelogo;
	}




	public String getClassStr() {
		return classStr;
	}
	public void setClassStr(String classStr) {
		this.classStr = classStr;
	}
	public String getDepartLocation() {
		return departLocation;
	}
	public void setDepartLocation(String departLocation) {
		this.departLocation = departLocation;
	}
	public String getArriveLocation() {
		return arriveLocation;
	}
	public void setArriveLocation(String arriveLocation) {
		this.arriveLocation = arriveLocation;
	}
	public String getDepartApnation() {
		return departApnation;
	}
	public void setDepartApnation(String departApnation) {
		this.departApnation = departApnation;
	}

	public String getDepartApcity() {
		return departApcity;
	}

	public void setDepartApcity(String departApcity) {
		this.departApcity = departApcity;
	}

	public int getDepartPacifictime() {
		return departPacifictime;
	}

	public void setDepartPacifictime(int departPacifictime) {
		this.departPacifictime = departPacifictime;
	}

	public String getDepartAirportcode() {
		return departAirportcode;
	}

	public void setDepartAirportcode(String departAirportcode) {
		this.departAirportcode = departAirportcode;
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

	public int getClassfee() {
		return classfee;
	}

	public void setClassfee(int classfee) {
		this.classfee = classfee;
	}

	public String getOptioncode() {
		return optioncode;
	}

	public void setOptioncode(String optioncode) {
		this.optioncode = optioncode;
	}

	public String getArriveApnation() {
		return arriveApnation;
	}

	public void setArriveApnation(String arriveApnation) {
		this.arriveApnation = arriveApnation;
	}

	public String getArriveApcity() {
		return arriveApcity;
	}

	public void setArriveApcity(String arriveApcity) {
		this.arriveApcity = arriveApcity;
	}

	public int getArrivePacifictime() {
		return arrivePacifictime;
	}

	public void setArrivePacifictime(int arrivePacifictime) {
		this.arrivePacifictime = arrivePacifictime;
	}

	public String getArriveAirportcode() {
		return arriveAirportcode;
	}

	public void setArriveAirportcode(String arriveAirportcode) {
		this.arriveAirportcode = arriveAirportcode;
	}

	public String getArriveApphoto() {
		return arriveApphoto;
	}

	public void setArriveApphoto(String arriveApphoto) {
		this.arriveApphoto = arriveApphoto;
	}

	public String getAirlinelogo() {
		return airlinelogo;
	}

	public void setAirlinelogo(String airlinelogo) {
		this.airlinelogo = airlinelogo;
	}
	
	
	
}
