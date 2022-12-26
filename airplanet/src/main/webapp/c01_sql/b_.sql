SELECT * FROM airport;
SELECT * FROM airline;
INSERT INTO airline VALUES ('RS','에어서울','/b01_img/logo_airseoul.jpg');
SELECT * FROM flight;
INSERT INTO flight values('ICNLAX22122214','RS','ICN',to_date('2022-12-22 14:00','YYYY-MM-DD HH24:mi'),'LAX',9,700000);
INSERT INTO flight values('ICNLAX22122120','RS','ICN',to_date('2022-12-21 20:00','YYYY-MM-DD HH24:mi'),'LAX',9.5,720000);
INSERT INTO flight values('ICNLAX22122221','KE','ICN',to_date('2022-12-22 21:00','YYYY-MM-DD HH24:mi'),'LAX',10,820000);
INSERT INTO flight values('ICNLAX22122123','KE','ICN',to_date('2022-12-21 23:30','YYYY-MM-DD HH24:mi'),'LAX',9.5,850000);
SELECT * FROM ticketOption;
INSERT INTO ticketOption VALUES('ICNLAX22122214ec1','ICNLAX22122214',0,50000,100);
INSERT INTO ticketOption VALUES('ICNLAX22122120ec0','ICNLAX22122120',0,0,100);
INSERT INTO ticketOption VALUES('ICNLAX22122221ec0','ICNLAX22122221',0,0,180);
INSERT INTO ticketOption VALUES('ICNLAX22122123ec1','ICNLAX22122123',0,0,180);



-- everywhere로 검색
SELECT DISTINCT a2.apnation, f.STANDARDFEE 
FROM(SELECT a.apnation, min(ff.standardfee) AS minfee FROM airport a, FLIGHT ff 
WHERE ff.ARRIVEAIRPORT =a.AIRPORTCODE 
AND TO_CHAR(ff.departdate,'yyyy-mm-dd')= '2022-12-21'
GROUP BY a.APNATION) cm, airport a2, flight f , airport a1, ticketOption t
WHERE cm.minfee = f.STANDARDFEE 
AND f.ARRIVEAIRPORT = a2.airportcode
AND f.DEPARTAIRPORT =a1.airportcode
AND f.flightnumber = t.flightnumber
AND (a1.apcity='인천' OR a1.apnation='인천') 
AND t.stock>=1
;

-- 나라명으로 검색
SELECT DISTINCT  a2.apcity, f.standardfee, a2.apphoto
FROM ( SELECT a.apcity, min(ff.standardfee) AS minfee FROM airport a, FLIGHT ff 
WHERE ff.ARRIVEAIRPORT =a.AIRPORTCODE 
AND TO_CHAR(ff.departdate,'yyyy-mm-dd')= '2022-12-21'
GROUP BY  a.apcity) cm, FLIGHT F, airport a2, airport a1, ticketOption t
WHERE f.standardfee = cm.minfee
AND a2.apcity = cm.apcity
AND f.arriveairport = a2.airportcode
AND f.DEPARTAIRPORT =a1.airportcode
AND f.flightnumber = t.flightnumber
AND (a1.apcity='인천' OR a1.apnation='인천') 
AND t.stock>=1
AND a2.apnation='미국'
;

-- 도시명 / 공항으로 검색
SELECT DISTINCT  f.departdate, f.DEPARTAIRPORT , f.ARRIVEAIRPORT , f.FLIGHTHOURS, 
a1.PACIFICTIME , a2.PACIFICTIME, ar.AIRLINELOGO, f.STANDARDFEE , t.CLASS  
FROM FLIGHT f, airport a2, airport a1, ticketOption t, AIRLINE ar 
WHERE a1.AIRPORTCODE =f.DEPARTAIRPORT 
AND a2.AIRPORTCODE =f.ARRIVEAIRPORT 
AND t.FLIGHTNUMBER =f.FLIGHTNUMBER 
AND ar.AIRLINECODE =f.AIRLINECODE 
AND t.stock>=1
AND TO_CHAR(f.departdate,'yyyy-mm-dd')= '2022-12-21'
AND (a1.apcity='인천' OR a1.apnation='인천') 
AND (a2.APCITY='후쿠오카' OR a2.AIRPORTCODE='일본')
AND substr(t.optioncode,15,2)='ec'
;



-- 국가이름으로 검색했을 때 결과 (중휘씨한테 국가검색/나라검색했을 때 구분하는거 어떻게 하는지 물어보기) // 직항
-- 코드에서 앞뒤 국가명만 바꿔서 넣으면 왕복에서 돌아오는 티켓 알 수 있음 // 직항
SELECT ap1.apnation, ap1.apcity,ap1.PACIFICTIME , f.flightnumber, f.departdate,f.flighthours,f.standardfee, t.CLASS, 
t.optioncode,ap2.apnation, ap2.apcity, ap2.PACIFICTIME , ap2.apphoto, ar.airlinelogo 
FROM airport ap2, flight f, airport ap1, ticketOption t, airline ar 
WHERE f.arriveairport=ap2.airportcode
AND f.departairport = ap1.airportcode
AND f.flightnumber = t.flightnumber
AND ar.airlinecode = f.airlinecode
AND ap1.apnation='대한민국' --출발국가
AND ap2.apnation='미국' -- 도착국가
AND TO_CHAR(f.departdate,'yyyy-mm-dd')= '2022-12-21' -- 출발일자
AND substr(t.optioncode,15,2)='bs' -- 클래스
AND ap1.apcity='인천' --출발도시
AND ap2.apcity='LA'-- 도착도시
AND t.stock>=1 -- 좌석이 있으면
;

/*
 String query = "";
 if( ~==null)
 	query += "";

SELECT ap1.apnation, ap1.apcity, f.flightnumber, f.departdate,f.flighthours,f.standardfee, 
t.optioncode,ap2.apnation, ap2.apcity, ap2.apphoto, ar.airlinelogo
FROM airport ap2, flight f, airport ap1, ticketOption t, airline ar 
WHERE f.arriveairport=ap2.airportcode
AND f.departairport = ap1.airportcode
AND f.flightnumber = t.flightnumber
AND ar.airlinecode = f.airlinecode
AND ap1.apnation = ?
AND ap2.apnation = ?
AND TO_CHAR(f.departdate,'yyyy-mm-dd')= '2022-12-21' 
AND substr(t.optioncode,15,2)= ?
AND ap1.apcity=?
AND ap2.apcity=?
AND t.stock>=1 
 * 
 * 
 *  */


--편도 나라명+도시명, 티켓정보
SELECT f.flightnumber, f.departdate, f.flighthours, f.airlinecode, ap.apphoto, ar.airlineLogo, f.standardfee 
FROM airport ap, flight f, airline ar 
WHERE f.departairport = ap.airportcode 
AND ar.airlineCode = f.airlinecode
AND f.departairport='ICN'  -- 출발지 검색
AND f.arriveairport='LAX'  -- 도착지 검색
AND TO_CHAR(f.departdate,'yyyy-mm-dd') = '2022-12-21' -- 가는날
;

--편도
SELECT f.flightnumber, f.departdate, f.flighthours, f.airlinecode, ap.apphoto, ar.airlineLogo, f.standardfee 
FROM airport ap, flight f, airline ar 
WHERE f.departairport = ap.airportcode 
AND ar.airlineCode = f.airlinecode
AND f.departairport='ICN'  -- 출발지 검색
AND f.arriveairport='LAX'  -- 도착지 검색
AND TO_CHAR(f.departdate,'yyyy-mm-dd') = '2022-12-22' -- 가는날
;
--왕복이면 뒤집어서
SELECT f.flightnumber, f.departdate, f.flighthours, f.airlinecode, ap.apphoto, ar.airlineLogo, f.standardfee 
FROM airport ap, flight f, airline ar 
WHERE f.departairport = ap.airportcode 
AND ar.airlineCode = f.airlinecode
AND f.departairport='LAX'  -- 출발지 검색
AND f.arriveairport='ICN'  -- 도착지 검색
AND TO_CHAR(f.departdate,'yyyy-mm-dd') = '2022-12-30' -- 가는날
;

SELECT ap.apcity FROM airport ap, flight f 
WHERE f.arriveairport = ap.airportcode
AND apcity='LA';

/*
-- 나라별 항공편
SELECT f.flightnumber, flighthours, departdate, standardfee FROM flight f, ticketoption t, airport ap
WHERE f.flightnumber=t.flightnumber AND ap.airportCode =
AND t.stock>=1 -- 좌석이 1이상 남았을 때
AND ; 
*/


