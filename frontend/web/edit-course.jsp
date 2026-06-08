<%@page import="model.User"%>
<%@page import="dao.CourseDAO"%>
<%@page import="model.Course"%>

<%
// 1. SEMAK SESSION: Wajib ada untuk elakkan kena kick atau security bypass
User user = (User) session.getAttribute("user");

if (user == null || (!"admin".equals(user.getRole()) && !"lecturer".equalsIgnoreCase(user.getRole()))) {
    response.sendRedirect("Login.jsp");
    return;
}

// 2. AMBIL DATA COURSE BERDASARKAN ID
int id = Integer.parseInt(request.getParameter("id"));
CourseDAO dao = new CourseDAO();
Course course = dao.getCourseById(id);

// 3. FIX: Sediakan URL Cancel dinamik mengikut role user yang sedang login
String cancelUrl = request.getContextPath() + "/course-list.jsp"; // Default untuk Admin
if (user != null && "lecturer".equalsIgnoreCase(user.getRole())) {
    cancelUrl = request.getContextPath() + "/lecturer-dashboard.jsp"; // Untuk Lecturer
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Course</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="edit-course-body">

<div class="navbar">
    <h2>Edit Course</h2>
</div>

<div class="container">
    <div class="edit-course-card">

        <form action="<%=request.getContextPath()%>/CourseServlet" method="post">

            <input type="hidden" name="action" value="update">
            <input type="hidden" name="courseId" value="<%=course.getCourseId()%>">

            <label>Title</label>
            <input type="text" name="title" value="<%=course.getTitle()%>" required>

            <label>Description</label>
            <textarea name="description" rows="5" required><%=course.getDescription()%></textarea>

            <label>Course Code</label>
            <input type="text" name="courseCode" value="<%=course.getCourseCode()%>" required>

            <div class="button-group">
                <button type="submit">Update Course</button>
                <a href="<%=cancelUrl%>" class="edit-course-back-link">Cancel</a>
            </div>
        </form>

    </div>
</div>

</body>
</html>