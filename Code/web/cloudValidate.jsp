
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String tname=request.getParameter("cname");
String tpassword=request.getParameter("cpassword");

if(tname.equals("cloud")&&tpassword.equals("cloud")){
response.sendRedirect("cloudHome.jsp");
}else{

}


%>