<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="vo.Flight"
    import="vo.TicketOption"
    import="java.util.*"
    %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- scope를 리퀘스트로해서 flightNumber, 인원, 좌석클래스, --> 


<%
Flight flight1 = new Flight("ICNLAX22122115","KE","ICN","2022-12-21 15:00","LAX",8,180000);
Flight flight2 = new Flight("LAXICN22123020","KE","LAX","2022-12-30 20:00","ICN",10,1000000);
TicketOption ticketOption1= new TicketOption("ICNLAX22122115bs0","ICNLAX22122115",23420,0,8);
TicketOption ticketOption2= new TicketOption("LAXICN22123020ec2","LAXICN22123020",0,50000,100);
List<Flight> flist=new ArrayList<Flight>();
flist.add(flight1);
flist.add(flight2);
List<TicketOption> tlist=new ArrayList<TicketOption>();
tlist.add(ticketOption1);
tlist.add(ticketOption2);

request.setAttribute("flist", flist);
request.setAttribute("tlist", tlist);
%>

<jsp:forward page="4001_view.jsp" />