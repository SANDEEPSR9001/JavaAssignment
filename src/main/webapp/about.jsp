<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Information Portal - About Us</title>
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
        max-width: 900px;
        text-align: left;
        margin: 40px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    main h2 {
        font-size: 2.2em;
        text-align: center;
        color: #1e90ff;
        margin-bottom: 20px;
    }

    .section-title {
        font-size: 1.5em;
        color: #1e90ff;
        margin-top: 20px;
        margin-bottom: 15px;
        border-bottom: 2px solid #1e90ff;
        padding-bottom: 5px;
    }

    p {
        font-size: 1.1em;
        color: #555;
        margin-bottom: 20px;
    }

    .vision, .mission, .quality-policy, .knowledge-wheel {
        margin-bottom: 25px;
        padding: 15px;
        border-left: 4px solid #1e90ff;
        background-color: #f9fbff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .vision p, .mission p, .quality-policy p, .knowledge-wheel p {
        margin-left: 10px;
    }

    .knowledge-wheel img {
        width: 100%;
        margin-top: 15px;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .knowledge-wheel p:last-child {
        margin-bottom: 0;
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
        <h2>About Us</h2>
        
        <div class="vision">
            <h3 class="section-title">Our Vision</h3>
            <p>
                Our vision is to create a knowledge-based society with a scientific temper, team spirit, and dignity of labor to face global competitive challenges.
            </p>
        </div>

        <div class="mission">
            <h3 class="section-title">Our Mission</h3>
            <p>
                Our mission is to evolve and develop skill-based systems for effective delivery of knowledge so as to equip young professionals with dedication and commitment to excellence in all spheres of life.
            </p>
        </div>

        <div class="quality-policy">
            <h3 class="section-title">Quality Policy</h3>
            <p>
                We believe in providing quality education through faculty development, updating of facilities, and continual improvement to meet norms laid down by UGC, keeping stakeholders satisfied.
            </p>
        </div>

        <div class="knowledge-wheel">
            <h3 class="section-title">Poornima Knowledge Wheel</h3>
            <p>
                At POORNIMA, the academic atmosphere is a rare blend of modern-day technical as well as soft skills and the traditional systems of learning processes, which are displayed in the knowledge wheel below.
            </p>
            <p>
                The inner circle denotes essential skills that are developed by the yearlong activities mentioned in the outer circle. All Poornimaiets follow the practices of the Poornima Knowledge Wheel for better careers. All teaching techniques, methodologies, and innovations are based on the Poornima Knowledge Wheel. The management of Poornima University ensures that faculty members transform philosophy into action.
            </p>
            <p>
                Over the years, students have been immensely benefited by it in their personal endeavors, skills, and while facing placement interviews. Tutor systems, Internet use, and talks by experts have provided an edge to students as well as faculty members in problem solving and global awareness. In addition, there is improvement in communication skills and ethical behavior. Orientation programs have made the Poornima family more disciplined and integrated to work as a team, a team member, and a leader.
            </p>
        </div>
    </main>

</body>
</html>
