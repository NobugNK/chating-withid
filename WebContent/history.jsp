<%@page import="allmessage.allmessage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="conndb.conndb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<%
conndb conn=new conndb();
ArrayList<allmessage> allnews=new ArrayList();
allnews=conn.getnews();
for(allmessage temp:allnews)
{	
%>
<tr><td><%out.println(temp.getName());out.println("  在");out.println(temp.getTimestamp());out.println("说：");%></td></tr>
<tr><td><%out.println(temp.getMessages());%></td></tr>
<%
}
%>
</table>
</body>
</html>