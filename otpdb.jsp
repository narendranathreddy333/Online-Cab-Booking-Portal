<%@ page import="java.sql.*"%>
<%
String email=(String)session.getAttribute("email");
String otp=request.getParameter("otp");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cab","root","kumaravalli");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from otp where email='"+email+"' and otp='"+otp+"'");
	while(rs.next())
	{
		int i=st.executeUpdate("update otp set status='Verified' where email='"+email+"' and otp='"+otp+"' ");
		if(i>0)
		{
			%>
			<script type="text/javascript">
			window.alert("OTP Verified SucessFully..");
			window.location="changePassword.jsp";
			</script>
			<%
		}
		else
		{
			%>
			<script type="text/javascript">
			window.alert("Unable To Verify OTP....");
			window.location="OTP.jsp";
			</script>
			<%	
		}
		%>
		<script type="text/javascript">
		window.alert("Unable To Verify OTP....");
		window.location="OTP.jsp";
		</script>
		<%	
	}
	
}
catch(Exception e)
{
	out.println(e);
}
%>