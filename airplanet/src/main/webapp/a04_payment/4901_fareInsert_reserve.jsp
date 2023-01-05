<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="vo.*"
    import="dao.*"
    import="java.util.*"
    import="java.text.SimpleDateFormat"
    %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

넘어온거 세션으로 받아서 반복문 돌려서 추가할 페어 리스트 만듬
표사면 옵션별상품마다 페어 추가. 잔여좌석 깎기. 탑승자정보 추가. 마일리지는 나중에
<%
Date nowtime=new Date();
SimpleDateFormat dtFormat = new SimpleDateFormat("yyMMddHHmmss");
String cntString = (String)session.getAttribute("cnt");
int cnt = Integer.parseInt(cntString);
AirMember reg2 = (AirMember)session.getAttribute("reg2");
ArrayList<FlightAll> flist= (ArrayList<FlightAll>)session.getAttribute("flist");
ArrayList<Fare> farelist= new ArrayList<Fare> ();
D_insertFare insertFareDao =new D_insertFare();


	for(int i=0;i<flist.size();i++){	
	FlightAll ff=flist.get(i);
	Fare ffare =new Fare();
	
	ffare.setBookingReference(dtFormat.format(nowtime)); 
	ffare.setOptionCode(ff.getOptioncode());
	ffare.setEmail(reg2.getEmail());
	ffare.setResState("1");	//결제
	ffare.setCardInfo("");
	ffare.setCnt(cnt);	//한명일때만?? 
	ffare.setTotalPrice((ff.getStandardFee()+ff.getClassfee()+ff.getBaggage())*cnt);
	farelist.add(ffare);
	
	insertFareDao.updateStock(ff.getOptioncode(), cnt);	//옵션코드 재고 업데이트, 한명일때
	}
String bkrf =insertFareDao.insertFarelistReturnSEQ(farelist);
	

	String kornames[] =request.getParameterValues("korname");
	String engnames[] =request.getParameterValues("engname");
	String engsurs[] =request.getParameterValues("engsur");
	String ppbirthdays[] =request.getParameterValues("ppbirthday");
//	String mfs[] =request.getParameterValues("mf");
	String ppnumbers[] =request.getParameterValues("ppnumber");
	String ppexpires[] =request.getParameterValues("ppexpire");
	String nations[] =request.getParameterValues("nation");
	String ppnations[] =request.getParameterValues("ppnation");

	for(int i=0;i<cnt;i++){
		Passenger ppassenger=new Passenger();	//탑승자 정보 넘겨받아야됨!!!
		ppassenger.setBookingReference(bkrf);
		ppassenger.setKorname(kornames[i]);
		ppassenger.setEngname(engnames[i]);
		ppassenger.setEngsur(engsurs[i]);
		ppassenger.setBirthday(ppbirthdays[i]);
		ppassenger.setMf(request.getParameter("mf"+(i+1)));
		ppassenger.setPpnumber(ppnumbers[i]);
		ppassenger.setPpexpire(ppexpires[i]);
		ppassenger.setNation(nations[i]);
		ppassenger.setPpnation(ppnations[i]);
		insertFareDao.insertPassenger(ppassenger);
	}


request.setAttribute("bookingReference", bkrf);
request.setAttribute("farelist", farelist);
request.getRequestDispatcher("4006_book_success.jsp").forward(request,response);
%>

</body>
</html>