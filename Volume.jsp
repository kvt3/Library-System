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
<div id="tab-content1" class="tab-content">
<form action="Volume" method="get">
<a href="Add_Copy.jsp?docid=<%=request.getParameter("docid")%>" class="right_link" >Add Copy</a>
<input type="hidden" id="docid" name="docid" value ="<%=request.getParameter("docid")%>"/>
<input type="hidden" id="title" name="title" value ="<%=request.getParameter("title")%>"/>
<br><br>
<table  width = "100%">

	<tr>
	  <td><h3>DOCUMENTID: <%=request.getParameter("docid")%><br>
	      TITLE: <%=request.getParameter("title")%><br></h3>
	  </td>
	  <td width = "20%">BRANCH<br><select name="branch" id="branch" class="dropbtn1" class="right_link">
	  <%! String branchid = null;
	      String branchname = null;
	      Integer cn = 0;
	      %>
	  <% List<String> _branchid = (ArrayList<String>)request.getAttribute("branchid");
	     List<String> _branchname = (ArrayList<String>)request.getAttribute("branchname");
	     Integer cn = (Integer)request.getAttribute("cn");
		  if(cn == null){
			  cn = 0;
		  }
		  for(int row=0; row < cn ; row++) { 
			  branchid = _branchid.get(row);
			  branchname = _branchname.get(row);
		  %>
				<option value="<%=branchid%>" class="color"><%=branchname %></option>
				
			<% }%>
		</select></td>
		<td width = "10%"><br><input type="submit" id="submit" value="OK" class="right_link"></td>
		
    </tr>
	</table>

</form>
<form action="ModifyVolume.jsp" method="get">
<table class="responstable" id="doc" >
  <tr>
    <th>VOLUME</th>
    <th >ISSUENO</th>
    <th >COPYNO</th>
    <th >POSITION</th>
    <th>AVAILABILITY</th>
    <th>MODIFY</th>
  </tr>
  <%! String position = null;
  	  String copyno = null;
  	  String jvolume = null;
  	  String issue_no = null;
  	  Integer cnt = 0;
  	ResultSet rs=null;
  	 
  %>
  <%
  List<String> _copyno = (ArrayList<String>)request.getAttribute("copyno");
  List<String> _position = (ArrayList<String>)request.getAttribute("position");
  List<String> _jvolume = (ArrayList<String>)request.getAttribute("jvolume");
  List<String> _issue_no = (ArrayList<String>)request.getAttribute("issue_no");
  Integer cnt = (Integer)request.getAttribute("cnt");
  if(cnt == null){
	  cnt = 0;
  }
  %>
 <% for(int row=0; row < cnt ; row++) { 
	 copyno = _copyno.get(row);
	 position = _position.get(row);
	 jvolume = _jvolume.get(row);
	 issue_no = _issue_no.get(row);
 	%>
  <tr>
  <input type="hidden" id="docid" name="docid" value ="<%=request.getParameter("docid")%>"/>
  <input type="hidden" id="branch" name="branch" value ="<%=request.getParameter("branch")%>"/>
    <td><%=jvolume %><input type="hidden" id="jvolume" name="jvolume" value ="<%=jvolume%>"/></td>
    <td><%=issue_no %><input type="hidden" id="issue_no" name="issue_no" value ="<%=issue_no%>"/></td>
    <td><%=copyno %><input type="hidden" id="copyno" name="copyno" value ="<%=copyno%>"/></td>
    <td><%=position %><input type="hidden" id="position" name="position" value ="<%=position%>"/></td>
    <%Statement stmt = DBconnection.getConnection();
			try {
				  String query = "select status from reservation_status where resnumber =(select resnumber from reserves where docid='"+request.getParameter("docid")+"' and copyno='"+copyno+"' and libid='"+request.getParameter("branch")+"');";
				  System.out.println(query);
				  rs=stmt.executeQuery(query);
			  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  try {
			  if (rs.isBeforeFirst() ) { 
			while(rs.next())
			  {  System.out.println("status: "+rs.getString(1));
				if(rs.getString(1).equals("RESERVED") || rs.getString(1).equals("BORROWED")){%>
	  		<td>NOT AVAILABLE</td>
	  		<%}else{%>
	  		<td>AVAILABLE</td>
	  		<% }}}else{%>
	  		<td>AVAILABLE</td>
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
    <td> 
    	<select name="change" class="dropbtn">
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