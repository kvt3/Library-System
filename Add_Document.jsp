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
<script src="js/addrows.js"></script>
<style type="text/css">
    <%@include file="/css/login.css" %>
    <%@include file="/css/table.css" %>
   <%@include file="/css/input.css" %>
   <%@include file="/css/tab.css" %>
 </style>
 <%
   String sessionfname = (String)session.getAttribute ( "sessionfname" );
   String sessionlname = (String)session.getAttribute( "sessionlname" );
   session.setAttribute( "sessionfname", sessionfname );
   session.setAttribute( "sessionlname", sessionlname );
%>
<body>
<jsp:include page="Home.jsp"></jsp:include>
<a href="Logout.jsp" class="right_link" >Logout</a>
<h2>Welcome <%=sessionfname %></h2>
<div id="tab-content1" class="tab-content">
<form action="AddDocumnet" method="get">
	<br><br>
	<h1>ADD Documet</h1>
	<table border="solid"  class="responstable1">
		<tr>
			<td>TYPE:</td>
			<td><select name="type" id="type" class="dropbtn1" onchange="changeTable()">
		    <option value=" ">Choose Type</option>
	  		<option value="BOOK">BOOK</option>
	  		<option value="PROCEEDINGS">PROCEEDINGS</option>
	  		<option value="JOURNAL_VOLUME">JOURNAL</option>	
	  		</select></td>
		</tr>
		<tr>
			<td>DOCID:</td>
			<td><input type="text" id="docid" name="docid" /></td>
		</tr>
		<tr>
			<td>TITLE:</td>
			<td><input type="text" id="title" name="title" /></td>
		</tr>
		<tr>
			<td>PUBLISHERID:</td>
			<td><input type="text" id="pubid" name="pubid" /></td>
		</tr>
		<tr>
			<td>PUBLISHER:</td>
			<td><input type="text" id="pubn" name="pubn" /></td>
		</tr>
		<tr>
			<td>PUBLICATION_DATE:</td>
			<td><input type="text" id="pubd" name="pubd" /></td>
		</tr>
		<tr>
			<td>PUBLISHER ADRESS:</td>
			<td><input type="text" id="pubadd" name="pubadd" /></td>
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
		<tr id="br1" style="display:none">
			<td>Author Name:</td>
			<td><input type="text" id="authn" name="authn"/></td>
		</tr>
		<tr id="br2" style="display:none">
			<td>Author ID:</td>
			<td><input type="text" id="authid" name="authid" /></td>
		</tr>
		<tr id="br3" style="display:none">
			<td>ISBN:</td>
			<td><input type="text" id="isbn" name="isbn" /></td>
		</tr>
		<tr id="jr1" style="display:none">
			<td>JOURNAL VOLUME:</td>
			<td><input type="text" id="jvol" name="jvol" /></td>
		</tr>
		<tr id="jr2" style="display:none">
			<td>ISSUE NO:</td>
			<td><input type="text" id="isno" name="isno" /></td>
		</tr>
		<tr id="jr5" style="display:none">
			<td>ISSUE NO:</td>
			<td><input type="text" id="scope" name="scope" /></td>
		</tr>
		<tr id="jr3" style="display:none">
			<td>EDITOR NAME:</td>
			<td><input type="text" id="ediname" name="ediname" /></td>
		</tr>
		<tr id="jr4" style="display:none">
			<td>EDITOR ID:</td>
			<td><input type="text" id="edid" name="edid" /></td>
		</tr>
		<tr id="pr1" style="display:none">
			<td>PROCEEDINGS DATE:</td>
			<td><input type="text" id="prod" name="prod" /></td>
		</tr>
		<tr id="pr2" style="display:none">
			<td>PROCEEDINGS LOCATION:</td>
			<td><input type="text" id="prol" name="prol" /></td>
		</tr>
		<tr id="pr3" style="display:none">
			<td>PROCEEDINGS EDITOR:</td>
			<td><input type="text" id="proe" name="proe" /></td>
		</tr>
	</table>
	<table align="center"><tr>
	<td><br><input type="submit" id="submit" value="submit" style="float: right;"></td>
	<tr></table>
</form>
</div>

</body>
</html>