<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Students</title>
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
            <div>
                <h1>Manage <span>Students</span></h1>
                <p>Add and manage all students</p>
            </div>
            <a href="/admin/students/add" class="btn-add">＋ Add Student</a>
        </div>

        <div class="table-section">
            <div class="table-header">
                <h3>All Students</h3>
                <span class="total-badge">${students.size()} Students</span>
            </div>
            <c:choose>
                <c:when test="${empty students}">
                    <div class="empty-state">
                        <div>👥</div>
                        <p>No students added yet. Click "Add Student" to get started!</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Student</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Course</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="student" items="${students}" varStatus="i">
                                <tr>
                                    <td style="color:var(--muted)">${i.count}</td>
                                    <td>
                                        <div class="student-cell">
                                            <div class="student-avatar">
                                            </div>
                                            <span>${student.name}</span>
                                        </div>
                                    </td>
                                    <td style="color:var(--muted)">${student.email}</td>
                                    <td style="color:var(--muted)">${student.phone}</td>
                                    <td>
                                        <span class="course-badge">${student.course.courseName}</span>
                                    </td>
                                    <td>
                                        <div class="action-btns">
                                            <a href="/admin/students/edit/${student.id}" class="btn-edit">✏️ Edit</a>
                                            <a href="/admin/students/delete/${student.id}" class="btn-delete" onclick="return confirm('Delete this student?')">🗑️ Delete</a>
                                        </div>
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