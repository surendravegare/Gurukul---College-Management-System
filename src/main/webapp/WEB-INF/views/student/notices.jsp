<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Notices</title>
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
            <a href="/student/marks" class="nav-item"><span class="nav-icon">📝</span> My Marks</a>
            <a href="/student/notices" class="nav-item active"><span class="nav-icon">🔔</span> Notices</a>
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
            <div>
                <h1>Notice <span class="teal">Board</span></h1>
                <p>Latest notices from Admin</p>
            </div>
        </div>

        <c:choose>
            <c:when test="${empty notices}">
                <div class="table-section">
                    <div class="empty-state">
                        <div>🔔</div>
                        <p>No notices posted yet!</p>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div style="display: flex; flex-direction: column; gap: 16px;">
                    <c:forEach var="notice" items="${notices}">
                        <div class="notice-card">
                            <div class="notice-top">
                                <h3 class="notice-title">${notice.title}</h3>
                                <span class="notice-date">🕐 ${notice.createdAt}</span>
                            </div>
                            <p class="notice-message">${notice.message}</p>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </main>
</body>
</html>