<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Information Portal - Contact Us</title>
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
            max-width: 800px;
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

        main p {
            font-size: 1.1em;
            line-height: 1.6;
            margin-bottom: 20px;
            color: #555;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        form input, form textarea {
            margin: 10px 0;
            padding: 10px;
            width: 80%;
            max-width: 400px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form input[type="submit"] {
            background-color: #1e90ff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        form input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .contact-details {
            margin-top: 20px;
            font-size: 1em;
            color: #333;
        }

        .success-message {
            color: green;
            margin: 15px 0;
        }

        .error-message {
            color: red;
            margin: 15px 0;
        }
    </style>
</head>
<body>

<%
    String message = "";
    String errorMessage = "";
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String userMessage = request.getParameter("message");

    if (request.getMethod().equalsIgnoreCase("POST")) {
        if (name != null && email != null && userMessage != null) {
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JavaAssignment", "root", "12345");
                String sql = "INSERT INTO contact_queries (name, email, message) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, userMessage);
                pstmt.executeUpdate();
                message = "Thank you for your message! We will get back to you shortly.";
            } catch (Exception e) {
                errorMessage = "There was an error while processing your request. Please try again later.";
                e.printStackTrace();
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        } else {
            errorMessage = "All fields are required.";
        }
    }
%>

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
    <h2>Contact Us</h2>
    <p>If you have any queries or feedback, please fill out the form below:</p>
    
    <form action="contact.jsp" method="post">
        <input type="text" name="name" placeholder="Your Name" required>
        <input type="email" name="email" placeholder="Your Email" required>
        <textarea name="message" placeholder="Your Message" rows="5" required></textarea>
        <input type="submit" value="Send Message">
    </form>

    <%
        if (!message.isEmpty()) {
            out.println("<div class='success-message'>" + message + "</div>");
        }
        if (!errorMessage.isEmpty()) {
            out.println("<div class='error-message'>" + errorMessage + "</div>");
        }
    %>

    <div class="contact-details">
        <p>IS-2027-2031, Ramchandrapura, P.O. Vidhani Vatika, Sitapura Extension, Jaipur, Rajasthan (India) 303905.</p>
        <p>Email: info@poornima.edu.in</p>
        <p>Phone: +91-8875 666 618 | +91-8875 666 617</p>
    </div>
</main>

</body>
</html>
