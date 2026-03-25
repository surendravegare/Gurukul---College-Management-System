<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Courses</title>
	<link rel="stylesheet" href="/static/css/style.css"/>
</head>
<body>

    <!-- SIDEBAR -->
    <aside class="sidebar admin">
        <div class="sidebar-logo">
            <a href="/admin/dashboard">GURUKUL</a>
            <p>Admin Panel</p>
        </div>
        <nav class="sidebar-nav">
            <div class="nav-label">Main</div>
            <a href="/admin/dashboard" class="nav-item">
                <span class="nav-icon">📊</span> Dashboard
            </a>
            <div class="nav-label">Manage</div>
            <a href="/admin/students" class="nav-item">
                <span class="nav-icon">👥</span> Students
            </a>
            <a href="/admin/teachers" class="nav-item">
                <span class="nav-icon">👨‍🏫</span> Teachers
            </a>
            <a href="/admin/courses" class="nav-item active">
                <span class="nav-icon">📚</span> Courses
            </a>
			<a href="/admin/notices" class="nav-item"><span class="nav-icon">🔔</span> Notices</a>
        </nav>
        <div class="sidebar-footer">
            <div class="user-info">
                <div class="user-avatar">A</div>
                <div class="user-details">
                    <p>${userName}</p>
                    <span>Admin</span>
                </div>
            </div>
            <a href="/logout" class="btn-logout">🚪 Logout</a>
        </div>
    </aside>

    <!-- MAIN -->
    <main class="main">
        <div class="topbar">
            <div>
                <h1>Manage <span>Courses</span></h1>
                <p>Add and manage all college courses</p>
            </div>
            <a href="/admin/courses/add" class="btn-add">＋ Add Course</a>
        </div>

        <div class="table-section">
            <div class="table-header">
                <h3>All Courses</h3>
                <span class="total-badge">
                    ${courses.size()} Courses
                </span>
            </div>

            <c:choose>
                <c:when test="${empty courses}">
                    <div class="empty-state">
                        <div>📚</div>
                        <p>No courses added yet. Click "Add Course" to get started!</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Course Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="course" items="${courses}" varStatus="i">
                                <tr>
                                    <td style="color:var(--muted)">${i.count}</td>
                                    <td>
                                        <span class="course-badge">
                                            📚 ${course.courseName}
                                        </span>
                                    </td>
                                    <td>
                                        <a href="/admin/courses/delete/${course.id}"
                                           class="btn-delete"
                                           onclick="return confirm('Delete this course?')">
                                            🗑️ Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

</body>
</html>