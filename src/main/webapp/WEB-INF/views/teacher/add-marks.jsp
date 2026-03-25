<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Add Marks</title>
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
            <a href="/teacher/students" class="nav-item"><span class="nav-icon">👥</span> My Students</a>
            <a href="/teacher/marks/add" class="nav-item active"><span class="nav-icon">📝</span> Add Marks</a>
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
            <h1>Add <span>Marks</span></h1>
            <p>Enter marks for a student</p>
        </div>

        <div class="form-card">
            <form action="/teacher/marks/save" method="post">
                <div class="form-group">
                    <label>Select Student</label>
                    <select name="studentId" required>
                        <option value="">Select Student...</option>
                        <c:forEach var="student" items="${students}">
                            <option value="${student.id}">${student.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label>Subject</label>
                    <input type="text" name="subject"required/>
                </div>
                <div class="form-group">
                    <label>Marks (out of 100)</label>
                    <input type="number" name="marks" min="0" max="100"  required/>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn-save"> 💾 Save Marks </button>
                    <a href="/teacher/students" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </div>
    </main>
</body>
</html>