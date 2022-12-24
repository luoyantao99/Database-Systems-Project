# Database-Systems-Project

Our product is a database query web platform based on the thinkcmf open source framework structure, developed using php 8.1.2, with user access authentication and other basic functions. 

## How to deploy

Step 1 – Installing Nginx

Nginx is one of the most popular web servers in the world and is responsible for hosting some of the largest and busiest sites on the internet. It can be used as a reverse proxy or web server and often uses fewer resources than Apache. 

```console
$ sudo apt update
$ sudo apt install nginx
```

Step 2 — Installing MySQL

MySQL is an open-source database management system, commonly installed as part of the popular LAMP (Linux, Apache, MySQL, PHP/Python/Perl) stack. It implements the relational model and uses SQL to manage its data.

```console
$ sudo apt update
$ sudo apt install mysql-server
$ sudo systemctl start mysql.service
```



The machine learning part: our model takes preprocessing
steps and choose 80% as the train set from the women's e-commerce
dataset. We used nltk package to conduct basic NLP processes and 
then compared clustering methods of the result. Our model is able to
predict whether comments  are a sign of postive feedback or negative
feedback. 

For furthur utilization of machine learning, please modify the notebook file
under machine learning folder.