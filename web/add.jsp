<%-- 
    Document   : add
    Created on : Jul 17, 2015, 9:03:42 PM
    Author     : tareqfadel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add A Guestbook Message</title>
    </head>
    <body>
        <h1>Add a Guestbook Message</h1>
        <form action="" method="GET">
            <label for="fname">First Name</label>
            <input type="text" name="fname" id="fname" /><br>
            <label for="sname">Last Name</label>
            <input type="text" name="sname" id="sname" /><br>
            <label for="email">email</label>
            <input type="email" name="email" id="email" /><br>
            <label for="message">Guestbook Message</label>
            <textarea name="message" id="message"></textarea>
            <input type="submit"/>
        </form>
    </body>
</html>
