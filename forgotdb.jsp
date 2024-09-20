<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Random" %>
<%-- <%@page import="venkat.Mail" %> --%>
<%
String email=request.getParameter("email");
session.setAttribute("email",email);
Random r=new Random();
int i=r.nextInt(10000+500000);
String msg="Your OTP For Reset Password Is \n"+i+"";
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cab","root","kumaravalli");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select count(*) from customerreg where email='"+email+"'");
while(rs.next())
{
	int count=rs.getInt(1);
	if(count>0)
	{
		int ii=st.executeUpdate("insert into otp values('"+email+"','"+i+"','Waiting',now() )");
		if(ii>0)
	
		
		{
			%>
			<script type="text/javascript">
window.alert("OTP Geneted Sucess");
window.location="OTP.jsp";
</script>
			<%
		}
		else
		{
			%>
			<script type="text/javascript">
window.alert("Unable to Generate OTP ");
window.location="Forgot.jsp";
</script>
			<%	
		}
	}
	else
	{
		%>
		<script type="text/javascript">
window.alert("Email Id Not Having Account");
window.location="Forgot.jsp";
</script>
		<%
	}
	%>
	<script type="text/javascript">
window.alert("Email Id Not Having Account");
window.location="Forgot.jsp";
</script>
	<%

}
}
catch(Exception e)
{
	out.println(e);
}
%>