<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<h2>예약자 정보</h2>
<table class="table table-bordered">
<tr><td>이름</td><td>이메일</td><td>휴대전화</td></tr>
<tr>
<td><input class="form-control" value="${reg2.name }" required><div class="invalid-feedback"> 이름을 입력해주세요.   </div></td>
<td><div class="input-group"><input type="text" value="${fn:split(reg2.email,'@')[0]}" class="form-control" required><span class="input-group-text">@</span><input type="text" value="${fn:split(reg2.email,'@')[1]}"  class="form-control" required><div class="invalid-feedback"> 이메일 주소를 입력해주세요.   </div></div></td>
<td><div class="input-group"><input minlength="3" maxlength="3" value="${fn:substring(reg2.phoneNumber,0,3) }" class="form-control" required><span class="input-group-text">-</span><input minlength="4" maxlength="4"  value="${fn:substring(reg2.phoneNumber,3,7) }" class="form-control " required><span class="input-group-text">-</span><input minlength="4" maxlength="4" value="${fn:substring(reg2.phoneNumber,7,12) }" class="form-control" required><div class="invalid-feedback">휴대전화 번호를 바르게 입력해주세요.</div></div></td>
</tr>	
</table>
<ul class="smallinfo">
<li>예약자 정보는 긴급상황 발생 시 즉시 연락이 가능해야 하며, 연락이 불가능한 경우 발생되는 불이익에 대해 당사는 책임지지 않사오니 이점 유의하시기 바랍니다.
</ul>
<br>
<h2>탑승객 정보</h2>
<fieldset id="passengerinfoset">
<div class="row g-3 align-items-center">
  <div class="col-auto"> <label for="korname" class="col-form-label">한글명</label><input id="korname" name="korname" class="form-control" placeholder="예)홍길동" required></div>
  <div class="col-auto"> <label for="engsur" class="col-form-label">영문 성</label><input id="engsur" name="engsur" class="form-control"  placeholder="예)HONG" required></div>
  <div class="col-auto"> <label for="engname" class="col-form-label">영문 이름</label><input id="engname" name="engname" class="form-control" placeholder="예)GILDONG" required></div>
  <div class="col-auto"> <label class="col-form-label">생년월일</label><input name="ppbirthday" class="form-control" type="date" required></div>
  <div class="col-auto"> <label for="mf" class="col-form-label">성별</label><div class="form-control" ><label><input type="radio" name="mf" value="m" checked>남성</label>&nbsp; &nbsp;<label><input type="radio" name="mf" value="f" >여성</label></div></div>
</div> 
<div class="row g-3 align-items-center"> 
  <div class="col-auto"> <label class="col-form-label">여권번호</label><input name="ppnumber" class="form-control" required></div>
  <div class="col-auto"> <label class="col-form-label">여권만료일</label><input type="date" name="ppexpire" class="form-control" required></div>
  <div class="col-auto"> <label class="col-form-label">국적</label><input name="nation" class="form-control" value="한국" required></div>
  <div class="col-auto"> <label class="col-form-label">여권발행국</label><input name="ppnation" class="form-control" value= "한국" required></div>
</div>  
</fieldset>


<jsp:useBean id="dao" class="dao.D_selectMyPassenger" />
<c:set var="myinfo" value="${dao.select(reg2.email)}" />
<script>
/* 탑승자정보 불러오기 */
function bringPassengerinfo(){	//db에서 정보 불러와서 넣기
 	let psginputs =document.querySelectorAll('#passengerinfoset input')
 	psginputs[0].value='${myinfo.korname}';
 	psginputs[1].value='${myinfo.engsur}';
 	psginputs[2].value='${myinfo.engname}';
 	var bday=(String)('${myinfo.birthday}'.substr(0,10))
 	psginputs[3].value= bday
 	if('m'=='${myinfo.mf}'){psginputs[4].checked=true;}
 	if('f'=='${myinfo.mf}'){psginputs[5].checked=true;}
 	psginputs[6].value='${myinfo.ppnumber}';
 	var ppexpire=(String)('${myinfo.ppexpire}'.substr(0,10))
 	psginputs[7].value= ppexpire ;
 	psginputs[8].value='${myinfo.nation}';
 	psginputs[9].value='${myinfo.ppnation}';
 }

</script>