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
String street=request.getParameter("street");
String city=request.getParameter("city");
String pin=request.getParameter("pin");
String addr=request.getParameter("address");
String type=request.getParameter("type");
String rent=request.getParameter("rent");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String preference=request.getParameter("preference");
String img1=request.getParameter("img1");
String img2=request.getParameter("img2");
String img3=request.getParameter("img3");
FileInputStream fis=new FileInputStream(img1);
byte image1[]=fis.readAllBytes();
FileInputStream fis1=new FileInputStream(img2);
byte image2[]=fis1.readAllBytes();
FileInputStream fis2=new FileInputStream(img3);
byte image3[]=fis2.readAllBytes();
int oid=DataBase.oid;
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rentialsystem","root","");
Statement s=conn.createStatement();
PreparedStatement ps=conn.prepareStatement("insert into house(oid,photo,street,city,pincode,address,type,rent,preference) values(?,?,?,?,?,?,?,?,?)");
ps.setInt(1,oid);
ps.setBytes(2,image1);
ps.setString(3,street);
ps.setString(4,city);
ps.setInt(5,Integer.parseInt(pin));
ps.setString(6,addr);
ps.setString(7,type);
ps.setInt(8,Integer.parseInt(rent));
ps.setString(9,preference);
int i=ps.executeUpdate();
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select max(hid) from house");
rs.next();
int hid=rs.getInt(1);
ps=conn.prepareStatement("insert into himages values(?,?)");
ps.setInt(1,hid);
ps.setBytes(2,image1);
ps.executeUpdate();
ps.setBytes(2,image2);
ps.executeUpdate();
ps.setBytes(2,image3);
ps.executeUpdate();
fis.close();
fis1.close();
fis2.close();
if(i==1)
	out.println("registration successful");
else
	out.println("registration failed! try again after some time");
%>
</body>
</html>