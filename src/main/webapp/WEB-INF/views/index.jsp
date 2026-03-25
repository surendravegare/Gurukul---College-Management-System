<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Gurukul – College Management System</title>

		<!-- Google Fonts -->
		<link
			href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700;900&family=Poppins:wght@300;400;500;600&display=swap"
			rel="stylesheet" />
		<style>
			/* ── Index Page Body ── */
			.index-body {
				font-family: 'Poppins', sans-serif;
				background: linear-gradient(135deg, #e8eaf6 0%, #fdf6ec 40%, #fce4ec 100%);
				color: var(--text-dark);
				min-height: 100vh;
				overflow: hidden;
			}

			/* ── Animated Background Blobs ── */
			.bg {
				position: fixed;
				inset: 0;
				z-index: 0;
				pointer-events: none;
			}

			.bg::before {
				content: '';
				position: absolute;
				top: -180px;
				right: -180px;
				width: 600px;
				height: 600px;
				background: radial-gradient(circle, rgba(57, 73, 171, 0.10) 0%, transparent 70%);
				border-radius: 50%;
				animation: pulse 7s ease-in-out infinite;
			}

			.bg::after {
				content: '';
				position: absolute;
				bottom: -180px;
				left: -180px;
				width: 520px;
				height: 520px;
				background: radial-gradient(circle, rgba(244, 99, 30, 0.08) 0%, transparent 70%);
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
					transform: scale(1.12);
					opacity: 1;
				}
			}

			.mandala {
				position: absolute;
				top: 50%;
				left: 50%;
				width: 820px;
				height: 820px;
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
				position: fixed;
				top: 0;
				left: 0;
				right: 0;
				z-index: 10;
				display: flex;
				align-items: center;
				justify-content: space-between;
				padding: 18px 56px;
				background: rgba(255, 255, 255, 0.70);
				backdrop-filter: blur(18px);
				border-bottom: 1px solid rgba(57, 73, 171, 0.12);
				box-shadow: 0 2px 20px rgba(26, 35, 126, 0.08);
				animation: slideDown 0.6s ease;
			}

			@keyframes slideDown {
				from {
					transform: translateY(-80px);
					opacity: 0;
				}

				to {
					transform: translateY(0);
					opacity: 1;
				}
			}

			.logo {
				font-family: 'Cinzel', serif;
				font-size: 26px;
				font-weight: 900;
				letter-spacing: 0.12em;
				background: linear-gradient(135deg, #1a237e, #3949ab);
				-webkit-background-clip: text;
				-webkit-text-fill-color: transparent;
				text-decoration: none;
			}

			.navbar .btn-login {
				background: linear-gradient(135deg, #1a237e, #3949ab);
				color: white;
				padding: 11px 30px;
				border-radius: 10px;
				font-size: 14px;
				font-weight: 600;
				text-decoration: none;
				font-family: 'Poppins', sans-serif;
				box-shadow: 0 4px 18px rgba(26, 35, 126, 0.25);
				transition: all 0.2s;
			}

			.navbar .btn-login:hover {
				transform: translateY(-2px);
				box-shadow: 0 8px 28px rgba(26, 35, 126, 0.35);
				color: white;
			}

			/* ── HERO ── */
			.hero {
				position: relative;
				z-index: 1;
				min-height: 100vh;
				display: flex;
				flex-direction: column;
				align-items: center;
				justify-content: center;
				text-align: center;
				padding: 0 20px;
			}

			.hero-inner {
				max-width: 680px;
			}

			/* Deco line */
			.deco-line {
				display: flex;
				align-items: center;
				justify-content: center;
				gap: 14px;
				margin-bottom: 28px;
				animation: fadeUp 0.7s ease 0.2s both;
			}

			.deco-line span {
				display: block;
				width: 55px;
				height: 1.5px;
			}

			.deco-line span:first-child {
				background: linear-gradient(90deg, transparent, #f4631e);
			}

			.deco-line span:last-child {
				background: linear-gradient(90deg, #f4631e, transparent);
			}

			.deco-line p {
				font-size: 12px;
				letter-spacing: 0.24em;
				text-transform: uppercase;
				color: #f4631e;
				font-weight: 600;
			}

			/* Brand */
			.brand {
				font-family: 'Cinzel', serif;
				font-size: 80px;
				font-weight: 900;
				letter-spacing: 0.12em;
				line-height: 1;
				background: linear-gradient(135deg, #1a237e 0%, #3949ab 50%, #5c6bc0 100%);
				-webkit-background-clip: text;
				-webkit-text-fill-color: transparent;
				animation: fadeUp 0.7s ease 0.35s both;
				text-shadow: none;
			}

			.tagline {
				font-family: 'Cinzel', serif;
				font-size: 14px;
				letter-spacing: 0.28em;
				color: #7f8fa6;
				margin-top: 10px;
				margin-bottom: 28px;
				animation: fadeUp 0.7s ease 0.45s both;
			}

			/* Divider */
			.divider {
				width: 120px;
				height: 2px;
				background: linear-gradient(90deg, transparent, #f7b731, transparent);
				margin: 0 auto 28px;
				border-radius: 2px;
				animation: fadeUp 0.7s ease 0.5s both;
			}

			.subtitle {
				font-size: 16px;
				color: #3d3d5c;
				line-height: 1.85;
				margin-bottom: 46px;
				animation: fadeUp 0.7s ease 0.55s both;
			}

			/* Feature Pills */
			.feature-pills {
				display: flex;
				align-items: center;
				justify-content: center;
				gap: 12px;
				margin-bottom: 40px;
				flex-wrap: wrap;
				animation: fadeUp 0.7s ease 0.58s both;
			}

			.pill {
				display: flex;
				align-items: center;
				gap: 7px;
				background: white;
				border: 1px solid rgba(57, 73, 171, 0.15);
				border-radius: 30px;
				padding: 8px 18px;
				font-size: 13px;
				font-weight: 500;
				color: #1a237e;
				box-shadow: 0 2px 10px rgba(26, 35, 126, 0.08);
			}

			.pill span {
				font-size: 15px;
			}

			/* CTA Button */
			.btn-portal {
				display: inline-flex;
				align-items: center;
				gap: 10px;
				background: linear-gradient(135deg, #1a237e, #3949ab);
				color: white;
				padding: 17px 52px;
				border-radius: 14px;
				font-size: 16px;
				font-weight: 600;
				font-family: 'Poppins', sans-serif;
				text-decoration: none;
				box-shadow: 0 6px 30px rgba(26, 35, 126, 0.3);
				transition: all 0.25s;
				animation: fadeUp 0.7s ease 0.65s both;
				letter-spacing: 0.03em;
				position: relative;
				overflow: hidden;
			}

			.btn-portal::before {
				content: '';
				position: absolute;
				inset: 0;
				background: linear-gradient(135deg, #f4631e, #f7b731);
				opacity: 0;
				transition: opacity 0.25s;
			}

			.btn-portal:hover::before {
				opacity: 1;
			}

			.btn-portal:hover {
				transform: translateY(-4px);
				box-shadow: 0 14px 40px rgba(26, 35, 126, 0.35);
				color: white;
			}

			.btn-portal span {
				position: relative;
				z-index: 1;
			}

			/* Role Cards */
			.role-cards {
				display: flex;
				align-items: center;
				justify-content: center;
				gap: 16px;
				margin-top: 44px;
				animation: fadeUp 0.7s ease 0.72s both;
			}

			.role-card {
				background: white;
				border: 1px solid rgba(57, 73, 171, 0.12);
				border-radius: 16px;
				padding: 18px 24px;
				display: flex;
				align-items: center;
				gap: 12px;
				box-shadow: 0 4px 16px rgba(26, 35, 126, 0.08);
				transition: all 0.22s;
				min-width: 140px;
			}

			.role-card:hover {
				transform: translateY(-3px);
				box-shadow: 0 8px 24px rgba(26, 35, 126, 0.14);
			}

			.role-icon {
				width: 42px;
				height: 42px;
				border-radius: 12px;
				display: flex;
				align-items: center;
				justify-content: center;
				font-size: 20px;
			}

			.role-icon.admin {
				background: linear-gradient(135deg, #e8eaf6, #c5cae9);
			}

			.role-icon.teacher {
				background: linear-gradient(135deg, #ede7f6, #d1c4e9);
			}

			.role-icon.student {
				background: linear-gradient(135deg, #e0f7fa, #b2ebf2);
			}

			.role-text p {
				font-size: 13px;
				font-weight: 600;
				color: #1a237e;
			}

			.role-text span {
				font-size: 12px;
				color: #7f8fa6;
			}

			/* Bottom Badge */
			.bottom-badge {
				position: absolute;
				bottom: 36px;
				left: 50%;
				transform: translateX(-50%);
				display: flex;
				align-items: center;
				gap: 10px;
				background: rgba(255, 255, 255, 0.7);
				border: 1px solid rgba(57, 73, 171, 0.12);
				padding: 9px 24px;
				border-radius: 30px;
				font-size: 13px;
				color: #7f8fa6;
				animation: fadeUp 0.7s ease 0.8s both;
				white-space: nowrap;
				backdrop-filter: blur(8px);
				box-shadow: 0 2px 12px rgba(26, 35, 126, 0.08);
			}

			.dot {
				width: 7px;
				height: 7px;
				border-radius: 50%;
				background: #2ecc71;
				animation: blink 2s ease-in-out infinite;
			}

			@keyframes blink {

				0%,
				100% {
					opacity: 1;
				}

				50% {
					opacity: 0.3;
				}
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

			/* ── RESPONSIVE ── */
			@media (max-width: 600px) {
				.navbar {
					padding: 16px 20px;
				}

				.brand {
					font-size: 48px;
				}

				.btn-portal {
					padding: 14px 36px;
					font-size: 14px;
				}

				.role-cards {
					flex-direction: column;
				}
			}
		</style>
	</head>

	<body>

		<!-- Background -->
		<div class="bg">
			<svg class="mandala" viewBox="0 0 500 500" fill="none" xmlns="http://www.w3.org/2000/svg">
				<g stroke="#FF9933" stroke-width="0.5">
					<circle cx="250" cy="250" r="240" />
					<circle cx="250" cy="250" r="200" />
					<circle cx="250" cy="250" r="160" />
					<circle cx="250" cy="250" r="120" />
					<circle cx="250" cy="250" r="80" />
					<circle cx="250" cy="250" r="40" />
					<circle cx="250" cy="250" r="10" />
					<ellipse cx="250" cy="50" rx="18" ry="40" />
					<ellipse cx="250" cy="450" rx="18" ry="40" />
					<ellipse cx="50" cy="250" rx="40" ry="18" />
					<ellipse cx="450" cy="250" rx="40" ry="18" />
					<ellipse cx="107" cy="107" rx="18" ry="40" transform="rotate(45 107 107)" />
					<ellipse cx="393" cy="393" rx="18" ry="40" transform="rotate(45 393 393)" />
					<ellipse cx="393" cy="107" rx="18" ry="40" transform="rotate(-45 393 107)" />
					<ellipse cx="107" cy="393" rx="18" ry="40" transform="rotate(-45 107 393)" />
					<ellipse cx="250" cy="130" rx="12" ry="28" />
					<ellipse cx="250" cy="370" rx="12" ry="28" />
					<ellipse cx="130" cy="250" rx="28" ry="12" />
					<ellipse cx="370" cy="250" rx="28" ry="12" />
					<line x1="250" y1="10" x2="250" y2="490" />
					<line x1="10" y1="250" x2="490" y2="250" />
					<line x1="74" y1="74" x2="426" y2="426" />
					<line x1="426" y1="74" x2="74" y2="426" />
					<circle cx="250" cy="20" r="4" fill="#FF9933" />
					<circle cx="250" cy="480" r="4" fill="#FF9933" />
					<circle cx="20" cy="250" r="4" fill="#FF9933" />
					<circle cx="480" cy="250" r="4" fill="#FF9933" />
					<circle cx="86" cy="86" r="4" fill="#FF9933" />
					<circle cx="414" cy="414" r="4" fill="#FF9933" />
					<circle cx="414" cy="86" r="4" fill="#FF9933" />
					<circle cx="86" cy="414" r="4" fill="#FF9933" />
				</g>
			</svg>
		</div>

		<!-- NAVBAR -->
		<nav class="navbar">
			<a href="/" class="logo">GURUKUL</a>
			<a href="/login" class="btn-login">Login →</a>
		</nav>

		<!-- HERO SECTION -->
		<section class="hero">
			<div class="hero-inner">

				<div class="deco-line">
					<span></span>
					<p>College Management System</p>
					<span></span>
				</div>

				<div class="brand">GURUKUL</div>
				<div class="tagline">— Where Knowledge Begins —</div>
				<div class="divider"></div>

				<p class="subtitle">
					A complete portal for Admins, Teachers &amp; Students <br />
					to manage college life — all in one place.
				</p>

				<a href="/login" class="btn-portal">
					🔐 Login to Portal
				</a>

			</div>


		</section>

	</body>

	</html>