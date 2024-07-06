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
<h1> SignUp Page </h1>
<a href="index.jsp">Existing User</a>
<br><br>
<form method="POST">
<input type="text" name="un" placeholder="enter username"required/>
<br><br>
<input type="password" name="pw1" placeholder="enter password"required/>
<br><br>
<input type="password" name="pw2" placeholder="confirm password"required/>
<br><br>
<input type="submit" name="btn" value="Register"/>
</form>



<%
if(request.getParameter("btn") != null)
{
String un=request.getParameter("un");
String pw1=request.getParameter("pw1");
String pw2=request.getParameter("pw2");
if(pw1.equals(pw2))
{
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url ="jdbc:mysql://localhost:3306/kcusers1oct23";
Connection con = DriverManager.getConnection(url, "root", "abc456");
String sql = "insert into users values (?, md5(?))";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1, un);
pst.setString(2, pw1);
pst.executeUpdate();
out.println("reg done");
con.close();
}
catch(SQLException e)
{
out.println("issue" +e);
}
}
else
{
out.println("passwords did not match");
}
}
%>
<center>
</body>
</html>