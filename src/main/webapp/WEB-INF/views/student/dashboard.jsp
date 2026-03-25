<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Student Dashboard</title>
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
            <a href="/student/dashboard" class="nav-item active"><span class="nav-icon">📊</span> Dashboard</a>
            <div class="nav-label">My Info</div>
            <a href="/student/profile" class="nav-item"><span class="nav-icon">👤</span> My Profile</a>
            <a href="/student/marks" class="nav-item"><span class="nav-icon">📝</span> My Marks</a>
			<a href="/student/notices" class="nav-item"><span class="nav-icon">🔔</span> Notices</a>
        </nav>
        <div class="sidebar-footer">
            <div class="user-info">
                <div class="user-avatar">S</div>
                <div class="user-details">
                    <p>${userName}</p>
                    <span>Student</span>
                </div>
            </div>
            <a href="/logout" class="btn-logout">🚪 Logout</a>
        </div>
    </aside>

    <main class="main">
        <div class="topbar">
            <div>
                <h1>Student <span>Dashboard</span></h1>
                <p>Welcome back, ${userName}! 🎓</p>
            </div>
            <div class="welcome-badge">🏫 Gurukul Student Panel</div>
        </div>

        <div class="section-title">⚡ Quick Actions</div>
        <div class="actions-grid">
            <a href="/student/profile" class="action-card">
                <div class="action-icon">👤</div>
                <div class="action-text">
                    <h3>My Profile</h3>
                    <p>View your details</p>
                </div>
            </a>
            <a href="/student/marks" class="action-card">
                <div class="action-icon">📝</div>
                <div class="action-text">
                    <h3>My Marks</h3>
                    <p>Check your results</p>
                </div>
            </a>
        </div>
    </main>
</body>
</html>