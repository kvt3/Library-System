<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.in.database.DBconnection" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="js/addrows.js"></script>
<style type="text/css">
    <%@include file="/css/login.css" %>
    <%@include file="/css/table.css" %>
   <%@include file="/css/input.css" %>
    <%@include file="/css/tab.css" %>
    </style>
  <jsp:include page="Home.jsp"></jsp:include> 
  <%
   String sessionfname = (String)session.getAttribute ( "sessionfname" );
   String sessionlname = (String)session.getAttribute( "sessionlname" );
   session.setAttribute( "sessionfname", sessionfname );
   session.setAttribute( "sessionlname", sessionlname );
%>
<body>
<a href="Logout.jsp" class="right_link" >Logout</a>
<h2>Welcome <%=sessionfname %></h2>
<div id="tab-content3" class="tab-content">
<a href="Add_Branch.jsp" class="right_link" >ADD BRANCH</a>
<br><br>
<table class="responstable" id="doc" >
	<tr>
    <th>LIBID</th>
    <th >LIBRARY NAME</th>
    <th>LIBRARY LOCATION</th>
  </tr>
	<%!ResultSet rs=null; %>
			<%Statement stmt = DBconnection.getConnection();
			try {
				  String query = "select LIBID,LNAME,LLOCATION from BRANCH;";
				  rs=stmt.executeQuery(query);
			  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  try {
			  
			while(rs.next())
			  {%>
			<tr>
	  		<td><%=rs.getString(1) %></td>
	  		<td><%=rs.getString(2) %></td>
	  		<td><%=rs.getString(3) %></td>
	  		</tr>
	  		<%}} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					rs.close();
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} %>
	  
	</table>

</div>
   

</body>
</html>