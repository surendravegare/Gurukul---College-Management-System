<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Student Detail</title>
	<link rel="stylesheet" href="/static/css/style.css"/>

</head>
<body>
    <aside class="sidebar teacher">
        <div class="sidebar-logo">
            <a href="/teacher/dashboard">GURUKUL</a>
            <p>Teacher Panel</p>
        </div>
        <nav class="sidebar-nav">
            <div class="nav-label">Main</div>
            <a href="/teacher/dashboard" class="nav-item"><span class="nav-icon">📊</span> Dashboard</a>
            <div class="nav-label">Manage</div>
            <a href="/teacher/students" class="nav-item active"><span class="nav-icon">👥</span> My Students</a>
            <a href="/teacher/marks/add" class="nav-item"><span class="nav-icon">📝</span> Add Marks</a>
			<a href="/teacher/marks" class="nav-item"><span class="nav-icon">📊</span> View Marks</a>
			<a href="/teacher/notices" class="nav-item"><span class="nav-icon">🔔</span> Notices</a>
			 </nav>
        <div class="sidebar-footer">
            <div class="user-info">
                <div class="user-avatar">T</div>
                <div class="user-details"><p>${userName}</p><span>Teacher</span></div>
            </div>
            <a href="/logout" class="btn-logout">🚪 Logout</a>
        </div>
    </aside>

    <main class="main">
        <div class="topbar">
            <div>
                <h1>Student <span>Detail</span></h1>
                <p>Full info and marks</p>
            </div>
            <a href="/teacher/students" class="btn-back">← Back to Students</a>
        </div>

        <div class="content-grid">

            <!-- Left: Profile Card -->
            <div class="profile-card">
                <div class="profile-top">
                    <div class="profile-avatar">${student.name.charAt(0)}</div>
                    <div class="profile-name">
                        <h2>${student.name}</h2>
                        <span>🎓 Student</span>
                    </div>
                </div>
                <div class="info-list">
                    <div class="info-row">
                        <label>Email</label>
                        <p>${student.email}</p>
                    </div>
                    <div class="info-row">
                        <label>Phone</label>
                        <p>${student.phone}</p>
                    </div>
                    <div class="info-row">
                        <label>Course</label>
                        <p>${student.course.courseName}</p>
                    </div>
                </div>
            </div>

            <!-- Right: Marks Table -->
            <div class="marks-section">
                <div class="marks-header">
                    <h3>📝 Marks</h3>
                    <span class="marks-badge-count">${marks.size()} Subjects</span>
                </div>
                <c:choose>
                    <c:when test="${empty marks}">
                        <div class="empty-state">No marks added yet!</div>
                    </c:when>
                    <c:otherwise>
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Subject</th>
                                    <th>Marks</th>
                                    <th>Grade</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="mark" items="${marks}" varStatus="i">
                                    <tr>
                                        <td style="color:var(--muted)">${i.count}</td>
                                        <td>${mark.subject}</td>
                                        <td>
                                            <span class="marks-pill
                                                <c:choose>
                                                    <c:when test="${mark.marks >= 75}">marks-high</c:when>
                                                    <c:when test="${mark.marks >= 50}">marks-mid</c:when>
                                                    <c:otherwise>marks-low</c:otherwise>
                                                </c:choose>">
                                                ${mark.marks} / 100
                                            </span>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${mark.marks >= 90}">🏆 A+</c:when>
                                                <c:when test="${mark.marks >= 75}">⭐ A</c:when>
                                                <c:when test="${mark.marks >= 60}">✅ B</c:when>
                                                <c:when test="${mark.marks >= 50}">📘 C</c:when>
                                                <c:otherwise>❌ Fail</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </main>
</body>
</html>