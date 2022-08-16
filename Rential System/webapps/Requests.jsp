<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,p1.DataBase,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
div{
text-align:center;
width:300px;
height:320px;
border:4px solid yellow;
}
body{
text-align:center;
}
</style>
</head>
<body>
<h1>Requests Received</h1>
<%Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rentialsystem","root","");
PreparedStatement ps=conn.prepareStatement("select * from houseRequests where owner_id=?");
ps.setInt(1,DataBase.oid);
ResultSet rs=ps.executeQuery();
PreparedStatement psr=conn.prepareStatement("select * from houserequests where cust_id=?");
psr.setInt(1,DataBase.oid);
ResultSet rs3=psr.executeQuery();
int i=0,j=0;
String str;
out.println("<table align=center>");
while(rs.next()){
	if(i==0){
		out.println("<tr>");
	}
	if(i==4){
		out.println("</tr>");
		i=0;
	}
	PreparedStatement ps1=conn.prepareStatement("select photo from house where hid=?");
	ps1.setInt(1,rs.getInt(3));
	ResultSet rs1=ps1.executeQuery();
	rs1.next();
	FileOutputStream fos=new FileOutputStream("C://Users/USER/eclipse-workspace/Rentialweb/houses/"+i+".jpg");
	fos.write(rs1.getBytes(1));
	str="C://Users/USER/eclipse-workspace/Rentialweb/houses/"+i+".jpg";
	out.println("<td>");
	out.println("<div>");
	out.println("<img src="+str+" width="+250+" height="+250+"/>");
	Statement stmt=conn.createStatement();
	ResultSet rs2=stmt.executeQuery("select * from users where uid="+rs.getInt(2));
	rs2.next();
	out.println("<br>"+rs2.getString(3)+" "+rs2.getString(2));
	out.println("<br>"+rs.getString(5));
	out.println("<br>"+rs.getLong(4));
	out.println("</div>");
	out.println("</td>");
	i++;
	j++;
}
out.println("</table>");
if(j==0){
	out.println("<h2>you don't have any requests</h2>");
}
out.println("<h1>Requests Sent</h1>");
j=0;
out.println("<table align=center>");
while(rs3.next()){
	if(i==0){
		out.println("<tr>");
	}
	if(i==4){
		out.println("</tr>");
		i=0;
	}
	PreparedStatement ps1=conn.prepareStatement("select photo from house where hid=?");
	ps1.setInt(1,rs3.getInt(3));
	ResultSet rs1=ps1.executeQuery();
	rs1.next();
	FileOutputStream fos=new FileOutputStream("C://Users/USER/eclipse-workspace/Rentialweb/houses/"+i+".jpg");
	fos.write(rs1.getBytes(1));
	str="C://Users/USER/eclipse-workspace/Rentialweb/houses/"+i+".jpg";
	out.println("<td>");
	out.println("<div>");
	out.println("<img src="+str+" width="+250+" height="+250+"/>");
	Statement stmt1=conn.createStatement();
	ResultSet rs2=stmt1.executeQuery("select * from users where uid="+rs3.getInt(1));
	rs2.next();
	out.println("<br>"+rs2.getString(3)+" "+rs2.getString(2));
	out.println("<br>"+rs3.getString(5));
	out.println("<br>"+rs3.getLong(4));
	out.println("</div>");
	out.println("</td>");
	i++;
	j++;
}
out.println("</table>");
if(j==0){
	out.println("<h2>you haven't made any requests</h2>");
}
%>

</body>
</html>