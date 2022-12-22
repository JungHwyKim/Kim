<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드정보 저장</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<style>
img.user{
	width:70%;
}
.astyle{
	color:black;
	text-decoration-line: none;
}
.btnOut{
	margin-top:30px;
	width:70%;
	height:70px;
	background:steelblue;
	color:white;
	border:none;
	border-radius: 12px;
}
.btnSave{
	margin-top:100px;
	margin-left:200px;
	width:50%;
	height:70px;
	background:steelblue;
	color:white;
	border:none;
	border-radius: 12px;
}
.field{
    font-size: 16px;
    line-height: 28px;
    padding: 8px 16px;
    width: 100%;
    min-height: 44px;
    border: unset;
    border-radius: 4px;
    outline-color: rgb(84 105 212 / 0.5);
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.16) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px;
}
</style>
<body>
<%@ include file="/header_logout.html" %>
<br><br>
	<div class="container-fluid">
	  <div class="row no-gutters">
	  	<div class="col-1"></div>
	    <div class="col-3" style="text-align:center;font-size:25px;">
	     <div class="p-3 border-0 bg-white">
	     	<img src="/b01_img/user.PNG" class="user"><br>
	     	<h1><b>안녕하세요!</b></h1>
	     	<p>XXXX@email.com<p>
	     </div>
	     <div class="border-0 bg-white" style="margin-top:30px;"><a href="3002_input_Info.jsp" class="astyle">여행객 정보 입력</a></div><hr>
	     <div class="border-0 bg-white"><a href="3009_cardInfo_input.jsp" class="astyle">결제 정보 입력</a></div><hr>
	     <div class="border-0 bg-white"><a href="3004_show_Info.jsp" class="astyle">내 예약</a></div><hr>
	     <div class="border-0 bg-white"><a href="#" class="astyle">가격 변동 알림</a></div><hr>
	     <div class="border-0 bg-white">계정</div><hr>
	     <input class="btnOut" type="button" value="로그아웃" onclick="logout()"/>
	    </div>
	    <div class="col-2"></div>
	    <div class="col-5 mt-5" style="font-size:25px;">
	    	<div class="p-3 border-0 bg-white mb-5" style="text-align:center;"><h1><b>결제 정보 입력</b></h1></div>
	    	<table class="table table-bordered mt-5">
				<tr><td>카드구분</td>
				<td>
				<label><input type="radio" name="ownertype" value="개인" checked>개인</label>&nbsp;&nbsp;&nbsp;
				<label><input type="radio" name="ownertype" value="법인">법인</label>
				</td>
				<td>국적</td>
				<td>
				<label><input type="radio" name="nationality" value="내국인" checked>내국인</label>&nbsp;&nbsp;&nbsp;
				<label><input type="radio" name="nationality" value="외국인">외국인</label>
				</td>
				</tr>
				<tr><td>카드종류</td><td><select name="cardType" class="form-select"><option>삼성카드</option><option>신한카드</option><option>롯데카드</option></select></td>
				<td>할부기간</td><td><select name="pricedis" class="form-select"><option>일시불</option><option>2개월</option><option>3개월</option></select></td></tr>
				<tr><td>카드번호</td><td><input class="field" name="cardnum"></td><td>유효기간</td>
						<td><div class="input-group"><input class="field" name="year" type="number" min="22" placeholder="년"><input class="field" name="month" type="number" max="12" min="1" placeholder="월"></div></td></tr>
				<tr><td>소유주이름</td><td><input class="field" name="ownerName"></td><td>생년월일</td><td><input class="field" name="birth" type="date"></td></tr>
				<tr><td>카드비밀번호</td><td><input class="field" name="pass" type="password" placeholder="앞 두자리만 입력하세요" maxlength="2"></td>
				<td>성별</td><td>
					<label><input type="radio" name="mf" value="male" checked>남성</label>&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="mf" value="female">여성</label></td></tr>
			</table>
			<input id="save" type="button" value="저장하기" class="btnSave"/>
	    </div>
	    <div class="col-1"></div>
	  </div>
	</div>
	<br><br>
<%@ include file="/0000_footer.html" %>
</body>
<script type="text/javascript">
// 로그아웃
function logout(){
	confirm("로그아웃 하시겠습니까?")
}

// DOM 객체 생성
var ownertype = document.querySelector("[name=ownertype]")
var nationality = document.querySelector("[name=nationality]")
var cardType = document.querySelector("[name=cardType]")
var pricedis = document.querySelector("[name=pricedis]")
var cardnum = document.querySelector("[name=cardnum]")
var year = document.querySelector("[name=year]")
var month = document.querySelector("[name=month]")
var ownerName = document.querySelector("[name=ownerName]")
var birth = document.querySelector("[name=birth]")
var pass = document.querySelector("[name=pass]")
var mf = document.querySelector("[name=mf]")
var saveOb = document.querySelector("#save")


// 버튼 활성화
saveOb.disabled = true;
ownertype.addEventListener("change", stateHandle);
nationality.addEventListener("change", stateHandle);
cardType.addEventListener("change", stateHandle);
pricedis.addEventListener("change", stateHandle);
cardnum.addEventListener("change", stateHandle);
year.addEventListener("change", stateHandle);
month.addEventListener("change", stateHandle);
ownerName.addEventListener("change", stateHandle);
birth.addEventListener("change", stateHandle);
pass.addEventListener("change", stateHandle);
mf.addEventListener("change", stateHandle);


function stateHandle() {
  if(ownertype.value== "" || nationality.value== "" || cardType.value== "" || pricedis.value==""
	  && cardnum.value== "" || year.value== "" || month.value== "" || ownerName.value== ""
		&& birth.value== "" || pass.value== "" || mf.value== "") {
	 saveOb.disabled = true; 
  }else {
	 saveOb.disabled = false;
  }
}

</script>
</html>