SELECT * FROM ticketOption WHERE flightnumber LIKE '%'||''||'%' AND optioncode LIKE '%'||''||'%' AND stock >= 10	;
SELECT * FROM flight;
--INSERT INTO flight values('SFOICN23012011','KE','SFO',TO_DATE('2023-01-20 11:00','YYYY-MM-DD HH24:MI'),'ICN',10,101000);
--INSERT INTO TICKETOPTION VALUES('SFOICN23012011ec1','SFOICN23012011',0,0,100);
--INSERT INTO TICKETOPTION VALUES('SFOICN23012011ec2','SFOICN23012011',0,80000,20);

SELECT f.*,t.* ,(standardfee+classfee+baggage) FROM TICKETOPTION t , FLIGHT f WHERE t.FLIGHTNUMBER =f.FLIGHTNUMBER 
AND departairport LIKE '%'||UPPER('icn')||'%'
AND arriveairport LIKE '%'||UPPER('')||'%'
AND optioncode LIKE '______________%'
AND departdate >= TO_DATE('2022-12-21 10:00','YYYY-MM-DD HH24:MI') 
AND departdate <= TO_DATE('2022-12-21 23:00','YYYY-MM-DD HH24:MI') 
;

UPDATE TICKETOPTION SET stock = (stock + 10) WHERE OPTIONCODE LIKE '%'||'LAXSFO22122123bs0'||'%';

SELECT * FROM fare;
INSERT INTO FARE VALUES ('2212221721061001','ICNLAX22122115bs0','abcdee@eemail.com',sysdate,1,'',1,978000);
--DELETE FROM ticketoption WHERE optioncode='ICNLAX22122115bs0';
SELECT * FROM PASSENGER p ;

SELECT * FROM TICKETOPTION t ;
--INSERT INTO TICKETOPTION values('ICNLAX22122214ec0','ICNLAX22122214',0,0,40);
--INSERT INTO TICKETOPTION values('LAXICN22123020ec0','LAXICN22123020',0,0,10);
--INSERT INTO TICKETOPTION values('ICNLAX22122115bs0','ICNLAX22122115',200000,0,10);
--INSERT INTO TICKETOPTION values('ICNLAX22122115bs1','ICNLAX22122115',200000,20000,10);
--INSERT INTO TICKETOPTION values('ICNLAX22122115bs2','ICNLAX22122115',200000,50000,5);
--INSERT INTO TICKETOPTION values('LAXSFO22122123bs1','LAXSFO22122123',200000,10000,20);

