<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Information Portal - Student Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            width: 100%;
            background-color: #1e90ff;
            color: #fff;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        header .logo img {
            width: 250px;
            height: auto;
            vertical-align: middle;
        }

        header h1 {
            font-size: 2em;
            display: inline;
            margin-left: 10px;
        }

        nav {
            width: 100%;
            background-color: #333;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        nav ul {
            display: flex;
            list-style-type: none;
            justify-content: center;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            text-decoration: none;
            color: #fff;
            font-size: 1.1em;
            padding: 10px 20px;
            display: block;
            transition: background-color 0.3s ease;
        }

        nav ul li a:hover {
            background-color: #1e90ff;
            border-radius: 5px;
        }

        main {
            width: 800px;
            height:fit-content;
            text-align: center;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        main h2 {
            font-size: 2em;
            margin-bottom: 15px;
            color: #1e90ff;
        }

        .notes-list {
            text-align: left;
            margin: 20px 0;
        }

        .notes-list a {
            display: block;
            padding: 10px;
            margin: 5px 0;
            background-color: #f4f4f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-decoration: none;
            color: #1e90ff;
            transition: background-color 0.3s ease;
        }

        .notes-list a:hover {
            background-color: #1e90ff;
            color: #fff;
        }
    </style>
</head>
<body>

    <header>
        <div class="logo">
            <img src="https://cdn.npfs.co/uploads/template/338/5686/publish/images/PULogo.png?1715147858" alt="Poornima University Logo">
        </div>
    </header>

<nav>
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="about.jsp">About Us</a></li>
        <% if (session.getAttribute("studentName") == null) { %>
            <li><a href="registration.jsp">Student Registration</a></li>
            <li><a href="login.jsp">Login</a></li>
        <% } else { %>
            <li><a href="dashboard.jsp">Dashboard</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        <% } %>
        <li><a href="contact.jsp">Contact Us</a></li>
    </ul>
</nav>

    <main>
        <%
            String studentName = (String) session.getAttribute("studentName"); // Get student's name from session
            if (studentName != null) {
        %>
            <h2>Welcome, <%= studentName %>!</h2>
        <%
            } else {
        %>
            <h2>Welcome!</h2>
        <%
            }
        %>

        <h3>Available Notes:</h3>
        <div class="notes-list">
            <a href="https://drive.google.com/example1" target="_blank">Subject 1 - Notes</a>
            <a href="https://drive.google.com/example2" target="_blank">Subject 2 - Notes</a>
            <a href="https://drive.google.com/example3" target="_blank">Subject 3 - Notes</a>
            <a href="https://drive.google.com/example4" target="_blank">Subject 4 - Notes</a>
        </div>
    </main>

</body>
</html>
