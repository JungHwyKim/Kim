package vo;
//Flight, Airline, Airport, TicketOption 테이블 4개 join해서 쓸 클래스
//vo.FlightAll
public class FlightAll {
	private String departApnation;
	private String departApcity;
	private int departPacifictime;	
	private String departAirportcode; 
	private String flightNumber;   //받을거
	private String departDate;
	private float flightHours;    
	private int standardFee;
	private int classfee;
	private String optioncode;		
	private String arriveApnation;
	private String arriveApcity;
	private int arrivePacifictime;
	private String arriveAirportcode;	//받을거
	private String arriveApphoto;	
	private String airlinelogo;			//받을거
	private String classStr; // 검색(좌석) 세션		//ec,bs코드로??
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
	private int frRange;
	private int toRange;
	private int sort;
	public FlightAll() {}

	
	
	public FlightAll( String departDate,String departLocation, String arriveLocation, String classStr) {
		this.departDate = departDate;
		this.classStr = classStr;
		this.departLocation = departLocation;
		this.arriveLocation = arriveLocation;
	}
	public FlightAll( String departDate,String departLocation, String arriveLocation, String classStr, int frRange, int toRange, int sort) {
		this.departDate = departDate;
		this.classStr = classStr;
		this.departLocation = departLocation;
		this.arriveLocation = arriveLocation;
		this.frRange=frRange;
		this.toRange=toRange;
		this.sort = sort;
	}
	
	

	public int getSort() {
		return sort;
	}



	public void setSort(int sort) {
		this.sort = sort;
	}



	public int getFrRange() {
		return frRange;
	}



	public void setFrRange(int frRange) {
		this.frRange = frRange;
	}



	public int getToRange() {
		return toRange;
	}



	public void setToRange(int toRange) {
		this.toRange = toRange;
	}



	//원주 evrywhere 검색 결과
	public FlightAll(String arriveApnation,int standardFee) {
		this.standardFee = standardFee;
		this.arriveApcity = arriveApnation;
	}
	//원주 evrywhere 검색어
	public FlightAll(String departDate, String departLocation) {
		this.departDate = departDate;
		this.departLocation = departLocation;
	}
	
	// 원주 nation 검색 결과
	public FlightAll( String arriveApcity,int standardFee, String arriveApphoto) {
		this.standardFee = standardFee;
		this.arriveApcity = arriveApcity;
		this.arriveApphoto = arriveApphoto;
	}

	// 원주 nation 검색어
	public FlightAll(String departDate, String departLocation, String arriveLocation) {
		this.departDate = departDate;
		this.departLocation = departLocation;
		this.arriveLocation = arriveLocation;
	}
	
	// 원주 everywhere 왕복시 돌아오는 편
	public FlightAll( String flightNumber, String departApnation, int standardFee) {
		this.departApnation = departApnation;
		this.flightNumber = flightNumber;
		this.standardFee = standardFee;
	}



	public FlightAll(String flightNumber, String departDate,  String departAirportcode, String arriveAirportcode, 
			float flightHours,int departPacifictime,  
			int arrivePacifictime, String airlinelogo, int standardFee, int classfee) {
		this.flightNumber=flightNumber;
		this.departPacifictime = departPacifictime;
		this.departAirportcode = departAirportcode;
		this.departDate = departDate;
		this.flightHours = flightHours;
		this.standardFee = standardFee;
		this.classfee = classfee;
		this.arrivePacifictime = arrivePacifictime;
		this.arriveAirportcode = arriveAirportcode;
		this.airlinelogo = airlinelogo;
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

	
	//세영: Flight생성자랑 동일하게
	public FlightAll(String flightNumber, String airlineCode, String departAirport, String departDate, String arriveAirport,
			float flightHours, int standardFee) {
		this.flightNumber = flightNumber;
		this.airlineCode = airlineCode;
		this.departAirportcode = departAirport;
		this.departDate = departDate;
		this.arriveAirportcode = arriveAirport;
		this.flightHours = flightHours;
		this.standardFee = standardFee;
	}
	
	//세영: 티켓생성자랑 동일(stock빼고)
	public FlightAll(String optionCode, String flightNumber, int classFee, int baggage) {
		this.optioncode = optionCode;
		this.flightNumber = flightNumber;
		this.classfee = classFee;
		this.baggage = baggage;
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


//////////////////////////세영추가
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
	
	
}
