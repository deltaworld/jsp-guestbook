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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<!--Connect to Database-->
        <sql:setDataSource 
            var="snapshot" 
            url="jdbc:mysql://localhost:3306/Guestbook?zeroDateTimeBehavior=convertToNull"
            user="root" password=""
            driver="com.mysql.jdbc.Driver"/>
 
        <sql:query dataSource="${snapshot}" var="result">
            SELECT LastName,FirstName,Email,Message,Date FROM Guestbook;
        </sql:query>
            <h1>View Database Entries</h1>
            
<table border="1" width="100%">
<tr>
    <th>Date</th>
    <th>First Name</th>
   <th>Last Name</th>
   <th>Email</th>
   <th>Message</th>
</tr>
<!--Loop Through result.rows array-->
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.Date}"/></td>
    <td><c:out value="${row.FirstName}"/></td>
   <td><c:out value="${row.LastName}"/></td>
   <td><c:out value="${row.Email}"/></td>
   <td><c:out value="${row.Message}"/></td>
</tr>
</c:forEach>
</table>
            
<a href="index.html">Go Back</a>
</body>
</html>
