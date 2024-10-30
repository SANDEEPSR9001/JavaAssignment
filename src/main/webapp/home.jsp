<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Information Portal - Home</title>
    <style>
        /* Reset margin and padding */
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
        <div class="info-section">
        <img src="https://cache.careers360.mobi/media/colleges/social-media/media-gallery/1032/2018/4/27/Poornima-University-Jaipur-(8)1.jpg" alt="Poornima University Campus">
        <h2>About Poornima University</h2>
        <p>
            Poornima University, established in 2012, is a prominent educational institution located in Jaipur, Rajasthan. It aims to provide quality education that prepares students for the competitive world. The university is recognized for its commitment to academic excellence, innovative teaching methods, and a focus on holistic development.
        </p>
        <p>
            The campus is equipped with modern infrastructure, including well-equipped laboratories, libraries, and spacious classrooms. The university offers a wide range of undergraduate and postgraduate programs across various disciplines, including engineering, management, and design. This diversity enables students to choose programs that align with their interests and career aspirations.
        </p>
        <p>
            One of the university's key strengths is its emphasis on research and innovation. Faculty members engage in various research projects, encouraging students to participate and contribute to new knowledge. This approach not only enhances the learning experience but also helps students develop critical thinking and problem-solving skills.
        </p>
        <p>
            Poornima University fosters a vibrant campus life, with numerous clubs, events, and extracurricular activities. These activities allow students to explore their passions outside of academics and build lasting friendships. The university also encourages students to participate in national and international competitions, enhancing their exposure and experience.
        </p>
        <p>
           In addition to academics, Poornima University places great importance on character building and ethical values. The institution aims to develop responsible citizens who contribute positively to society. By focusing on both academic and personal growth, Poornima University prepares its students to face future challenges confidently.
        </p>
        <p>
           Overall, Poornima University stands out as a center of learning that promotes academic excellence, innovation, and holistic development, making it a preferred choice for aspiring students.
        </p>
    </div>
    </main>

</body>
</html>
