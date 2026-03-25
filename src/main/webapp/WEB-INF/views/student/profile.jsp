<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – My Profile</title>
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
            <a href="/student/profile" class="nav-item active"><span class="nav-icon">👤</span> My Profile</a>
            <a href="/student/marks" class="nav-item"><span class="nav-icon">📝</span> My Marks</a>
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
            <h1>My <span>Profile</span></h1>
            <p>Your personal information</p>
        </div>

        <div class="profile-card">
            <div class="profile-top">
                <div class="profile-avatar">${student.name.charAt(0)}</div>
                <div class="profile-name">
                    <h2>${student.name}</h2>
                    <span>🎓 Student</span>
                </div>
            </div>
            <div class="info-grid">
                <div class="info-item">
                    <label>Full Name</label>
                    <p>${student.name}</p>
                </div>
                <div class="info-item">
                    <label>Email</label>
                    <p>${student.email}</p>
                </div>
                <div class="info-item">
                    <label>Phone</label>
                    <p>${student.phone}</p>
                </div>
                <div class="info-item">
                    <label>Course</label>
                    <p>${student.course.courseName}</p>
                </div>
            </div>
        </div>
    </main>
</body>
</html>