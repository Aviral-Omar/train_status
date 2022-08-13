USE train_status;

select * from train;
select * from station;
select * from train_schedule;
select * from train_days;
select * from admin;
SELECT getArrivalTime(12967, 'WL'); -- showing the values of arrival time
SELECT getDepartureTime(12925, 'JUC'); -- showing the values of the departure time
SELECT getTimeDelay("23:55:00", "23:10:00"); -- describe the function first.
CALL trainsBetweenStations("NDLS", "BSB");-- output is there 
CALL trainsBetweenStations("NDLS","JP"); -- no output is there
select checkTrainExists(22334); -- 0 means no train exists

start transaction;
call adminupdate(12967,'WL','2022-04-10 2:58:00');
call adminupdate(12967,'NGP','2022-04-10 11:25:00');
call adminupdate(12967,'BPL','2022-04-10 18:00:00');
call adminupdate(12967,'UJN','2022-04-10 21:30:00');
call adminupdate(12967,'KOTA','2022-04-11 02:50:00');
call adminupdate(12967,'DPA','2022-04-11 06:04:00');
commit;

start transaction;
select gettrainstatus(12967);
commit;
-- now show difference between trainsBetweenStations and trainsBetweenStattionsDate one

start transaction;
CALL trainsBetweenStationsOnDate("NGP", "KOTA", "2022-04-13");

CALL trainsBetweenStationsOnDate("CNB", "PRYJ", "2022-04-11");
call trainsBetweenStations('CNB',"PRYJ");
commit;