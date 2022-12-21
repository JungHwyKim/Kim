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
	
	
}
