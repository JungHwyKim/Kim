-- 항공사
ALTER TABLE airline
 DROP CONSTRAINT PK_airline; -- 항공사 기본키

-- 항공사
DROP TABLE airline;

-- 항공사
CREATE TABLE airline (
	airlineCode char(2) NOT NULL,
	airlineName varchar2(20) NULL,
	airlineLogo varchar2(1000) NULL
);

-- 항공사
ALTER TABLE airline
	ADD CONSTRAINT PK_airline -- 항공사 기본키
	PRIMARY KEY (
	airlineCode -- 항공사코드
	);
	
INSERT INTO airline values('KE','대한항공','/b01_img/ke.png');
SELECT airlinecode FROM airline;

-- 공항정보
ALTER TABLE airport
 DROP CONSTRAINT PK_airport; -- 공항정보 기본키

-- 공항정보
DROP TABLE airport;

-- 공항정보
CREATE TABLE airport (
	airportCode char(3) NOT NULL,
	apNation varchar2(20) NULL,
	apCity varchar2(20) NULL,
	PacificTime number NULL,
	apPhoto varchar2(1000) NULL
);

-- 공항정보
ALTER TABLE airport
	ADD CONSTRAINT PK_airport -- 공항정보 기본키
	PRIMARY KEY (
	airportCode -- 공항코드
	);
	
SELECT apphoto FROM airport;
INSERT INTO airport values('ICN', '대한민국', '인천', 17, '/b01_img/ICN.png');  
INSERT INTO airport values('LAX', '미국', 'LA', -8, '/b01_img/LA.png');
INSERT INTO airport values('SFO', '미국', '샌프란시스코', -8, '/b01_img/SFO.png');


-- 항공노선
ALTER TABLE flight
 DROP CONSTRAINT PK_flight; -- 항공노선 기본키

-- 항공노선
DROP TABLE flight;

-- 항공노선
CREATE TABLE flight (
	flightNumber varchar2(20) NOT NULL,
	airlineCode char(2) NULL,
	departAirport char(3) NULL,
	departDate DATE NULL,
	arriveAirport char(3) NULL,
	flightHours number NULL,
	standardFee number NULL
);

-- 항공노선
ALTER TABLE flight
	ADD CONSTRAINT PK_flight -- 항공노선 기본키
	PRIMARY KEY (
	flightNumber -- 항공편코드
	);

-- 항공노선
ALTER TABLE flight
	ADD CONSTRAINT FK_airport_TO_flight -- 공항정보 -> 항공노선
	FOREIGN KEY (
	departAirport -- 출발공항
	)
	REFERENCES airport ( -- 공항정보
	airportCode -- 공항코드
	);

-- 항공노선
ALTER TABLE flight
	ADD CONSTRAINT FK_airportt_TO_flight2 -- 공항정보 -> 항공노선2
	FOREIGN KEY (
	arriveAirport -- 도착공항
	)
	REFERENCES airport ( -- 공항정보
	airportCode -- 공항코드
	);

-- 항공노선
ALTER TABLE flight
	ADD CONSTRAINT FK_airline_TO_flight -- 항공사 -> 항공노선
	FOREIGN KEY (
	airlineCode -- 항공사코드
	)
	REFERENCES airline ( -- 항공사
	airlineCode -- 항공사코드
	);
	
SELECT * FROM flight;
INSERT INTO flight values('ICNLAX22122115', 'KE', 'ICN', TO_DATE('2022-12-21 15:00','YYYY-MM-DD HH24-mi'), 'LAX', '8', 800000);
INSERT INTO flight values('LAXSFO22122123', 'KE', 'LAX', TO_DATE('2022-12-21 23:00','YYYY-MM-DD HH24-mi'), 'SFO', 1.5, 800000);
INSERT INTO flight values('LAXICN22123020', 'KE', 'LAX', TO_DATE('2022-12-30 20:00','YYYY-MM-DD HH24-mi'), 'ICN', 10, 1000000);

-- 옵션별상품
ALTER TABLE ticketOption
	DROP FOREIGN KEY FK_flight_TO_ticketOption; -- 항공노선 -> 옵션별상품

-- 옵션별상품
ALTER TABLE ticketOption
 DROP CONSTRAINT PK_ticketOption; -- 옵션별상품 기본키

-- 옵션별상품
DROP TABLE ticketOption;

-- 옵션별상품
CREATE TABLE ticketOption (
	optionCode varchar2(20) NOT NULL,
	flightNumber varchar2(20) NULL,
	classFee number NULL,
	baggage number NULL,
	stock number NULL
);

-- 옵션별상품
ALTER TABLE ticketOption
	ADD CONSTRAINT PK_ticketOption -- 옵션별상품 기본키
	PRIMARY KEY (
	optionCode -- 운임코드
	);

-- 옵션별상품
ALTER TABLE ticketOption
	ADD CONSTRAINT FK_flight_TO_ticketOption -- 항공노선 -> 옵션별상품
	FOREIGN KEY (
	flightNumber -- 항공편코드
	)
	REFERENCES flight ( -- 항공노선
	flightNumber -- 항공편코드
	);
	
SELECT * FROM ticketOption;
INSERT INTO ticketOption VALUES('ICNLAX22122115bs0','ICNLAX22122115',230000,0,30);
INSERT INTO ticketOption VALUES('LAXSFO22122123bs0','LAXSFO22122123',10000,0,7);
INSERT INTO ticketOption VALUES('LAXICN22123020ec2','LAXICN22123020',0,50000,180);

-- 회원
ALTER TABLE airMember
 DROP CONSTRAINT PK_member; -- 회원 기본키

-- 회원
DROP TABLE airMember;

-- 회원
CREATE TABLE airMember(
	email varchar2(50) NOT NULL,
	pass varchar2(20) NULL,
	name varchar2(20) NULL,
	phonenumber varchar2(20) NULL,
	mileage number NULL,
	cardInfo varchar2(1000) NULL
);

-- 회원
ALTER TABLE airMember
	ADD CONSTRAINT PK_airMember -- 회원 기본키
	PRIMARY KEY (
	email -- 이메일
	);

SELECT * FROM airMember;
INSERT INTO airMember values('t711txt@naver.com','1234', '임창균', '01098765432', 24000, '개인 내국인 롯데카드 1111222233334444 25 12 임창균 2001-08-11 23 m');

-- Fare
ALTER TABLE fare
	DROP FOREIGN KEY FK_airMember_TO_fare; -- 회원 -> Fare

-- Fare
ALTER TABLE fare
	DROP FOREIGN KEY FK_ticketOption_TO_fare; -- 옵션별상품 -> Fare

-- Fare
ALTER TABLE fare
 DROP CONSTRAINT PK_fare; -- Fare 기본키

-- Fare
DROP TABLE fare;

-- Fare
CREATE TABLE fare (
	bookingReference varchar2(20) NOT NULL,
	optionCode varchar2(20) NULL,
	email varchar2(50) NULL,
	resDate DATE NULL,
	resState varchar2(20) NULL,
	cardinfo varchar2(1000) NULL,
	cnt number NULL,
	totalPrice number NULL
);
-- Fare
ALTER TABLE fare
	ADD CONSTRAINT FK_airMember_TO_fare -- 회원 -> Fare
	FOREIGN KEY (
	email -- 이메일
	)
	REFERENCES airMember ( -- 회원
	email -- 이메일
	);

-- Fare
ALTER TABLE fare
	ADD CONSTRAINT FK_ticketOption_TO_fare -- 옵션별상품 -> Fare
	FOREIGN KEY (
	optionCode -- 운임코드
	)
	REFERENCES ticketOption ( -- 옵션별상품
	optionCode -- 운임코드
	);

SELECT * FROM fare;
INSERT INTO fare values(to_char(sysdate,'yymmddhh24miss')||fare_seq.nextval,'ICNLAX22122115bs0','t711txt@naver.com',sysdate,'1','',2,2000000);

CREATE SEQUENCE fare_seq
	INCREMENT BY 1
	START WITH 1000
	MINVALUE 1000
	MAXVALUE 9999
	CYCLE;

SELECT to_char(sysdate,'yymmddhh24miss')||to_char(fare_seq.nextval)  FROM dual;

-- 탑승자정보
ALTER TABLE passenger
	DROP FOREIGN KEY FK_fare_TO_passenger; -- Fare -> 탑승자정보

-- 탑승자정보
DROP TABLE passenger;

-- 탑승자정보
CREATE TABLE passenger (
	bookingReference varchar2(20) NULL,
	korname varchar2(20) NULL,
	engsur varchar2(20) NULL,
	engname varchar2(20) NULL,
	birthday DATE NULL,
	mf varchar2(20) NULL,
	ppnumber varchar2(20) NULL,
	ppexpire DATE NULL,
	nation varchar2(20) NULL,
	ppnation varchar2(20) NULL
);



SELECT * FROM passenger;
INSERT INTO passenger values('2212211657371010','임창균','Lim','im',to_date('1998-07-03','yyyy-mm-dd'),'m','m1234567',to_date('2030-12-01','yyyy-mm-dd'),'한국','한국');
INSERT INTO passenger values('2212211657371010','임지우','Lim','jiou',to_date('2020-03-28','yyyy-mm-dd'),'f','m9876543',to_date('2033-11-30','yyyy-mm-dd'),'한국','한국');


-- 저장한탑승자정보
DROP TABLE  myPassengerInfo;

-- 저장한탑승자정보
CREATE TABLE myPassengerInfo (
	email varchar2(50) NULL,
	korname varchar2(20) NOT NULL,
	engsur varchar2(20) NULL,
	engname varchar2(20) NULL,
	birthday DATE NULL,
	mf varchar2(20) NULL,
	ppnumber varchar2(20) NULL,
	ppexpire date NULL,
	nation varchar2(20) NULL,
	ppnation varchar2(20) NULL
);


	
SELECT * FROM myPassengerInfo;
INSERT INTO myPassengerInfo values('t711txt@naver.com','임창균','Lim','im',to_date('1998-07-03','yyyy-mm-dd'),'m','m1234567',to_date('2030-12-01','yyyy-mm-dd'),'한국','한국');

