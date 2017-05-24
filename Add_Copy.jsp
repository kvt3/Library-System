<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div id="tab-content1" class="tab-content">
<form action="AddCopy" method="get">
<input type="hidden" id="docid" name="docid" value ="<%=request.getParameter("docid")%>"/>
	<br><br>
	<h1>ADD COPY</h1>
	<table border="solid"  class="responstable1">
		</tr>
			<td>COPY NO:</td>
			<td><input type="text" id="cpno" name="cpno" /></td>
		<tr>
		</tr>
		<tr>
			<td>POSITION:</td>
			<td><input type="text" id="pos" name="pos" /></td>
		</tr>
		<tr>
			<td>BRANCH:</td>
			<td><select name="branch" id="branch" class="dropbtn1">
			<%!ResultSet rs=null; %>
			<%Statement stmt = DBconnection.getConnection();
			try {
				  String query = "select LIBID,LNAME from BRANCH;";
				  rs=stmt.executeQuery(query);
			  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  try {
			  
			while(rs.next())
			  {%>
	  		<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
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
		</tr>
		</table>
	<table align="center"><tr>
	<td><br><input type="submit" id="submit" value="submit" style="float: right;"></td>
	<tr></table>
</form>
</div>
 
</body>
</html>