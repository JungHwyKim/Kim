package vo;
//vo.TicketOption
public class TicketOption {
	private String optionCode;
	private String flightNumber;
	private int classFee;
	private int baggage;
	private int stock;
	
	public TicketOption() {}
	
	public TicketOption(String optionCode, String flightNumber, int classFee, int baggage, int stock) {
		this.optionCode = optionCode;
		this.flightNumber = flightNumber;
		this.classFee = classFee;
		this.baggage = baggage;
		this.stock = stock;
	}
	
	public String getOptionCode() {
		return optionCode;
	}
	public void setOptionCode(String optionCode) {
		this.optionCode = optionCode;
	}
	public String getFlightNumber() {
		return flightNumber;
	}
	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}
	public int getClassFee() {
		return classFee;
	}
	public void setClassFee(int classFee) {
		this.classFee = classFee;
	}
	public int getBaggage() {
		return baggage;
	}
	public void setBaggage(int baggage) {
		this.baggage = baggage;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	//추가기능
	public String getClassStr() {
		String classStr="일반석";
		if(this.optionCode.indexOf("bs")!=-1){
			classStr="비즈니스석";
		}else if(this.optionCode.indexOf("fs")!=-1){
			classStr="일등석";
		}
		return classStr;
	}
	
	public String getBaggageStr() {
		String baggageStr="없음";
		if(this.optionCode.substring(16, 17).equals("1")){
			baggageStr="-";
		}else if(this.optionCode.substring(16, 17).equals("2")){
			baggageStr="수하물 추가";
		}
		return baggageStr;
	}
	
}
