<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="vo.*" 
  	import="dao.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style>
.col {
	width: 100%;
	height: 600px;
}
.col::after {
	content: "";
	background: url('/b01_img/main_back.jpg');
	background-size: cover;
	opacity: 0.7;
	position: absolute;
	top: 100px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	z-index:-1;
}
.colD {
	width: 80%;
	height: 500px;
	margin:auto;
}
[name=signin]:hover, [name=signup]:hover, [name=searchBtn]{
	cursor:pointer;
}
.hidden {
	display:none;
}
.wordList{
	display:none;
}
.wordList1{
	display:none;
}
.des{
	padding:5px 0 0 10px;
	border:none;
	width:245px;
	background:rgba(220,220,220,0.7); 
}
.arv{
	padding:5px 0 0 10px;
	border:none;
	width:245px;
	background:rgba(220,220,220,0.7); 
}
.des:hover{
	background:rgba(100,100,100,0.7);
	color:white;
	font-weight:600;
}
.arv:hover{
	background:rgba(100,100,100,0.7);
	color:white;
	font-weight:600;
}
.balloon {  
	 position:relative; 
	 margin:20px 0 0 -15px;
	 width:300px; 
	 height:280px;
	 background:rgba(100,100,100,0.7); 
	 border-radius:10px;
	 display: none;
}
.balloon:after { 
	 border-top:0px solid transparent; 
	 border-left: 10px solid transparent; 
	 border-right: 10px solid transparent; 
	 border-bottom: 10px solid rgba(100,100,100,0.7);
	 content:""; 
	 margin-left:-55px;
	 position:absolute;
	 top:-10px;
	 left:200px;  
}
.pBtn1, .pBtn2{
	border-radius:50%;
	border:2px solid #cccccc;
	width:40px;
	height:40px;
	font-size:xx-large;
	color:steelblue;
}
.mBtn1,.mBtn2{
	background:#cccccc;
	color:#444444;
	border-radius:50%;
	border:2px solid #cccccc;
	width:40px;
	height:40px;
	font-size:xx-large;
}
.mBtn1:active, .pBtn1:active,.mBtn2:active, .pBtn2:active{
	border:2px solid steelblue;
}
.headerRL{
	width:120px;
	height:50px;
	background:lightblue;
	border-radius:10px;
	border:none;
	font-size:medium;
	font-weight:700;
	color:white;
}
</style>
</head>
<body>
	<div class="col">
	<jsp:include page="/header.jsp" flush="true"/> 
		<div class="colD">
			<div style="margin-top:100px;"><span style="font-size:70px;font-weight:800;color:white;">여행을 시작하세요</span></div>
			<div style="border:1px solid white;border-radius:20px;height:250px;background:rgba(250,250,250,0.9)">
				<div style="margin:50px 0 0 20px">
					<input type="radio" name="trip" value="0" checked="checked"/><span style="font-weight:600" > 왕복 </span> 
					<input type="radio" name="trip" value="1"/><span style="font-weight:600" > 편도</span>
				</div>
			<div style="display:flex;margin:25px 0 0 25px;">
				<div style="flex-direction:column;"> 
					<div><span style="font-weight:600;font-size:small;">출발지</span></div>
					<div><input style="width:250px;height:35px;" type="text" name="departure"/></div>
					<div style="position:absolute;">
						<div class="wordList" tabindex="0"></div>
					</div>
				</div>
				<div style="flex-direction:column;">
					<div><span style="font-weight:600;font-size:small;">도착지</span></div>
					<div><input style="width:250px;height:35px;" type="text" name="arrival"/></div>
					<div style="position:absolute;">
						<div class="wordList1" tabindex="0"></div>
					</div>
				</div>
				<div style="flex-direction:column;">
					<div><span style="font-weight:600;font-size:small;">가는날</span></div>
					<div><input style="width:125px;height:35px;" type="text" name="ddate"/></div>
				</div>
				<div style="flex-direction:column;">
					<div><span style="font-weight:600;font-size:small;">오는날</span></div>
					<div><input style="width:125px;height:35px;" type="text" name="adate"/></div>
				</div>
				<div style="flex-direction:column;">
					<div><span style="font-weight:600;font-size:small;">좌석등급 및 승객</span></div>
					<div><input style="width:250px;height:35px;" type="text" name="gradenum"/></div>
					<div style="position:absolute;">
						<div class="gAn" tabindex="0">
							<div class="balloon">
								<div style="margin-left:30px;padding-top:20px;font-size:small;font-weight:600;color:white;">좌석 등급</div>
								<div style="margin:-5px 0 0 28px;padding-top:10px;">
									<select class="opt" style="border-radius:5px;width:240px;height:35px;">
										<option value="ec">일반석</option>
										<option value="bs">비즈니스석</option>
										<option value="fs">일등석</option>
									</select>
								</div>
								<div style="margin-left:30px;padding:10px 0 10px 0;font-size:small;font-weight:600;color:white;">성인</div>
								<div style="display:flex;margin-left:30px;">
									<div><input type="button" class="mBtn1" value="&#8722"></div>
									<div class="adt" style="margin:12px 15px 0 15px;color:white;">1</div>
									<div><input type="button" class="pBtn1" value="&#43"></div>
									<div style="margin:12px 10px 0 10px;color:white;">만 16세 이상</div>
								</div>
								<div style="margin:15px 0 0 200px;"><input class="sendgAn" type="button" style="width:70px;height:25px;background:rgba(250,250,250,0.7);border-radius:5px;border:none;" value="완료"></div>
							</div>
						 </div>
					</div>
				</div>
			</div>
			<div><input style="z-index:1;position:absolute;width:30px;height:25px;margin:-33px 0 0 240px;background:white;border:none;font-size:20px;color:steelblue" type="button" name="switch" value="⇄"/></div>
			<div><input style="margin:20px 0 0 900px;width:150px;height:50px;font-size:large;font-weight:700;background:NavajoWhite;border:1px solid moccasin;color:white;border-radius:10px;" name="searchBtn" type="button" value="항공권 검색 →"></div>
			
			</div>
		</div>
	</div>
	<div id="asd"></div>
<div id="footer" style="margin-top:160px;"></div>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$("#footer").load("footer.html")
	var place = document.querySelectorAll(".des")
	var ddateOb = document.querySelector("[name=ddate]")
	var adateOb = document.querySelector("[name=adate]")
	var swch = document.querySelector("[name=switch]")
	var depart = document.querySelector("[name=departure]")
	var arriv = document.querySelector("[name=arrival]")
	var mBtn1Ob = document.querySelector(".mBtn1")
	var pBtn1Ob = document.querySelector(".pBtn1")
	var adtOb = document.querySelector(".adt")
	var d = new Date()
	var gradenumOb = document.querySelector("[name=gradenum]")
	var sendgAnOb = document.querySelector(".sendgAn")
	var optOb = document.querySelector(".opt")
	var tripArr = document.querySelectorAll("[name=trip]")
	
	// 출발지/도착지 반전
	swch.onclick=function(){
		var departSave = depart.value
		depart.value = arriv.value
		arriv.value = departSave
	}

	// 데이트피커
	$(function(){
	    $("[name=ddate], [name=adate]").datepicker({
	    	  changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
	    	  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
	    	  minDate: '0y', // 현재날짜로부터 100년이전까지 년을 표시한다.
	    	  nextText: '다음 달', // next 아이콘의 툴팁.
	    	  prevText: '이전 달', // prev 아이콘의 툴팁.
	    	  numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
	    	  stepMonths: 1, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
	    	  yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	    	  showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
	    	  currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
	    	  closeText: '닫기',  // 닫기 버튼 패널
	    	  dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
	    	  showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
	    	  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
	    	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.
	    	  yearRange: "2022:2024" //연도 범위
	    });
	});
	$(document).ready(function () {
        $.datepicker.setDefaults($.datepicker.regional['ko']); 
        $( "[name=ddate]" ).datepicker({
             changeMonth: true, 
             changeYear: true,
             nextText: '다음 달',
             prevText: '이전 달', 
             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             dateFormat: "yymmdd",
             maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
             onClose: function( selectedDate ) {    
                  //시작일(startDate) datepicker가 닫힐때
                  //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                 $("#endDate").datepicker( "option", "minDate", selectedDate );
             } 
        });
        $( "[name=adate]" ).datepicker({
             changeMonth: true, 
             changeYear: true,
             nextText: '다음 달',
             prevText: '이전 달', 
             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             dateFormat: "yymmdd",
             maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
             onClose: function( selectedDate ) {    
                 // 종료일(endDate) datepicker가 닫힐때
                 // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                 $("#startDate").datepicker( "option", "maxDate", selectedDate );
             }    
        });    
	});
	
	// 날짜 디폴트
	ddateOb.value = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()
	adateOb.value = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()
	
	// 오는날이 가는날보다 빠를때
	ddateOb.onchange=function(){
		const ddate = new Date(ddateOb.value)
		console.log(ddateOb.value)		
		if(ddateOb.value >= adateOb.value){
			adateOb.value = ddateOb.value 
		}
	}	
	adateOb.onchange=function(){
		const adate = new Date(adateOb.value)
		console.log(adateOb.value)	
		if(ddateOb.value >= adateOb.value){
			adateOb.value = ddateOb.value 
		}	
	}
	
	// 등급 및 인원 디폴트
	var cnt1 = 1;
	gradenumOb.value = "등급: "+$(".opt option:selected").text()
	gradenumOb.value  += ", "+cnt1+"명"
	
	// 등급 및 인원 선택
	mBtn1Ob.onclick=minus1
	function minus1(){
		if(cnt1 >= 2){
			cnt1--
			if(cnt1 <= 1){
				mBtn1Ob.style.background="#cccccc"
				mBtn1Ob.style.color="#444444"
				adtOb.innerText=cnt1
			}else{
				mBtn1Ob.style.background="white"
				mBtn1Ob.style.color="steelblue"
				if(cnt1 >= 2){
					adtOb.innerText=cnt1
				}
			}
		}else{
			alert("성인은 1명 아래로 내려갈 수 없습니다.")
		}
	}
	pBtn1Ob.onclick=function(){
		cnt1++
		if(cnt1 >= 2){
			mBtn1Ob.style.background="white"
			mBtn1Ob.style.color="steelblue"
		}
		adtOb.innerText=cnt1
	}
	gradenumOb.onclick=function(){
		document.querySelector(".balloon").style.display="block"
	}
	sendgAnOb.onclick=function(){
		gradenumOb.value = "등급: "+$(".opt option:selected").text()
		gradenumOb.value  += ", "+cnt1+"명"
		document.querySelector(".balloon").style.display="none"
	}
	gradenumOb.onblur=function(){
		if(event.relatedTarget == null) {
			document.querySelector(".balloon").style.display="none"
		}
	} 
	document.querySelector(".gAn").onblur=function(){
		document.querySelector(".balloon").style.display="none"
	}
	
	// 왕복/편도 선택
	var adateB = false
	for(var idx=0;idx<tripArr.length;idx++){
		tripArr[idx].onclick=function(){
			if(this.value == 1){ 
				adateB = true
				adateOb.readOnly=adateB
				adateOb.value=""
				adateOb.style.border="1px solid #252525"
				adateOb.style.background="#dddddd"
				adateOb.style.height="35px"
				adateOb.style.width="125px"
				$("[name=adate]").datepicker('disable');
			}else{
				adateB = false
				adateOb.readOnly=adateB
				adateOb.value = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()
				adateOb.style.background="white"
				$("[name=adate]").datepicker('enable');
			}
		}
	}
	// 공항코드 불러오기
	var searchBtnOb = document.querySelector("[name=searchBtn]")
	// 도착지(공백삭제)
	var arvP = ""
	// 도착지(공백삭제)
	var depP = ""
	var dep0 = "" // 나라
	// 도착지 항공 코드
	var arvC = ""
	// 출발지 항공 코드
	var depC = ""
	// 출발지 선택
	var dcontainer = document.querySelector(".wordList")
	depart.onkeyup=function(){
		var xhr = new XMLHttpRequest()
		var qstr = "?apnation="+depart.value+"&apcity="+depart.value
		console.log(qstr)
		xhr.open("get","b01_search.jsp"+qstr,true)
		xhr.send()
		xhr.onreadystatechange=function(){
			if(xhr.readyState == 4 && xhr.status == 200 && depart.length!=0){
				dcontainer.style.display="block"
				dcontainer.innerHTML = xhr.responseText
				call()
				if(depart.value==""){
					dcontainer.style.display="none"
				}
			}
		}
	}
	// 도착지 선택
	var d1container = document.querySelector(".wordList1")
	arriv.onkeyup=function(){
		var xhr = new XMLHttpRequest()
		var qstr = "?apnation="+arriv.value+"&apcity="+arriv.value
		console.log(qstr)
		xhr.open("get","b01_search.jsp"+qstr,true)
		xhr.send()
		xhr.onreadystatechange=function(){
			if(xhr.readyState == 4 && xhr.status == 200 && depart.length!=0){
				d1container.style.display="block"
				d1container.innerHTML = xhr.responseText
				call1()
				if(arriv.value==""){
					d1container.style.display="none"
				}
			}
		}
	}
	function call(){
		var p = document.querySelectorAll(".pList")
		p.forEach(function(d){
			for(var i=0;i<p.length;i++){
				p[i].onclick=function(){
					depart.value = this.innerText
					let da = depart.value
					let darr = da.split(',')
					depP = darr[1].trim()
					dep0 = darr[0]
					var qstr = "?sch="+depP
					var xhr = new XMLHttpRequest()
					xhr.open("get","b02_getCode.jsp"+qstr,true)
					xhr.send()
					xhr.onreadystatechange=function(){
						if(xhr.readyState == 4 && xhr.status == 200){
							depC = xhr.responseText.trim()
							
						}
					}
					dcontainer.style.display="none";
				}
			}
		})
	}
	function call1(){
		var p = document.querySelectorAll(".pList")
		p.forEach(function(d){
			for(var i=0;i<p.length;i++){
				p[i].onclick=function(){
					arriv.value = this.innerText
					let a = arriv.value
					let aarr = a.split(',')	
					arvP = aarr[1].trim()
					var qstr = "?sch="+arvP
					var xhr = new XMLHttpRequest()
					xhr.open("get","b02_getCode.jsp"+qstr,true)
					xhr.send()
					xhr.onreadystatechange=function(){
						if(xhr.readyState == 4 && xhr.status == 200){
							arvC = xhr.responseText.trim()
							arvS = aarr[0]
						}
					}
					d1container.style.display="none";
				}
			}
		})
	}
	depart.onblur=function(){
		if(event.relatedTarget === null) {
			dcontainer.style.display="none"
		}
	}
	arriv.onblur=function(){
		if(event.relatedTarget === null) {
			d1container.style.display="none"
		}
	}
	
	// 항공권 검색
	searchBtnOb.onclick=function(){
		// 왕복
		if(tripArr[0].value == 0){
			if(depC == ""){
				depart.focus()
				// 입력해달라는 내용
			}else{
				if(arriv.value == ""){
					var qstr="?departlocation="+depC+"&arrivelocation=&departdate="+ddateOb.value+"&arrivedate="+adateOb.value+"&classP="+optOb.value+"&cnt="+cnt1
					location.href="b2000_1_check.jsp"+qstr
				}else if(arvC == ""){
					var qstr="?departlocation="+depC+"&arrivelocation="+arriv.value+"&departdate="+ddateOb.value+"&arrivedate="+adateOb.value+"&classP="+optOb.value+"&cnt="+cnt1
					console.log(qstr)
					location.href="b2000_1_check.jsp"+qstr
				}else{
					var qstr="?departlocation="+depC+"&arrivelocation="+arvC+"&departdate="+ddateOb.value+"&arrivedate="+adateOb.value+"&classP="+optOb.value+"&cnt="+cnt1
					console.log(qstr)
					location.href="b2000_1_check.jsp"+qstr
				}
			}
		// 편도
		}else{
			if(depC == ""){
				depart.focus()
				// 입력해달라는 내용
			}else{
				if(arriv.value == ""){
					var qstr="?departlocation="+depC+"&arrivelocation=&departdate="+ddateOb.value+"&classP="+optOb.value+"&cnt="+cnt1
					location.href="b2000_1_check.jsp"+qstr
				}else if(arvC == ""){
					var qstr="?departlocation="+depC+"&arrivelocation="+arriv.value+"&departdate="+ddateOb.value+"&classP="+optOb.value+"&cnt="+cnt1
					location.href="b2000_1_check.jsp"+qstr
				}else{
					var qstr="?departlocation="+depC+"&arrivelocation="+arvC+"&departdate="+ddateOb.value+"&classP="+optOb.value+"&cnt="+cnt1
					location.href="b2000_1_check.jsp"+qstr
				}
			}
		}
	}
	
</script>
</body>
</html>