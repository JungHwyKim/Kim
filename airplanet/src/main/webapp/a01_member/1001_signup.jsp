<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="airplanet.vo.*" 
    import="airplanet.dao.*" 
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<style type="text/css">
.logo:hover{
	cursor:pointer;
}
.colFlex{
	display:flex;
	flex-direction:column;
	margin:auto;
	margin-top:40px;
	width:60%;
	align-items:center;
}
.regFlex{
	width:60%;
	margin-top:5px;
}
.textS{
	font-size:small;
	font-weight:bold;
}
.popupMain{
	position:fixed;
	width:31%;
	height:50%;
	border:1px solid black;
	margin:-35% 0 0 34%;
	z-index:999;
	background:rgb(255,255,255);
	border-radius:15px;
	visibility:hidden;
}
.popupBack{
	position:fixed;
	width:110%;
	height:105%;
	border:1px solid black;
	margin:-50% 0 0 -5%;
	background:rgba(0,0,0,0.3);
	z-index:998;
	visibility:hidden;
}
.toMain{
	margin:25% 0 0 80px;
	width:130px;
	height:40px;
}
.toSignin{
	margin:35% 0 0 20px;
	width:130px;
	height:40px;
}" 
</style>
<script>


</script>

</head>
<body>
<c:remove var="reg" scope="session"/>
	<div class="colFlex">
		<div><img src="/b01_img/logo_l.png" onclick="location.href='/a02_search/2000_main.jsp'" class="logo"></div>
		<div class="colFlex" style="height:580px;border:2px solid steelblue;border-radius:10px;margin-top:-5px;">
			<!-- 아이디 -->
			<div style="position:absolute;width:35%;">
				<div class="regFlex" style="margin-top:50px;width:15%;margin-left:100px;"><span class="textS">아이디</span></div>
				<div class="regFlex" style="display:flex;margin-left:100px;" >
					<input type="text" name="id" style="width:60%;">
					<div style="position:absolute;margin:13px 0 0 32%;">@</div>
					<select id="email" style="width:40%"></select>
				</div>
				<div style="margin-left:100px;">
					<div class="idcontainer" style="font-size:xx-small;"></div>
				</div>
			</div>
			<!-- 비밀번호 -->
			<div style="position:absolute;width:35%;margin:130px 0 0 200px;">
				<div class="regFlex"><span class="textS" style="margin-top:50px;width:15%;">비밀번호</span></div>
				<div class="regFlex" style="display:flex;"><input type="password" name="pw" style="width:100%;"></div>
				<div class="chgType" style="position:relative;margin:-30px 0 0 55%;padding-bottom:10px;">
					<img src="/b01_img/view.png" style="width:13px;height:9px;">
				</div>
				<div style="width:60%">
					<div class="pwcontainer" style="font-size:xx-small;"></div>
				</div>
			</div>
			<!-- 비밀번호 확인 -->
			<div style="position:absolute;width:35%;margin:210px 0 0 200px;">
				<div class="regFlex"><span class="textS" style="margin-top:50px;width:15%;">비밀번호 확인</span></div>
				<div class="regFlex"><input type="password" name="pwck" style="width:100%;"></div>
				<div class="chgType" style="position:relative;margin:-30px 0 0 55%;padding-bottom:10px;">
					<img src="/b01_img/view.png" style="width:13px;height:10px;padding-bottom:2px;">
				</div>
				<div style="width:60%">
					<div class="pwckcontainer" style="font-size:xx-small;"></div>
				</div>
			</div>
			<!-- 이름 -->
			<div style="position:absolute;width:35%;margin:290px 0 0 200px;">
				<div class="regFlex"><span class="textS" style="margin-top:50px;width:15%;">이름</span></div>
				<div class="regFlex"><input type="text" name="name"></div>
				<div style="width:60%">
					<div class="namecontainer" style="font-size:xx-small;"></div>
				</div>
			</div>
			<!-- 전화번호 -->
			<div style="position:absolute;width:35%;margin:370px 0 0 200px;">
				<div class="regFlex"><span class="textS">전화번호</span></div>
				<div class="regFlex" style="margin-top:0;">
						<input style="width:70%;" type="text" name="tel">
						<input style="width:30%;height:41px;background:steelblue;font-weight:bold;" type="button" name="telck" value="인증하기">
				</div>
				<div class="regFlex" style="margin-top:0;"><input style="background:#efefef;" type="text" name="telckcode" placeholder="인증번호를 입력하세요"></div>
				<div style="width:60%">
					<div class="telcontainer" style="font-size:xx-small;"></div>
				</div>
			</div>
			<div class="regFlex" style="position:absolute;width:21%;margin-top:510px;"><input style="width:100%;background:steelblue;" type="button" name="reg" value="가입하기"></div>
			
		</div>
	</div>
	<div class="popupMain">
		<img src="/b01_img/A_Check.png" style="width:25%;height:30%;margin:10% 0 0 37%"/>
		<div style="margin:5% 0 0 29%;">회원가입이 <span style="font-weight:700;">완료</span> 되었습니다!</div>
		<div style="display:flex;">
			<div><input class="toMain" type="button" value="메인화면" style="background:rgb(75,168,229);" onclick="location.href='/a02_search/2000_main.jsp'"></div>
			<div><input class="toSignin" type="button" value="로그인" style="background:rgb(75,168,229);" onclick="location.href='/a01_member/1002_signin.jsp'"></div>
		</div>
	</div>
	<div class="popupBack"></div>
</body>
<script type="text/javascript">
var idOb = document.querySelector("[name=id]")
var pwOb = document.querySelector("[name=pw]")
var pwckOb = document.querySelector("[name=pwck]")
var emailOb = document.querySelector("#email")
var pwV = document.querySelectorAll(".chgType")
var telOb = document.querySelector("[name=tel]")
var telckOb = document.querySelector("[name=telck]")
var telckcodeOb = document.querySelector("[name=telckcode]")
var nameOb = document.querySelector("[name=name]")
var regOb = document.querySelector("[name=reg]")
var idcontainerOb = document.querySelector(".idcontainer")

var pattern1 = /[0-9]/; //숫자
var pattern2 = /[a-zA-Z]/; //영어
var pattern3 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //한글
var pattern4 = /[-_]/; //특수문자
var pattern5 = /[!@#$%^&*]/; //특수문자(비번)

var emailId = ""
var pwValid = ""

var emailArr = ["hotmail.com","hanmail.net","naver.com","gmail.com","daum.net","nate.com","cyworld.com","yahoo.com"]
var eshow = ""
emailArr.forEach(function(e){
	eshow += "<option>"+e+"</option>"
})
emailOb.innerHTML = eshow

/* 이벤트 */
idOb.onblur=idCheck
emailOb.onchange=idCheck
pwOb.onblur=pwCheck
pwckOb.onblur=pwDbCheck


// 전체 유효성 여부
var idPass = false
var pwPass = false
var pwckPass = false
var namePass = false
var telPass = false

/* 아이디 유효성(영문,숫자만 허용) */
function idCheck(){
	idPass = false
	emailId = idOb.value+"@"+emailOb.value
	if(pattern5.test(idOb.value)){
		idcontainerOb.innerText = "5~20자의 영문 소문자, 숫자만 사용 가능합니다."
		idcontainerOb.style.color="red"
		idOb.style.borderColor="red"
		return;
	}else if(!pattern3.test(idOb.value) && idOb.value.length >= 5 && idOb.value.length <= 20){
		console.log(emailId+"1")
		var xhr = new XMLHttpRequest()
		xhr.open("get","a01_idCheck.jsp?email="+emailId,true)
		console.log("a01_idCheck.jsp?email="+emailId)
		xhr.send()
		xhr.onreadystatechange=function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = JSON.parse(xhr.responseText)
				console.log(data.hasMember)
				if(data.hasMember){
					console.log(emailId+"2")
					idcontainerOb.innerText="등록된 아이디가 있습니다."
					idcontainerOb.style.color="red"
					idOb.style.borderColor="red"
					return;
				}else{
					console.log(emailId+"3")
					idcontainerOb.innerText = "멋진 아이디이군요!"
					idcontainerOb.style.color="green"
					idOb.style.borderColor="green"
					idPass = true
					return;
				}
			}
		}
		console.log(emailId+"4")
		return;
	}else if(idOb.value == ""){
		idcontainerOb.innerText = ""
		idOb.style.borderColor="#cccccc"
		return;
	}else{
		idcontainerOb.innerText = "5~20자의 영문 소문자, 숫자만 사용 가능합니다."
		idcontainerOb.style.color="red"
		idOb.style.borderColor="red"
		return;
	}
}

// 비밀번호(영문/숫자/특수문자 포함된 8~16자리 값)
function pwCheck(){
	pwPass = false
	if(pattern1.test(pwOb.value) && pattern2.test(pwOb.value) && pattern5.test(pwOb.value)){
		if(pwOb.value.length >= 8 && pwOb.value.length <= 16){
			document.querySelector(".pwcontainer").innerText = "사용가능한 비밀번호입니다!"
			document.querySelector(".pwcontainer").style.color="green"
			pwOb.style.borderColor="green"
			pwValid = pwOb.value
			pwPass = true
			return;
		}else{
			document.querySelector(".pwcontainer").innerText = "비밀번호 설정 조건을 확인해주세요."
			document.querySelector(".pwcontainer").style.color="red"
			pwOb.style.borderColor="red"
			return;
		}
	}else if(pwOb.value.length == 0){
		document.querySelector(".pwcontainer").innerText = ""
		pwOb.style.borderColor="#cccccc"
		return;
	}else{
		document.querySelector(".pwcontainer").innerText = "비밀번호 설정 조건을 확인해주세요."
		document.querySelector(".pwcontainer").style.color="red"
		pwOb.style.borderColor="red"
		return;
	}
}

// 비밀번호 확인
function pwDbCheck(){
	pwckPass = false
	if(pwckOb.value == 0){
		document.querySelector(".pwckcontainer").innerText = ""
		pwckOb.style.borderColor="#cccccc"	
	}else if(pwckOb.value == pwValid){
		document.querySelector(".pwckcontainer").innerText = "비밀번호가 일치합니다!"
		document.querySelector(".pwckcontainer").style.color="green"
		pwckOb.style.borderColor="green"
		pwckPass = true
	}else{
		document.querySelector(".pwckcontainer").innerText = "비밀번호를 확인해주세요."
		document.querySelector(".pwckcontainer").style.color="red"
		pwckOb.style.borderColor="red"
	}
}

// 비밀번호/ 비밀번호 확인(보기/숨기기)
var pwViewBoolean0 = true
var pwViewBoolean1 = true
pwV.forEach(function(i){
	pwV[0].onclick=function(){
		if(pwViewBoolean0){
			pwOb.type="text"
			pwV[0].innerHTML = "<img src='/b01_img/unview.png' style='width:13px;height:11px;margin-top:1px;'/>"	
			console.log(pwOb.type)
			pwViewBoolean0 = false
		}
		else{
			pwOb.type="password"
			pwV[0].innerHTML = "<img src='/b01_img/view.png' style='width:13px;height:9px;padding-bottom:1px;'/>"
			console.log(pwOb.type)
			pwViewBoolean0 = true
		}
	}
	pwV[1].onclick=function(){
		if(pwViewBoolean1){
			pwckOb.type="text"
			pwV[1].innerHTML = "<img src='/b01_img/unview.png' style='width:13px;height:11px;margin-top:1px;'/>"	
			console.log(pwOb.type)
			pwViewBoolean1 = false
		}
		else{
			pwckOb.type="password"
			pwV[1].innerHTML = "<img src='/b01_img/view.png' style='width:13px;height:10px;padding-bottom:2px;'>"
			console.log(pwOb.type)
			pwViewBoolean1 = true
		}
	}
})

// 이름(공백X)
nameOb.onblur=function(){
	namePass = false
	if(nameOb.value == ""){
		document.querySelector(".namecontainer").innerText="이름은 필수입력 사항입니다."
		nameOb.style.borderColor="red"
		document.querySelector(".namecontainer").style.color="red"
	}else{
		document.querySelector(".namecontainer").innerText="멋진 이름입니다!"
		nameOb.style.borderColor="green"
		document.querySelector(".namecontainer").style.color="green"
		namePass = true
	}
}

// 전화번호 입력(11자)
var telckboolean= false
function telCheck(){
	if(pattern1.test(telOb.value)){
		if(telOb.value.length != 11){
			telOb.style.borderColor="red"			
			document.querySelector(".telcontainer").innerText="전화번호 11자리를 입력해주세요."
			telckcodeOb.style.borderColor="#cccccc"
			telC()
			return;
		}else{
			telOb.style.borderColor="green"
			document.querySelector(".telcontainer").style.color="green"
			document.querySelector(".telcontainer").innerText="인증해주세요!"
			telckboolean = true
			return;
		}
	}else if(telOb.value.length == 0){
		telOb.style.borderColor="#cccccc"
		document.querySelector(".telcontainer").innerText=""
		telC()
		return;
	}else{
		telOb.style.borderColor="red"
		document.querySelector(".telcontainer").innerText="전화번호를 확인해주세요."
		telC()
		return;
	}
}
function telC(){
	document.querySelector(".telcontainer").style.color="red"
	telckcodeOb.value=""
	telckboolean = false
	telckcodeOb.style.background="#efefef"
	telckcodeOb.readOnly = true
}
var telF = ""
telckOb.onclick=function(){
	telCheck()
	telF = telOb.value
	if(telckboolean){
		telckcodeOb.readOnly=false
		telckcodeOb.style.background="white"
	}else{
		telPass = false
	}
}
telckcodeOb.onblur=function(){
	telPass = false
	if(telckcodeOb.value=="1111"){
		telckcodeOb.style.borderColor="green"
		document.querySelector(".telcontainer").style.color="green"
		document.querySelector(".telcontainer").innerText="인증 완료!"
		telPass = true
	}else{
		telckcodeOb.style.borderColor="red"
		document.querySelector(".telcontainer").style.color="red"
		document.querySelector(".telcontainer").innerText="인증번호가 일치하지 않습니다"
	}
}
// 회원가입 마무리
var popupMain = document.querySelector(".popupMain")
var popupBack = document.querySelector(".popupBack")
regOb.onclick=function(){
	if(idPass && pwPass && pwckPass && namePass && telPass){
		popupMain.style.visibility="visible"
		popupBack.style.visibility="visible"
		var xhr = new XMLHttpRequest()
		var qstr = "?email="+emailId+"&pw="+pwOb.value+"&name="+nameOb.value+"&tel="+telF
		console.log(qstr)
		xhr.open("get","a02_register.jsp"+qstr,true)
		xhr.send()
		/* a1.value=emailId
		a2.value=pwOb.value
		a3.value=nameOb.value
		a4.value=telF
		console.log(a1.value)
		console.log(a2.value)
		console.log(a3.value)
		console.log(a4.value) */
	}else{
		if(!idPass){
			idOb.focus(); 
			return;
		}else if(!pwPass){
			pwOb.focus(); 
			return;
		}else if(!pwckPass){
			pwckOb.focus(); 
			return;
		}else if(!namePass){
			nameOb.focus(); 
			return;
		}else{
			telOb.focus(); 
			return;
		}
	}
}

</script>
</html>