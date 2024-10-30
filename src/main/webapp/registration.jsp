<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Information Portal - Student Registration</title>
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

        main form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        main form input {
            margin: 10px 0;
            padding: 10px;
            width: 80%;
            max-width: 400px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        main form input[type="submit"] {
            background-color: #1e90ff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        main form input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 20px;
            color: #ff0000;
        }

        .success {
            color: #28a745;
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
        <h2>Student Registration</h2>

        <%
            String message = null;
            Connection conn = null;
            PreparedStatement stmt = null;

            if (request.getMethod().equalsIgnoreCase("post")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String course = request.getParameter("course");

                String jdbcURL = "jdbc:mysql://localhost:3306/JavaAssignment"; 
                String dbUser = "root"; 
                String dbPass = "12345"; 

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

                    String sql = "INSERT INTO students (name, email, password, course) VALUES (?, ?, ?, ?)";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, name);
                    stmt.setString(2, email);
                    stmt.setString(3, password);
                    stmt.setString(4, course);
                    int rowsInserted = stmt.executeUpdate();

                    if (rowsInserted > 0) {
                        message = "success";
                    } else {
                        message = "Registration failed! Please try again.";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    message = "An error occurred: " + e.getMessage();
                } finally {
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            }
        %>

        <form action="" method="post">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="course" placeholder="Course" required>
            <input type="submit" value="Register">
        </form>

        <%
            if (message != null) {
                if (message.equals("success")) {
        %>
                    <div class="message success">Registration successful! Welcome!</div>
        <%
                } else {
        %>
                    <div class="message"><%= message %></div>
        <%
                }
            }
        %>
    </main>

</body>
</html>
