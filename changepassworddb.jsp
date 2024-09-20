<%@page import="java.sql.*"%>
<%
String email=(String)session.getAttribute("email");
String pwd=request.getParameter("pwd");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cab","root","kumaravalli");
	Statement st=con.createStatement();
	int i=st.executeUpdate("update customerreg set password='"+pwd+"' where email='"+email+"'");
	if(i>0)
	{

		%>
		<script type="text/javascript">
		window.alert("Password Changed SucessFully..");
		window.location="customerlogin.jsp";
		</script>
		<%
	
	}
	else
	{

		%>
		<script type="text/javascript">
		window.alert("Unable Change Password Now..");
		window.location="changePassword.jsp";
		</script>
		<%
	
	}
}
catch(Exception e)
{
	out.println(e);
}
%>