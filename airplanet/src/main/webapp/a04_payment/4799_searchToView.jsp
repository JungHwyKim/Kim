<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="vo.FlightAll"
    import="vo.TicketOption"
    import="dao.*"
    import="java.util.*"
    %>

<!-- 사용자가 클릭한 항공편 상세 보여주기 위해서  
검색결과에서 scope 를 리퀘스트로, Flight객체, ticketOption(좌석선택했으니까??),Airport객체, Airline객체 전달 받아서??하면되나???
 --> 

<%
//가는편
FlightAll flight1 = new FlightAll("ICNLAX22122115","KE","ICN","2022-12-21 15:00","LAX",8,999999);
flight1.setDepartApcity("인천");flight1.setArriveApcity("LA");
flight1.setAirlineName("대한항공");flight1.setAirlinelogo("/b01_img/ke.PNG");
flight1.setDepartLocation("인천");flight1.setArriveLocation("LA");flight1.setClassStr("bs");
flight1.setOptioncode("ICNLAX22122115bs0");flight1.setClassfee(23420);flight1.setBaggage(0);

//오는편 정보 넘겨받은거
FlightAll flight2 = new FlightAll("LAXICN22123020","KE","LAX","2022-12-30 20:00","ICN",10,1000000);
flight2.setDepartApcity("LA");flight2.setArriveApcity("인천");
flight2.setAirlineName("대한항공");flight2.setAirlinelogo(request.getContextPath()+"/b01_img/ke.PNG");
flight2.setDepartLocation("LA");flight2.setArriveLocation("인천");flight2.setClassStr("ec");
flight2.setOptioncode("LAXICN22123020ec2");flight2.setClassfee(0);flight2.setBaggage(50000);

ArrayList<FlightAll> flist=new ArrayList<FlightAll>();
flist.add(flight1);
flist.add(flight2);
//여기까지 넘겨받을 데이터들


//스케줄디테일에 출력될 서머리 json으로 만들기(가는표 기준)
String [] summary= new String[7];
summary[0]=flist.get(0).getDepartLocation()==flist.get(flist.size()-1).getDepartLocation()?"편도":"왕복";
summary[1]="직항";
summary[2]=flist.get(0).getFlightHours()+"시간";
summary[3]="성인 1명";
summary[4]="일반석";
summary[5]=flist.get(0).getAirlinelogo();
summary[6]=flist.get(0).getAirlineName();

for(FlightAll ff:flist){
	if(ff.getDepartLocation()!=ff.getDepartApcity()){
		summary[1]="경유";
	}
	if(ff.getOptioncode().indexOf("bs")!=-1){
		summary[4]="비즈니스석";
	}else if(ff.getOptioncode().indexOf("fs")!=-1){
		summary[4]="일등석";
	}
}

//옵션선택할 수 있게 노선번호랑 좌석등급으로 검색하기
List<TicketOption> tlist1=new ArrayList<TicketOption>();	//갈때
D_selectTicketOption ticketdao= new D_selectTicketOption();
TicketOption forSearch= new TicketOption();
forSearch.setFlightNumber(flist.get(0).getFlightNumber());
forSearch.setOptionCode(flist.get(0).getClassStr());
forSearch.setStock(1);
tlist1=ticketdao.selectAll(forSearch);

if(summary[0].equals("왕복")){	//올때
List<TicketOption> tlist2=new ArrayList<TicketOption>();
TicketOption forSearch2= new TicketOption();
forSearch2.setFlightNumber(flist.get(flist.size()-1).getFlightNumber());
forSearch2.setOptionCode(flist.get(flist.size()-1).getClassStr());
forSearch2.setStock(1);
tlist2=ticketdao.selectAll(forSearch2);
request.setAttribute("tlist2", tlist2);
}

request.setAttribute("tlist1", tlist1);
request.setAttribute("flist", flist);
request.setAttribute("summary", summary);
%>


<jsp:forward page="4800_view.jsp" />