
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DataBaseCon.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
      
  
      

<!------ Include the above in your HEAD tag ---------->
  </head>
<body>
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
                                    <a class="nav-link" href="dataownerreq.jsp">File key Generator</a>
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
    <!-- ****** Header Area End ****** -->
    
    <div class="breadcumb-area" style="background-image: url(bg-img/background-board-brown-326311.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>User Details </h2>
                    </div>
                </div>
            </div>
        </div>
</div>
       <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1">User ID</th>
								<th class="column2">User name</th>
								<th class="column3">User Email</th>
								
								<th class="column5">User Address</th>
								
							</tr>
						</thead>
                                                 <%
			
			
			
			String uid=null,uname=null,uemail=null,uaddress=null;
ResultSet rs=null;


try
{
	Connection con = DbConnection.getConnection();
        String qry="select uid, uname, uemail, uaddress from userdetails";
	PreparedStatement ps=con.prepareStatement(qry);

        rs =ps.executeQuery(qry);
	while(rs.next())
	{
	uid=rs.getString("uid");
	uname=rs.getString("uname");
	uemail=rs.getString("uemail");
	uaddress=rs.getString("uaddress");
        
	
	
%>
						<tbody>
								<tr>
									<td class="column1"><%=uid%></td>
									<td class="column2"><%=uname%></td>
									<td class="column3"><%=uemail%></td>
                                                                        <td class="column3"><%=uaddress%></td>
									
                                                                        
									
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
    
    
    
