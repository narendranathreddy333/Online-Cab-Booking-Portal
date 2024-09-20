<%@page import = "java.sql.*" %>
<%
String uname=(String)session.getAttribute("uname");
String csp=(String)session.getAttribute("csp");
String vnumber=(String)session.getAttribute("vnumber");
String vname=(String)session.getAttribute("vname");
String pickup=request.getParameter("pickup");
String dest=request.getParameter("dest");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cab","root","kumaravalli");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select count(*) from booking where csp_name='"+csp+"'and vname='"+vname+"' AND status='Waiting' OR status='Booked'");
	while(rs.next())
	{
		int count=rs.getInt(1);
		if(count==0)
		{
			int i=st.executeUpdate("insert into booking values(null,'"+csp+"','"+vname+"','"+uname+"',now(),0.0,'Waiting','"+pickup+"','"+dest+"')");
			if(i>0)
			{
				%>
				<script type="text/javascript">
					window.alert("Booking Request Sent Successfully");
				window.location="viewbookings.jsp";
				</script>
				<% 
			}
			else
			{
				%>
				<script type="text/javascript">
					window.alert("Booking Request Not sent");
				window.location= "SendbookingRequest.jsp";
				</script>
				<% 
			}
			
		}
		else
		{
			%>
			<script type="text/javascript">
				window.alert("The requested Cab is unavailable");
			window.location="Searchcabsdb.jsp";
			</script>
			<% 
		}
		
	}
}
	catch(Exception e)
{
		out.println(e);
}
%>

