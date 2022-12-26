<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 	import="java.util.*"
    %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />

검색할때 만들어진 flightAll 객체에 옵션 선택한 값 넣어서 paymentTotal로 전달 

<jsp:useBean id="dao" class="dao.D_selectTicketOption" scope="page" />
<jsp:useBean id="toSearch" class="vo.TicketOption" scope="page" />


