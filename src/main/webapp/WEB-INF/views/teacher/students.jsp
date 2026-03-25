<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – My Students</title>
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
                <h1>My <span>Students</span></h1>
                <p>All students in your class</p>
            </div>
            <a href="/teacher/marks/add" class="btn-add">📝 Add Marks</a>
        </div>

        <div class="table-section">
            <div class="table-header">
                <h3>Student List</h3>
                <span class="total-badge">${students.size()} Students</span>
            </div>
            <c:choose>
                <c:when test="${empty students}">
                    <div class="empty-state">
                        <div>👥</div>
                        <p>No students found!</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Student</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Course</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach var="student" items="${students}" varStatus="i">
							    <tr style="cursor:pointer" onclick="window.location='/teacher/student/${student.id}'">
							        <td style="color:var(--muted)">${i.count}</td>
							        <td>
							            <div class="student-cell">
							                <span>${student.name}</span>
							            </div>
							        </td>
							        <td style="color:var(--muted)">${student.email}</td>
							        <td style="color:var(--muted)">${student.phone}</td>
							        <td><span class="course-badge">${student.course.courseName}</span></td>
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