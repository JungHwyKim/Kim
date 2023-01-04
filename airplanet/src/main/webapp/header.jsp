<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   %>
   
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<link href="/bs-custom.css" rel="stylesheet">
<style>
header{
	margin-bottom: 50px;
}
.profilepic{
	display:inline-block;
	height:50px;
	margin-right: 20px;
	}
</style>




<header id="header" class="d-flex justify-content-between">
	
		<div style="margin:5px 0 0 0px;"><a href="/a02_search/2000_main.jsp"><img src="/b01_img/airplanet_logo.png" width="100%" height="70px"/></a></div>
		<div style="margin:20px 0 0 45%;">
			<input style="width:120px;height:50px;background:lightblue;border-radius:10px;border:none;font-size:medium;font-weight:700;color:white;margin-right:20px;" type="button" name="signup" value="회원가입" />
			<input style="width:120px;height:50px;background:lightblue;border-radius:10px;border:none;font-size:medium;font-weight:700;color:white;" type="button" name="signin" value="로그인" />
		<div class="dropdown profilepic">
		<img class="profilepic" src="/b01_img/user.PNG" class="btn dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	 <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="/a03_myPage/3001_myPage_Main.jsp">마이페이지</a>
    <a class="dropdown-item" onclick="signout()">로그아웃</a>
  </div>
		</div> <span id="prof_name">${naver_name}</span>
		</div>
</header>



<script>

var signup=document.querySelector('[name=signup]')
signup.onclick=function(){
	location.href="/a01_member/1001_signup.jsp";
}
var signinout=document.querySelector('[name=signin]')

// 추가
var n = document.querySelector("#prof_name")

var kakaoId = '${profile_name}'
var regId='${reg2.email}'
if(regId=='' && kakaoId==''){	//로그인 안했을때
	signup.style.display="";
	signinout.value="로그인"
	signinout.onclick=function(){location.href="/a01_member/1002_signin.jsp"}
}else if(regId != ''){
	signup.style.display="none";
	signinout.style.display="none"
	// 추가
	n.innerText='${reg2.name}'+kakaoId+'${naver_id}'
}else{
	signup.style.display="none";
	signinout.style.display="none"
	// 추가
	n.innerText='${reg2.name}'+kakaoId+'${naver_id}'
}
console.log('${reg2.name}')
console.log('${profile_name}')
//console.log('${state.nickname}')

function signout(){
	if('${reg2.name}' != ''){
		console.log("일반")
		location.href="/a01_member/1400_signout.jsp"			
	}else{
		console.log("카카오")
		location.href="/a01_member/1401_signout.jsp"
	}
}

var profilepic=document.querySelector('.profilepic')
var reg2email='${reg2.email}';
console.log(reg2email)
if(reg2email.length>2 || kakaoId != ''){
	profilepic.style.display='inline-block'
}else{
	profilepic.style.display='none'
}



</script>