#!/bin/bash

echo "Installing mysql..."
debconf-set-selections <<< 'mysql-server mysql-server/root_password password rootpass'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rootpass'
apt-get update > /dev/null
apt-get install -y mysql-server-5.5 > /dev/null
echo "Done!"
echo "Updating mysql configs in /etc/mysql/my.cnf..."
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
echo "Updated mysql bind address in /etc/mysql/my.cnf to 0.0.0.0 to allow external connections."
sudo sed -i "s/.*max_connections.*/max_connections = 10/" /etc/mysql/my.cnf
echo "Updated max connections to reduce memory overhead"
sudo service mysql stop
sudo service mysql start
echo "Done!"
echo "Adding sample databases and creating users"
mysql -uroot -prootpass < /vagrant/mysqlsampledatabase.sql
mysql -uroot -prootpass -e "create schema looker_scratch;" 
mysql -uroot -prootpass -e "create user 'douglas_adams' identified by '42istheanswer';"
mysql -uroot -prootpass -e "grant all privileges on classicmodels.* to 'douglas_adams';"
mysql -uroot -prootpass -e "create user 'looker' identified by 'looker';"
mysql -uroot -prootpass -e "grant select on classicmodels.* to 'looker';"
mysql -uroot -prootpass -e "grant select, index, insert, update, delete, create, drop, alter, create temporary tables on looker_scratch.* to 'looker';"
mysql -uroot -prootpass -e "flush privileges"
echo "Done!"
echo "Provisioning complete!"