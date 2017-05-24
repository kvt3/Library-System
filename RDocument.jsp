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
   int cnt1 = (int)session.getAttribute("cnt1");
	int cnt2 = (int)session.getAttribute("cnt2");
	session.setAttribute( "cnt1", cnt1 );
	   session.setAttribute( "cnt2", cnt2 );
%>
<body>
<a href="Logout.jsp" class="right_link" >Logout</a>
<h2>Welcome <%=sessionrname %></h2>
<div id="tab-content1" class="tab-content">
<form action="RDocument" method="get">
<table>
	<tr>  
	  
	  <td>TITLE:<br><input type="text" id="title" name="title"/></td>
	  <td>WRITTEN BY:<br><input type="text" id="wrtby" name="wrtby" /></td>
	  <td>TYPE:<br><select name="change" id="change" class="dropbtn1">
	  		<option value="BOOK">BOOK</option>
	  		<option value="JOURNAL_VOLUME">JOURNAL</option>
	  		<option value="PROCEEDINGS">PROCEEDINGS</option>
		</select></td>
		<td><br><input type="submit" id="submit" value="OK"></td>
		
    </tr>
	</table>

</form>
<form action="">
<table class="responstable" id="doc" >
  <tr>
    <th>DOCID</th>
    <th >TITLE</th>
    <th>PUBLISHER</th>
    <th>WRITTEN BY</th>
    
  </tr>
  <%! String docid = null;
  	  String title = null;
  	  String pubname = null;
  	  String wrtby = null;
  	Integer cnt = 0;
  	 
  %>
  <%
  List<String> _docid = (ArrayList<String>)request.getAttribute("_docid");
  List<String>_title = (ArrayList<String>)request.getAttribute("_title");
  List<String> _pubname = (ArrayList<String>) request.getAttribute("_pubname");
  List<String> _wrtby = (ArrayList<String>) request.getAttribute("_wrtby");
  Integer cnt = (Integer)request.getAttribute("cnt");
  if(cnt == null){
	  cnt = 0;
  }
  %>
 <% for(int row=0; row < cnt ; row++) { 
	 docid = _docid.get(row);
	 title = _title.get(row);
	 pubname = _pubname.get(row);
	 wrtby = _wrtby.get(row);
 	%>
  <tr id="<%=row %>">
  
    <td><a href="Rredirect?docid=<%=docid %>&title=<%=title %>" class="color" >
    <%=docid %>
    <input type="hidden" id="docid" name="docid" value ="<%=docid %>"/></td>
    
    <td><%=title %>
    <input type="hidden" id="title" name="title" value ="<%=title %>"/></td>
    
    <td><%=pubname%>
    <input type="hidden" id="pubname" name="pubname" value ="<%=pubname %>"/></td>
    
    
    <td><%=wrtby%>
    <input type="hidden" id="wrtby" name="wrtby" value ="<%=wrtby %>"/></td>
    
  </tr>
<% } %>
</table>

</form>
</div>
</body>
</html>