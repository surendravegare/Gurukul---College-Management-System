<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Teacher Dashboard</title>
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
            <a href="/teacher/dashboard" class="nav-item active"><span class="nav-icon">📊</span> Dashboard</a>
            <div class="nav-label">Manage</div>
            <a href="/teacher/students" class="nav-item"><span class="nav-icon">👥</span> My Students</a>
            <a href="/teacher/marks/add" class="nav-item"><span class="nav-icon">📝</span> Add Marks</a>
			<a href="/teacher/marks" class="nav-item"><span class="nav-icon">📊</span> View Marks</a>
			<a href="/teacher/notices" class="nav-item"><span class="nav-icon">🔔</span> Notices</a>
			</nav>
        <div class="sidebar-footer">
            <div class="user-info">
                <div class="user-avatar">T</div>
                <div class="user-details">
                    <p>${userName}</p>
                    <span>Teacher</span>
                </div>
            </div>
            <a href="/logout" class="btn-logout">🚪 Logout</a>
        </div>
    </aside>

    <main class="main">
        <div class="topbar">
            <div>
                <h1>Teacher <span>Dashboard</span></h1>
                <p>Welcome back, ${userName}! 👨‍🏫</p>
            </div>
            <div class="welcome-badge">🏫 Gurukul Teacher Panel</div>
        </div>

        <div class="section-title">⚡ Quick Actions</div>
        <div class="actions-grid">
            <a href="/teacher/students" class="action-card">
                <div class="action-icon">👥</div>
                <div class="action-text">
                    <h3>My Students</h3>
                    <p>View all students</p>
                </div>
            </a>
            <a href="/teacher/marks/add" class="action-card">
                <div class="action-icon">📝</div>
                <div class="action-text">
                    <h3>Add Marks</h3>
                    <p>Enter student marks</p>
                </div>
            </a>
        </div>
    </main>
</body>
</html>