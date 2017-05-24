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

<script type="text/javascript">
if(<%=request.getAttribute("customerID")%> != null){
	alert("<%=request.getAttribute("customerID")%>");
}
</script>
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
<div id="tab-content2" class="tab-content">
<form action="AddReader" method="get">
	<br><br>
	<h1>ADD READER</h1>
	<table border="solid"  class="responstable1">
		</tr>
			<td>READER NAME</td>
			<td><input type="text" id="name" name="name" /></td>
		<tr>
		</tr>
		<tr>
			<td>READER TYPE</td>
			<td><input type="text" id="type" name="type" /></td>
		</tr>
		<tr>
			<td>ADDRESS</td>
			<td><input type="text" id="add" name="add" /></td>
		</tr>
		</table>
	<table align="center"><tr>
	<td><br><input type="submit" id="submit" value="submit" style="float: right;"></td>
	<tr></table>
</form>
</div>
  
</body>
</html>