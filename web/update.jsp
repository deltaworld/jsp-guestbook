<%-- 
    Document   : update
    Created on : Jul 17, 2015, 9:04:02 PM
    Author     : Tareq Fadel
--%>
<%@page import="java.util.*,java.io.*,java.sql.*" %>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>

<!--Like Namespace-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Adobe Guestbook: Update</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/docs.css">
  <script src="js/libs/jquery-2.1.4.min.js"></script>
  <script src="js/libs/bootstrap.min.js"></script>
  <script src="js/update.js"></script>
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
        <h1>Update a guestbook entry</h1>
        <p>Modify details for an existing guestbook record.</p>
    </div>
    <p>Please enter the ID of the record you wish to update</p>
    <form action="update.jsp" method="GET" class="form-inline bs-form" 
              role="form">
        <div class="form-group">
            <label for="idq">ID:</label>
            <input type="number" name="idq" id="idq" placeholder="Enter ID" 
                   required="required"  autofocus="autofocus" class="form-control"/>
        </div>
            <button type="submit" class="btn btn-primary" id="find">Find Entry</button>
    </form>

    <c:choose>
        <c:when test="${not empty param.idq}">
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * FROM Guestbook WHERE Id = ? 
            <sql:param value="${param.idq}" />
        </sql:query>
        </c:when>
    </c:choose>
    <div class="bs-form">
        <form action="update2.jsp" method="GET" id="updateform" role="form">
            <input type="hidden" name="id" id="id" value="${result.rows[0].Id}" />
            <div class="form-group">
                <label for="fname">First Name:</label>
                <input type="text" name="fname" id="fname" required="required" 
                    class="form-control" value="${result.rows[0].FirstName}"/>
            </div>
            
            <div class="form-group">
                <label for="sname">Last Name:</label>
                <input type="text" name="sname" id="sname" required="required"
                   class="form-control" value="${result.rows[0].LastName}"/>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" required="required"
                   class="form-control" value="${result.rows[0].email}"/>
            </div>
            
            <div class="form-group">
                <label for="message">Guestbook Message</label>
                <textarea name="message" id="message" required="required" 
                      class="form-control">
                    <c:out value="${result.rows[0].message}"/>  
                </textarea>
            </div>
            <button type="submit" class="btn btn-primary">Update record</button>
        </form>
    </div>
</div> 
</body>
</html>
