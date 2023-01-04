<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="jspexp.vo.*" 
  	import="jspexp.a13_database.*"
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
.colFlex{
	display:flex;
	flex-direction:column;
}
.logo{
	width:300px;
	height:120px;
}
.logo:hover, .signup:hover, .findId:hover, .findPw:hover{
	cursor:pointer;
}
.signup{
	font-size:x-small;
	margin:3% 30% 0 7%;
	color:#aaaaaa;
	width:20%;
}
.findId{
	font-size:x-small;
	margin:3% 2% 0 3%;
	color:#aaaaaa;
}
.findPw{
	font-size:x-small;
	margin:3% 0 0 2%;
	color:#aaaaaa;
}
.formDiv{
	margin:auto;
	border:1px solid steelblue;
	width:40%;
	height:430px;
	border-radius:10px;
	align-items:center;
}
[name=email]{
	width:100%;
	margin-top:60px;
}
[name=pass]{
	width:100%;
	margin-top:15px;
}
.idcontainer, .pwcontainer{
	font-size:xx-small;
}
.saveIdSpan{
	font-size:x-small;
	vertical-align:middle;
}
.btn{
	width:100%;
	margin-top:1%;
	width:100%;
}
.hrDiv{
	margin-top:20px;
	width:60%;
}
#naver_id_login{
	width:60%;
	margin-top:10px;
	background:#03C75A;
	border-radius:5px; 
}
.googleImgDiv, .kakaoImgDiv{
	position:absolute;
	margin:9px 0 0 9px;
}
.googleImg, .kakaoImg{
	width:25px;
	height:25px;
}
.kakao{
	width:60%;
	margin-top:10px;
}
.naver{
	width:60%;
	margin-top:10px;
	display:block;
}
</style>
<script>
/*

*/

</script>

</head>
<body>
	<div class="colFlex">
		<div style="margin:auto;">
			<img src="/b01_img/airplanet_logo.png" onclick="location.href='/a02_search/2000_main.jsp'" class="logo"/>
		</div>
		<div><br></div>
		<div class="colFlex formDiv">
			<form style="width:60%;" name="signin" action="/a01_member/a03_signinCk.jsp" method="get">
				<!-- 아이디 -->
				<div>
					<input type="text" name="email" placeholder="아이디 입력"/>
				</div>
				<div style="position:absolute;color:red;">
					<div class="idcontainer"></div>
				</div>
				<!-- 비밀번호 -->
				<div>
					<input type="password" name="pass" placeholder="비밀번호 입력"/>
				</div>
				<div style="position:absolute;color:red;">
					<div class="pwcontainer"></div>
				</div>
				<!-- 아이디 저장 -->
				<div style="margin-top:2%;">
					<input type="checkbox" name="saveid"/>
					<span class="saveIdSpan">아이디 저장</span>
				</div>
				<!-- 로그인 버튼 -->
				<div>
					<input type="button" value="로그인" class="btn" style="background:steelblue;"/>
				</div>
			</form>
			<div class="hrDiv">
				<hr color="steelblue">
			</div>
			<!-- 구글 버튼 -->
			<div id="naver_id_login" style="display:none;">
			<div id="naver_id_login" class="naver">
				<input style="width:100%;border:1px solid Gainsboro;background:white;color:black;" 
					type="button" value="네이버 로그인"/>
				<div class="googleImgDiv">
					<img src="/b01_img/google.png" class="googleImg"/>
				</div>
			</div>	
			</div>
			<!-- 카카오 버튼 -->
			<div class="kakao">
				<input style="width:100%;background:gold;color:black;" type="button" value="카카오 아이디로 로그인"/>
				<div class="kakaoImgDiv">
					<img src="/b01_img/kakao.png" class="kakaoImg"/>
				</div>
			</div>
			<!-- 기타 기능 -->
			<div style="display:flex;width:60%;">
				<div class="signup" onclick="location.href='/a01_member/1001_signup.jsp'">회원가입</div>
				<div class="findId" onclick="''"><span>아이디찾기</span></div>
				<div style="margin-top:1%;"><hr style="height:50%;"></div>
				<div class="findPw" onclick="''"><span>비밀번호찾기</span></div>
			</div>
		</div>
	</div>
	<div id="footers" style="margin-top:8%"></div>
	
</body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8"></script>
<script type="text/javascript">
var idOb = document.querySelector("[name=email]")
var idD = document.querySelector(".idcontainer")
var pwOb = document.querySelector("[name=pass]")
var pwD = document.querySelector(".pwcontainer")
var btnOb = document.querySelector(".btn")
var saveid = document.querySelector("[name=saveid]")


idOb.onblur=function(){
	if(idOb.value!=""){
		idD.innerText=""
		idOb.style.borderColor="#cccccc"		
	}
}

idOb.onkeyup=function(){
	if(event.keyCode == 13){
		login()
	}
}
pwOb.onkeyup=function(){
	if(event.keyCode == 13){
		login()
	}
}

btnOb.onclick=login
	
function login(){
	if(idOb.value == ""){
		idOb.style.borderColor="red"
		idOb.focus();
		idD.innerText="아이디를 입력해주세요"
		return;
	}else if(idOb.value != "" && pwOb.value == ""){
		idD.innerText=""
		idOb.style.borderColor="#cccccc"
		pwOb.style.borderColor="red"
		pwOb.focus()
		pwD.innerText="비밀번호를 입력해주세요"
		return;
	}else{
		idD.innerText=""
		idOb.style.borderColor="#cccccc"
		pwD.innerText=""
		pwOb.style.borderColor="#cccccc"
		// 아이디 저장(쿠키)
		if(saveid.checked){
			saveIdCookie()
		}else{
			deleteIdCookie()
		}
		
		document.signin.submit();
		return;
	}
}

// 저장된 아이디(쿠키)가 있을 때
var cookiee = document.cookie.split(";")
	//console.log(cookiee)
for(var i=0;i<cookiee.length;i++){
var nv = cookiee[i].split("=")
	//console.log(cookiee[i])
	console.log(nv)
	for(var j=0;j<nv.length;j++){
		console.log(nv[0].trim())
		if(nv[0].trim() == "idCookie"){
			idOb.value=nv[1].trim()
			saveid.checked="true"
		}
	}
}

// 아이디 쿠키 생성
function saveIdCookie(){
	var date = new Date()
	date.setDate(date.getDate() + 7)
	var idCookie = ""
	idCookie += "idCookie="+idOb.value+";"
	idCookie += "expires=" + date.toUTCString()
	document.cookie = idCookie;
}
function deleteIdCookie(){
	var date = new Date()
	date.setDate(date.getDate() - 1)
	var idCookie = ""
	idCookie += "idCookie="+idOb.value+";"
	idCookie += "expires=" + date.toUTCString()
	document.cookie = idCookie;
}
var page = "http://localhost:6080/a01_member/a03_signinCk.jsp"
// 회원체크 페이지에서 돌아오면 lPage 바뀌지 않음
if(!document.referrer.includes(page) && document.referrer!=''){
	var lPage = document.referrer	
// 로그인 페이지로 바로 넘어갈때 lPage가 null
}else if(document.referrer==''){
	console.log("2321")
	var lPage = "/a02_search/2000_main.jsp"
}
//
console.log(lPage)
// 넘어온 페이지 저장
if(lPage != null){
	if(!lPage.includes(page)){
		localStorage.setItem('lastPage',document.referrer)	
	}
	console.log(localStorage.getItem('lastPage'))
}



// 카카오 스크립트
var kakao = document.querySelector(".kakao")
Kakao.init('42668abcd2ff093e3126085f52f5802c')
console.log(Kakao.isInitialized()) // sdk 초기화 여부 판단
// 카카오 로그인
kakao.onclick = kakaoLogin
function kakaoLogin(){
	Kakao.Auth.login({
		success: function(response){
			Kakao.API.request({
				url:'/v2/user/me',
				success : function(response){
					console.log(response)
					console.log(JSON.stringify(response.properties.nickname))
					location.href="/a01_member/a04_kakao.jsp?profile_name="+response.properties.nickname
				},
				fail: function(error){
					console.log(error)
				},
			})
		},
		fail: function(error){
			console.log(error)
		},
	})
}
// 카카오 로그아웃
function kakaoLogout(){
	if(Kakao.Auth.getAccessToken()){
		Kakao.API.request({
			url:'/v1/user/unlink',
			success: function(response){
				console.log(response)
				
			},
			fail: function(error){
				console.log(error)
			},
		})
		Kakao.Auth.setAccessToken(undefined)
	}
}

// 네이버 로그인
var naver_id_login = new naver_id_login("RTYAK5wpHQ_5DXB8xM_e", "http://localhost:6080/a01_member/a05_naver.jsp");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("green", 3,40);
naver_id_login.setDomain("http://localhost:6080/a01_member/1002_signin.jsp");
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();



$("#footers").load("/a02_search/footer.html");


</script>
</html>