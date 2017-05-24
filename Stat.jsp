<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="com.in.database.DBconnection" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
   String sessionfname = (String)session.getAttribute ( "sessionfname" );
   String sessionlname = (String)session.getAttribute( "sessionlname" );
   session.setAttribute( "sessionfname", sessionfname );
   session.setAttribute( "sessionlname", sessionlname );
%>
<%!ResultSet rs=null; 
ResultSet rs1=null;
ResultSet rs2=null;
ResultSet rs3=null;
String[] branch = null;
String selectedItem = null;
String branchname = null;
List<String> _title = new ArrayList<String>();
List<String> _borrow = new ArrayList<String>();
List<String> _name = new ArrayList<String>();
List<String> _cnt = new ArrayList<String>();
List<String> _til = new ArrayList<String>();
List<String> _bor = new ArrayList<String>();
%>
<%		  
		

		if(request.getParameter("branch")!=null)
		{	_name.clear();
			_cnt.clear();
			_til.clear();
			_bor.clear();
		   selectedItem=request.getParameter("branch");
		   
		    branch = selectedItem.split(",");
		    branchname = branch[1];
		   Statement stmt2 = DBconnection.getConnection();
	       Statement stmt3 = DBconnection.getConnection();
	       
	       try {
				  String query2 = "select  r.rname as readername ,count(*) as Borrowed from Borrows b ,Reader r  where b.readerid = r.readerid  and b.libid='"+branch[0]+"' group by b.readerid  ORDER BY BORROWED DESC limit 10;";
				  rs2=stmt2.executeQuery(query2);
				  String query3 = "select  d.title as title ,count(*) as Borrowed from Borrows b ,document d  where b.docid = d.docid and d.type = 'BOOK' and libid='"+branch[0]+"' group by b.Docid  ORDER BY BORROWED DESC limit 10;";
				  rs3=stmt3.executeQuery(query3);
			  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  try {
			  
			while(rs2.next())
			  {
				_name.add(rs2.getString(1));
				_cnt.add(rs2.getString(2));
	  		}
			while(rs3.next())
			  {
				_til.add(rs3.getString(1));
				_bor.add(rs3.getString(2));
	  		}
			
		  } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					System.out.println(selectedItem);
					System.out.println("name"+_name);
					System.out.println("cnt"+_cnt);
					System.out.println("bor"+_bor);
					System.out.println("til"+_til);
					rs2.close();
					stmt2.close();
					rs3.close();
					stmt3.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	       
		}
		}
          
			_title.clear();
			_borrow.clear();
			Statement stmt1 = DBconnection.getConnection();
          
			try {
				  String query1 = "select  d.title as title ,count(*) as Borrowed from Borrows b ,document d  where b.docid = d.docid and d.type = 'BOOK' group by b.Docid  ORDER BY BORROWED DESC limit 10;";
				  rs1=stmt1.executeQuery(query1);
			  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  try {
			  
			while(rs1.next())
			  {
				_title.add(rs1.getString(1));
				_borrow.add(rs1.getString(2));
	  		}} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					
					System.out.println(_title);
					System.out.println(_borrow);
					rs1.close();
					stmt1.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} 
			%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js">
</script>
<script src="js/addStat.js"></script>

<style type="text/css">
    <%@include file="/css/login.css" %>
    <%@include file="/css/table.css" %>
   <%@include file="/css/input.css" %>
   <%@include file="/css/tab.css" %>
 </style>
 <jsp:include page="Home.jsp"></jsp:include>
<body >
<input type="hidden" id="title" value="<%= _title %>">
<input type="hidden" id="borr" value="<%= _borrow %>">
<input type="hidden" id="name" value="<%= _name %>">
<input type="hidden" id="cnt" value="<%= _cnt %>">
<input type="hidden" id="til" value="<%= _til %>">
<input type="hidden" id="bor" value="<%= _bor %>">
<input type="hidden" id="st" value="<%= branchname %>">

<a href="Logout.jsp" class="right_link" >Logout</a>
<h2>Welcome <%=sessionfname %></h2>
<div id="tab-content4" class="tab-content">
<div id="columnchart_values" style="width: 100%; height: auto;"></div>
<form action="Stat.jsp" method="get">
<table><tr><td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BRANCH : <select name="branch" id="branch" class="dropbtn1" style="width: 200px;">
			<option value="">Choose Branch</option>
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
	  		<option value="<%=rs.getString(1) %>,<%=rs.getString(2) %>"><%=rs.getString(2) %></option>
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
			} %></select>
			</td>
			<td>
			<input type="submit" id="submit" value="Ok" >
			</td></tr></table>
</form>
<div id="columnchart_values1" style="width: 100%; height: auto;" ></div>
<div id="columnchart_values2" style="width: 100%; height: auto;"></div>

</div>
  
</body>
</html>