<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.smallinfo{font-size: 80%;color:gray;}

a:link {
	text-decoration: none;
	font-size: 80%;
	color:gray;
}
</style>

<link href="/bs-custom.css" rel="stylesheet" >
<meta charset="UTF-8">
<title>결제</title>
</head>
<body>
<main class="container">
<jsp:include page="/header.jsp"></jsp:include>
<h2>선택한 항공 스케줄</h2>
<%@ include file="4001_scheduleDetail.jsp" %>
<div class="row">
<div class="col" ><button type="button" class="btn btn-primary showswitch" style="width: 100%">가는 편</button></div>
<c:if test ="${not empty tlist2 }" >
	<div class="col" ><button type="button" class="btn btn-secondary showswitch" style="width: 100%">오는 편</button></div></div>
</c:if>
<table class="table table-bordered showswitchtarget">
<thead>
<tr class="table-secondary"><th>구분</th><th>인원</th><th>선택사항1</th><th>선택사항2</th><th>합계</th></tr>
</thead>
<colgroup><col style="width:10%"><col style="width:10%"><col style="width:20%"><col style="width:20%"><col style="width:20%"></colgroup>
<tbody>
<c:set var="costgo" value="0" />
<c:forEach var="eachticket" items="${flist }" varStatus="vv" >
	<c:if test="${flist.get(0).departLocation eq eachticket.departLocation }">
		<tr><td>${fn:substring(eachticket.optioncode,0,3) }➡${fn:substring(eachticket.optioncode,3,6) }</td>
		<td>1명</td><td>${eachticket.classStr }</td><td>${eachticket.baggageStr }</td>
		<td>${eachticket.standardFee + eachticket.classfee+ eachticket.baggage}</td>		</tr>
	<c:set var="costgo" value="${costgo+ eachticket.standardFee + eachticket.classfee+ eachticket.baggage}" />
	</c:if>
</c:forEach>
<tr><th class="table-secondary" colspan="2">총 요금(가는 편)</th><td colspan="3"><c:out value="${costgo }" />원</td></tr>
</tbody>
</table>

<table class="table table-bordered showswitchtarget" style="display:none;">
<thead>
<tr class="table-secondary"><th>구분</th><th>인원</th><th>선택사항1</th><th>선택사항2</th><th>합계</th></tr>
</thead>
<colgroup><col style="width:10%"><col style="width:10%"><col style="width:20%"><col style="width:20%"><col style="width:20%"></colgroup>
<tbody>
<c:set var="costback" value="0" />
<c:if test="${not empty tlist2 }" >
<c:forEach var="eachticket" items="${flist }" varStatus="vv" >
	<c:if test="${flist.get(flist.size()-1).departLocation eq eachticket.departLocation }">
		<tr><td>${fn:substring(eachticket.optioncode,0,3) }➡${fn:substring(eachticket.optioncode,3,6) }</td>
		<td>1명</td><td>${eachticket.classStr }</td><td>${eachticket.baggageStr }</td>
		<td>${eachticket.standardFee + eachticket.classfee+ eachticket.baggage}</td>		</tr>
	<c:set var="costback" value="${costback+ eachticket.standardFee + eachticket.classfee+ eachticket.baggage}" />
	</c:if>
</c:forEach>
</c:if>
<tr><th class="table-secondary" colspan="2">총 요금(오는 편)</th><td colspan="3"><c:out value="${costback }" />원</td></tr>
</tbody>
</table>

<div class="row justify-content-between">
<div class="col-4"><h5>총 예상 요금</h5></div><div class="col-4"><h5>${costgo+costback }원</h5></div>
</div>

<ul class="smallinfo"><strong>예약 시 주의사항</strong>
<li><strong>[가는편/오는편 개별 예약]</strong>예약 완료 시 가는편/오는편 예약번호가 개별 생성되며, 각 예약번호의 마이페이지를 통해 결제/변경/취소를 진행해야 합니다. (개 별 예약 규정 적용)</li>
<li><strong>[운항안내]</strong> COVID-19 영향으로 국토교통부 방침에 의해 탑승율 제한, 사전 공지 없이 비운항 또는 스케줄이 변경 될 수 있습니다.</li>
</ul>
<br><br>




<form class="needs-validation" action="4902_fareInsert_pay.jsp" novalidate>
<%@ include file="4004_1_passengerInfo.jsp" %>
<label><input class="form-check-input" type="checkbox" onchange="bringPassengerinfo()">탑승객 정보 불러오기</label><br>
<strong>탑승객 영문이름, 생년월일, 성별 기재 시 주의사항</strong>
<ul class="smallinfo">
<li>탑승자의 영문성명, 생년월일, 성별, 국적은 여권과 동일해야 하며, 예약 후 변경이 불가합니다.
<li>(임의로 등록(FAKE NAME)하는 경우 모든 예약이 취소되거나 수수료가 부과될 수 있습니다.)
<li>입력한 여권 정보가 다르거나 또는 누락, 분실 신고된 여권, 사용된 단수 여권 정보로 입력한 경우 항공편 탑승 및 현지 입국이 거절 될 수 있습니다.
<li>정확한 본인 영문 이름은 정부24(나의 생활정보)에서 확인할 수 있습니다. (간편인증 또는 공동,금융인증서 필요) 조회하기
<li>영문 성이 한 글자인 경우, 예약 전 유선 및 톡집사로 문의 바랍니다. (예시 : 오길동 – O/GILDONG)
</ul>
<ul class="smallinfo">
<strong>탑승객소아/유아 탑승 안내</strong>
<li>귀국일 기준으로 만 12세 이상인 소아와 만 2세가 넘는 유아는 추가 차액이 발생하며 항공사 규정에따라 발권이 불가할 수 있으니 결제전 문의바랍니다.
<li>혼자 여행하는 만 18세 미만의 미성년자는 추가 요금이 발생할 수 있으므로 결제전 톡집사 로 문의바랍니다 .
<li>혼자 여행하는 16세 미만의 비동반 소아는 추가 요금이 발생할 수 있으므로 톡집사로 문의바랍니다.
<li>만 20세 미만의 탑승객이 유아/소아와 동반할 경우, 예약 후 톡집사로 문의 바랍니다.
</ul><br><br>


<h2>결제정보</h2>
<div class="row">
<div class="col" ><button type="button" class="btn btn-primary showswitch" style="width: 100%">즉시 결제</button></div>
<div class="col" ><button type="button" class="btn btn-secondary showswitch" style="width: 100%">예약완료</button></div></div>
<br>
<fieldset class="showswitchtarget">
<div class="row .justify-content-start">
<h5 class="col-3">마일리지 사용하기</h5>
	<div class="input-group col" id="mileageinput" required>
	<input type="number" class="form-control" name="useMileage" value="0" min ="0" max="99999999">
	<span class="input-group-text"> / </span>
	<input type="number" class="input-group-text" value="${reg2.mileage }" readonly>
	</div>
	<div class="col-3"></div>
</div>
<span class="smallinfo">마일리지는 10,000 이상부터 사용 가능합니다</span>


<br><br>
<h5>카드사 할인 선택</h5>
<div class="row" id="discountcard">
<label class="col-sm-3"><input class="form-check-input" type="radio" name="discountcard" value="" checked >선택없음</label><div class="col-sm-3"></div>
<label class="col-sm-3"><input class="form-check-input" type="radio" name="discountcard" value="삼성카드" >삼성카드결제조건</label><div class="col-sm-3">10,000원</div>
<label class="col-sm-3"><input class="form-check-input" type="radio" name="discountcard" value="신한카드" >신한카드결제조건</label><div class="col-sm-3">2,000원</div>
<label class="col-sm-3"><input class="form-check-input" type="radio" name="discountcard" value="롯데카드" >롯데카드결제조건</label><div class="col-sm-3">3,000원</div>
<label class="col-sm-3"><input class="form-check-input" type="radio" name="discountcard" value="현대카드" >현대카드결제조건</label><div class="col-sm-3">40,000원</div>
</div>

<br><br>

<div class="rounded-2 bg-info row">
<div class="col text-center align-self-center ">총 요금 ${costgo+costback }원</div>
<div class="col">
	<div class="row">
		<div class="col">카드할인  -</div>
		<div class="col" id="finaldiscountcard">0</div></div>
	<div class="row">
		<div class="col">마일리지 -</div>
		<div class="col" id="finalmileage">0</div></div>
</div>
<div class="col text-center fs-5">최종결제금액<span class="text-primary h2" id="finalprice"> ${costgo+costback } </span>원</div>
</div>
<br>
<label><input class="form-check-input" type="checkbox" onchange="bringcardinfo(this)">카드정보 불러오기</label>
<%@ include file="4005_cardinfo.jsp" %>

</fieldset>

<br>

<label class="fs-5"><input type="checkbox" class ="form-check-input" onclick="consentAll(this)">항공권 규정 확인 및 약관 전체 동의</label>

<style>
#consentAgreements label{
	position:relative;
	display:block;
	}
#consentAgreements div{
	position:absolute;
	top:0;
	left:500px;
	}
</style>


<ul type="none" class="border" id="consentAgreements">
	<li><label><input class ="form-check-input" type="checkbox" required>		<div class="invalid-feedback">항공권 규정 및 약관에 동의해주세요 </div>
		<a href="#" onclick="popup('4005_rule1.html');return false"> [필수] 항공사 요금규정(변경, 환불, 수하물 등)</a></label>
	<li><label><input class ="form-check-input" type="checkbox" required>		<div class="invalid-feedback">항공권 규정 및 약관에 동의해주세요 </div>
		<a href="#" onclick="popup('4005_rule2.html');return false"> [필수] 에어플래닛 이용규정(예약, 결제, 여권/비자, 취급수수료 등)</a></label>
	<li><label><input class ="form-check-input" type="checkbox" required> 		<div class="invalid-feedback">항공권 규정 및 약관에 동의해주세요 </div>
		<a href="#" onclick="popup('4005_rule3.html');return false"> [필수] 개인정보 수집 및 이용</a></label>
</ul>


<div class="row"><button type="submit" id="finalsubmit" class="btn btn-primary btn-lg">결제 완료하기</button></div>

</form>


<br>
<br>
<br>
</main>
<%@ include file="/0000_footer.html" %>

<script type="text/javascript">
/* 1. 모두입력햇는지 확인*/
(() => {
	  'use strict'
	  const forms = document.querySelectorAll('.needs-validation')
	  const submit = document.querySelector('#finalsubmit')
	  
	  Array.from(forms).forEach(form => {
	    form.addEventListener('submit', event => {
	      if (!form.checkValidity()) {
	        event.preventDefault()
	        event.stopPropagation()
	      }
	      form.classList.add('was-validated')
	      submit.classList.remove('btn-primary')
	      submit.classList.add('btn-danger')
	      submit.classList.add('text-white')
	    }, false)
	  })
	})()

//약관보기 팝업
function popup(href) {
	window.open(href,href,'width=700px,height=600px, status=no,menubar=no,toolbar=no,top=100px,left=100px');
}
//약관 전체 동의
function consentAll(self){
var consentAgreements = document.querySelectorAll('#consentAgreements input')
	if(self.checked==true){
		consentAgreements.forEach(function(box1){
			box1.checked=true;
		})
	}else{
		consentAgreements.forEach(function(box1){
			box1.checked=false;
		})
	}
}
	
	
 var discountcard = document.querySelectorAll('[name=discountcard]')
 var cardcorporate= document.querySelector('[name=cardcorporate]')
 var cardcorporateopts = document.querySelectorAll('[name=cardcorporate] option')
	
/*2. 카드사 할인선택 : 같은값으로 카드 select 바꾸고 disabled 속성*/
 discountcard.forEach(function(thiscard){
	 thiscard.addEventListener('change',function(){
				cardcorporateopts.forEach(function(opt){
					if(opt.value==thiscard.value){
						opt.selected=true;
						cardcorporate.disabled=true;
						discountcardapply(thiscard.value)
					}
					if(thiscard.value==""){cardcorporate.disabled=false;}
				})
				let cardcorporate2= document.querySelector('[name=cardcorporate2]')
				cardcorporate2.value=cardcorporate.value
				finalpriceapply();
		})
 })
 
/* 카드정보입력칸에서 고른 카드회사로 할인선택도 바뀌게 */
function discountcardbyselectedcard() {
	for(var thiscard of discountcard){
		if(thiscard.value==cardcorporate.value){
			thiscard.checked=true;
			cardcorporate.disabled=true;
			break;
		}else{
			discountcard[0].checked=true;
		}	
	}
}

 
/* 나중에결제 선택했을때 카드 입력안해도 validate안걸리게 required 상태 바꾸는거 */
function paynow(){
	let form = document.querySelector('form');
	let filset = document.querySelectorAll('fieldset.showswitchtarget input,fieldset.showswitchtarget select');
	form.classList.remove('was-validated');
	filset.forEach(function(self){
		if(self.required==true){
			self.required=false
			}else{
				self.required=true
			}
	})
	filset[7].required=false;
	
}

var originalPrice=${costgo+costback }	;
var myMileage= '${reg2.mileage}';
if(myMileage==''){myMileage=0;}else{myMileage=Number(myMileage)}


			console.log('js외부 '+myMileage)

</script>
<script type="text/javascript" src="4000_switchInfo.js">/*버튼눌러서 가는편 오는편 바꾸기*/</script>
<script type="text/javascript" src="4000_bringcardinfo.js">/*카드정보불러오기*/</script>
<script type="text/javascript" src="4000_mileage_card.js">/*마일리지 유효성,금액변경 적용*/</script>
<script>
//이벤트리스너 할당
/* 카드정보입력칸 select 바뀔때 */
cardcorporate.addEventListener('change',function(){
	discountcardbyselectedcard();
	discountcardapply(cardcorporate.value);
	finalpriceapply();
	let cardcorporate2= document.querySelector('[name=cardcorporate2]')
	cardcorporate2.value=cardcorporate.value
})
/* 마일리지 입력할때 */
mileageinputs[0].addEventListener("input",mileageValid)	

/* 가는편vs오는편 */
showswitch[0].addEventListener('click',function(){
	showswitching('0','0','','','','');	
	showswitching('1','0','none','','','');	
}) 	
showswitch[1].addEventListener('click',function(){
	showswitching('1','1','','','','');	
	showswitching('0','1','none','','','');	
}) 	

/* 지금결제vs나중에 */
showswitch[2].addEventListener('click',function(){
	showswitching('2','2','','finalsubmit','결제 완료하기','4902_fareInsert_pay.jsp');
	paynow()
}) 	
showswitch[3].addEventListener('click',function(){
	showswitching('2','3','none','finalsubmit','예약 완료하기','4901_fareInsert_reserve.jsp');	
	paynow()
}) 	

</script>
</body>
</html>