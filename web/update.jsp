<%-- 
    Document   : update
    Created on : Jul 17, 2015, 9:04:02 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update Record</h1>
        
        Please Enter your email address to update record
            <form action="update.jsp" method="GET">
            <label for="fname">email address:</label>
            <input type="text" name="email" id="fname" />
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
            
            
        </c:when>
    </c:choose>
        <form action="update2.jsp" method="GET">
            <input type="hidden" name="id" id="id" value="${result.rows[0].Id}" />
            <label for="fname">First Name</label>
            <input type="text" name="fname" id="fname" value="${result.rows[0].FirstName}"/><br>
            <label for="sname">Last Name</label>
            <input type="text" name="sname" id="sname" value="${result.rows[0].LastName}"/><br>
            <label for="email">email</label>
            <input type="email" name="email" id="email" value="${result.rows[0].email}"/><br>
            <label for="message">Guestbook Message</label>
            <textarea name="message" id="message"><c:out value="${result.rows[0].message}"/></textarea>
            <input type="submit" value="Update Record"/><br/>
            <a href="index.html">Go Back</a>
        </form>
    
    
    
            
    </body>
</html>
