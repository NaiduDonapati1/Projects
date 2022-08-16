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
text-align:right;
}</style>
</head>
<body>
<form method="post" onSubmit="return validate(this)" action="sort.jsp">
<div>city:<input type="text" name="city" id="city" width="30"/>
street:<input type="text" name="street" id="street" width="30"/>
<input type="submit" value="search"/></div>
</form>
<table>
<tr>
<%String city=request.getParameter("city"); 
String street=request.getParameter("street");
Class.forName("com.mysql.cj.jdbc.Driver");
PreparedStatement ps;
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rentialsystem","root","");
if(street==""){
	ps=conn.prepareStatement("select * from house where city=?");
	ps.setString(1,city);
}
else{
	ps=conn.prepareStatement("select * from house where city=? and street=?");
	ps.setString(1,city);
	ps.setString(2,street);
}
ResultSet rs=ps.executeQuery();
int i=0,j=0;
String str;
while(rs.next()){
	if(i%4==0){
		out.println("</tr>");
	}
		%>
		<td>
		<form method="post" action="housedetails.jsp">
		<%
	byte[] b=rs.getBytes(3);
	str="C://Users/USER/eclipse-workspace/Rentialweb/houses/"+i+".jpg";
	File f=new File("C://Users/USER/eclipse-workspace/Rentialweb/houses/"+i+".jpg");
	FileOutputStream fos =new FileOutputStream(f);
	fos.write(b);
	out.println("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button value="+rs.getInt(2)+" name=h><img src="+str+" width="+250+" height="+250+"/><br>"+rs.getString(4)+"&nbsp&nbsp&nbsp&nbsp"+rs.getString(5)+"</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
	out.println("</form>");
    i++;
    j++;
}
if(j==0){
	out.println("no results found");
}
%>
</tr>
</table>
<script>
var city=document.getElementById("city").value;
function validate(){
	if(city.test(null)){
		alert("please enter city Name");
		return false;
	}
	else
		return true;
}</script>
</body>
</html>