<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<!-- Yeh add karo <head> mein -->
	<link rel="stylesheet" href="/static/css/style.css"/>
    <title>Gurukul – Add Course</title>
</head>
<body>
	<c:if test="${not empty error}">
	    <div style="background: linear-gradient(135deg,#ffebee,#ffcdd2); border: 1px solid #ef9a9a; border-radius: 12px; padding: 14px 18px; font-size: 14px; color: #c62828; margin-bottom: 20px; font-weight: 500;">
	        ⚠️ ${error}
	    </div>
	</c:if>
    <!-- SIDEBAR -->
      <aside class="sidebar admin">
        <div class="sidebar-logo">
            <a href="/admin/dashboard">GURUKUL</a>
            <p>Admin Panel</p>
        </div>
        <nav class="sidebar-nav">
            <div class="nav-label">Main</div>
            <a href="/admin/dashboard" class="nav-item">
                <span class="nav-icon">📊</span> Dashboard
            </a>
            <div class="nav-label">Manage</div>
            <a href="/admin/students" class="nav-item">
                <span class="nav-icon">👥</span> Students
            </a>
            <a href="/admin/teachers" class="nav-item">
                <span class="nav-icon">👨‍🏫</span> Teachers
            </a>
            <a href="/admin/courses" class="nav-item active">
                <span class="nav-icon">📚</span> Courses
            </a>
			<a href="/admin/notices" class="nav-item"><span class="nav-icon">🔔</span> Notices </a>
        </nav>
        <div class="sidebar-footer">
            <div class="user-info">
                <div class="user-avatar">A</div>
                <div class="user-details">
                    <p>${userName}</p>
                    <span>Admin</span>
                </div>
            </div>
            <a href="/logout" class="btn-logout">🚪 Logout</a>
        </div>
    </aside>

    <!-- MAIN -->
    <main class="main">
        <div class="topbar">
            <h1>Add New <span>Course</span></h1>
            <p>Fill in the details to add a new course</p>
        </div>

        <div class="form-card">
            <form action="/admin/courses/save" method="post">
                <div class="form-group">
                    <label>Course Name</label>
                    <input type="text"
                           name="courseName"
                           placeholder="e.g. Computer Science"
                           required/>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn-save">💾 Save Course</button>
                    <a href="/admin/courses" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </div>
    </main>

</body>
</html>