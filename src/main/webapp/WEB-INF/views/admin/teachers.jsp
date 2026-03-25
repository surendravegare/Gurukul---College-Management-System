<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Teachers</title>
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
            <div>
                <h1>Manage <span>Teachers</span></h1>
                <p>Add and manage all teachers</p>
            </div>
            <a href="/admin/teachers/add" class="btn-add">＋ Add Teacher</a>
        </div>

        <div class="table-section">
            <div class="table-header">
                <h3>All Teachers</h3>
                <span class="total-badge">${teachers.size()} Teachers</span>
            </div>
            <c:choose>
                <c:when test="${empty teachers}">
                    <div class="empty-state">
                        <div>👨‍🏫</div>
                        <p>No teachers added yet. Click "Add Teacher" to get started!</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Teacher</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Course</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="teacher" items="${teachers}" varStatus="i">
                                <tr>
                                    <td style="color:var(--muted)">${i.count}</td>
                                    <td>
                                        <div class="teacher-cell">
                                            <div class="teacher-avatar">
                                            </div>
                                            <span>${teacher.name}</span>
                                        </div>
                                    </td>
                                    <td style="color:var(--muted)">${teacher.email}</td>
                                    <td style="color:var(--muted)">${teacher.phone}</td>
                                    <td>
                                        <span class="course-badge">${teacher.course.courseName}</span>
                                    </td>
                                    <td>
                                        <div class="action-btns">
                                            <a href="/admin/teachers/edit/${teacher.id}" class="btn-edit">✏️ Edit</a>
                                            <a href="/admin/teachers/delete/${teacher.id}" class="btn-delete" onclick="return confirm('Delete this teacher?')">🗑️ Delete</a>
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