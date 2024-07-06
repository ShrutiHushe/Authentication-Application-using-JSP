<%@ page import="java.sql.*" %>

<html>
<head>
<title> Auth App </title>
<style>
*{font-size:50px; font-family:Calibri;}
body{background-color:light-yellow;}
h1{background-color:black; color:white; width:50%; border-radius:40px;}
</style>
</head>

<body>
<center>
<h1> Home Page </h1>

<%
String un = (String)session.getAttribute("un");
if(un == null)
{
response.sendRedirect("index.jsp");
}
else
{
out.println("Welcome " +un);
}
%>

<form method="POST">
<input type="submit" name="btn" value="Logout"/>
</form>

<%
if(request.getParameter("btn") != null)
{
session.invalidate();
response.sendRedirect("index.jsp");
}
%>
<center>
</body>
</html>