<%@page import="DataBaseCon.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%

    String sharedkey = null;
    Random RANDOM = new SecureRandom();
    int mac1_LENGTH = 7;
    String letters = "0123456789";
    String uid = "";
    for (int i = 0; i < mac1_LENGTH; i++) {
        int index = (int) (RANDOM.nextDouble() * letters.length());
        uid += letters.substring(index, index + 1);
    }
    sharedkey = uid;
  int sid = Integer.parseInt(request.getParameter("sid"));
  
String sqlQuery = "update oreg set skey=? where sid=?";
Connection con=null;
PreparedStatement ps=null;
try{
con=DbConnection.getConnection();
ps=con.prepareStatement(sqlQuery);
ps.setString(1, sharedkey);
ps.setInt(2, sid);
int k=0;
k=ps.executeUpdate();
if(k>0){
response.sendRedirect("ofareq.jsp");
}
else{
response.sendRedirect("ofareq.jsp?msg=not updated");
}


}catch(Exception e){
    e.printStackTrace();



}


%>