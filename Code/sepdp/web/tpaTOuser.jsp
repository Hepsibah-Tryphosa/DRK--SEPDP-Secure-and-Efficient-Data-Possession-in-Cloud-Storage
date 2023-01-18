<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.login"%>
<%@page import="DataBaseCon.DbConnection"%>
<%@page import="com.util.userlogin"%>
<%@page import="java.util.*"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="stylesheet" href="css/main.css">
    <!-- Title -->
    <title>SEPDP</title>

    <!-- Favicon -->
    <link rel="icon" href="core-img/cloud-icon-27.png">

    <!-- Core Stylesheet -->
    <link href="style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="css/responsive/responsive.css" rel="stylesheet">
    
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="tabler/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="tabler/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="tabler/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="tabler/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="tabler/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="tabler/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="tabler/css/util.css">
	<link rel="stylesheet" type="text/css" href="tabler/css/main.css">

        
    </head>
    <body>
        
    <!-- ****** Top Header Area End ****** -->

    <!-- ****** Header Area Start ****** -->
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
                                    <a class="nav-link" href="tpa.jsp">Home <span class="sr-only">(current)</span></a>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="dataownerreq.jsp">filekey Genrator</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="tpaTOuser.jsp">user request</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="userdetails.jsp">user Details</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="index.html">logout</a>
                                </li>
                           </div>
                    </nav>
                </div>
            </div>
            </div>
        
    </header>
    
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1">File ID</th>
                                                                <th class="column2">Owner name</th>
								<th class="column2">File name</th>
								<th class="column3">Username</th>
								
								<th class="column5">Request</th>
								
							</tr>
						</thead>
                                                 <%
			
		
			
			String filename=null, ownername=null,fid=null,uemail=null,tpaStatus="no",hashkey=null;
ResultSet rs=null;

try
{
	Connection con = DbConnection.getConnection();
        String qry="select * from userreq where tpaStatus='"+tpaStatus+"'";
	PreparedStatement ps=con.prepareStatement(qry);

        rs =ps.executeQuery(qry);
	while(rs.next())
	{
         ownername=rs.getString("ownername");
	fid=rs.getString("fid");
	filename=rs.getString("filename");
	uemail=rs.getString("uemail");
	hashkey=rs.getString("hashkey");
	
	
%>
						<tbody>
								<tr>
									<td class="column1"><%=fid%></td>
                                                                        <td class="column2"><%=ownername%></td>
									<td class="column2"><%=filename%></td>
									
									<td class="column2"><%=uemail%></td>
                                                                        <td class="column5"><a href="tpaupdate.jsp?uemail=<%=uemail%>&&fid=<%=fid%>">Send Request to owner</a></td>
									
								</tr>
							<%

	   }
} catch(Exception e1)
	   {
	     out.println(e1.getMessage());
	   }
 %>	
								
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
    </body>
</html>
