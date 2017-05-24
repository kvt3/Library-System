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
<form action="Document" method="get">
<a href="Add_Document.jsp" class="right_link" >Add Documents</a>

<br><br>
<table >
	<tr>
	  <td>DOCUMENTID:<br><input type="text" id="docid" name="docid" /></td>
	  <td>TITLE:<br><input type="text" id="title" name="title"/></td>
	  <td>TYPE:<br><select name="change" id="change" class="dropbtn1">
	  		<option value="BOOK">BOOK</option>
	  		<option value="PROCEEDINGS">PROCEEDINGS</option>
	  		<option value="JOURNAL_VOLUME">JOURNAL</option>
		</select></td>
		<td><br><input type="submit" id="submit" value="OK"></td>
		
    </tr>
	</table>

</form>
<form action="Modify.jsp">
<table class="responstable" id="doc" >
  <tr>
    <th>DOCID</th>
    <th >TITLE</th>
    <th>PUBLISHER</th>
    <th>PUBLICATION_DATE</th>
    <th>MODIFY</th>
  </tr>
  <%! String docid = null;
  	  String title = null;
  	  String pdate = null;
  	  String pubname = null;
  	Integer cnt = 0;
  	 
  %>
  <%
  List<String> _docid = (ArrayList<String>)request.getAttribute("_docid");
  List<String>_title = (ArrayList<String>)request.getAttribute("_title");
  List<String>_pdate = (ArrayList<String>) request.getAttribute("_pdate");
  List<String> _pubname = (ArrayList<String>) request.getAttribute("_pubname");
  Integer cnt = (Integer)request.getAttribute("cnt");
  if(cnt == null){
	  cnt = 0;
  }
  %>
 <% for(int row=0; row < cnt ; row++) { 
	 docid = _docid.get(row);
	 title = _title.get(row);
	 pdate = _pdate.get(row);
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
    <td><%=pdate%>
    <input type="hidden" id="pdate" name="pdate" value ="<%=pdate %>"/></td>
    <td> 
    	<select name="change" id="change" class="dropbtn">
    	<option  value=" ">Choose Action</option>
  		<option value="modify">MODIFY</option>
  		<option value="delete">DELETE</option>
	</select></td>
  </tr>
<% } %>
</table>
<input type="submit" id="submit" value="submit" style="float: right;">
</form>
 
</div>
</body>
</html>