<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*,java.awt.image.*,java.awt.*,p1.DataBase,java.io.*,javax.imageio.stream.*,javax.imageio.*,java.util.*" pageEncoding="ISO-8859-1"%>
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
<%!Blob image=null;
ResultSet rs=null;
String str;
int i;
HashMap <Integer,Image> hm=new HashMap<>();
Blob bl;
%>
<%
response.setContentType("text/html");
DataBase db=new DataBase();
rs=db.house();
i=1;
while(rs.next()){
		if(i%4==0){
			out.println("</tr>");
		}
			%>
			<td>
			<form method="post" action="housedetails.jsp">
			<%
		byte[] b=rs.getBytes(3);
		str="C://Users/USER/eclipse-workspace/Rentialweb/houses/h"+i+".jpg";
		File f=new File("C://Users/USER/eclipse-workspace/Rentialweb/houses/h"+i+".jpg");
		FileOutputStream fos =new FileOutputStream(f);
		fos.write(b);
		out.println("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button value="+rs.getInt(2)+" name=h><img src="+str+" width="+250+" height="+250+"/><br>"+rs.getString(4)+"&nbsp&nbsp&nbsp&nbsp"+rs.getString(5)+"</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
		out.println("</form>");
	    i++;
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