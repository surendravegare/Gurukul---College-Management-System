<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gurukul – Admin Dashboard</title>
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
            <a href="/admin/dashboard" class="nav-item active"><span class="nav-icon">📊</span> Dashboard</a>
            <div class="nav-label">Manage</div>
            <a href="/admin/students" class="nav-item"><span class="nav-icon">👥</span> Students</a>
            <a href="/admin/teachers" class="nav-item"><span class="nav-icon">👨‍🏫</span> Teachers</a>
            <a href="/admin/courses" class="nav-item"><span class="nav-icon">📚</span> Courses</a>
            <a href="/admin/notices" class="nav-item"><span class="nav-icon">🔔</span> Notices</a>
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
                <h1>Admin <span>Dashboard</span></h1>
                <p>Welcome back, ${userName}! 👑</p>
            </div>
            <div class="welcome-badge admin">🏫 Gurukul Admin Panel</div>
        </div>

        <!-- Stats — 4 cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon orange">👥</div>
                <div class="stat-info">
                    <p>Total Students</p>
                    <h2>${totalStudents}</h2>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon blue">👨‍🏫</div>
                <div class="stat-info">
                    <p>Total Teachers</p>
                    <h2>${totalTeachers}</h2>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon green">📚</div>
                <div class="stat-info">
                    <p>Total Courses</p>
                    <h2>${totalCourses}</h2>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon gold">🔔</div>
                <div class="stat-info">
                    <p>Total Notices</p>
                    <h2>${totalNotices}</h2>
                </div>
            </div>
        </div>

        <!-- Charts — stats ke neeche -->
        <div class="charts-row">
            <div class="chart-card">
                <h3 class="chart-title">📊 Overview</h3>
                <div class="chart-wrapper">
                    <canvas id="overviewChart"></canvas>
                </div>
            </div>
            <div class="chart-card">
                <h3 class="chart-title">📈 Statistics</h3>
                <div class="chart-wrapper">
                    <canvas id="barChart"></canvas>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="section-title">⚡ Quick Actions</div>
        <div class="actions-grid">
            <a href="/admin/students" class="action-card">
                <div class="action-icon orange">👥</div>
                <div class="action-text"><h3>View Students</h3><p>See all students</p></div>
            </a>
            <a href="/admin/students/add" class="action-card">
                <div class="action-icon blue">➕</div>
                <div class="action-text"><h3>Add Student</h3><p>Enroll new student</p></div>
            </a>
            <a href="/admin/teachers" class="action-card">
                <div class="action-icon purple">👨‍🏫</div>
                <div class="action-text"><h3>View Teachers</h3><p>See all teachers</p></div>
            </a>
            <a href="/admin/teachers/add" class="action-card">
                <div class="action-icon green">➕</div>
                <div class="action-text"><h3>Add Teacher</h3><p>Add new teacher</p></div>
            </a>
            <a href="/admin/courses" class="action-card">
                <div class="action-icon teal">📚</div>
                <div class="action-text"><h3>View Courses</h3><p>Manage courses</p></div>
            </a>
            <a href="/admin/courses/add" class="action-card">
                <div class="action-icon orange">➕</div>
                <div class="action-text"><h3>Add Course</h3><p>Create new course</p></div>
            </a>
        </div>

    </main>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx1 = document.getElementById('overviewChart').getContext('2d');
        new Chart(ctx1, {
            type: 'doughnut',
            data: {
                labels: ['Students', 'Teachers', 'Courses', 'Notices'],
                datasets: [{
                    data: [${totalStudents}, ${totalTeachers}, ${totalCourses}, ${totalNotices}],
                    backgroundColor: ['#3949ab', '#7b1fa2', '#f4631e', '#f7b731'],
                    borderWidth: 0,
                    hoverOffset: 8
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: { padding: 16, font: { family: 'Poppins', size: 13 }, color: '#4a4a6a' }
                    }
                },
                cutout: '65%'
            }
        });

        const ctx2 = document.getElementById('barChart').getContext('2d');
        new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: ['Students', 'Teachers', 'Courses', 'Notices'],
                datasets: [{
                    label: 'Total Count',
                    data: [${totalStudents}, ${totalTeachers}, ${totalCourses}, ${totalNotices}],
                    backgroundColor: ['rgba(57,73,171,0.8)', 'rgba(123,31,162,0.8)', 'rgba(244,99,30,0.8)', 'rgba(247,183,49,0.8)'],
                    borderRadius: 10,
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: { stepSize: 1, font: { family: 'Poppins' }, color: '#7f8fa6' },
                        grid: { color: 'rgba(0,0,0,0.05)' }
                    },
                    x: {
                        ticks: { font: { family: 'Poppins' }, color: '#7f8fa6' },
                        grid: { display: false }
                    }
                }
            }
        });
    </script>

</body>
</html>