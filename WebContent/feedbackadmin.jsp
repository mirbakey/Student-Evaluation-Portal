<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="bad.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{
background-color: grey;
}
#container{
border: 2px solid black;
text-align: center;
line-height: 50px;
background-color: #eae9e9;
padding: 50px;

}
input{
border:1px solid grey;
padding: 2px;
margin: 4px;

}
span{
border: 2px solid grey;
padding: 4px;
font-style: bold;

}

.btn{
background-color: grey;
color: white;
padding-right:12px;
padding-top:10px;
padding-bottom:10px;

padding-left:12px;
text-decoration: none;
}

.btn:hover{
background-color: black;
color: white;
}
table,th,tr,td{
border : 2px solid grey;
border-collapse: collapse;
margin: auto;
padding:2px;


}

</style>
</head>
<body>
<div id="container">
		
	<%			
		String validity = (String) session.getAttribute("valid");
		if (validity.equals("truetrue")) {			

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/project","root","1234");
			
			PreparedStatement ps = con.prepareStatement("select * from feedbackstu");

			ResultSet rs = ps.executeQuery();
			boolean exist = false;
			%>
			<h1>Welcome: <%=session.getAttribute("userfull")%></h1>
			<div id="blocks">
			<h3 class="fie">Feedbacks </h3>
			<h4 class="fie">Select To Approve</h4>
			
			<form action="feedbackadminfinal.jsp" method="post">
			<table>
			<tr><th>S.No</th><th>Feedback</th><th>Approved</th><th>Selection</th></tr>
			<%int i =0;
			while(rs.next())
			{
				
				String feed = rs.getString("feed");
					 String email = rs.getString("email");
					 String approved = rs.getString("approved");
					
					 
					i++;				
				%>
				
				<tr><td><%=i%></td><td><%=feed %></td><td><%=approved%></td><td><input type="radio" value=<%=email%> name="email" required></td></tr>
				
				<%
					
			}%>
			</table><br>
			<input type="submit" value="Approve" class="btn">
			</form>
			</div>
</div>			

	<%
		}

		else {
	%>


	<jsp:forward page="bad.jsp"></jsp:forward>

	<%
		}
	%>



</body>
</html>