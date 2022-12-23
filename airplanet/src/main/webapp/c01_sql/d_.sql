SELECT * FROM ticketOption WHERE flightnumber LIKE '%'||''||'%' AND optioncode LIKE '%'||''||'%' AND stock >= 10	;
SELECT * FROM flight;

SELECT f.*,t.* ,(standardfee+classfee+baggage) FROM TICKETOPTION t , FLIGHT f WHERE t.FLIGHTNUMBER =f.FLIGHTNUMBER 
AND departairport LIKE '%'||UPPER('')||'%'
AND arriveairport LIKE '%'||UPPER('')||'%'
AND optioncode LIKE '______________%'
AND departdate >= TO_DATE('2022-12-10 10:00','YYYY-MM-DD HH24:MI') ;

UPDATE TICKETOPTION SET stock = (stock + 10) WHERE OPTIONCODE LIKE '%'||'LAXSFO22122123bs0'||'%';

SELECT * FROM fare;
INSERT INTO FARE VALUES ('2212221721061001','ICNLAX22122115bs0','abcdee@eemail.com',sysdate,1,'',1,978000);
--DELETE FROM fare WHERE bookingreference='2212221721061001';
SELECT * FROM PASSENGER p ;