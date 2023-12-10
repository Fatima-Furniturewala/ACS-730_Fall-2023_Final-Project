#!/bin/bash
sudo yum -y update
sudo yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h1>Final Group 5 Project</h1><p>My private IP is <font color="blue">$myip</font></p><ul><li>Fatima Abubakar Furniturewala</li><li>Latheef Saafia Fathima</li><li>Mu-Ting Chung</li><li>Xiao Ming Tang</li><li>Xinyue Li</li></ul>"  >  /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd