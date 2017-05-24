<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
    <%@include file="/css/tab.css" %>
    
    </style>
</head>
<body>
<ul class="tabs">
	<li>
   
   <input type="radio"  name="tabs" id="tab1" onclick="document.location.href = 'RDocument.jsp'">
          <label for="tab1">Documents</label>
</li>
   
    <li>
   <input type="radio" name="tabs" id="tab3" onclick="document.location.href = 'ReservedBooks.jsp'">
   <label for="tab3">My Page</label>
   </li>
<li>
   <input type="radio" name="tabs" id="tab2" onclick="document.location.href = 'BorrowedBooks.jsp'">
   <label for="tab2">Borrowed Books</label>
   </li>
   <li>
   <input type="radio" name="tabs" id="tab4" onclick="document.location.href = 'MyCart.jsp'">
   <label for="tab4">My Cart</label>
   </li>

</ul>  
</body>
</html>