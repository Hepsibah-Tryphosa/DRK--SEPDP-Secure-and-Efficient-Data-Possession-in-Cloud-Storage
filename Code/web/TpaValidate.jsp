
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String tname=request.getParameter("tname");
String tpassword=request.getParameter("tpassword");

if(tname.equals("Tpa")&&tpassword.equals("Tpa")){
response.sendRedirect("tpa.jsp");
}else{
response.sendRedirect("TpaLogin.jsp");
}


%>