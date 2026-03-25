<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Add Teacher</title>
	<link rel="stylesheet" href="/static/css/style.css"/>
</head>
<body>
  <aside class="sidebar admin">
        <div class="sidebar-logo">
            <a href="/admin/dashboard">GURUKUL</a>
            <p>Admin Panel</p>
        </div>
        <nav class="sidebar-nav">
            <div class="nav-label">Main</div>
            <a href="/admin/dashboard" class="nav-item"><span class="nav-icon">📊</span> Dashboard</a>
            <div class="nav-label">Manage</div>
            <a href="/admin/students" class="nav-item"><span class="nav-icon">👥</span> Students</a>
            <a href="/admin/teachers" class="nav-item active"><span class="nav-icon">👨‍🏫</span> Teachers</a>
            <a href="/admin/courses" class="nav-item"><span class="nav-icon">📚</span> Courses</a>
			<a href="/admin/notices" class="nav-item"><span class="nav-icon">🔔</span> Notices</a>
        </nav>
        <div class="sidebar-footer">
            <div class="user-info">
                <div class="user-avatar">A</div>
                <div class="user-details"><p>${userName}</p><span>Admin</span></div>
            </div>
            <a href="/logout" class="btn-logout">🚪 Logout</a>
        </div>
    </aside>

    <main class="main">
        <div class="topbar">
            <h1>Add New <span>Teacher</span></h1>
            <p>Fill in the details to add a new teacher</p>
        </div>

        <div class="form-card">
            <form action="/admin/teachers/save" method="post">

                <div class="form-divider">👨‍🏫 Teacher Details</div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" name="name" placeholder="e.g. Priya Sharma" required/>
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" name="phone" placeholder="e.g. 9876543210"/>
                    </div>
                </div>

                <div class="form-group">
                    <label>Course</label>
                    <select name="course.id" required>
                        <option value="">Select Course...</option>
                        <c:forEach var="course" items="${courses}">
                            <option value="${course.id}">${course.courseName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-divider">🔐 Login Credentials</div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" placeholder="teacher@gurukul.com" required/>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" placeholder="Set password" required/>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-save">💾 Save Teacher</button>
                    <a href="/admin/teachers" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </div>
    </main>
</body>
</html>