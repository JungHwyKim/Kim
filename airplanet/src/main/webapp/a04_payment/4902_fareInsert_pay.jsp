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
int totalPrice=1123000;	//param.총가격 받아서 넣기(갈때+올때)
Date nowtime=new Date();
SimpleDateFormat dtFormat = new SimpleDateFormat("yyMMddHHmmss");
AirMember reg2 = (AirMember)session.getAttribute("reg2");
ArrayList<FlightAll> flist= (ArrayList<FlightAll>)session.getAttribute("flist");
ArrayList<Fare> farelist= new ArrayList<Fare> ();
D_insertFare insertFareDao =new D_insertFare();
	String paymentCardInfo=
	request.getParameter("cardownertype")+" "+
	request.getParameter("cardownernation")+" "+
	request.getParameter("cardcorporate2")+" "+
	request.getParameter("cardinstallment")+" "+
	request.getParameter("cardnumber")+" "+
	request.getParameter("cardYY")+" "+
	request.getParameter("cardMM")+" "+
	request.getParameter("cardownername")+" "+
	request.getParameter("cardbirthday")+" "+
	request.getParameter("cardpassword")+" "+
	request.getParameter("cardmf");
out.println(paymentCardInfo);
int useMileage = Integer.parseInt(request.getParameter("useMileage")) / flist.size();
int cardPromotion=Integer.parseInt(request.getParameter("cardPromotion")) / flist.size();
out.print("<br>마일리지 1회당 "+useMileage);
	for(int i=0;i<flist.size();i++){	
		FlightAll ff=flist.get(i);
		Fare ffare =new Fare();
		
		ffare.setBookingReference(dtFormat.format(nowtime)); 
		ffare.setOptionCode(ff.getOptioncode());
		ffare.setEmail(reg2.getEmail());
		ffare.setResState("2");	//결제
		ffare.setCardInfo(paymentCardInfo);
		ffare.setCnt(1);	//한명일때만?? 
		ffare.setTotalPrice(ff.getStandardFee()+ff.getClassfee()+ff.getBaggage()-useMileage-cardPromotion);
		farelist.add(ffare);
	insertFareDao.updateStock(ff.getOptioncode(), 1);	//옵션코드 재고 업데이트, 한명일때
	insertFareDao.updateMileage(reg2.getEmail(),ffare.getTotalPrice()/20);
	}

Passenger ppassenger=new Passenger();	//탑승자 정보 넘겨받아야됨!!!
ppassenger.setBookingReference(dtFormat.format(nowtime));
ppassenger.setKorname(request.getParameter("korname"));
out.print(request.getParameter("korname"));
ppassenger.setEngname(request.getParameter("engname"));
ppassenger.setEngsur(request.getParameter("engsur"));
ppassenger.setBirthday(request.getParameter("ppbirthday"));
ppassenger.setMf (request.getParameter("mf"));
ppassenger.setPpnumber (request.getParameter("ppnumber"));
out.print(request.getParameter("ppnumber"));
ppassenger.setPpexpire (request.getParameter("ppexpire"));
ppassenger.setNation (request.getParameter("nation"));
ppassenger.setPpnation (request.getParameter("ppnation"));


String bkrf = insertFareDao.insertFarePassenger(farelist,ppassenger);

if(!request.getParameter("useMileage").equals("")){
	insertFareDao.updateMileage(reg2.getEmail(), 0-Integer.parseInt(request.getParameter("useMileage")) );}	//마일리지 사용했을때

request.setAttribute("bookingReference", bkrf);
request.setAttribute("farelist", farelist);
request.getRequestDispatcher("4007_pay_success.jsp").forward(request,response);
%>
다음페이지로 리퀘스트 넘겨서 부킹레퍼로 조회해서 정보 보여주기

</body>
</html>