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
<%Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rentialsystem","root","");
PreparedStatement ps=conn.prepareStatement("select * from house where oid=?");
ps.setInt(1,DataBase.oid);
ResultSet rs=ps.executeQuery();
int i=0,j=0;
String str;
out.println("<h1>My Rents</h1>");
out.println("<table align=center>");
while(rs.next()){
	if(i==0){
		out.println("<tr>");
	}
	if(i==4){
		out.println("</tr>");
		i=0;
	}
	FileOutputStream fos=new FileOutputStream("C://Users/USER/eclipse-workspace/Rentialweb/houses/"+i+".jpg");
	fos.write(rs.getBytes(3));
	str="C://Users/USER/eclipse-workspace/Rentialweb/houses/"+i+".jpg";
	out.println("<td>");
	out.println("<div>");
	out.println("<img src="+str+" width="+250+" height="+250+"/>");
	out.println("<br>"+rs.getString(7));
	out.println("<br>"+rs.getString(5)+"-"+rs.getInt(6));
	out.println("<br>"+rs.getString(8));
	out.println("</div>");
	out.println("</td>");
	i++;
	j++;
}
out.println("</table>");
if(j==0){
	out.println("no Rents Yet<br>");
}
out.println("<p>Give your house to needy for Rent <a href=registerhouse.html><button>Click Here</button></a><p>");
%>
</body>
</html>