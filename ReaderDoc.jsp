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
    
<jsp:include page="RHome.jsp"></jsp:include>
<%
   String sessionreaderid = (String)session.getAttribute ( "sessionreaderid" );
   String sessionrname = (String)session.getAttribute( "sessionrname" );
   session.setAttribute( "sessionreaderid", sessionreaderid );
   session.setAttribute( "sessionrname", sessionrname );
%>
<body>
<a href="Logout.jsp" class="right_link" >Logout</a>
<h2>Welcome <%=sessionrname %></h2>
<div id="tab-content3" class="tab-content">

<form action="RDocument" method="get">
<table border="solid"  class="responstable1">
	<tr>  
	  <td>TITLE:</td>
	  <td><input type="text" id="title" name="title"/></td>
	  </tr>
	  
	  <tr>
	  <td>TYPE:</td>
	  <td><select name="change" id="change" class="dropbtn1" onchange="changeTable()">
	  		<option value="BOOK">BOOK</option>
	  		<option value="PROCEEDINGS">PROCEEDINGS</option>
	  		<option value="JOURNAL_VOLUME">JOURNAL</option>
		</select></td>
		</tr>
		
			<tr id="b1" style="display:none">
			<td>Author Name:</td>
			<td><input type="text" id="authname" name="authname"/></td></tr>
			<tr id="j1" style="display:none">
			<td>EDITOR NAME:</td>
			<td><input type="text" id="editname" name="editname" /></td></tr>
			<tr id="p1" style="display:none">
			<td>PROCEEDINGS EDITOR:</td>
			<td><input type="text" id="proedit" name="proedit" /></td></tr>
			<tr>
		<td><input type="submit" id="submit" value="OK"></td>
		
    </tr>
	</table>

</form>
<form action="Modify.jsp">
<table class="responstable" id="doc" >
  <tr>
    <th>DOCID</th>
    <th >TITLE</th>
    <th>PUBLISHER</th>
    
    <th>STATUS</th>
    <th>RESERVE</th>
  </tr>
  <%! String docid = null;
  	  String title = null;
  	  
  	  String pubname = null;
  	Integer cnt = 0;
  	 
  %>
  <%
  List<String> _docid = (ArrayList<String>)request.getAttribute("_docid");
  List<String>_title = (ArrayList<String>)request.getAttribute("_title");
  
  List<String> _pubname = (ArrayList<String>) request.getAttribute("_pubname");
  Integer cnt = (Integer)request.getAttribute("cnt");
  if(cnt == null){
	  cnt = 0;
  }
  %>
 <% for(int row=0; row < cnt ; row++) { 
	 docid = _docid.get(row);
	 title = _title.get(row);
	 
	 pubname = _pubname.get(row);
 	%>
  <tr id="<%=row %>">
    <td><a href="Redirect?docid=<%=docid %>&title=<%=title %>" class="color" >
    <%=docid %>
    <input type="hidden" id="docid" name="docid" value ="<%=docid %>"/></td>
    <td><%=title %>
    <input type="hidden" id="title" name="title" value ="<%=title %>"/></td>
    <td><%=pubname%>
    <input type="hidden" id="pubname" name="pubname" value ="<%=pubname %>"/></td>
    
    <td>unavailable</td>
    <td> 
    	<input type="checkbox" name=""/> </td>
  </tr>
<% } %>
</table>
<input type="submit" id="submit" value="submit" style="float: right;">
</form>
</div>  

</body>
</html>