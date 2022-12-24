# Database-Systems-Project

Our product is a database query web platform based on the ThinkCMF open source framework structure, developed using php 8.1.2, with user access authentication and other basic functions. Due to the use of ThinkCMF framework, the access to the MySQL database was implemented using Object-Relational Mapping (ORM). The queries and manipulations of data from a database were done using an object-oriented paradigm, without the need for SQL commands. 

## Demo
![alt text](https://github.com/luoyantao99/Database-Systems-Project/blob/main/README_images/animated.gif)

## Screenshots
![alt text](https://github.com/luoyantao99/Database-Systems-Project/blob/main/README_images/login.png)

![alt text](https://github.com/luoyantao99/Database-Systems-Project/blob/main/README_images/ORM.png)

## How to deploy

### Step 1 – Installing Nginx

Nginx is one of the most popular web servers in the world and is responsible for hosting some of the largest and busiest sites on the internet. It can be used as a reverse proxy or web server and often uses fewer resources than Apache. 

```
$ sudo apt update
$ sudo apt install nginx
```

### Step 2 — Installing MySQL

MySQL is an open-source database management system, commonly installed as part of the popular LAMP (Linux, Apache, MySQL, PHP/Python/Perl) stack. It implements the relational model and uses SQL to manage its data.

```
$ sudo apt update
$ sudo apt install mysql-server
$ sudo systemctl start mysql.service
```

### Step 3 — Installing PHP 8.1.2 with Nginx

Nginx doesn’t have built-in support for processing PHP files. PHP-FPM (“fastCGI process manager”) is used to handle the PHP files.

Run the following commands to install PHP and PHP FPM packages:

```
$ sudo apt update
$ sudo apt install php-fpm
```


## Machine Learning

Our model takes preprocessing
steps and choose 80% as the train set from the women's e-commerce
dataset. We used nltk package to conduct basic NLP processes and 
then compared clustering methods of the result. Our model is able to
predict whether comments  are a sign of postive feedback or negative
feedback. 

For furthur utilization of machine learning, please modify the notebook file
under machine learning folder.


## References

https://github.com/thinkcmf/thinkcmf <br />
https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04 <br />
https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04 <br />
https://linuxize.com/post/how-to-install-php-on-ubuntu-20-04/ <br />
