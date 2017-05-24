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
<form action="FindReader" method="get">
<a href="Add_Reader.jsp" class="right_link" >Add Reader</a>
<br><br>
<table >
	<tr>
	  <td>READERID:<br><input type="text" id="rid" name="rid" /></td>
	  <td>RESERVATION NO:<br><input type="text" id="rno" name="rno"/></td>
	 <td><br><input type="submit" id="submit" value="OK" ></td>
		
    </tr>
	</table>

</form>
<form action="ChangeStatus">
<table class="responstable" id="doc" >
  <tr>
  	<th>RESERVATION NO</th>
    <th>REDERID</th>
    <th>DOCID</th>
    <th>COPY NUMBER</th>
    <th>LIBRARY</th>
    <th>STATUS</th>
    <th>BORROW TIME</th>
    <th>RETURN TIME</th>
    <th>FINE DUE</th>
    <th>MODIFY</th>
  </tr>
  <%! String resnumber = null;
  	  String readerid = null;
  	  String docid = null;
  	  String copyno = null;
  	  String rname = null;
  	  String rtype = null;
  	  String lname = null;
  	  String status = null;
  	  String add = null;
  	  String libid = null;
  	  Integer cnt = 0;
  	  ResultSet rs=null;
  	  float fine =0;
  	 
  %>
  <%
  List<String> _resnumber = (ArrayList<String>)request.getAttribute("_resnumber");
  List<String>_readerid = (ArrayList<String>)request.getAttribute("_readerid");
  List<String>_docid = (ArrayList<String>) request.getAttribute("_docid");
  List<String> _copyno = (ArrayList<String>) request.getAttribute("_copyno");
  List<String> _rname = (ArrayList<String>) request.getAttribute("_rname");
  List<String> _rtype = (ArrayList<String>) request.getAttribute("_rtype");
  List<String> _lname = (ArrayList<String>) request.getAttribute("_lname");
  List<String> _status = (ArrayList<String>) request.getAttribute("_status");
  List<String> _add = (ArrayList<String>) request.getAttribute("_add");
  List<String> _libid = (ArrayList<String>) request.getAttribute("_libid");
  Integer cnt = (Integer)request.getAttribute("cnt");
  if(cnt == null){
	  cnt = 0;
  }
  %>
 <% for(int row=0; row < cnt ; row++) { 
	 resnumber = _resnumber.get(row);
	 readerid = _readerid.get(row);
	 docid = _docid.get(row);
	 copyno = _copyno.get(row);
	 rname = _rname.get(row);
	 rtype = _rtype.get(row);
	 lname = _lname.get(row);
	 status = _status.get(row);
	 add = _add.get(row);
	 libid = _libid.get(row);
 	%>
  <tr id="<%=row %>">
    <td>
    <%=resnumber %>
    <input type="hidden" id="resnumber" name="resnumber" value ="<%=resnumber %>"/></td>
    <td><a href="ReaderInfo.jsp?readerid=<%=readerid %>&rname=<%=rname %>&rtype=<%=rtype %>&add=<%=add %>" class="color" ><%=readerid %></a>
    <input type="hidden" id="readerid" name="readerid" value ="<%=readerid %>"/></td>
    <td><%=docid%>
    <input type="hidden" id="docid" name="docid" value ="<%=docid %>"/></td>
    <td><%=copyno%>
    <input type="hidden" id="copyno" name="copyno" value ="<%=copyno %>"/></td>
    <td><%=lname%>
    <input type="hidden" id="lname" name="lname" value ="<%=libid %>"/></td>
    <td><%=status%>
    <input type="hidden" id="status" name="status" value ="<%=status %>"/></td>
    <%if(status.equals("RESERVED")) {%>
    <td>unavailable</td>
    <td>unavailable</td>
	<td>unavailable <input type="hidden" id="fine" name="fine" value ="<%=fine %>"/></td>
	<%} else if(status.equals("BORROWED") || status.equals("RETURNED")) {
		Statement stmt = DBconnection.getConnection();
		try {
			  String query = "select bdtime,rdtime,fine from BORROWS natural join reservation_status where RESNUMBER='"+resnumber+"';";
			  rs=stmt.executeQuery(query);
			  SimpleDateFormat currentFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String currDate = currentFormat.format(cal.getTime());
				Date d1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(currDate);
				 Date d2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(rs.getString(2));
				 long diff = (d1.getTime() - d2.getTime());
				 long diffDays = diff / (24 * 60 * 60 * 1000);
				 if(diffDays > 0){
					 fine = (float) (diffDays * 0.2);
				 }else{
					 fine = (float)0;
				 }
	
	%>
    <td><%=rs.getString(1)%></td>
    <td><%=rs.getString(2)%></td>
	<td><%=fine%> $ <input type="hidden" id="fine" name="fine" value ="<%=fine %>"/></td>
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
			}} %>
    <td> 
    	<select name="change" id="change" class="dropbtn">
    	<option  value=" ">Choose Action</option>
  		<option value="Borrowed">Borrowed</option>
  		<option value="Return">Return</option>
	</select></td>
	
  </tr>
<% } %>
</table>
<input type="submit" id="submit" value="submit" style="float: right;">
</div>
  
</form>
</body>
</html>