<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – View Marks</title>
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
            <a href="/teacher/marks/add" class="nav-item"><span class="nav-icon">📝</span> Add Marks</a>
            <a href="/teacher/marks" class="nav-item active"><span class="nav-icon">📊</span> View Marks</a>
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
                <h1>View <span class="purple">Marks</span></h1>
                <p>All students subject wise marks</p>
            </div>
            <a href="/teacher/marks/add" class="btn-add">📝 Add Marks</a>
        </div>

        <c:choose>
            <c:when test="${empty studentMarksMap}">
                <div class="table-section">
                    <div class="empty-state">
                        <div>📝</div>
                        <p>No marks added yet!</p>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="entry" items="${studentMarksMap}">
                    <div class="table-section" style="margin-bottom: 24px;">
                        <div class="table-header">
                            <div style="display:flex; align-items:center; gap:14px;">
                                <div class="row-avatar purple">${entry.key.name.charAt(0)}</div>
                                <div>
                                    <h3>${entry.key.name}</h3>
                                    <span style="font-size:13px; color:var(--text-muted);">${entry.key.email}</span>
                                </div>
                            </div>
                            <span class="total-badge blue">${entry.value.size()} Subjects</span>
                        </div>

                        <c:choose>
                            <c:when test="${empty entry.value}">
                                <div class="empty-state" style="padding: 30px;">
                                    <p>No marks added yet for this student!</p>
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
                                        <c:forEach var="mark" items="${entry.value}" varStatus="i">
                                            <tr>
                                                <td class="td-muted">${i.count}</td>
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
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </main>
</body>
</html>