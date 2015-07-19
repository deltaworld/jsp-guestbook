<%-- 
    Document   : delete
    Created on : Jul 17, 2015, 9:03:54 PM
    Author     : tareqfadel
--%>
<%@page import="java.util.*,java.io.*,java.sql.*" %>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>

<!--Like Namespace-->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete a Guestbook Entry</title>
    </head>
    <body>
<h1>Delete a Record</h1>
        
        Please Enter the email address of the record you wish to delete
            <form action="delete.jsp" method="GET">
            <label for="email">email address:</label>
            <input type="text" name="email" id="email" />
            <input type="submit"/><br/>
            <a href="index.html">Go Back</a>
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
            
            <table border="1" width="100%">
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
            Press DELETE button confirm deletion
            <form id="deleterecord" action="delete2.jsp" method="GET"> 
                <input type="submit" value="DELETE" />
                <input type="hidden" name="id" id="id" value="${result.rows[0].Id}" />
            </form>
        </c:when>
    </c:choose>
    </body>
</html>
