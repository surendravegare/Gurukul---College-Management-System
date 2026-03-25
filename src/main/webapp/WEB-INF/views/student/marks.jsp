<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – My Marks</title>
	<link rel="stylesheet" href="/static/css/style.css"/>
</head>
<body>
 <aside class="sidebar student">
        <div class="sidebar-logo">
            <a href="/student/dashboard">GURUKUL</a>
            <p>Student Panel</p>
        </div>
        <nav class="sidebar-nav">
            <div class="nav-label">Main</div>
            <a href="/student/dashboard" class="nav-item"><span class="nav-icon">📊</span> Dashboard</a>
            <div class="nav-label">My Info</div>
            <a href="/student/profile" class="nav-item"><span class="nav-icon">👤</span> My Profile</a>
            <a href="/student/marks" class="nav-item active"><span class="nav-icon">📝</span> My Marks</a>
			<a href="/student/notices" class="nav-item"><span class="nav-icon">🔔</span> Notices</a>
        </nav>
        <div class="sidebar-footer">
            <div class="user-info">
                <div class="user-avatar">S</div>
                <div class="user-details"><p>${userName}</p><span>Student</span></div>
            </div>
            <a href="/logout" class="btn-logout">🚪 Logout</a>
        </div>
    </aside>

    <main class="main">
        <div class="topbar">
            <h1>My <span>Marks</span></h1>
            <p>Your subject wise results</p>
        </div>

        <div class="table-section">
            <div class="table-header">
                <h3>Result Card</h3>
                <span class="total-badge">${marks.size()} Subjects</span>
            </div>
            <c:choose>
                <c:when test="${empty marks}">
                    <div class="empty-state">
                        <div>📝</div>
                        <p>No marks added yet by your teacher!</p>
                    </div>
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
                                        <span class="marks-badge
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
    </main>
</body>
</html>