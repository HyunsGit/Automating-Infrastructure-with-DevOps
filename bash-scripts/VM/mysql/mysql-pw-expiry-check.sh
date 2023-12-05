#!/bin/bash

log_name="{project명}-mysql-deadline-passwd"

EXPIRY_DATE="SELECT user, host,
              CONCAT(
                     CAST(IFNULL(password_lifetime, @@global.default_password_lifetime) AS signed)
                         + CAST(DATEDIFF(password_last_changed, now()) as signed), ' days'
                    ) AS expires_in,
              (password_last_changed
                    + INTERVAL CAST(IFNULL(password_lifetime, @@global.default_password_lifetime) AS signed) DAY
              ) AS expires_datetime
         FROM mysql.user"     

function hr(){
  printf '=%.0s' {1..110}
  printf "\n"
}


SQL_ALL=$EXPIRY_DATE

SQL_DEADLINE="$EXPIRY_DATE
         WHERE CAST(IFNULL(password_lifetime, @@global.default_password_lifetime) AS signed)
                         + CAST(DATEDIFF(password_last_changed, now()) as signed) <= 14 
		     AND CAST(IFNULL(password_lifetime, @@global.default_password_lifetime) AS signed)
                         + CAST(DATEDIFF(password_last_changed, now()) as signed) >= 0;"


hr
echo $SQL_ALL | /usr/bin/mysql --defaults-file=/home/{centos / ubuntu}/{프로젝트명.cnf} -t > /mgt/log/$log_name
echo "$log_name CREATED"

hr
echo $SQL_DEADLINE | /usr/bin/mysql --defaults-file=/home/{centos / ubuntu}/{프로젝트명.cnf} -t > /mgt/log/$log_name
echo "$log_name CREATED"
