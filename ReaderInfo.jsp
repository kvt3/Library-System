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
<div id="tab-content2" class="tab-content" >
<table  id="doc" >
  <tr >
  	<td>READERID:</td>
  	<td><%=request.getParameter("readerid") %></td>
  </tr>
    <tr>
    	<td>READER NAME:</td>
    	<td><%=request.getParameter("rname") %></td>
    </tr>
    <tr>
    	<td>READER TYPE:</td>
    	<td><%=request.getParameter("rtype") %></td>
    </tr>
    <tr>
    	<td>READER ADDRESS:</td>
    	<td><%=request.getParameter("add") %></td>
    </tr>
    <tr>
    	<td>AVERAGE FINE PAID:</td>
    	<%!ResultSet rs=null; 
    	String avgfine = null;%>
			<%Statement stmt = DBconnection.getConnection();
			try {
				  String query = "select avg(fine) from borrows natural join reservation_status where readerid='"+request.getParameter("readerid")+"';";
				  rs=stmt.executeQuery(query);
				  System.out.println(rs.getString(1));
				  avgfine = rs.getString(1);
				  if (avgfine == null){
					  avgfine = "0.0";
				  }
				  %>

				  <td><%= avgfine %></td>
			  <%} catch (SQLException e) {
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
		}  %>
    </tr>
</table>
</body>
</html>