<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 	import="java.util.*"
 	import="vo.FlightAll"
    import="vo.TicketOption"
    %>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />

<jsp:useBean id="dao" class="dao.D_selectTicketOption" scope="page" />
<jsp:useBean id="toSearch" class="vo.TicketOption" scope="page" />

<c:forEach items="${flist }" var="ff" >
<h2>${ff.optioncode }</h2>
</c:forEach>
${param.passenger1go }<br>




flightAll클래스랑 선택한 옵션코드 받아서 검색해서 정보 변경하기
<%
ArrayList<FlightAll> flist= (ArrayList<FlightAll>)request.getAttribute("flist");
ArrayList<String> namelist=Collections.list(request.getParameterNames());
//두개 받아서
int len=namelist.size()-1;
for(int i=0;i<len;i++){
	String para=(String)request.getParameter(namelist.get(i));
	out.print(namelist.get(i)+" : "+para+"<br>");
	flist.get(i).setOptioncode(para);
}

%>