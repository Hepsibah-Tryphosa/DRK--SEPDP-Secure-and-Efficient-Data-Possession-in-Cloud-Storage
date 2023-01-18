<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.lang.String"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="com.util.login.*" %>
<html lang="en">
<head>
      <!DOCTYPE html>



    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Sepdp</title>

   <link rel="icon" href="core-img/cloud-icon-27.png">

    <!-- Core Stylesheet -->
    <link href="style.css" rel="stylesheet">

  
      
<link href="signin.css" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->
  </head>
<body id="LoginForm">
    <header class="header_area" style="background-image: url(bg-img/background-board-brown-326311.jpg);">

        <div class="container">
            
            <div class="row">
                <!-- Logo Area Start -->
                <div class="col-12">
                    <div class="logo_area text-center" >
                        <a href="index.html" class="yummy-logo">Secure And Efficient Privacy Preserving Provable Data Possession In Cloud Storage</a>
                    </div>
                </div>
            </div>
<div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#yummyfood-nav" aria-controls="yummyfood-nav" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i> Menu</button>
                        <!-- Menu Area Start -->
                        <div class="collapse navbar-collapse justify-content-center" id="yummyfood-nav">
                            <ul class="navbar-nav" id="yummy-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="owner.jsp">Home<span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="Fileupload.jsp">File Upload <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="dataview.jsp">Audit Request<span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="ownerAceept.jsp">User Request<span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="signin.jsp">logout<span class="sr-only">(current)</span></a>
                                </li>
                                
                                
                           </div>
                    </nav>
                </div>
            </div>
        
    </header>
    <!-- ****** Header Area End ****** -->
    
    <div class="breadcumb-area" style="background-image: url(bg-img/background-board-brown-326311.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                         <%                                                                            
                                      String skey = null;
                                      Random RANDOM = new SecureRandom();
                                      int mac1_LENGTH = 7;
                                      String letters = "0123456789";
                                      String uid = "";
                                      for (int i = 0; i < mac1_LENGTH; i++) {
                                      int index = (int) (RANDOM.nextDouble() * letters.length());
                                      uid += letters.substring(index, index + 1);
                                        }
                                        skey=uid;

    
                                                                                  
			
                            String publickey=session.getAttribute("publickey").toString();
                            String username = session.getAttribute("ownername").toString();%>
                        <h2> Welcome <%=username%></h2>
                    </div>
                </div>
            </div>
        </div>
</div>
                    <br>
                    <div>
                  
<div class="container">

<div id ="login-form">
<div class="main-div">
    
    <form id="Login" action="Fileupload" method="post" enctype="multipart/form-data">

        <div class="form-g">

            <i class="fa fa-user" aria-hidden="true"></i> Name:<br>
            <input type="text" class="form-control" id="name" name="ownername"  value="<%=username%>" readonly>

        </div>
            <br>
                   <div class="form-g">

            <i class="fa fa-user" aria-hidden="true"></i> about file:<br>
            <input type="text" class="form-control" id="name" name="abfile">

        </div>

                 <br>  
            
            <div class="form-g">

            <i class="fa fa-key" aria-hidden="true"></i> public key<br>
            <input type="text" class="form-control" id="name" name="pbkey"  value="<%=publickey%>" readonly>

        </div>

<br>
        <div class="form-g">
            <i class="fa fa-key" aria-hidden="true"></i> secret key<br>
            <input type="text" class="form-control" id="name" name="sckey" value="<%=skey%>" readonly>

        </div>
            <br>
            <div class="form-g">
                <i class="fa fa-file-text" aria-hidden="true"></i> file<br>
            <input type="file" class="form-control" id="file" name="file">

        </div>
            <br>
    
        <button type="submit" class="btn btn-primary">upload</button>

    </form>
    </div>
<p class="botto-text" align="center"> Designed by SEPDP Developer</p>
</div></div>
                        </div>
</body>
    
    
    
    
</html>