<%-- 
    Document   : add
    Created on : Jul 18, 2015, 12:41:05 AM
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
        <sql:setDataSource 
            var="snapshot" 
            url="jdbc:mysql://localhost:3306/Guestbook?zeroDateTimeBehavior=convertToNull"
            user="root" password=""
            driver="com.mysql.jdbc.Driver"/>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <ul>
    <li><p><b>First Name:</b>
    <%= request.getParameter("fname")%>
    </p></li>
    <li><p><b>Surname:</b>
   <%= request.getParameter("sname")%></p>
    </li>
    <li><p><b>email:</b>
   <%= request.getParameter("email")%></p>
    </li>
    <li><p><b>Message:</b>
   <%= request.getParameter("message")%></p>
    </li>
</ul>
        
    </body>
</html>
