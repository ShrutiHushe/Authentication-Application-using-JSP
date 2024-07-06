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
<h1> Login Page </h1>
<a href="signup.jsp">New Users Click Here</a>
<br><br>
<form method="POST">
<input type="text" name="un" placeholder="enter username"required/>
<br><br>
<input type="password" name="pw" placeholder="enter password"required/>
<br><br>
<input type="submit" name="btn" value="Login"/>
</form>



<%
if(request.getParameter("btn") != null)
{
String un=request.getParameter("un");
String pw=request.getParameter("pw");
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url ="jdbc:mysql://localhost:3306/kcusers1oct23";
Connection con = DriverManager.getConnection(url, "root", "abc456");
String sql = "select * from users where un=? and pw=md5(?)";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1, un);
pst.setString(2, pw);
ResultSet rs =pst.executeQuery();
if(rs.next())
{
session.setAttribute("un", un);
response.sendRedirect("home.jsp");
}
else
{
out.println("check ur credentials");
}
con.close();
}
catch(SQLException e)
{
out.println("issue" +e);
}
}
%>
</center>
</body>
</html>