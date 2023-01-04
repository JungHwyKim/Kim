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
String [] flightNumbers = request.getParameterValues("flightNumber");
String [] departDates = request.getParameterValues("departDate");
String [] departAirportcodes = request.getParameterValues("departAirportcode");
String [] arriveAirportcodes = request.getParameterValues("arriveAirportcode");
String [] airlinelogos = request.getParameterValues("airlinelogo"); 

//쿼리스트링 받아오기~~
/* String [] flightNumbers={"ICNLAX22122115","LAXSFO22122123","SFOICN23012011"};
session.setAttribute("departLocation", "ICN");
session.setAttribute("arriveLocation", "SFO");
session.setAttribute("classStr", "bs"); */
//~~~쿼리스트링 받아오기


D_FlightAll fallDao=new D_FlightAll();
ArrayList<FlightAll> flist=new ArrayList<FlightAll>();

//가는편,오는편 구분용으로 필요함
String departLoc = (String)session.getAttribute("departLocation");
String arriveLoc = fallDao.selectAirportCode((String)session.getAttribute("arriveLocation"));


//flist만들기
FlightAll flight1 = null;
for(int i=0;i<flightNumbers.length;i++){
	flight1 = fallDao.selectFlight(flightNumbers[i]);
	flight1 = fallDao.selectDepartAirport(flight1);
	flight1 = fallDao.selectArriveAirport(flight1);
	flight1 = fallDao.selectAirline(flight1);
	flight1.setDepartLocation(departLoc);
	flight1.setArriveLocation(arriveLoc);
	if(flight1.getArriveAirportcode().equals(arriveLoc)){
		//도착을 해서 도착지랑 착륙공항이 같아지면 다음번부터 바뀌는거임
		arriveLoc = (String)session.getAttribute("departLocation");
		departLoc = (String)session.getAttribute("arriveLocation");
	}
	flight1.setClassStr((String)session.getAttribute("classStr"));
	flist.add(flight1);
}


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
	if(ff.getDepartLocation()!=ff.getDepartAirportcode()){
		summary[1]="경유 ";
	}
	if(ff.getClassStr().indexOf("bs")!=-1){
		summary[4]="비즈니스석";
	}else if(ff.getClassStr().indexOf("fs")!=-1){
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


for(int i=1;i<flist.size();i++){	//올때 tlist2 만들기
	if(!flist.get(i).getDepartLocation().equals(flist.get(i-1).getDepartLocation())){
		out.print("다름<br>");
		List<TicketOption> tlist2=new ArrayList<TicketOption>();
		TicketOption forSearch2= new TicketOption();
		forSearch2.setFlightNumber(flist.get(i).getFlightNumber());
		forSearch2.setOptionCode(flist.get(i).getClassStr());
		forSearch2.setStock(1);
		tlist2=ticketdao.selectAll(forSearch2);
		session.setAttribute("tlist2", tlist2);
		out.print(tlist2.size());
		break;
	}
}

//경유일때
for(int i=1;i<flist.size();i++){
	if(flist.get(i).getArriveLocation().equals(flist.get(i-1).getArriveLocation())){
		forSearch= new TicketOption();
		forSearch.setFlightNumber(flist.get(i).getFlightNumber());
		forSearch.setOptionCode(flist.get(i).getClassStr());
		forSearch.setStock(1);
		//가는경유는 11 오는 경유는 22
		if(i-1==0){
			List<TicketOption> tlist11=new ArrayList<TicketOption>();
			tlist11=ticketdao.selectAll(forSearch);
			session.setAttribute("tlist11", tlist11);
		}else if(i==flist.size()-1){
			List<TicketOption> tlist22=new ArrayList<TicketOption>();
			tlist22=ticketdao.selectAll(forSearch);
			session.setAttribute("tlist22", tlist22);
			out.print(tlist22);
		}
	}
}

session.setAttribute("tlist1", tlist1);
session.setAttribute("flist", flist);
session.setAttribute("summary", summary);
%>


<jsp:forward page="4800_view.jsp" />