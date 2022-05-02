<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>    
    
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vetcaredb", "rame123", "rootpwd");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM petowner WHERE ownerID="+id);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <h1>Data Deleted Successfully</h1>
    <a href="petprofile_ownerlist.jsp"><button align="right">Back</button></a>
</body>
</html>