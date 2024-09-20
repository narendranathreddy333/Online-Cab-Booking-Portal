<%@page import ="java.sql.*"%>
<%
String cspname=request.getParameter("cspname");
String cspemail=request.getParameter("cspemail");
String vtype=request.getParameter("vtype");
String vname=request.getParameter("vname");
String vnumber=request.getParameter("vnumber");
String vmodel=request.getParameter("vmodel");
String capacity=request.getParameter("capacity");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cab","root","kumaravalli");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select count(*) from addcab where vehnum='"+vnumber+"' && cspname='"+cspname+"'");
while(rs.next())
{
	int count=rs.getInt(1);
	if(count==0)
	{
		int i=st.executeUpdate("insert into addcab values('"+cspname+"','"+cspemail+"','"+vtype+"','"+vname+"','"+vnumber+"','"+vmodel+"','"+capacity+"')");
		if(i>0)
		{
			%>
			<script type="text/javascript">
			window.alert("Cab Details registered successfully")
			window.location("cabhome.jsp");
			</script>
			<%
		}
		else
		{
			%>
			<script type="text/javascript">
			window.alert("Cab details unable to be added ")
			window.location("cspaddcabs.jsp");
			</script>
			<%
		}
	}
	else
	{
		%>
		<script type="text/javascript">
		window.alert("vehicle number already added by You");
		window.location("cabaddcabs.jsp");
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
