<%@page import ="java.sql.*"%>
<%
String uname=request.getParameter("uname");
session.setAttribute("uname",uname);
String pwd=request.getParameter("pwd");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cab","root","kumaravalli");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from cabregister where username='"+uname+"' && password='"+pwd+"'");
while(rs.next())
{
	String email=rs.getString("email");
	session.setAttribute("email",email);
	%>
	<script type="text/javascript">
	window.alert("Login successfull");
	window.location="cabhome.jsp";
	</script>
	<% 
}
%>
<script type="text/javascript">
window.alert("Login failed");
window.location="cab.jsp";
</script>
<% 
		
}
catch(Exception e)
{
	out.println(e);
}
%>
