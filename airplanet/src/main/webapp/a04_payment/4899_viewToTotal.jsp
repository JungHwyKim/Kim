<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 	import="java.util.*"
 	import="vo.FlightAll"
    import="vo.TicketOption"
    import="dao.D_flightallABSORBticketoption"
    %>
flightAll클래스랑 선택한 옵션코드 받아서 검색해서 정보 변경하기
옵션코드 받은걸로 dao검색 돌려서 flightAll객체.setㅁㅁ 하기??

<%
ArrayList<FlightAll> flist= (ArrayList<FlightAll>)session.getAttribute("flist");
ArrayList<String> namelist=Collections.list(request.getParameterNames());
for(String name:namelist){
	out.print("<h3>"+name+"</h3>");
}
//두개 받아서
int len=namelist.size();

for(int i=0;i<len;i++){
	D_flightallABSORBticketoption absorbdao= new D_flightallABSORBticketoption();
	String para=(String)request.getParameter(namelist.get(i));
	out.print(namelist.get(i)+" : "+para+"<br>");
	absorbdao.absorbing(flist.get(i), para);
}
session.setAttribute("flist", flist);
%>

<jsp:forward page="4900_paymentTotal.jsp" />