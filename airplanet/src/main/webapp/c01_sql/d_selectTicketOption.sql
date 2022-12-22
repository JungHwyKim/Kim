SELECT * FROM ticketOption WHERE flightnumber LIKE '%'||''||'%' AND optioncode LIKE '%'||''||'%' AND stock >= 10	;
SELECT * FROM flight;

SELECT f.*,t.* ,(standardfee+classfee+baggage) FROM TICKETOPTION t , FLIGHT f WHERE t.FLIGHTNUMBER =f.FLIGHTNUMBER 
AND departairport LIKE '%'||UPPER('lax')||'%'
AND arriveairport LIKE '%'||UPPER('i')||'%'
AND optioncode LIKE '______________%'
AND departdate >= TO_DATE('2022-12-10 10:00','YYYY-MM-DD HH24:MI') ;

