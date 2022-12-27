package dao;

import vo.DB;
import vo.TicketOption;
import vo.FlightAll;

public class D_flightallABSORBticketoption {

	public void absorbing(FlightAll fa,String optioncode) {
		D_selectTicketOption tdao= new D_selectTicketOption();
		TicketOption aticket = tdao.selectOneSpecific(optioncode);
		fa.setOptioncode(aticket.getOptionCode());
		fa.setClassfee(aticket.getClassFee());
		fa.setClassStr(aticket.getClassStr());
		fa.setBaggage(aticket.getBaggage());
		fa.setBaggageStr(aticket.getBaggageStr());
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
