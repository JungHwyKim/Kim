package vo;
//Flight, Airline, Airport, TicketOption 테이블 4개 join해서 쓸 클래스
//vo.FlightAll
public class FlightAll2 {
	private String departApnation;
	private String departApcity;
	private int departPacifictime;
	private String departAirportcode;
	private String flightNumber1;
	private String departDate1;
	private float flightHours1;
	private int standardFee1;
	private int classfee1;
	private String optioncode;		
	private String arriveApnation;
	private String arriveApcity;
	private int arrivePacifictime;
	private String arriveAirportcode;
	private String arriveApphoto;
	private String airlinelogo1;
	private String flightNumber2;
	private String departDate2;
	private float flightHours2;
	private int standardFee2;
	private int classfee2;
	private String airlinelogo2;
	
	private String classStr; // 검색(좌석)		//ec,bs코드로??
	private String departLocation; // 검색(출발지) //+최초출발지
	private String arriveLocation; // 검색(도착지) //+최종도착지
		
	//세영추가
	private String airlineCode;
	private String airlineName;
	private int baggage;	//결제선택단계에서 추가
	private String baggageStr;	//결제선택단계에서 추가
	//도착현지시간 계산해서 넣는게 좋은가??
	//인원 1인 이상 구분하게 되면 필드 추가

	//원주 추가
	private int frRange1;
	private int toRange1;
	private int frRange2;
	private int toRange2;
	private int sort;
	public FlightAll2() {}
	
	// 검색어
	public FlightAll2(String departDate1, String departDate2,  String departLocation, String arriveLocation,
			String classStr, int frRange1, int toRange1, int frRange2, int toRange2, int sort) {
		this.departDate1 = departDate1;
		this.departDate2 = departDate2;
		this.classStr = classStr;
		this.departLocation = departLocation;
		this.arriveLocation = arriveLocation;
		this.frRange1 = frRange1;
		this.toRange1 = toRange1;
		this.frRange2 = frRange2;
		this.toRange2 = toRange2;
		this.sort = sort;
	}
	
	//출력결과 
	public FlightAll2( String flightNumber1, String departDate1, String departAirportcode, String arriveAirportcode,
			float flightHours1, int departPacifictime, int arrivePacifictime, String airlinelogo1,
			int standardFee1, int classfee1, 
			 String flightNumber2, String departDate2, float flightHours2,String airlinelogo2,
			 int standardFee2, int classfee2) {
		this.departPacifictime = departPacifictime;
		this.departAirportcode = departAirportcode;
		this.flightNumber1 = flightNumber1;
		this.departDate1 = departDate1;
		this.flightHours1 = flightHours1;
		this.standardFee1 = standardFee1;
		this.classfee1 = classfee1;
		this.arrivePacifictime = arrivePacifictime;
		this.arriveAirportcode = arriveAirportcode;
		this.airlinelogo1 = airlinelogo1;
		this.flightNumber2 = flightNumber2;
		this.departDate2 = departDate2;
		this.flightHours2 = flightHours2;
		this.standardFee2 = standardFee2;
		this.classfee2 = classfee2;
		this.airlinelogo2 = airlinelogo2;
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

	public String getFlightNumber1() {
		return flightNumber1;
	}

	public void setFlightNumber1(String flightNumber1) {
		this.flightNumber1 = flightNumber1;
	}

	public String getDepartDate1() {
		return departDate1;
	}

	public void setDepartDate1(String departDate1) {
		this.departDate1 = departDate1;
	}

	public float getFlightHours1() {
		return flightHours1;
	}

	public void setFlightHours1(float flightHours1) {
		this.flightHours1 = flightHours1;
	}

	public int getStandardFee1() {
		return standardFee1;
	}

	public void setStandardFee1(int standardFee1) {
		this.standardFee1 = standardFee1;
	}

	public int getClassfee1() {
		return classfee1;
	}

	public void setClassfee1(int classfee1) {
		this.classfee1 = classfee1;
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

	public String getAirlinelogo1() {
		return airlinelogo1;
	}

	public void setAirlinelogo1(String airlinelogo1) {
		this.airlinelogo1 = airlinelogo1;
	}

	public String getFlightNumber2() {
		return flightNumber2;
	}

	public void setFlightNumber2(String flightNumber2) {
		this.flightNumber2 = flightNumber2;
	}

	public String getDepartDate2() {
		return departDate2;
	}

	public void setDepartDate2(String departDate2) {
		this.departDate2 = departDate2;
	}

	public float getFlightHours2() {
		return flightHours2;
	}

	public void setFlightHours2(float flightHours2) {
		this.flightHours2 = flightHours2;
	}

	public int getStandardFee2() {
		return standardFee2;
	}

	public void setStandardFee2(int standardFee2) {
		this.standardFee2 = standardFee2;
	}

	public int getClassfee2() {
		return classfee2;
	}

	public void setClassfee2(int classfee2) {
		this.classfee2 = classfee2;
	}

	public String getAirlinelogo2() {
		return airlinelogo2;
	}

	public void setAirlinelogo2(String airlinelogo2) {
		this.airlinelogo2 = airlinelogo2;
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

	public int getBaggage() {
		return baggage;
	}

	public void setBaggage(int baggage) {
		this.baggage = baggage;
	}

	public String getBaggageStr() {
		return baggageStr;
	}

	public void setBaggageStr(String baggageStr) {
		this.baggageStr = baggageStr;
	}

	public int getFrRange1() {
		return frRange1;
	}

	public void setFrRange1(int frRange1) {
		this.frRange1 = frRange1;
	}

	public int getToRange1() {
		return toRange1;
	}

	public void setToRange1(int toRange1) {
		this.toRange1 = toRange1;
	}

	public int getFrRange2() {
		return frRange2;
	}

	public void setFrRange2(int frRange2) {
		this.frRange2 = frRange2;
	}

	public int getToRange2() {
		return toRange2;
	}

	public void setToRange2(int toRange2) {
		this.toRange2 = toRange2;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}
	

	
}
