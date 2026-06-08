<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - SMARTLEARN</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* Scoped styles just for the login card alignment */
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }
        .alert {
            padding: 10px 14px;
            margin-bottom: 15px;
            border-radius: 4px;
            font-size: 13px;
            width: 100%;
            box-sizing: border-box;
        }
        .alert-error {
            background-color: #fee2e2;
            color: #ef4444;
            border: 1px solid #fca5a5;
        }
        .alert-success {
            background-color: #d1fae5;
            color: #059669;
            border: 1px solid #6ee7b7;
        }
    </style>
</head>
<body class="dashboard-body">

<div class="navbar">
    <h2>SMARTLEARN Portal</h2>
</div>

<div class="login-container">
    <div class="card" style="width: 100%; max-width: 400px; padding: 30px;">
        <h2>Account Login</h2>
        <p style="color: #64748b; font-size: 14px; margin-top: -10px; margin-bottom: 20px;">
            Please enter your credentials to access your dashboard.
        </p>

        <%-- ================= DYNAMIC MESSAGES & ALERTS ================= --%>
        <%
            String error = request.getParameter("error");
            String success = request.getParameter("success");
            
            if ("invalid".equals(error)) {
        %>
            <div class="alert alert-error">Invalid email or password. Please try again.</div>
        <%
            } else if ("roleMismatch".equals(error)) {
        %>
            <div class="alert alert-error">The selected role does not match this account's registered type.</div>
        <%
            } else if ("role".equals(error)) {
        %>
            <div class="alert alert-error">System Error: Defined role has an unknown permission tier.</div>
        <%
            } else if ("system".equals(error)) {
        %>
            <div class="alert alert-error">A system exception occurred. Contact your administrator.</div>
        <%
            }
            
            if ("registered".equals(success)) {
        %>
            <div class="alert alert-success">Registration successful! You can now log in.</div>
        <%
            }
        %>

        <%-- ================= LOGIN FORM LAYER ================= --%>
        <form action="auth" method="post" autocomplete="off">
            
            <input type="hidden" name="action" value="login">

            <label for="email" style="font-weight: bold;">Email Address</label>
            <input type="email" id="email" name="email" placeholder="name@domain.com" required style="width:100%; padding:10px; margin-bottom:15px; border:1px solid #cbd5e1; border-radius:6px; box-sizing: border-box;">

            <label for="password" style="font-weight: bold;">Password</label>
            <input type="password" id="password" name="password" placeholder="••••••••" required style="width:100%; padding:10px; margin-bottom:15px; border:1px solid #cbd5e1; border-radius:6px; box-sizing: border-box;">

            <label for="role" style="font-weight: bold;">Select Your Portal Role</label>
            <select id="role" name="role" required style="width:100%; padding:10px; margin-bottom:20px; border:1px solid #cbd5e1; border-radius:6px; background-color: white; box-sizing: border-box;">
                <option value="" disabled selected>-- Choose Role --</option>
                <option value="student">Student</option>
                <option value="lecturer">Lecturer</option>
                <option value="admin">Administrator</option>
            </select>

            <button type="submit" class="join-btn" style="width: 100%; padding: 12px; font-size: 15px; text-align: center; justify-content: center;">
                Secure Login
            </button>
        </form>

        <hr style="border: 0; border-top: 1px solid #e2e8f0; margin: 25px 0; width: 100%;">

        <p style="font-size: 14px; color: #475569; margin: 0; text-align: center; width: 100%;">
            New to the portal? <a href="Register.jsp" style="color: #2563eb; text-decoration: none; font-weight: 600;">Create an account</a>
        </p>
    </div>
</div>

</body>
</html>