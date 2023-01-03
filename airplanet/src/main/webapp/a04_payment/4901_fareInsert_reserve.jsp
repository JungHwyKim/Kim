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
	ffare.setCnt(1);	//한명일때만?? 
	ffare.setTotalPrice(ff.getStandardFee()+ff.getClassfee()+ff.getBaggage());
	farelist.add(ffare);
	
	insertFareDao.updateStock(ff.getOptioncode(), 1);	//옵션코드 재고 업데이트, 한명일때
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

request.setAttribute("bookingReference", bkrf);

request.getRequestDispatcher("4006_book_success.jsp").forward(request,response);
%>

</body>
</html>