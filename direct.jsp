<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String Email = request.getParameter("email");
	String Password = request.getParameter("password");
	
	String Role=null;

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social","root","");
		Statement stmt = con.createStatement();
		
		String sql = "SELECT Role FROM registration where Email = '"+Email+"' AND Password = '"+Password+"'";
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next())
		{
	         //Retrieve by column name
	         
	        Role = rs.getString("Role");
	         System.out.println(Role);
	         
	
			if(Role.equals("SUPERADMIN"))
			{
				response.sendRedirect("super.jsp");
			}
			else if(Role.equals("ADMIN"))
			{
				response.sendRedirect("Deptadmin.jsp");
			}
			else
			{
				response.sendRedirect("Userlogin.jsp");
			}
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
	session.setAttribute("email", Email);
%>

</body>
</html>