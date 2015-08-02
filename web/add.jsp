<%-- 
    Document   : delete
    Created on : Jul 18, 2015, 12:41:05 AM
    Author     : Tareq Fadel
--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Adobe Guestbook: Add</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/libs/jquery-2.1.4.min.js"></script>
  <script src="js/libs/bootstrap.min.js"></script>
  <style>
      .bs-form {
          margin:0 100px;
      }
  </style>
</head>
<body>
<%@page import="java.util.*,java.io.*,java.sql.*" %>
<%@page import="javax.servlet.http.*,javax.servlet.*,java.text.*" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource 
            var="snapshot" 
            url="jdbc:mysql://localhost:3306/Guestbook?zeroDateTimeBehavior=convertToNull"
            user="root" password=""
            driver="com.mysql.jdbc.Driver"/>

<%! String date = "";       // date display for HTML
    java.util.Date dNow;    // for Now date
%> 
<%
            dNow = new java.util.Date();
            SimpleDateFormat dBInput = new SimpleDateFormat ("yyyy-MM-dd");
            date = dBInput.format(dNow);
            %>            

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
        <h1>Add a Guestbook Entry</h1>
        <p>A new record entry to the guestbook - <b>
          <% SimpleDateFormat dateHtml = new SimpleDateFormat ("d MMMMM, yyyy");
             String dateHtmlStr = dateHtml.format(dNow);
             out.print(dateHtmlStr); %>
        </b></p>
    </div>            
    <div class="bs-form">
        <form action="add.jsp" method="GET" role="form">
            
            <div class="form-group">
                <label for="fname">First Name:</label>
                <input type="text" name="fname" id="fname" class="form-control" 
                       placeholder="Enter First Name" required="required"/>
            </div>
            <div class="form-group">
                <label for="sname">Last Name:</label>
                <input type="text" name="sname" id="sname" class="form-control"
                       placeholder="Enter Last Name" required="required"/>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" class="form-control"
                       placeholder="Enter Email" required="required"/>
            </div>
            
            <div class="form-group">
                <label for="message">Guestbook Message:</label>
                <textarea name="message" id="message" class="form-control"
                          placeholder="Please leave a message" 
                          required="required">
                </textarea>
            </div>
            <%
                out.print(
                    "<input type=\"hidden\" name=\"date\" id=\"date\" value=\"" 
                    + date + "\" />");
                // Adds date from server to database as a hidden input field
            %>
            
            <button type="submit" class="btn btn-primary">Add Message</button>  
        </form>   
    
    <c:choose>
        <c:when test="${not empty param.fname
                     && not empty param.sname
                     && not empty param.email
                     && not empty param.message
                     && not empty param.date
                }">
    
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
    </div>
      </div>      
    </body>
</html>
