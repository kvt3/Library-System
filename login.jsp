<!DOCTYPE html>

<html>
<head>
<title></title>
<style type="text/css">
    <%@include file="/css/logintab.css" %>
    <%@include file="/css/input.css" %>
    <%@include file="/css/login.css" %>
    </style>
</head>

<body>
<br><br><br>
<h1>WELCOME TO SYMBOISIS LIABRARY</h1>
<form id="login" action="Login" method="get">
<h1>Log In</h1>
<ul class="tabs">
        <li>
          <input type="radio" checked name="tabs" id="tab1" value="employee">
          <label for="tab1">EMPLOYEE</label>
          <div id="tab-content1" class="tab-content animated fadeIn">
          <fieldset id="inputs">
        <input type="text" placeholder="Library_ID" required="" id="username" name="username" value="" />
        <input type="password" placeholder="Password" required="" id="password" name="password" value=""/>
    </fieldset>
         <fieldset id="actions">
        <input type="submit" id="submit" value="Log in">
    </fieldset>
          
    </div>
        </li>
        <li>
          <input type="radio" name="tabs" id="tab2" value="reader">
          <label for="tab2">READER</label>
          <div id="tab-content2" class="tab-content animated fadeIn">
            <fieldset id="inputs">
        <input type="text" placeholder="READER_ID" required="" id="readerid" name="readerid" value=" "/>
	</fieldset>
	     <fieldset id="actions">
        <input type="submit" id="submit" value="Log in">
    </fieldset>
          </div>
        </li>
        </ul>

</form>

</body>
</html>