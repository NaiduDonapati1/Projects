<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,p1.DataBase,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String preference=request.getParameter("preference");
int hid=DataBase.hid;
int cid=DataBase.oid;
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rentialsystem","root","");
Statement s=conn.createStatement();
ResultSet rs=s.executeQuery("select oid from house where hid="+hid);
rs.next();
int oid=rs.getInt(1);
PreparedStatement ps=conn.prepareStatement("insert into houserequests values(?,?,?,?,?,?)");
ps.setInt(1,oid);
ps.setInt(2,cid);
ps.setInt(3,hid);
ps.setLong(4,Long.parseLong(phone));
ps.setString(5,email);
ps.setString(6,preference);
int i=ps.executeUpdate();
if(i==1)
	out.println("registration successful");
else
	out.println("registration failed! try again after some time");
%>
</body>
</html>