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
            <a href="/admin/teachers" class="nav-item"><span class="nav-icon">👨‍🏫</span> Teachers</a>
            <a href="/admin/courses" class="nav-item"><span class="nav-icon">📚</span> Courses</a>
            <a href="/admin/notices" class="nav-item active"><span class="nav-icon">🔔</span> Notices</a>
					
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
                <h1>Notice <span>Board</span></h1>
                <p>Post and manage notices</p>
            </div>
            <a href="/admin/notices/add" class="btn-add">＋ Add Notice</a>
        </div>

        <div class="table-section">
            <div class="table-header">
                <h3>All Notices</h3>
                <span class="total-badge orange">${notices.size()} Notices</span>
            </div>
            <c:choose>
                <c:when test="${empty notices}">
                    <div class="empty-state">
                        <div>🔔</div>
                        <p>No notices posted yet!</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="padding: 20px; display: flex; flex-direction: column; gap: 16px;">
                        <c:forEach var="notice" items="${notices}">
                            <div class="notice-card">
                                <div class="notice-top">
                                    <div>
                                        <h3 class="notice-title">${notice.title}</h3>
                                        <span class="notice-date">🕐 ${notice.createdAt}</span>
                                    </div>
                                    <a href="/admin/notices/delete/${notice.id}" 
                                       class="btn-delete"
                                       onclick="return confirm('Delete this notice?')">
                                       🗑️ Delete
                                    </a>
                                </div>
                                <p class="notice-message">${notice.message}</p>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</body>
</html>