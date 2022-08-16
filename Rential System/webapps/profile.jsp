<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="p1.DataBase,java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
img{
border-radius:50%;
align:center;
}
body{
text-align:center;}
td{
text-align:left;}</style>
</head>
<body>
<%int uid=DataBase.oid;
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rentialsystem","root","");
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from users where uid="+uid);
FileOutputStream fos=new FileOutputStream("C://Users/USER/eclipse-workspace/Rentialweb/houses/profile.jpg");
rs.next();
String name=rs.getString(2)+" "+rs.getString(3);
String email=rs.getString(6);
long phone=rs.getLong(5);
String addr=rs.getString(7);
byte img[]=rs.getBytes(8);
fos.write(img);
%>
<img src="C://Users/USER/eclipse-workspace/Rentialweb/houses/profile.jpg" align="middle" width="200" height="200"/>
<table align="center">
<tr>
<td>Name</td>
<td>:</td>
<td><%out.println(name); %></td>
</tr>
<tr>
<td>email</td>
<td>:</td>
<td><%out.println(email); %></td>
</tr>
<tr>
<td>Phone</td>
<td>:</td>
<td><%out.println(phone); %></td>
</tr>
<tr>
<td>Address</td>
<td>:</td>
<td><%out.println(addr); %></td>
</tr></table>
</body>
</html>