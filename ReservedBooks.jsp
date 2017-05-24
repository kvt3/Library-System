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
<table  id="doc" >
  <tr >
  	<td>READERID:</td>
  	<td><%=sessionreaderid %></td>
  </tr>
    <tr>
    	<td>READER NAME:</td>
    	<td><%=sessionrname %></td>
    </tr>
    <tr>
    	<td>AVERAGE FINE PAID:</td>
    	<%!ResultSet rs2=null; 
    	String avgfine = null;%>
			<%Statement stmt2 = DBconnection.getConnection();
			try {
				  String query2 = "select avg(fine) from borrows natural join reservation_status where readerid='"+request.getParameter("readerid")+"';";
				  rs2=stmt2.executeQuery(query2);
				  System.out.println(rs2.getString(1));
				  avgfine = rs2.getString(1);
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
				rs2.close();
				stmt2.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}  %>
    </tr>

    </table>
    <br><br>
    <br><br><br>
   ** A reserved book has to be picked up before 6 pm;
otherwise, the reservation is cancelled.!!!!!
<h3>Number of Documents Reserved currently</h3>
<table class="responstable" id="doc" >

  <tr>
    <th>RESNUMBER</th>
    <th>TITLE</th>
    <th>DOCID</th>
    <th>COPYNO</th>
    <th>BRANCH</th>
    <th>RES_DATETIME</th>
  </tr>
			<%!ResultSet rs=null; 
			ResultSet rs1=null;
			ResultSet rs3=null;
			float fine = 0;
			%>
			<%Statement stmt = DBconnection.getConnection();
			Statement stmt3 = DBconnection.getConnection();
			
			try {
				  String query = "select RESNUMBER, DOCID, COPYNO, LNAME, DTIME,title from Document natural join RESERVES r natural join RESERVATION_STATUS s natural join BRANCH b where READERID = '"+sessionreaderid+"'and STATUS = 'RESERVED' ;";
				  
				  rs=stmt.executeQuery(query);
				  
				  System.out.print(rs.getString(1));
			  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  try {
			  	SimpleDateFormat currentFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			  	Calendar cal = Calendar.getInstance();
			  	cal.set(Calendar.HOUR_OF_DAY,18);
			  	cal.set(Calendar.MINUTE,00);
			  	cal.set(Calendar.SECOND,0);
				String currDate = currentFormat.format(cal.getTime());
				Date currt = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(currDate);
				System.out.println("d1:"+currt);
			  int cnt1 = 0;
			  int flag = 0;
			while(rs.next())
			  { cnt1++;
			  Date resr = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(rs.getString(5));
					System.out.println("currt"+resr.getHours());
					System.out.println("resr"+resr);
					long diff = (resr.getTime() - currt.getTime());
					long diffDays = diff / (24 * 60 * 60 * 1000);
					int timediff=(resr.getHours()-currt.getHours());
					int a = resr.compareTo(currt);
					if(a > 0 && diffDays == 0){
						flag = 0;
					}else if(a < 0 && timediff <= 0 && diffDays > -2){
						flag =0;
					}else{
						flag = 1;
					}
					System.out.println("diffdays "+a+","+diffDays+","+timediff);
					if(flag == 1){
						String query3 = "delete from RESERVES where RESNUMBER ='"+rs.getString(1)+"';";
						stmt3.executeQuery(query3);
					}
					%>
	  		<tr>
	  		<td><%=rs.getString(1) %></td>
	  		<td><%=rs.getString(6) %></td>
	  		<td><%=rs.getString(2) %></td>
	  		<td><%=rs.getString(3) %></td>
	  		<td><%=rs.getString(4) %></td>
	  		<td><%=rs.getString(5) %></td>
	  		
	  		</tr>
	  		
	  		<%}session.setAttribute( "cnt1", cnt1 );
			} catch (SQLException e) {
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
		
</table><br><br>
**Documents that are not returned on time are fined at a rate of 20 cents for each day
after the due date.
<h3>Number of Documents Borrowed currently</h3>
<table class="responstable" id="doc1">
<tr>
    <th>BORNUMBER</th>
    <th>TITLE</th>
    <th>DOCID</th>
    <th>COPYNO</th>
    <th>BRANCH</th>
    <th>BOR_DATETIME</th>
    <th>RET_DATETIME</th>
    <th>FINE</th>
  </tr>
  <%Statement stmt1 = DBconnection.getConnection();
  try{
  String query1 = "select BORNUMBER, DOCID, COPYNO, LNAME, BDTIME, RDTIME,title from Document natural join BORROWS a natural join RESERVATION_STATUS s natural join BRANCH b where READERID = '"+sessionreaderid+"' and status = 'BORROWED' ;";
  rs1=stmt.executeQuery(query1);
  }catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  try {
	  SimpleDateFormat currentFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Calendar cal = Calendar.getInstance();
	String currDate = currentFormat.format(cal.getTime());
	Date d1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(currDate);
	  int cnt2 =0;
	while(rs1.next())
	  {cnt2++;
		Date d2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(rs.getString(6));
		 long diff = (d1.getTime() - d2.getTime());
		 long diffDays = diff / (24 * 60 * 60 * 1000);
		 if(diffDays > 0){
			 fine = (float) (diffDays * 0.2);
		 }else{
			 fine = (float)0;
		 }
	  %>
		<tr>
		<td><%=rs1.getString(1) %></td>
		<td><%=rs1.getString(7) %></td>
		<td><%=rs1.getString(2) %></td>
		<td><%=rs1.getString(3) %></td>
		<td><%=rs1.getString(4) %></td>
		<td><%=rs1.getString(5) %></td>
		<td><%=rs1.getString(6) %></td>
		
		<td><%=fine %> $</td>
		
		</tr>
		
		<%}session.setAttribute( "cnt2", cnt2 );
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		try {
			rs1.close();
			stmt1.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	%>

</table>
</form>
</div>

</body>
</html>          
          
          
          
          
          
          
          
          
          