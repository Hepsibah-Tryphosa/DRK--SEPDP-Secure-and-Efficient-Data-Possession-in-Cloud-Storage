<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.login"%>
<%@page import="DataBaseCon.DbConnection"%>
<%@page import="java.util.*"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>SEPDP</title>

    <!-- Favicon -->
   <link rel="icon" href="core-img/cloud-icon-27.png">
<link rel="stylesheet" href="css/main.css">
    <!-- Core Stylesheet -->
    <link href="style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="css/responsive/responsive.css" rel="stylesheet">
    

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
<!--===============================================================================================-->
      
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
								<th class="column2">File name</th>
								<th class="column3">About file</th>
								
								<th class="column5">Request</th>
								
							</tr>
						</thead>
                                                 <%
			
			String publickey=session.getAttribute("publickey").toString();
			
			String filename=null,fileid=null,hkeystatus="no",aboutfile=null,secretkey=null,ownername=null;
ResultSet rs=null;
String tr="Unregistered";
System.out.println(publickey);
try
{
	Connection con = DbConnection.getConnection();
        String qry="select fid, fname, abfile, secretkey,ownername from filedetails where publickey='"+publickey+"' and hkeystatus='"+hkeystatus+"'";
	PreparedStatement ps=con.prepareStatement(qry);

        rs =ps.executeQuery(qry);
	while(rs.next())
	{
	fileid=rs.getString("fid");
	filename=rs.getString("fname");
	aboutfile=rs.getString("abfile");
	secretkey=rs.getString("secretkey");
        ownername=rs.getString("ownername");
	
	
%>
						<tbody>
								<tr>
									<td class="column1"><%=fileid%></td>
									<td class="column2"><%=filename%></td>
									<td class="column3"><%=ownername%></td>
									
                                                                        <td class="column5"><a href="Auditreq.jsp?ownername=<%=ownername%>&&fid=<%=fileid%>">Audit Request to generate Hashkey</a></td>
									
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