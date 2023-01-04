<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%> 
<fmt:requestEncoding value="utf-8"/>   
<% request.setCharacterEncoding("utf-8"); %>       


<%
String arriveLocation = (String) session.getAttribute("arriveLocation");
String departLocation = (String) session.getAttribute("departLocation");
String departDate = (String) session.getAttribute("departDate");
String arriveDate = (String) session.getAttribute("arriveDate");
String classStr = (String) session.getAttribute("classStr");

%>

<%--dao.B_search_range getRangeticket    param.inputLeft  param.inputRight  --%>
	<jsp:useBean id="dao1" class="dao.B_search_range"/>
	<jsp:useBean id="sch1" class="vo.FlightAll"/>
	<jsp:setProperty property="*" name="sch1"/>
	${sch1.setDepartDate(departDate) } 
	${sch1.setDepartLocation(departLocation) } 
	${sch1.setArriveLocation(arriveLocation) } 
	${sch1.setClassStr(classStr) }
	<c:if test="${empty classStr }">${sch1.setClassStr("ec") }</c:if>
	${sch1.setFrRange(param.inputLeft) }
	${sch1.setToRange(param.inputRight) }
	${sch1.setSort(param.selectSort) }
	<jsp:useBean id="gson" class="com.google.gson.Gson"/>
	${gson.toJson(dao1.getRangeticket(sch1))}	

