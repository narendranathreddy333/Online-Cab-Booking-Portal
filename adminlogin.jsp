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
ResultSet rs=st.executeQuery("Select * from admin where username='"+uname+"' && password='"+pwd+"'");
while(rs.next())
{
	%>
	<script type="text/javascript">
	window.alert("Login successfull");
	window.location="adminhome.jsp";
	</script>
	<% 
}
%>
<script type="text/javascript">
window.alert("Login failed");
window.location="admin.jsp";
</script>
<% 
		
}
catch(Exception e)
{
	out.println(e);
}
%>
