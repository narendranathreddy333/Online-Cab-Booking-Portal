<%@page import ="java.sql.*"%>
<%
String csp=request.getParameter("csp");
String dos=request.getParameter("dos");
String firstname=request.getParameter("fname");
String lastname=request.getParameter("lname");
String dob=request.getParameter("bday");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String gender=request.getParameter("gender");
String city=request.getParameter("city");
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cab","root","kumaravalli");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select count(*) from cabregister where cabservicename='"+csp+"'");
while(rs.next())
{
	int count=rs.getInt(1);
	if(count==0)
	{
		int i=st.executeUpdate("insert into cabregister values('"+csp+"','"+dos+"','"+firstname+"','"+lastname+"','"+dob+"','"+email+"','"+mobile+"','"+gender+"','"+city+"','"+uname+"','"+pwd+"')");
		if(i>0)
		{
			%>
			<script type="text/javascript">
			window.alert("Customer details registered successfully")
			window.location("cab.jsp");
			</script>
			<%
		}
		else
		{
			%>
			<script type="text/javascript">
			window.alert("Customer details unable to register ")
			window.location("cabregister.jsp");
			</script>
			<%
		}
	}
	else
	{
		%>
		<script type="text/javascript">
		window.alert("Username already exists ")
		window.location("customeregister.jsp");
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
