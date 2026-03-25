<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Add Notice</title>
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
            <h1>Add New <span>Notice</span></h1>
            <p>Post a notice for students and teachers</p>
        </div>

        <div class="form-card">
            <form action="/admin/notices/save" method="post">
                <div class="form-group">
                    <label>Notice Title</label>
                    <input type="text" name="title" placeholder="e.g. Holiday Notice" required/>
                </div>
                <div class="form-group">
                    <label>Message</label>
                    <textarea name="message" rows="5" placeholder="Write your notice here..." required
                        style="width:100%; background:var(--beige); border:1.5px solid var(--beige-dark); border-radius:12px; padding:13px 18px; font-size:15px; color:var(--text-dark); font-family:'Poppins',sans-serif; outline:none; resize:vertical; transition: all 0.2s;"
                        onfocus="this.style.borderColor='var(--blue-mid)'; this.style.background='var(--white)'; this.style.boxShadow='0 0 0 3px rgba(57,73,171,0.1)'"
                        onblur="this.style.borderColor='var(--beige-dark)'; this.style.background='var(--beige)'; this.style.boxShadow='none'"></textarea>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn-save">🔔 Post Notice</button>
                    <a href="/admin/notices" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </div>
    </main>
</body>
</html>