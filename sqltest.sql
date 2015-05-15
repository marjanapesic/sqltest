#1.task

SELECT count(*) as cnt 
FROM login_history 
WHERE YEAR(login_time) = 2012 
    AND MONTH(login_time) = 9 
    AND dayofweek(login_time) = 4 
    AND login_action='logout' 
group by user_id order by cnt desc limit 1;

#2.task
#a month and year as paramethers
DELIMITER $$
CREATE PROCEDURE LogoutUserByMonth(IN m int, IN y int)
 BEGIN
 SELECT count(*) as cnt, user_id
 FROM login_history
 WHERE MONTH(login_time) = m and YEAR(login_time) =y and login_action = 'logout'
 group by user_id order by cnt desc limit 1;
 END$$
 DELIMITER ;
 
call LogoutUserByMonth(5,2015); #call of procedure
#b all months
SELECT MONTH(login_time),YEAR(login_time), count(*) as cnt, user_id
FROM login_history
WHERE login_action = 'logout'
group by MONTH(login_time), YEAR(login_time), user_id 
order by cnt desc 
limit 1;

#3.task
SELECT count(*) as counted, user_id 
FROM login_history 
group by user_id;