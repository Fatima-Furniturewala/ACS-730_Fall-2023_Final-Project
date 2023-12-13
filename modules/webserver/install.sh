#!/bin/bash
sudo yum -y update
sudo yum -y install httpd


myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="shortcut icon" href="#">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Welcome to Cats and Dogs</title>
</head>
<style media="screen">
  body {
          background-color: #4c724c;
          font-size: 50pt;
          color: white;
    }
    h1 {
    font-size: 16px;
    }
    li {
    font-size: 16px;
    }
</style>
<body>
<h1>Final Group 5 Project</h1><p>My private IP is <font color="blue">$myip</font></p><ul><li>Fatima Abubakar Furniturewala</li><li>Latheef Saafia Fathima</li><li>Mu-Ting Chung</li><li>Xiao Ming Tang</li><li>Xinyue Li</li></ul>
    <div class="container-fluid">
      <div id="one" class="text-center">
        <span>"Whats my url?"</span>
      </div>
      <div class="row">
        <div class="col-md-6 text-center">
          <a href="https://mchung46-test-web.s3.amazonaws.com/cats/index.html"><img src="https://ecs-demogo-pictures.s3.ap-northeast-2.amazonaws.com/web/web/img/ilovecats.jpg" width="400" height="400" alt="..." class="img-rounded"></a>
        </div>
        <div class="col-md-6 text-center">
          <a href="https://mchung46-test-web.s3.amazonaws.com/dogs/index.html"><img src="https://ecs-demogo-pictures.s3.ap-northeast-2.amazonaws.com/web/web/img/ilovedogs.jpg" width="400" height="400" alt="..." class="img-rounded"></a>
        </div>
      </div>
    </div>
<script>
    $('#one span').text(window.location.href);
</script>
</body>
</html>"  >  /var/www/html/index.html


# Start and enable Apache
sudo systemctl start httpd
sudo systemctl enable httpd


sudo systemctl start httpd
sudo systemctl enable httpd