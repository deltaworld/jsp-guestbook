<%-- 
    Document   : add
    Created on : Jul 18, 2015, 12:41:05 AM
    Author     : tareqfadel
--%>
<%@page import="java.util.*,java.io.*,java.sql.*" %>
<%@page import="javax.servlet.http.*,javax.servlet.*,java.text.*" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%! String date = ""; %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add A Guestbook Message</title>
    </head>
    <body>
        <%
   java.util.Date dNow = new java.util.Date( );
   SimpleDateFormat simpleDate = new SimpleDateFormat ("yyyy-MM-dd");
   String dateFormatted = simpleDate.format(dNow);
   out.print( "<h2 align=\"center\">" + dateFormatted + "</h2>");
    date = dateFormatted;%>
        <h1>Add a Guestbook Message</h1>
        <form action="add.jsp" method="GET">
            <label for="fname">First Name</label>
            <input type="text" name="fname" id="fname" /><br>
            <label for="sname">Last Name</label>
            <input type="text" name="sname" id="sname" /><br>
            <label for="email">email</label>
            <input type="email" name="email" id="email" /><br>
            <label for="message">Guestbook Message</label>
            <textarea name="message" id="message"></textarea>
            <%
   out.print( 
           "<input type=\"hidden\" name=\"date\" id=\"date\" value=\"" 
                   + date + "\" />");%>
            
            <input type="submit"/><br/>
            <a href="index.html">Go Back</a>
        </form>
        
    <sql:setDataSource 
            var="snapshot" 
            url="jdbc:mysql://localhost:3306/Guestbook?zeroDateTimeBehavior=convertToNull"
            user="root" password=""
            driver="com.mysql.jdbc.Driver"/>
    <c:choose>
        <c:when test="${not empty param.fname
                     && not empty param.sname
                     && not empty param.email
                     && not empty param.message}">
    
        <sql:update dataSource="${snapshot}" var="result">
            INSERT INTO Guestbook (LastName, FirstName, Email, Message, Date)
            VALUES (?, ?, ?, ?, ?);
            <sql:param value="${param.sname}" />
            <sql:param value="${param.fname}" />
            <sql:param value="${param.email}" />
            <sql:param value="${param.message}" />
            <sql:param value="${param.date}" />
        </sql:update>
            Record has been added to the database.
        </c:when>
            <c:otherwise><br/>Please fill in all fields.</c:otherwise>
    </c:choose>
            
    </body>
</html>
