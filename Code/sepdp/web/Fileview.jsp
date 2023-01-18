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
                                    <a class="nav-link" href="Fileview.jsp">View File<span class="sr-only">(current)</span></a>
                                </li>
                              
                                <li class="nav-item active">
                                    <a class="nav-link" href="filedownload.jsp">File download<span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="user.jsp">logout<span class="sr-only">(current)</span></a>
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
								<th class="column3">About file</th>
								
								<th class="column5">Request</th>
								
							</tr>
						</thead>
                                                 <%
			
			String uemail=session.getAttribute("uemail").toString();
			
			String filename=null, ownername=null,fileid=null,aboutfile=null,hashkey="no",hkeystatus="yes";
ResultSet rs=null;
String tr="Unregistered";
try
{
	Connection con = DbConnection.getConnection();
        String qry="select * from filedetails where  hkeystatus='"+hkeystatus+"'";
	PreparedStatement ps=con.prepareStatement(qry);

        rs =ps.executeQuery(qry);
	while(rs.next())
	{
         ownername=rs.getString("ownername");
	fileid=rs.getString("fid");
	filename=rs.getString("fname");
	aboutfile=rs.getString("abfile");
	hashkey=rs.getString("hashkey");
	
	
%>
						<tbody>
								<tr>
									<td class="column1"><%=fileid%></td>
                                                                        <td class="column2"><%=ownername%></td>
									<td class="column2"><%=filename%></td>
									<td class="column3"><%=aboutfile%></td>
									
                                                                        <td class="column5"><a href="tpare.jsp?uemail=<%=uemail%>&&fid=<%=fileid%>">send</a></td>
									
								</tr>
							<%	  
}
	   }
	   catch(Exception e1)
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
