<%@page import="model.User"%>
<%
    User user = (User) session.getAttribute("user");
    String role = (user != null) ? user.getRole() : null;
    String name = (user != null) ? user.getName() : null;
%>

<!DOCTYPE html>
<html>
<head>
    <title>SMARTLEARN</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="navbar">
    <h2>SMARTLEARN: CLOUD-NATIVE LEARNING MANAGEMENT SYSTEM</h2>
</div>

<div class="container">

    <div class="card">

        <!-- ================= AUTH SECTION ================= -->
        <% if (user == null) { %>

            <h2>Welcome, Guest</h2>

            <p>Please login or register to continue.</p>

            <a href="Login.jsp">
                <button class="login-btn">Login</button>
            </a>

            <a href="Register.jsp">
                <button class="register-btn">Register</button>
            </a>

        <% } else { %>

            <h2>Welcome, <%= name %> (<%= role %>)</h2>

            <a href="logout">
                <button class="logout-btn">Logout</button>
            </a>

            <br><br>

            <!-- ================= ROLE BASED MENU ================= -->

            <% if ("admin".equals(role) || "lecturer".equals(role)) { %>

                <a href="course-form.jsp">
                    <button class="create-btn">+ Create Course</button>
                </a>

                <a href="course-list.jsp">
                    <button class="manage-btn">Manage Courses</button>
                </a>

            <% } %>

            <% if ("student".equals(role)) { %>

                <a href="student-dashboard.jsp">
                    <button class="student-btn">My Courses</button>
                </a>

            <% } %>

            <% if ("lecturer".equals(role)) { %>

                <a href="lecturer-dashboard.jsp">
                    <button class="lecturer-btn">Lecturer Dashboard</button>
                </a>

            <% } %>

            <% if ("admin".equals(role)) { %>

                <a href="student-dashboard.jsp">
                    <button class="student-btn">Student Dashboard</button>
                </a>

            <% } %>

        <% } %>

    </div>

</div>

</body>
</html>