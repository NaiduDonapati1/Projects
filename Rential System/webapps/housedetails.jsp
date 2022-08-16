<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,p1.DataBase,java.sql.*,java.io.*,p1.DataBase"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
text-align:center;
}
</style>
</head>
<body>
<form method="post" action="bookhouse.html">
<%String id=request.getParameter("h");
DataBase.hid=Integer.parseInt(id);
DataBase db=new DataBase();
out.println("<div>");
int i=1;
ResultSet rs=db.houseImages(Integer.parseInt(id));
while(rs.next()){
	String str;
	byte[] b=rs.getBytes(1);
	str="C://Users/USER/eclipse-workspace/Rentialweb/houses/"+id+""+i+".jpg";
	File f=new File("C://Users/USER/eclipse-workspace/Rentialweb/houses/"+id+""+i+".jpg");
	FileOutputStream fos =new FileOutputStream(f);
	fos.write(b);
	out.println("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img src="+str+" width="+250+" height="+250+"/>");
    i++;
    fos.close();
}
out.println("</div>");
%>
<table align="center">
<%
ResultSet rsd=db.house(Integer.parseInt(id));
rsd.next();
ResultSetMetaData rsm=rsd.getMetaData();
int count=rsm.getColumnCount();
i=4;
while(i<=count){
	out.println("<tr>");
	out.println("<td><h3>"+rsm.getColumnName(i)+"</h3></td>");
	out.println("<td>:</td>");
	out.println("<td><h5>"+rsd.getString(i)+"</h5></td>");
	out.println("</tr>");
	i++;
}
%>
</table>
<input type="submit" value="Book House"/>
</form>
</body>
</html>