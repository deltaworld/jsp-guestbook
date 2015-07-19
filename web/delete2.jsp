<%-- 
    Document   : delete2
    Created on : Jul 19, 2015, 11:03:43 PM
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
    <sql:setDataSource 
            var="snapshot" 
            url="jdbc:mysql://localhost:3306/Guestbook?zeroDateTimeBehavior=convertToNull"
            user="root" password=""
            driver="com.mysql.jdbc.Driver"/>
<sql:update dataSource="${snapshot}" var="result">
            DELETE FROM Guestbook WHERE Id = ?
            <sql:param value="${param.id}" />
        </sql:update>
        <h1>Record has been Deleted</h1>
        <a href="index.html">Go Back</a>
    </body>
</html>
