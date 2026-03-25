<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Gurukul – Login</title>

		<style>
			:root {
				--blue-dark: #1a237e;
				--blue-mid: #3949ab;
				--blue-light: #5c6bc0;
				--blue-soft: #e8eaf6;
				--cream: #fdf6ec;
				--beige: #f5ebe0;
				--beige-dark: #e8d5b7;
				--orange: #f4631e;
				--gold: #f7b731;
				--white: #ffffff;
				--text-dark: #1a1a2e;
				--text-muted: #7f8fa6;
				--error: #c62828;
				--blue-glow: rgba(26, 35, 126, 0.28);
			}

			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
			}

			body {
				font-family: 'Poppins', sans-serif;
				background: linear-gradient(135deg, #e8eaf6 0%, #fdf6ec 50%, #fce4ec 100%);
				color: var(--text-dark);
				min-height: 100vh;
				display: flex;
				flex-direction: column;
			}

			/* ── Blobs BG ── */
			.bg {
				position: fixed;
				inset: 0;
				z-index: 0;
				pointer-events: none;
			}

			.bg::before {
				content: '';
				position: absolute;
				top: -200px;
				right: -200px;
				width: 600px;
				height: 600px;
				background: radial-gradient(circle, rgba(57, 73, 171, 0.09) 0%, transparent 70%);
				border-radius: 50%;
				animation: pulse 7s ease-in-out infinite;
			}

			.bg::after {
				content: '';
				position: absolute;
				bottom: -200px;
				left: -200px;
				width: 500px;
				height: 500px;
				background: radial-gradient(circle, rgba(244, 99, 30, 0.07) 0%, transparent 70%);
				border-radius: 50%;
				animation: pulse 9s ease-in-out infinite reverse;
			}

			@keyframes pulse {

				0%,
				100% {
					transform: scale(1);
					opacity: 0.5;
				}

				50% {
					transform: scale(1.1);
					opacity: 1;
				}
			}

			.mandala {
				position: absolute;
				top: 50%;
				left: 50%;
				width: 800px;
				height: 800px;
				opacity: 0.04;
				animation: spin 70s linear infinite;
			}

			@keyframes spin {
				from {
					transform: translate(-50%, -50%) rotate(0deg);
				}

				to {
					transform: translate(-50%, -50%) rotate(360deg);
				}
			}

			/* ── NAVBAR ── */
			.navbar {
				position: relative;
				z-index: 10;
				display: flex;
				align-items: center;
				justify-content: space-between;
				padding: 18px 56px;
				background: rgba(255, 255, 255, 0.72);
				backdrop-filter: blur(18px);
				border-bottom: 1px solid rgba(57, 73, 171, 0.12);
				box-shadow: 0 2px 16px rgba(26, 35, 126, 0.07);
			}

			.logo {
				font-family: 'Cinzel', serif;
				font-size: 22px;
				font-weight: 900;
				letter-spacing: 0.12em;
				background: linear-gradient(135deg, var(--blue-dark), var(--blue-mid), var(--blue-light));
				-webkit-background-clip: text;
				-webkit-text-fill-color: transparent;
				text-decoration: none;
			}

			.nav-back {
				color: var(--text-muted);
				text-decoration: none;
				font-size: 13px;
				font-weight: 500;
				transition: color 0.2s;
			}

			.nav-back:hover {
				color: var(--blue-dark);
			}

			/* ── LOGIN WRAPPER ── */
			.login-wrapper {
				position: relative;
				z-index: 1;
				flex: 1;
				display: flex;
				align-items: center;
				justify-content: center;
				padding: 40px 20px;
			}

			/* ── LOGIN CARD ── */
			.login-card {
				background: var(--white);
				border: 1px solid rgba(57, 73, 171, 0.14);
				border-radius: 24px;
				padding: 48px 44px;
				width: 100%;
				max-width: 440px;
				box-shadow: 0 20px 60px rgba(26, 35, 126, 0.13);
				animation: fadeUp 0.6s ease;
			}

			@keyframes fadeUp {
				from {
					opacity: 0;
					transform: translateY(24px);
				}

				to {
					opacity: 1;
					transform: translateY(0);
				}
			}

			/* Card Top */
			.card-top {
				text-align: center;
				margin-bottom: 36px;
			}

			.card-icon {
				width: 60px;
				height: 60px;
				background: linear-gradient(135deg, var(--blue-soft), #c5cae9);
				border: 1px solid #9fa8da;
				border-radius: 16px;
				display: flex;
				align-items: center;
				justify-content: center;
				font-size: 26px;
				margin: 0 auto 16px;
				box-shadow: 0 4px 16px rgba(26, 35, 126, 0.12);
			}

			.card-top h2 {
				font-family: 'Cinzel', serif;
				font-size: 24px;
				font-weight: 700;
				color: var(--blue-dark);
				margin-bottom: 6px;
			}

			.card-top p {
				font-size: 14px;
				color: var(--text-muted);
			}

			/* Divider */
			.divider {
				width: 60px;
				height: 2px;
				background: linear-gradient(90deg, transparent, var(--gold), transparent);
				margin: 0 auto 32px;
				border-radius: 2px;
			}

			/* Form */
			.form-group {
				margin-bottom: 20px;
			}

			.form-group label {
				display: block;
				font-size: 12px;
				font-weight: 600;
				color: var(--blue-dark);
				text-transform: uppercase;
				letter-spacing: 0.08em;
				margin-bottom: 8px;
			}

			.form-group input {
				width: 100%;
				background: var(--beige);
				border: 1.5px solid var(--beige-dark);
				border-radius: 12px;
				padding: 14px 18px;
				font-size: 15px;
				color: var(--text-dark);
				font-family: 'Poppins', sans-serif;
				outline: none;
				transition: all 0.2s;
			}

			.form-group input:focus {
				border-color: var(--blue-mid);
				background: var(--white);
				box-shadow: 0 0 0 3px rgba(57, 73, 171, 0.10);
			}

			.form-group input::placeholder {
				color: #b0a898;
			}

			/* Error */
			.error-msg {
				background: linear-gradient(135deg, #ffebee, #ffcdd2);
				border: 1px solid #ef9a9a;
				border-radius: 10px;
				padding: 12px 16px;
				font-size: 14px;
				color: var(--error);
				margin-bottom: 20px;
				text-align: center;
				font-weight: 500;
			}

			/* Submit */
			.btn-submit {
				width: 100%;
				background: linear-gradient(135deg, var(--blue-dark), var(--blue-mid));
				color: white;
				border: none;
				padding: 15px;
				border-radius: 12px;
				font-size: 16px;
				font-weight: 600;
				font-family: 'Poppins', sans-serif;
				cursor: pointer;
				box-shadow: 0 6px 20px var(--blue-glow);
				transition: all 0.2s;
				margin-top: 8px;
				letter-spacing: 0.03em;
			}

			.btn-submit:hover {
				transform: translateY(-2px);
				box-shadow: 0 10px 32px var(--blue-glow);
			}

			/* Roles Hint */
			.roles-hint {
				display: flex;
				justify-content: center;
				gap: 16px;
				margin-top: 28px;
				padding-top: 24px;
				border-top: 1.5px solid var(--beige-dark);
			}

			.role-chip {
				font-size: 12px;
				color: var(--text-muted);
				display: flex;
				align-items: center;
				gap: 5px;
				font-weight: 500;
			}

			.role-dot {
				width: 7px;
				height: 7px;
				border-radius: 50%;
			}

			.dot-admin {
				background: var(--blue-dark);
			}

			.dot-teacher {
				background: #7b1fa2;
			}

			.dot-student {
				background: #006064;
			}

			/* Responsive */
			@media (max-width: 500px) {
				.login-card {
					padding: 36px 24px;
				}

				.navbar {
					padding: 16px 20px;
				}
			}
		</style>
	</head>

	<body>

		<!-- Background -->
		<div class="bg">
			<svg class="mandala" viewBox="0 0 500 500" fill="none">
				<g stroke="#FF9933" stroke-width="0.5">
					<circle cx="250" cy="250" r="240" />
					<circle cx="250" cy="250" r="200" />
					<circle cx="250" cy="250" r="160" />
					<circle cx="250" cy="250" r="120" />
					<circle cx="250" cy="250" r="80" />
					<circle cx="250" cy="250" r="40" />
					<ellipse cx="250" cy="50" rx="18" ry="40" />
					<ellipse cx="250" cy="450" rx="18" ry="40" />
					<ellipse cx="50" cy="250" rx="40" ry="18" />
					<ellipse cx="450" cy="250" rx="40" ry="18" />
					<line x1="250" y1="10" x2="250" y2="490" />
					<line x1="10" y1="250" x2="490" y2="250" />
					<line x1="74" y1="74" x2="426" y2="426" />
					<line x1="426" y1="74" x2="74" y2="426" />
				</g>
			</svg>
		</div>

		<!-- NAVBAR -->
		<nav class="navbar">
			<a href="/" class="logo">GURUKUL</a>
			<a href="/" class="nav-back">← Back to Home</a>
		</nav>

		<!-- LOGIN FORM -->
		<div class="login-wrapper">
			<div class="login-card">

				<div class="card-top">
					<div class="card-icon">🔐</div>
					<h2>Welcome Back</h2>
					<p>Login to your Gurukul portal</p>
				</div>

				<div class="divider"></div>

				<!-- Error Message -->
				<% if (request.getAttribute("error") !=null) { %>
					<div class="error-msg">
						⚠️ <%= request.getAttribute("error") %>
					</div>
					<% } %>

						<!-- Form -->
						<form action="/login" method="post">
							<div class="form-group">
								<label>Email Address</label>
								<input type="email" name="email" placeholder="Enter your email" required />
							</div>

							<div class="form-group">
								<label>Password</label>
								<input type="password" name="password" placeholder="Enter your password" required />
							</div>

							<button type="submit" class="btn-submit">
								Login to Portal →
							</button>
						</form>

						<!-- Roles hint -->
						<div class="roles-hint">
							<div class="role-chip">
								<div class="role-dot dot-admin"></div> Admin
							</div>
							<div class="role-chip">
								<div class="role-dot dot-teacher"></div> Teacher
							</div>
							<div class="role-chip">
								<div class="role-dot dot-student"></div> Student
							</div>
						</div>

			</div>
		</div>

	</body>

	</html>