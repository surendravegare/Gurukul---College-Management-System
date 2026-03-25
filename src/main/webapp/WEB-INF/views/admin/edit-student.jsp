<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Edit Student</title>
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
            <a href="/admin/students" class="nav-item active"><span class="nav-icon">👥</span> Students</a>
            <a href="/admin/teachers" class="nav-item"><span class="nav-icon">👨‍🏫</span> Teachers</a>
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
            <h1>Edit <span>Student</span></h1>
            <p>Update student information</p>
        </div>

        <div class="form-card">
            <form action="/admin/students/update" method="post">

                <!-- Hidden ID -->
                <input type="hidden" name="id" value="${student.id}"/>

                <div class="form-divider">👤 Student Details</div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" name="name" value="${student.name}" required/>
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" name="phone" value="${student.phone}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" value="${student.email}" required/>
                </div>

                <div class="form-group">
                    <label>Course</label>
                 <select name="courseId" required>
                        <c:forEach var="course" items="${courses}">
                            <option value="${course.id}"
                                <c:if test="${course.id == student.course.id}">selected</c:if>>
                                ${course.courseName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-save">💾 Update Student</button>
                    <a href="/admin/students" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </div>
    </main>
</body>
</html>