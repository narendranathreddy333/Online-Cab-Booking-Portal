<%@page import="java.sql.*" %>
<%
String fare=request.getParameter("fare");
String uname=(String) session.getAttribute("uname");
String booking_id=(String)session.getAttribute("booking_id");
String csp=request.getParameter("csp");
String vname=request.getParameter("vname");
String custname=request.getParameter("custname");
String booking_time=request.getParameter("booking_time");


try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cab","root","kumaravalli");
	Statement st=con.createStatement();
	
	int i=st.executeUpdate("update booking set fare='"+fare+"', status='Confirmed' where booking_id='"+booking_id+"' and status='Waiting'");
	if(i>0)
	{
		%>
		<script type="text/javascript">
		window.alert("Booking confirmed");
		window.location="cspviewbookings.jsp";
		</script>
		<%
	}
	else
	{
		%>
		<script type="text/javascript">
		window.alert("Booking could not be confirmed");
		window.location="cspviewbookings.jsp";
		</script>
		<%
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
