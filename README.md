# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#Docker Image

docker build --network host -t ImageName:Tag AppDir

docker build --network host -t buscombinedpmis:0.1 /mnt/d/WorkSpace/RubyProjects/BusCombinedPmis/


#Findout a Container IP

docker container inspect ContainerName | grep 'IPAddress'

docker container inspect mysqldb | grep 'IPAddress'


#Run Container

docker run -p 3000:3000 ImageName:Tag

docker run -p 3000:3000 buscombinedpmis:0.1

docker run --name buscombinedpmis --network my_dev_network -p 3000:3000 buscombinedpmis:0.4

docker run --rm --name buscombinedpmis -p 3000:3000 -e MYSQL_HOST=Container(Name or IP) -e MYSQL_USER=username -e MYSQL_PASSWORD=password -e MYSQL_DB=database --network my_dev_network -d buscombinedpmis:0.6

