<%-- 
    Document   : delete
    Created on : Jul 17, 2015, 9:03:54 PM
    Author     : tareqfadel
--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Delete A Guestbook Record</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/libs/jquery-2.1.4.min.js"></script>
  <script src="js/libs/bootstrap.min.js"></script>

<%@page import="java.util.*,java.io.*,java.sql.*" %>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>

<!--Like Namespace-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
      .bs-form {
          margin:20px 0;
      }
      #email {
          width:300px;
      }
  </style>    
</head>
    <body>
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
    <h1>Delete a Guestbook Entry</h1>
    <p>Delete a guestbook entry by using email as the identifier.</p>
    </div>            
        
    <p>Please enter the email address of the record you wish to delete</p>
            <form action="delete.jsp" method="GET" class="form-inline bs-form" 
                  role="form">
                
                <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" name="email" id="email" class="form-control" 
                       required="required" placeholder="Enter email" />
                </div>
                <button type="submit" class="btn btn-primary">Delete Entry</button>
            
        </form>
    <sql:setDataSource 
            var="snapshot" 
            url="jdbc:mysql://localhost:3306/Guestbook?zeroDateTimeBehavior=convertToNull"
            user="root" password=""
            driver="com.mysql.jdbc.Driver"/>
    <c:choose>
        <c:when test="${not empty param.email}">
    
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * FROM Guestbook WHERE Email = ? 
            <sql:param value="${param.email}" />
        </sql:query>
            
            <table border="1" width="100%" class="table-hover table table-striped">
<tr>
   <th>First Name</th>
   <th>Last Name</th>
   <th>Email</th>
   <th>Message</th>
</tr>
<!--Loop Through result.rows array-->
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${result.rows[0].FirstName}"/></td>
   <td><c:out value="${result.rows[0].LastName}"/></td>
   <td><c:out value="${result.rows[0].Email}"/></td>
   <td><c:out value="${result.rows[0].Message}"/></td>
</tr>
</c:forEach>
</table>
            <form id="deleterecord" action="delete2.jsp" method="GET"> 
                
                 <button type="submit" class="btn btn-danger">DELETE</button>
                <input type="hidden" name="id" id="id" value="${result.rows[0].Id}" />
            </form>
        </c:when>
    </c:choose>
</div>
    </body>
</html>
