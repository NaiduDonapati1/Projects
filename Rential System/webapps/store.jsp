<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.io.*,javax.sql.rowset.serial.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%response.setContentType("text/html");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String addr=request.getParameter("address");
String mobile=request.getParameter("phone");
String gen=request.getParameter("gender");
String prof=request.getParameter("profile");
String pwd=request.getParameter("pwd");
String profile="";
for(int i=0;i<prof.length();i++){
	if((int)(prof.charAt(i))==92)
		profile+="/";
	else
		profile+=prof.charAt(i);
		
}
File f=new File(profile);
FileInputStream fis=new FileInputStream(f);
byte b[]=fis.readAllBytes();
Blob bl=new SerialBlob(b);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rentialsystem","root","");
PreparedStatement ps=conn.prepareStatement("insert into users(fname,lname,gender,phone,email,address,photo,password) values(?,?,?,?,?,?,?,?)");
ps.setString(1,fname);
ps.setString(2,lname);
ps.setString(3,gen);
ps.setLong(4,Long.parseLong(mobile));
ps.setString(5,email);
ps.setString(6,addr);
ps.setBlob(7,bl);
ps.setString(8,pwd);
try{
int i=ps.executeUpdate();
if(i==1)
	 out.println("Registration successfull  <a href="+'"'+"login.html"+'"'+">CLICK HERE</a>  to Login");
}
catch(Exception e){
	out.println("Email ID already exists<br>");
	out.println("Registration Failed  <a href="+'"'+"register.html"+'"'+">CLICK HERE</a>  to Register again");
}
%>
</body>
</html>