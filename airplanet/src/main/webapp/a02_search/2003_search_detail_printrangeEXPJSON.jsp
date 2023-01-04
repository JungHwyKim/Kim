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
<%--dao.B_search_range2 getRangeticket2  
param.inputLeft param.inputRight param.inputLeft2 param.inputRight2 param.selectSort --%>
	<jsp:useBean id="dao1" class="dao.B_search_range2"/>
	<jsp:useBean id="sch1" class="vo.FlightAll2"/>
	<jsp:setProperty property="*" name="sch1"/>
	${sch1.setDepartDate1(departDate) }
	${sch1.setDepartDate2(arriveDate) } 
	${sch1.setDepartLocation(departLocation) } 
	${sch1.setArriveLocation(arriveLocation) } 
	${sch1.setClassStr(classStr) }
	<c:if test="${empty classStr }">${sch1.setClassStr("ec") }</c:if>
	
	${sch1.setFrRange1(param.inputLeft)}
	${sch1.setToRange1(param.inputRight)}
	${sch1.setFrRange2(param.inputLeft2)}
	${sch1.setToRange2(param.inputRight2)}	
	${sch1.setSort(param.selectSort)}	

	<jsp:useBean id="gson" class="com.google.gson.Gson"/>
	${gson.toJson(dao1.getRangeticket2(sch1))}
