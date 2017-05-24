<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="com.in.database.DBconnection" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.text.*"%>
<%@ page import="java.util.*" %>
   <%@ page import="examples.cart.*" %>
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
<div id="tab-content4" class="tab-content">

<form action="AddReservation">
<table class="responstable" id="doc" >

  <tr>
    <th>Title</th>
    <th>DOCID</th>
    <th>COPYNO</th>
    <th>BRANCH</th>
    <th>CANCEL</th>
  </tr>
		<%
// Get the current shopping cart from the user's session.
    ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		int cnt1 = (int)session.getAttribute("cnt1");
		int cnt2 = (int)session.getAttribute("cnt2");
		session.setAttribute( "cnt1", cnt1 );
		   session.setAttribute( "cnt2", cnt2 );
		System.out.println("cnt1 "+cnt1+","+"cnt2 "+cnt2);
		

// If the user doesn't have a shopping cart yet, create one.
    if (cart == null)
    {
        cart = new ShoppingCart();
        session.setAttribute("ShoppingCart", cart);
    }

// Get the items from the cart.
    Vector<Item> items = cart.getItems();

// If there are no items, tell the user that the cart is empty.
    if (items.size() == 0)
    {	int cnt = 10 -(cnt1 +cnt2);
    	out.println("<h4 class =\"right_link\">Number Of Documents you can reserve : "+cnt+"</h4>");
        out.println("<h3>Your Reservation cart is empty.</h3>");
        
        
    }
    else
    {
    	int numItems =items.size();
    		int cnt = 10 -(cnt1 +cnt2);
    		out.println("<h4 class =\"right_link\">Number Of Documents you can reserve : "+cnt+"</h4>");
    		if(numItems > cnt){
    			out.println("<script type=\"text/javascript\">");  
    			out.println("alert('You can not Borrow and reserve more than 10 books');");  
    			out.println("</script>");
    			System.out.println("numItems "+numItems);
    			cart.removeItem(numItems-1);
    			numItems = numItems-1;	
    			System.out.println("numItems "+numItems);
    		}

    	System.out.println("numItems "+numItems);


    	        for (int i=0; i < numItems; i++)
    	        {
    	            Item item = (Item) items.elementAt(i);
%>
	  		<tr>
	  		<td><%=item.title %><input type="hidden" id="read" name="read" value ="<%=item.readerid%>"/></td>
	  		<td><%=item.docid%><input type="hidden" id="docid" name="docid" value ="<%=item.docid%>"/></td>
	  		<td><%=item.copyno%><input type="hidden" id="copyno" name="copyno" value ="<%=item.copyno%>"/></td>
	  		<td><%=item.libid%><input type="hidden" id="branch" name="branch" value ="<%=item.libid%>"/></td>
	  		<td><a href="RemoveItemServlet?item=<%=i %>">Remove</a></td>
	  		
	  		</tr>
		<%} 
			}%>
		
</table>
<input type="submit" id="submit" value="submit" style="float: right;">
</div>

</body>
</html>          
         