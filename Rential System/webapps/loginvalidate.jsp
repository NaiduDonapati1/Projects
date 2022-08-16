<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.io.*,p1.DataBase"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%response.setContentType("text/html");
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rentialsystem","root","");
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select uid,password from users where email="+"'"+uname+"'"+"");
if(rs.next()){
	int uid=rs.getInt(1);
	DataBase.oid=uid;
	if(rs.getString(2).equals(pwd)){
		try {
		    RequestDispatcher dispatcher =getServletContext().getRequestDispatcher("/home.html");
			dispatcher.include(request,response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	else{
		out.println("Login Failed due to invalid credentials <a href="+'"'+"login.html"+'"'+">CLICK HERE</a>  to try again");
	}
}
%>
</body>
</html>