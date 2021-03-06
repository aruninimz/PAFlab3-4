<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    <%@ page import="lab3.test" %>


<%
//Insert item----------------------------------
if (request.getParameter("itemCode") != null)
{
test itemObj = new test();
String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
request.getParameter("itemName"),
request.getParameter("itemPrice"),
request.getParameter("itemDesc"));
session.setAttribute("statusMsg", stsMsg);
}

//Delete item----------------------------------
if (request.getParameter("itemID") != null)
{
test itemObj = new test();
String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
session.setAttribute("statusMsg", stsMsg);
}
%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="Views/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
<div class="container">
<div class="row" >
<div class="col">
<h1>Items Management</h1>
<form method="post" action="new.jsp">
Item code: <input name="itemCode" type="text"class="form-control"><br> Item
name: <input name="itemName" type="text"class="form-control"><br> Item price:
<input name="itemPrice" type="text"class="form-control"><br> Item
description: <input name="itemDesc" type="text"class="form-control"><br> <input
name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
</form>
<div class="alert alert-success">
<%
out.print(session.getAttribute("statusMsg"));
%>
</div>
<br>
<%
test itemObj = new test();
out.print(itemObj.readItems());
%>
</div></div></div>
</body>
</html>