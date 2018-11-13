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
	
	//String Role="";

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/social","root","");
		Statement stmt = con.createStatement();
		
		String sql = "SELECT Role FROM registration where Email = '"+Email+"' AND Password = '"+Password+"'";
		System.out.println(sql);
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()==false) /*To see if rs is empty*/
		{	
			response.sendRedirect("Login.jsp");
			//out.println("invalid Username or Password");
		}
		else //else print the below data.../*
		{
		    //Retrieve by column name
		         
		    String Role = rs.getString("Role");
		    System.out.println(Role);
		         
			if(Role.equals("Superadmin"))
			{
				response.sendRedirect("super.jsp");
			}
			else if(Role.equals("Admin"))
			{
				response.sendRedirect("Deptadmin.jsp");
			}
			else if(Role.equals("User"))
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