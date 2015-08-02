<%-- 
    Document   : delete2
    Created on : Jul 19, 2015, 11:03:43 PM
    Author     : Tareq Fadel
--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Adobe Guestbook: Delete</title>
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
 
</head>
<body>
<sql:setDataSource driver="com.mysql.jdbc.Driver" user="root" password=""
            url="jdbc:mysql://localhost:3306/Guestbook?zeroDateTimeBehavior=convertToNull"
            var="snapshot" />
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
<sql:update dataSource="${snapshot}" var="result">
            DELETE FROM Guestbook WHERE Id = ?
            <sql:param value="${param.idc}" />
</sql:update>
            <h1>Record has been deleted</h1>
</div>    
</body>
</html>
