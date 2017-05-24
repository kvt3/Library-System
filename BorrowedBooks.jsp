<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="com.in.database.DBconnection" %>
    <%@ page import="java.sql.SQLException" %>
        <%@ page import="java.text.ParseException" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.util.Calendar" %>
    <%@ page import="java.util.Date" %>
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
<form action="ReservBook">
<h3>Total Number of Books Borrowed</h3>
<table class="responstable" id="doc" >

  <tr>
    <th>BORNUMBER</th>
    <th>DOCID</th>
    <th>COPYNO</th>
    <th>BRANCH</th>
    <th>BOR_DATETIME</th>
    <th>RET_DATETIME</th>
    <th>FINE</th>
  </tr>
			<%!ResultSet rs=null;
			float fine = 0;
			%>
			<%Statement stmt = DBconnection.getConnection();
			try {
				  String query = "select BORNUMBER, DOCID, COPYNO, LNAME, BDTIME, RDTIME from BORROWS a natural join BRANCH b where READERID = '"+sessionreaderid+"' ;";
				  rs=stmt.executeQuery(query);
				  
					
				  
				  System.out.print(rs.getString(1));
			  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  try {
			  SimpleDateFormat currentFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String currDate = currentFormat.format(cal.getTime());
			  Date d1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(currDate);
			  System.out.println(d1);
			while(rs.next())
			  {  Date d2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(rs.getString(6));
			  System.out.println(d2);
			  System.out.println(d1);
				 long diff = (d1.getTime() - d2.getTime());
				 long diffDays = diff / (24 * 60 * 60 * 1000);
				 if(diffDays > 0){
					 fine = (float) (diffDays * 0.2);
				 }else{
					 fine = (float)0;
				 }
			  %>
	  		<tr>
	  		<td><%=rs.getString(1) %></td>
	  		<td><%=rs.getString(2) %></td>
	  		<td><%=rs.getString(3) %></td>
	  		<td><%=rs.getString(4) %></td>
	  		<td><%=rs.getString(5) %></td>
	  		<td><%=rs.getString(6) %></td>

	  		<td><%=fine %> $</td>
	  		
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
          
          
          
          
          
          
          
          
          