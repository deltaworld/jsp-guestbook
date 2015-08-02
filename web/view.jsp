<%-- 
    Document   : view
    Created on : Jul 17, 2015, 9:03:31 PM
    Author     : tareqfadel
--%>
<!--Imports-->
<%@page import="java.util.*,java.io.*,java.sql.*" %>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>

<!--Namespace-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Adobe Guestbook: View</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/libs/jquery-2.1.4.min.js"></script>
  <script src="js/libs/bootstrap.min.js"></script>
  <script src="js/jquery-dateFormat.min.js"></script>
  <script src="js/format-date.js"></script>
  
</head>
<body>
    
<!--Connect to Database-->
<sql:setDataSource 
    var="snapshot" user="root" password="" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/Guestbook?zeroDateTimeBehavior=convertToNull" />

<sql:query dataSource="${snapshot}" var="result">
    SELECT * FROM Guestbook;
</sql:query>
    <div class="container">
<div class="row">
     <div class="col-sm-12">
        <div class="btn-group btn-group-justified">
             <a href="index.html" class="btn btn-success">Home</a>
          <a href="view.jsp" class="btn btn-primary">View</a>
          <a href="add.jsp" class="btn btn-primary">Add</a>
          <a href="delete.jsp" class="btn btn-primary">Delete</a>
          <a href="update.jsp" class="btn btn-primary">Update</a>
       </div>
     </div>
        </div>
<div class="jumbotron">
    <h1>View Guestbook Entries</h1>
      <p>A detailed list of all guestbook entries.</p>
    </div>            
        
       
            
<table border="1" width="100%" class="table-hover table table-striped">
<tr>
    <th>ID</th>
    <th>Date</th>
    <th>First Name</th>
   <th>Last Name</th>
   <th>Email</th>
   <th>Message</th>
</tr>
<!--Loop Through result.rows array-->
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.Id}"/></td>
    <td class="date"><c:out value="${row.Date}"/></td>
    <td><c:out value="${row.FirstName}"/></td>
   <td><c:out value="${row.LastName}"/></td>
   <td><c:out value="${row.Email}"/></td>
   <td><c:out value="${row.Message}"/></td>
</tr>
</c:forEach>
</table>
</div>        
</body>
</html>
