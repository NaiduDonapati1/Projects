<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*,java.util.*,javax.servlet.*;"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!class Thread1 extends GenericServlet implements Runnable{
public HttpServletResponse res;
PrintWriter pw;
public void service(ServletRequest req,ServletResponse res) throws ServletException,IOException{
	res.setContentType("text/html");
	pw=res.getWriter();
}
public void run(){
	try{
	int i=10;
	while(i<10){
		pw.println(i);
		i++;
		
	}
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
}
%>
</body>
</html>