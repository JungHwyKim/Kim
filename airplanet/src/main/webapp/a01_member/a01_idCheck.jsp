<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="airplanet.vo.*" 
  	import="airplanet.dao.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>


<jsp:useBean id="dao" class="dao.A_idCheck"/>
{"hasMember":${dao.idCheck(param.email)}}