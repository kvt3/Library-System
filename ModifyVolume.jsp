<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
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
<div id="tab-content1" class="tab-content">

<form action="ModifyVolume">
<input type="hidden" id="docid" name="docid" value ="<%=request.getParameter("docid")%>"/>
<input type="hidden" id="branch" name="branch" value ="<%=request.getParameter("branch")%>"/>
<h1>UPDATE JOURNAL</h1>
<table class="responstable" id="doc" >
  <tr>
  	<th>COPY NO</th>
    <th>JOURNAL VOLUME</th>
    <th >ISSUE NO</th>
    <th>POSITION</th>
    <th>UPDATE</th>
  </tr>
  <% String[] jvolume = request.getParameterValues("jvolume");
     String[] issue_no = request.getParameterValues("issue_no");
     String[] copyno = request.getParameterValues("copyno");
     String[] position = request.getParameterValues("position");
     String[] change = request.getParameterValues("change");
     
    %>
  
 <% for(int row=0; row < change.length ; row++) { 
	 if(change[row].equalsIgnoreCase("Modify"))
	 {
 	%>
  <tr>
  <td><%=copyno[row] %><input type="hidden" id="copyno" name="copyno" value="<%=copyno[row] %>"/></td>
    <td><input type="text" id="jvol" name="jvol" value ="<%=jvolume[row] %>"/></td>
    <td><input type="text" id="issue_no" name="issue_no" value ="<%=issue_no[row] %>"/></td>
    <td><input type="text" id="position" name="position" value ="<%=position[row] %>"/></td>
    <td><select name="modify" class="dropbtn">
  		<option value="yes">YES</option>
  		<option value="no">NO</option>
	</select></td>
  </tr>
<% }}%>
</table>
<br><br><br>
<h1>DELETE JOURNAL</h1>
<table class="responstable" id="doc1">
<tr>
    <th>JOURNAL VOLUME</th>
    <th >ISSUE NO</th>
    <th>COPY NO</th>
    <th>POSITION</th>
    <th>DELETE</th>
  </tr>
<%  for(int row=0; row < change.length ; row++) { 
	if(change[row].equalsIgnoreCase("Delete")){
	%>
	<tr>
	<td><%=copyno[row] %><input type="hidden" id="copyno" name="copyno" value="<%=copyno[row] %>"/></td>
    <td><input type="text" id="jvol" name="jvol" value ="<%=jvolume[row] %>"/></td>
    <td><input type="text" id="title" name="title" value ="<%=issue_no[row] %>"/></td>
    <td><input type="text" id="position" name="position" value ="<%=position[row] %>"/></td>
    <td> <select name="delete" class="dropbtn">
  		<option value="<%=copyno[row] %>">YES</option>
  		<option value="no">NO</option>
	</select></td>
  </tr>
	<%} } %>
</table>
<input type="submit" id="submit" value="submit" style="float: right;">
</div> 
</form>
</body>
</html>