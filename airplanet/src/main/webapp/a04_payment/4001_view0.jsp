<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />

<!-- scope를 리퀘스트로해서 flightNumber, 인원, 좌석클래스, --> 
<jsp:useBean id="dao" class="dao.D_selectTicketOption" scope="page" />
<jsp:useBean id="toSearch" class="vo.TicketOption" scope="page" />

<c:set var="go1" value="${go1TicketOption }" scope="request" />
<c:set var="go1" value="${go1TicketOption }" scope="request" />



<jsp:forward page="4001_view.jsp" >
${go1TicketOption.flightNumber }