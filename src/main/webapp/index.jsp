<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AURA — Next-Gen Modern Cyber Store</title>

    <!-- Google Fonts & Font Awesome Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=Syne:wght@700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

    <style>
        :root {
            --bg-body: #0b0d10;
            --bg-surface: #12151b;
            --bg-card: #181c24;
            --bg-card-hover: #1f242e;
            --accent-lime: #ccff00;
            --accent-lime-hover: #b3e600;
            --accent-cyan: #00f0ff;
            --accent-magenta: #ff0055;
            --text-main: #f3f4f6;
            --text-muted: #9ca3af;
            --border-color: rgba(255, 255, 255, 0.08);
            --border-active: rgba(204, 255, 0, 0.4);
            --radius-main: 16px;
            --radius-card: 14px;
            --radius-button: 999px;
            --transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            --container: 1280px;
            --glow-lime: 0 0 25px rgba(204, 255, 0, 0.25);
            --glow-cyan: 0 0 25px rgba(0, 240, 255, 0.25);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        html {
            scroll-behavior: smooth;
        }
        body {
            font-family: 'Space Grotesk', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-body);
            color: var(--text-main);
            line-height: 1.5;
            overflow-x: hidden;
            -webkit-font-smoothing: antialiased;
        }
        h1, h2, h3, h4, .font-heading {
            font-family: 'Syne', sans-serif;
        }
        a {
            color: inherit;
            text-decoration: none;
        }
        img {
            display: block;
            max-width: 100%;
            height: auto;
        }
        button {
            cursor: pointer;
            border: none;
            background: none;
            font-family: inherit;
        }

        .container {
            width: 100%;
            max-width: var(--container);
            margin: 0 auto;
            padding: 0 24px;
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: var(--bg-body);
        }
        ::-webkit-scrollbar-thumb {
            background: #252a34;
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: var(--accent-lime);
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 14px 28px;
            border-radius: var(--radius-button);
            font-weight: 700;
            font-size: 13px;
            letter-spacing: 0.8px;
            text-transform: uppercase;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }
        .btn-lime {
            background-color: var(--accent-lime);
            color: #000;
        }
        .btn-lime:hover {
            background-color: var(--accent-lime-hover);
            transform: translateY(-2px);
            box-shadow: var(--glow-lime);
        }
        .btn-glass {
            background: rgba(255, 255, 255, 0.05);
            color: var(--text-main);
            border: 1px solid var(--border-color);
            backdrop-filter: blur(10px);
        }
        .btn-glass:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: var(--text-main);
            transform: translateY(-2px);
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 900;
            background: rgba(11, 13, 16, 0.85);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border-color);
        }
        .nav-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 80px;
        }
        .logo {
            font-size: 28px;
            font-weight: 800;
            letter-spacing: -1px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .logo span {
            color: var(--accent-lime);
            text-shadow: 0 0 10px rgba(204, 255, 0, 0.5);
        }

        .nav-links {
            display: flex;
            gap: 32px;
            list-style: none;
        }
        .nav-links a {
            font-size: 14px;
            font-weight: 600;
            color: var(--text-muted);
            transition: var(--transition);
            letter-spacing: 0.5px;
            position: relative;
        }
        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 0%;
            height: 2px;
            background: var(--accent-lime);
            transition: var(--transition);
        }
        .nav-links a:hover, .nav-links a.active {
            color: var(--accent-lime);
        }
        .nav-links a:hover::after, .nav-links a.active::after {
            width: 100%;
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 14px;
        }
        .action-icon {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: var(--bg-surface);
            border: 1px solid var(--border-color);
            color: var(--text-main);
            display: grid;
            place-items: center;
            transition: var(--transition);
            position: relative;
        }
        .action-icon:hover {
            border-color: var(--accent-lime);
            color: var(--accent-lime);
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(204, 255, 0, 0.15);
        }
        .badge {
            position: absolute;
            top: -4px;
            right: -4px;
            background: var(--accent-lime);
            color: #000;
            font-weight: 800;
            font-size: 10px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: grid;
            place-items: center;
            box-shadow: 0 0 10px rgba(204, 255, 0, 0.5);
        }

        /* Mobile Menu Drawer */
        .mobile-toggle { display: none; }
        .mobile-drawer {
            position: fixed;
            top: 80px;
            left: 0;
            right: 0;
            background: var(--bg-surface);
            border-bottom: 1px solid var(--border-color);
            padding: 24px;
            display: none;
            flex-direction: column;
            gap: 16px;
            z-index: 899;
            transform: translateY(-100%);
            transition: transform 0.3s ease;
        }
        .mobile-drawer.active {
            display: flex;
            transform: translateY(0);
        }

        .hero {
            padding-top: 130px;
            padding-bottom: 40px;
        }
        .hero-banner {
            background: linear-gradient(135deg, rgba(22, 25, 30, 0.9) 0%, rgba(24, 28, 36, 0.95) 100%);
            border-radius: var(--radius-main);
            border: 1px solid var(--border-color);
            padding: 60px;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            min-height: 480px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
        }
        .hero-banner::before {
            content: '';
            position: absolute;
            top: -40%;
            right: -10%;
            width: 550px;
            height: 550px;
            background: radial-gradient(circle, rgba(204, 255, 0, 0.12) 0%, rgba(0, 240, 255, 0.05) 50%, transparent 70%);
            pointer-events: none;
            filter: blur(40px);
        }
        .hero-content {
            max-width: 620px;
            z-index: 2;
        }
        .hero-tag {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 6px 16px;
            background: rgba(204, 255, 0, 0.08);
            border: 1px solid var(--border-active);
            color: var(--accent-lime);
            border-radius: var(--radius-button);
            font-size: 12px;
            font-weight: 700;
            margin-bottom: 24px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .hero h1 {
            font-size: 54px;
            line-height: 1.05;
            margin-bottom: 20px;
            letter-spacing: -1.5px;
            background: linear-gradient(180deg, #ffffff 0%, #a1a5b0 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .hero p {
            font-size: 18px;
            color: var(--text-muted);
            margin-bottom: 32px;
            font-weight: 400;
        }

        .controls-bar {
            margin: 40px 0 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        .filter-tags {
            display: flex;
            gap: 10px;
            overflow-x: auto;
            padding-bottom: 4px;
        }
        .tag-btn {
            padding: 10px 22px;
            border-radius: var(--radius-button);
            background: var(--bg-surface);
            border: 1px solid var(--border-color);
            color: var(--text-muted);
            font-size: 13px;
            font-weight: 600;
            white-space: nowrap;
            transition: var(--transition);
        }
        .tag-btn:hover, .tag-btn.active {
            background: var(--accent-lime);
            color: #000;
            border-color: var(--accent-lime);
            box-shadow: 0 0 15px rgba(204, 255, 0, 0.2);
        }
        .search-box {
            display: flex;
            align-items: center;
            background: var(--bg-surface);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-button);
            padding: 0 18px;
            width: 320px;
            transition: var(--transition);
        }
        .search-box:focus-within {
            border-color: var(--accent-lime);
            box-shadow: 0 0 15px rgba(204, 255, 0, 0.15);
        }
        .search-box input {
            background: none;
            border: none;
            outline: none;
            color: var(--text-main);
            padding: 12px;
            width: 100%;
            font-size: 14px;
            font-family: inherit;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 24px;
            margin-bottom: 80px;
            min-height: 300px;
        }
        .product-card {
            background: var(--bg-surface);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-main);
            padding: 16px;
            transition: var(--transition);
            display: flex;
            flex-direction: column;
            position: relative;
            cursor: pointer;
        }
        .product-card:hover {
            transform: translateY(-6px);
            border-color: var(--border-active);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.5);
            background: var(--bg-card);
        }
        .image-container {
            width: 100%;
            aspect-ratio: 1;
            background: #0f1217;
            border-radius: var(--radius-card);
            overflow: hidden;
            position: relative;
            margin-bottom: 16px;
        }
        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .product-card:hover .image-container img {
            transform: scale(1.08);
        }
        .card-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--accent-lime);
            font-size: 10px;
            font-weight: 800;
            padding: 4px 10px;
            border-radius: 20px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .like-btn {
            position: absolute;
            top: 12px;
            right: 12px;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: rgba(13, 15, 18, 0.6);
            backdrop-filter: blur(8px);
            color: var(--text-main);
            display: grid;
            place-items: center;
            transition: var(--transition);
            z-index: 5;
        }
        .like-btn:hover, .like-btn.liked {
            color: var(--accent-magenta);
            background: #fff;
            box-shadow: 0 0 15px rgba(255, 0, 85, 0.4);
        }

        .product-info {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }
        .product-rating {
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 12px;
            color: var(--text-muted);
            margin-bottom: 6px;
        }
        .stars {
            color: var(--accent-lime);
        }
        .product-category {
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--text-muted);
            font-weight: 700;
            margin-bottom: 4px;
        }
        .product-title {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 12px;
            line-height: 1.3;
        }
        .product-bottom {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: auto;
            padding-top: 12px;
            border-top: 1px solid var(--border-color);
        }
        .price {
            font-size: 20px;
            font-weight: 800;
            color: var(--accent-lime);
        }
        .add-cart-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            color: var(--text-main);
            display: grid;
            place-items: center;
            transition: var(--transition);
        }
        .add-cart-btn:hover {
            background: var(--accent-lime);
            color: #000;
            border-color: var(--accent-lime);
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(204, 255, 0, 0.4);
        }

        .no-results {
            grid-column: 1 / -1;
            text-align: center;
            padding: 80px 20px;
            background: var(--bg-surface);
            border: 1px dashed var(--border-color);
            border-radius: var(--radius-main);
            color: var(--text-muted);
        }
        .no-results i {
            font-size: 40px;
            margin-bottom: 16px;
            color: var(--accent-lime);
        }

        .promo-section {
            background: linear-gradient(135deg, var(--bg-surface) 0%, rgba(30, 34, 41, 0.8) 100%);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-main);
            padding: 48px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 30px;
            margin-bottom: 80px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
        }
        .promo-text h2 {
            font-size: 36px;
            margin-bottom: 12px;
            letter-spacing: -0.5px;
        }
        .countdown {
            display: flex;
            gap: 14px;
            margin-top: 24px;
        }
        .time-box {
            background: rgba(11, 13, 16, 0.8);
            border: 1px solid var(--border-color);
            padding: 12px;
            border-radius: 12px;
            min-width: 68px;
            text-align: center;
        }
        .time-box .num {
            font-size: 24px;
            font-weight: 800;
            color: var(--accent-lime);
            text-shadow: 0 0 10px rgba(204, 255, 0, 0.3);
        }
        .time-box .label {
            font-size: 10px;
            text-transform: uppercase;
            color: var(--text-muted);
            font-weight: 600;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(8px);
            z-index: 1000;
            opacity: 0;
            pointer-events: none;
            transition: var(--transition);
        }
        .overlay.active {
            opacity: 1;
            pointer-events: auto;
        }

        .side-drawer {
            position: fixed;
            top: 0;
            right: 0;
            width: 440px;
            max-width: 100%;
            height: 100%;
            background: var(--bg-surface);
            border-left: 1px solid var(--border-color);
            z-index: 1001;
            transform: translateX(100%);
            transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1);
            display: flex;
            flex-direction: column;
            box-shadow: -10px 0 40px rgba(0,0,0,0.8);
        }
        .side-drawer.active {
            transform: translateX(0);
        }

        .drawer-header {
            padding: 24px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .drawer-header h3 {
            font-size: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .close-btn {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: var(--bg-card);
            color: var(--text-muted);
            display: grid;
            place-items: center;
            transition: var(--transition);
        }
        .close-btn:hover {
            color: #fff;
            background: rgba(255, 255, 255, 0.1);
        }

        .drawer-body {
            padding: 24px;
            overflow-y: auto;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .cart-item {
            display: flex;
            gap: 16px;
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            padding: 12px;
            border-radius: var(--radius-card);
            align-items: center;
        }
        .cart-item img {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 10px;
            background: #000;
        }
        .cart-item-details {
            flex-grow: 1;
        }
        .cart-item-title {
            font-size: 15px;
            font-weight: 700;
            margin-bottom: 4px;
        }
        .cart-item-price {
            color: var(--accent-lime);
            font-weight: 700;
            font-size: 14px;
            margin-bottom: 8px;
        }
        .qty-controls {
            display: flex;
            align-items: center;
            gap: 10px;
            background: var(--bg-surface);
            border: 1px solid var(--border-color);
            border-radius: 20px;
            padding: 2px 8px;
            width: fit-content;
        }
        .qty-btn {
            color: var(--text-main);
            font-size: 12px;
            padding: 2px 6px;
        }
        .qty-btn:hover {
            color: var(--accent-lime);
        }

        .drawer-footer {
            padding: 24px;
            border-top: 1px solid var(--border-color);
            background: var(--bg-body);
        }
        .cart-summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 15px;
            color: var(--text-muted);
        }
        .cart-summary-total {
            display: flex;
            justify-content: space-between;
            font-size: 20px;
            font-weight: 800;
            color: var(--text-main);
            margin-bottom: 20px;
            padding-top: 12px;
            border-top: 1px dashed var(--border-color);
        }

        .modal {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0.95);
            width: 90%;
            max-width: 850px;
            background: var(--bg-surface);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-main);
            z-index: 1002;
            opacity: 0;
            pointer-events: none;
            transition: var(--transition);
            box-shadow: 0 25px 60px rgba(0,0,0,0.9);
            overflow: hidden;
        }
        .modal.active {
            opacity: 1;
            pointer-events: auto;
            transform: translate(-50%, -50%) scale(1);
        }

        .modal-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
        }
        .modal-image {
            background: #0b0d10;
            display: grid;
            place-items: center;
            padding: 30px;
            position: relative;
        }
        .modal-image img {
            max-height: 380px;
            object-fit: contain;
            border-radius: 12px;
        }
        .modal-content {
            padding: 40px;
            display: flex;
            flex-direction: column;
        }
        .modal-close {
            position: absolute;
            top: 16px;
            right: 16px;
            z-index: 10;
        }

        /* Toast Container */
        .toast-container {
            position: fixed;
            bottom: 24px;
            right: 24px;
            z-index: 1100;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .toast {
            background: var(--bg-card);
            border: 1px solid var(--accent-lime);
            color: var(--text-main);
            padding: 14px 20px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            gap: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
            animation: slideIn 0.3s forwards;
            font-size: 14px;
            font-weight: 600;
        }
        @keyframes slideIn {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        footer {
            background: var(--bg-surface);
            border-top: 1px solid var(--border-color);
            padding: 60px 0 30px;
            margin-top: auto;
        }
        .footer-grid {
            display: grid;
            grid-template-columns: 2fr repeat(3, 1fr);
            gap: 40px;
            margin-bottom: 40px;
        }
        .footer-brand p {
            color: var(--text-muted);
            margin-top: 12px;
            max-width: 320px;
            font-size: 14px;
        }
        .footer-col h4 {
            font-size: 15px;
            margin-bottom: 20px;
            color: var(--text-main);
            letter-spacing: 0.5px;
        }
        .footer-col ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .footer-col a {
            color: var(--text-muted);
            font-size: 14px;
            transition: var(--transition);
        }
        .footer-col a:hover {
            color: var(--accent-lime);
        }
        .footer-bottom {
            padding-top: 30px;
            border-top: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: var(--text-muted);
            font-size: 13px;
        }

        /* Responsive Breakpoints */
        @media (max-width: 992px) {
            .hero h1 { font-size: 42px; }
            .modal-grid { grid-template-columns: 1fr; }
            .modal-image { display: none; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
            .promo-section { flex-direction: column; text-align: center; }
            .countdown { justify-content: center; }
        }
        @media (max-width: 768px) {
            .nav-links { display: none; }
            .mobile-toggle { display: grid; }
            .hero-banner { padding: 40px 24px; }
            .hero h1 { font-size: 32px; }
            .controls-bar { flex-direction: column; align-items: stretch; }
            .search-box { width: 100%; }
            .footer-grid { grid-template-columns: 1fr; }
            .footer-bottom { flex-direction: column; gap: 12px; text-align: center; }
            .side-drawer { width: 100%; }
        }
    </style>
</head>
<body>

    <header>
        <div class="container nav-inner">
            <a href="#" class="logo">AURA<span>.</span></a>
            
            <ul class="nav-links">
                <li><a href="#" class="active">Discover</a></li>
                <li><a href="#shop">Shop All</a></li>
                <li><a href="#promo">Deals</a></li>
                <li><a href="#about">About</a></li>
            </ul>

            <div class="nav-actions">
                <button class="action-icon" onclick="focusSearch()" aria-label="Search">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
                <button class="action-icon" onclick="openWishlist()" aria-label="Wishlist">
                    <i class="fa-regular fa-heart"></i>
                    <span class="badge" id="wishlistBadge">0</span>
                </button>
                <button class="action-icon" onclick="openCart()" aria-label="Cart">
                    <i class="fa-solid fa-bag-shopping"></i>
                    <span class="badge" id="cartBadge">0</span>
                </button>
                <button class="action-icon mobile-toggle" id="menuToggle" aria-label="Toggle Menu">
                    <i class="fa-solid fa-bars"></i>
                </button>
            </div>
        </div>

        <!-- Mobile Drawer -->
        <div class="mobile-drawer" id="mobileDrawer">
            <a href="#" class="active" onclick="toggleMenu()">Discover</a>
            <a href="#shop" onclick="toggleMenu()">Shop All</a>
            <a href="#promo" onclick="toggleMenu()">Deals</a>
            <a href="#about" onclick="toggleMenu()">About</a>
        </div>
    </header>

    <main>
        <section class="hero container">
            <div class="hero-banner">
                <div class="hero-content">
                    <span class="hero-tag"><i class="fa-solid fa-bolt"></i> Cyber Edition Drop v3.0</span>
                    <h1>Next-Gen Hardware For Digital Natives</h1>
                    <p>Upgrade your aesthetic with engineered minimalist technology, hyper-responsive audio, and modern cyberwear accessories.</p>
                    <div style="display: flex; gap: 16px; flex-wrap: wrap;">
                        <a href="#shop" class="btn btn-lime">Explore Drop <i class="fa-solid fa-arrow-right"></i></a>
                        <a href="#promo" class="btn btn-glass">Limited Offer</a>
                    </div>
                </div>
            </div>
        </section>

        <section class="container" id="shop">
            <div class="controls-bar">
                <div class="filter-tags">
                    <button class="tag-btn active" onclick="filterCategory('all', this)">All Hardware</button>
                    <button class="tag-btn" onclick="filterCategory('tech', this)">Cyberware</button>
                    <button class="tag-btn" onclick="filterCategory('apparel', this)">Apparel</button>
                    <button class="tag-btn" onclick="filterCategory('audio', this)">Audio</button>
                </div>
                <div class="search-box">
                    <i class="fa-solid fa-search" style="color: var(--text-muted);"></i>
                    <input type="text" id="searchInput" placeholder="Search gear (e.g., ring, board)..." onkeyup="filterProducts()">
                </div>
            </div>

            <div class="products-grid" id="productsGrid">
                <!-- Products injected dynamically via JS -->
            </div>
        </section>

        <section class="container" id="promo">
            <div class="promo-section">
                <div class="promo-text">
                    <span style="color: var(--accent-lime); font-weight: 700; text-transform: uppercase; font-size: 12px; letter-spacing: 1px;">
                        <i class="fa-solid fa-fire"></i> Limited Collector's Edition
                    </span>
                    <h2>Obsidian Titanium Smartwatch</h2>
                    <p style="color: var(--text-muted); max-width: 460px;">Machined grade-5 titanium casing, sapphire crystal face, and neural bio-sensors. Limited global drop of 500 numbered units.</p>
                    <div class="countdown">
                        <div class="time-box"><div class="num" id="days">02</div><div class="label">Days</div></div>
                        <div class="time-box"><div class="num" id="hours">14</div><div class="label">Hours</div></div>
                        <div class="time-box"><div class="num" id="mins">38</div><div class="label">Mins</div></div>
                        <div class="time-box"><div class="num" id="secs">45</div><div class="label">Secs</div></div>
                    </div>
                </div>
                <div>
                    <button class="btn btn-lime" onclick="claimPromo()" style="padding: 20px 40px; font-size: 15px;">
                        Claim Code "AURA2026" — $450
                    </button>
                </div>
            </div>
        </section>
    </main>

    <div class="overlay" id="overlay" onclick="closeAllDrawers()"></div>

    <!-- Side Cart Drawer -->
    <div class="side-drawer" id="cartDrawer">
        <div class="drawer-header">
            <h3><i class="fa-solid fa-bag-shopping" style="color: var(--accent-lime);"></i> Shopping Cart</h3>
            <button class="close-btn" onclick="closeAllDrawers()"><i class="fa-solid fa-xmark"></i></button>
        </div>
        <div class="drawer-body" id="cartBody">
            <!-- Dynamic Cart Items -->
        </div>
        <div class="drawer-footer">
            <div class="cart-summary-row">
                <span>Subtotal</span>
                <span id="cartSubtotal">$0.00</span>
            </div>
            <div class="cart-summary-row">
                <span>Cyber Shipping</span>
                <span style="color: var(--accent-lime);">FREE</span>
            </div>
            <div class="cart-summary-total">
                <span>Total</span>
                <span id="cartTotal" style="color: var(--accent-lime);">$0.00</span>
            </div>
            <button class="btn btn-lime" style="width: 100%;" onclick="checkout()">Proceed To Checkout <i class="fa-solid fa-arrow-right"></i></button>
        </div>
    </div>

    <!-- Side Wishlist Drawer -->
    <div class="side-drawer" id="wishlistDrawer">
        <div class="drawer-header">
            <h3><i class="fa-solid fa-heart" style="color: var(--accent-magenta);"></i> Saved Hardware</h3>
            <button class="close-btn" onclick="closeAllDrawers()"><i class="fa-solid fa-xmark"></i></button>
        </div>
        <div class="drawer-body" id="wishlistBody">
            <!-- Dynamic Wishlist Items -->
        </div>
    </div>

    <div class="modal" id="quickViewModal">
        <button class="close-btn modal-close" onclick="closeModal()"><i class="fa-solid fa-xmark"></i></button>
        <div class="modal-grid">
            <div class="modal-image">
                <img id="modalImg" src="" alt="Product Detail">
            </div>
            <div class="modal-content">
                <span id="modalCategory" class="product-category" style="color: var(--accent-lime);">Category</span>
                <h2 id="modalTitle" style="font-size: 28px; margin-bottom: 12px;">Product Title</h2>
                <div class="product-rating" style="margin-bottom: 16px;">
                    <div class="stars" id="modalStars"></div>
                    <span id="modalReviews">(0 reviews)</span>
                </div>
                <p id="modalDesc" style="color: var(--text-muted); font-size: 14px; margin-bottom: 24px; line-height: 1.6;">Product detailed description will appear here...</p>
                <div style="margin-top: auto;">
                    <div style="font-size: 28px; font-weight: 800; color: var(--accent-lime); margin-bottom: 20px;" id="modalPrice">$0.00</div>
                    <button class="btn btn-lime" style="width: 100%;" id="modalAddBtn">Add To Cart</button>
                </div>
            </div>
        </div>
    </div>

    <div class="toast-container" id="toastContainer"></div>

    <footer id="about">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <a href="#" class="logo">AURA<span>.</span></a>
                    <p>Next-generation lifestyle artifacts and hardware designed for utility, speed, and futuristic aesthetics.</p>
                </div>
                <div class="footer-col">
                    <h4>Ecosystem</h4>
                    <ul>
                        <li><a href="#">Drop Archive</a></li>
                        <li><a href="#">Firmware Updates</a></li>
                        <li><a href="#">Cybernetics Lab</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Support</h4>
                    <ul>
                        <li><a href="#">Encrypted Dispatch</a></li>
                        <li><a href="#">Warranty Register</a></li>
                        <li><a href="#">Contact Desk</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Network</h4>
                    <ul>
                        <li><a href="#">Instagram</a></li>
                        <li><a href="#">X.com / Twitter</a></li>
                        <li><a href="#">Discord Server</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 AURA Hardware Systems. All rights reserved.</p>
                <p>Designed for high-density minimalist setups.</p>
            </div>
        </div>
    </footer>

    <script>
        // State Management
        const PRODUCTS = [
            {
                id: 'p1',
                title: 'Aura ANC Wireless Headphones',
                category: 'audio',
                price: 349.00,
                rating: 4.9,
                reviews: 128,
                image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=800&q=80',
                badge: 'Best Seller',
                desc: 'Active noise cancellation with graphene acoustic drivers, custom EQ tuning, and ultra-comfortable memory foam ear cushions.'
            },
            {
                id: 'p2',
                title: 'Chronos Titanium Smart Ring',
                category: 'tech',
                price: 199.00,
                rating: 4.8,
                reviews: 94,
                image: 'https://images.unsplash.com/photo-1605100804763-247f67b3557e?auto=format&fit=crop&w=800&q=80',
                badge: 'Cyberware',
                desc: 'Continuous biometrics, sleep stage tracking, and contactless gesture controls housed in ultra-light titanium.'
            },
            {
                id: 'p3',
                title: 'CyberDeck Mechanical Keyboard',
                category: 'tech',
                price: 159.00,
                rating: 4.7,
                reviews: 210,
                image: 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=800&q=80',
                badge: 'Hot Drop',
                desc: 'Low-profile mechanical switches, hot-swappable PCB, wireless dual-mode Bluetooth 5.2, and customizable RGB backlight.'
            },
            {
                id: 'p4',
                title: 'Modular Technical Jacket',
                category: 'apparel',
                price: 280.00,
                rating: 4.9,
                reviews: 67,
                image: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?auto=format&fit=crop&w=800&q=80',
                badge: 'Weatherproof',
                desc: '3-layer waterproof Gore-Tex weave, magnetic modular utility pockets, and reinforced tactical seams.'
            },
            {
                id: 'p5',
                title: 'Aura Studio Reference Speakers',
                category: 'audio',
                price: 499.00,
                rating: 5.0,
                reviews: 42,
                image: 'https://images.unsplash.com/photo-1545454675-3531b543be5d?auto=format&fit=crop&w=800&q=80',
                badge: 'Audiophile',
                desc: 'Acoustically tuned aluminum enclosure with high-density Kevlar woofers for zero-distortion studio audio.'
            },
            {
                id: 'p6',
                title: 'Tactical Cyber Backpack',
                category: 'apparel',
                price: 145.00,
                rating: 4.6,
                reviews: 83,
                image: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=800&q=80',
                badge: 'Utility',
                desc: 'Water-resistant carbon grid outer shell with internal TSA laptop compartment and integrated USB-C power passthrough.'
            }
        ];

        let cart = [];
        let wishlist = [];
        let activeCategory = 'all';

        // Render Products
        function renderProducts() {
            const grid = document.getElementById('productsGrid');
            const searchVal = document.getElementById('searchInput').value.toLowerCase();

            const filtered = PRODUCTS.filter(p => {
                const matchesCat = activeCategory === 'all' || p.category === activeCategory;
                const matchesSearch = p.title.toLowerCase().includes(searchVal) || p.desc.toLowerCase().includes(searchVal);
                return matchesCat && matchesSearch;
            });

            if (filtered.length === 0) {
                grid.innerHTML = `
                    <div class="no-results">
                        <i class="fa-solid fa-radar"></i>
                        <h3>No Artifacts Discovered</h3>
                        <p>Try searching for a different keyword or category filter.</p>
                    </div>
                `;
                return;
            }

            grid.innerHTML = filtered.map(p => {
                const isLiked = wishlist.includes(p.id);
                return `
                    <div class="product-card" onclick="openQuickView('${p.id}')">
                        <div class="image-container">
                            <span class="card-badge">${p.badge}</span>
                            <img src="${p.image}" alt="${p.title}" loading="lazy">
                            <button class="like-btn ${isLiked ? 'liked' : ''}" onclick="event.stopPropagation(); toggleWishlist('${p.id}')" aria-label="Wishlist">
                                <i class="${isLiked ? 'fa-solid' : 'fa-regular'} fa-heart"></i>
                            </button>
                        </div>
                        <div class="product-info">
                            <span class="product-category">${p.category}</span>
                            <h3 class="product-title">${p.title}</h3>
                            <div class="product-rating">
                                <div class="stars">${'<i class="fa-solid fa-star"></i>'.repeat(Math.floor(p.rating))}</div>
                                <span>${p.rating} (${p.reviews})</span>
                            </div>
                            <div class="product-bottom">
                                <span class="price">$${p.price.toFixed(2)}</span>
                                <button class="add-cart-btn" onclick="event.stopPropagation(); addToCart('${p.id}')" aria-label="Add to cart">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                `;
            }).join('');
        }

        // Cart Actions
        function addToCart(id) {
            const product = PRODUCTS.find(p => p.id === id);
            const existing = cart.find(item => item.id === id);

            if (existing) {
                existing.qty += 1;
            } else {
                cart.push({ ...product, qty: 1 });
            }

            updateCartUI();
            showToast(`Added <strong>${product.title}</strong> to cart!`);
        }

        function updateCartQty(id, delta) {
            const item = cart.find(i => i.id === id);
            if (!item) return;

            item.qty += delta;
            if (item.qty <= 0) {
                cart = cart.filter(i => i.id !== id);
            }
            updateCartUI();
        }

        function updateCartUI() {
            const badge = document.getElementById('cartBadge');
            const cartBody = document.getElementById('cartBody');
            const totalCount = cart.reduce((acc, i) => acc + i.qty, 0);
            
            badge.innerText = totalCount;

            if (cart.length === 0) {
                cartBody.innerHTML = `
                    <div style="text-align: center; color: var(--text-muted); margin-top: 60px;">
                        <i class="fa-solid fa-basket-shopping" style="font-size: 48px; margin-bottom: 16px; opacity: 0.5;"></i>
                        <p>Your shopping cart is empty.</p>
                    </div>
                `;
                document.getElementById('cartSubtotal').innerText = '$0.00';
                document.getElementById('cartTotal').innerText = '$0.00';
                return;
            }

            let subtotal = 0;
            cartBody.innerHTML = cart.map(item => {
                const itemTotal = item.price * item.qty;
                subtotal += itemTotal;
                return `
                    <div class="cart-item">
                        <img src="${item.image}" alt="${item.title}">
                        <div class="cart-item-details">
                            <div class="cart-item-title">${item.title}</div>
                            <div class="cart-item-price">$${item.price.toFixed(2)}</div>
                            <div class="qty-controls">
                                <button class="qty-btn" onclick="updateCartQty('${item.id}', -1)"><i class="fa-solid fa-minus"></i></button>
                                <span style="font-size: 12px; font-weight: 700; min-width: 16px; text-align: center;">${item.qty}</span>
                                <button class="qty-btn" onclick="updateCartQty('${item.id}', 1)"><i class="fa-solid fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                `;
            }).join('');

            document.getElementById('cartSubtotal').innerText = `$${subtotal.toFixed(2)}`;
            document.getElementById('cartTotal').innerText = `$${subtotal.toFixed(2)}`;
        }

        // Wishlist Actions
        function toggleWishlist(id) {
            const product = PRODUCTS.find(p => p.id === id);
            const idx = wishlist.indexOf(id);

            if (idx > -1) {
                wishlist.splice(idx, 1);
                showToast(`Removed from wishlist`);
            } else {
                wishlist.push(id);
                showToast(`Added <strong>${product.title}</strong> to wishlist!`);
            }

            document.getElementById('wishlistBadge').innerText = wishlist.length;
            renderProducts();
            renderWishlistDrawer();
        }

        function renderWishlistDrawer() {
            const body = document.getElementById('wishlistBody');
            if (wishlist.length === 0) {
                body.innerHTML = `
                    <div style="text-align: center; color: var(--text-muted); margin-top: 60px;">
                        <i class="fa-regular fa-heart" style="font-size: 48px; margin-bottom: 16px; opacity: 0.5;"></i>
                        <p>No saved items yet.</p>
                    </div>
                `;
                return;
            }

            const items = PRODUCTS.filter(p => wishlist.includes(p.id));
            body.innerHTML = items.map(p => `
                <div class="cart-item">
                    <img src="${p.image}" alt="${p.title}">
                    <div class="cart-item-details">
                        <div class="cart-item-title">${p.title}</div>
                        <div class="cart-item-price">$${p.price.toFixed(2)}</div>
                        <button class="btn btn-lime" style="padding: 6px 14px; font-size: 11px; margin-top: 6px;" onclick="addToCart('${p.id}')">
                            Move To Cart
                        </button>
                    </div>
                </div>
            `).join('');
        }

        // Quick View Modal
        function openQuickView(id) {
            const p = PRODUCTS.find(item => item.id === id);
            if (!p) return;

            document.getElementById('modalImg').src = p.image;
            document.getElementById('modalCategory').innerText = p.category;
            document.getElementById('modalTitle').innerText = p.title;
            document.getElementById('modalStars').innerHTML = '<i class="fa-solid fa-star"></i>'.repeat(Math.floor(p.rating));
            document.getElementById('modalReviews').innerText = `(${p.reviews} verified reviews)`;
            document.getElementById('modalDesc').innerText = p.desc;
            document.getElementById('modalPrice').innerText = `$${p.price.toFixed(2)}`;
            
            const addBtn = document.getElementById('modalAddBtn');
            addBtn.onclick = () => {
                addToCart(p.id);
                closeModal();
                openCart();
            };

            document.getElementById('overlay').classList.add('active');
            document.getElementById('quickViewModal').classList.add('active');
        }

        function closeModal() {
            document.getElementById('quickViewModal').classList.remove('active');
            document.getElementById('overlay').classList.remove('active');
        }

        // Drawers
        function openCart() {
            closeAllDrawers();
            document.getElementById('overlay').classList.add('active');
            document.getElementById('cartDrawer').classList.add('active');
        }

        function openWishlist() {
            closeAllDrawers();
            renderWishlistDrawer();
            document.getElementById('overlay').classList.add('active');
            document.getElementById('wishlistDrawer').classList.add('active');
        }

        function closeAllDrawers() {
            document.getElementById('overlay').classList.remove('active');
            document.getElementById('cartDrawer').classList.remove('active');
            document.getElementById('wishlistDrawer').classList.remove('active');
            document.getElementById('quickViewModal').classList.remove('active');
        }

        // Filters & Search
        function filterCategory(cat, btn) {
            activeCategory = cat;
            document.querySelectorAll('.tag-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            renderProducts();
        }

        function filterProducts() {
            renderProducts();
        }

        function focusSearch() {
            const input = document.getElementById('searchInput');
            input.scrollIntoView({ behavior: 'smooth', block: 'center' });
            input.focus();
        }

        // Mobile Nav
        function toggleMenu() {
            document.getElementById('mobileDrawer').classList.toggle('active');
        }
        document.getElementById('menuToggle').addEventListener('click', toggleMenu);

        // Toast Feedback
        function showToast(msg) {
            const container = document.getElementById('toastContainer');
            const toast = document.createElement('div');
            toast.className = 'toast';
            toast.innerHTML = `<i class="fa-solid fa-circle-check" style="color: var(--accent-lime);"></i> <span>${msg}</span>`;
            
            container.appendChild(toast);
            setTimeout(() => {
                toast.style.opacity = '0';
                toast.style.transform = 'translateX(100%)';
                setTimeout(() => toast.remove(), 300);
            }, 3000);
        }

        function claimPromo() {
            showToast('Discount code <strong>AURA2026</strong> copied to clipboard!');
        }

        function checkout() {
            if (cart.length === 0) {
                showToast('Add items to cart before checkout.');
                return;
            }
            showToast('Order received! Initiating cyber dispatch.');
            cart = [];
            updateCartUI();
            closeAllDrawers();
        }

        // Countdown Timer Logic
        function startTimer() {
            let totalSeconds = 2 * 86400 + 14 * 3600 + 38 * 60 + 45;
            setInterval(() => {
                if (totalSeconds <= 0) return;
                totalSeconds--;

                const d = Math.floor(totalSeconds / 86400);
                const h = Math.floor((totalSeconds % 86400) / 3600);
                const m = Math.floor((totalSeconds % 3600) / 60);
                const s = totalSeconds % 60;

                document.getElementById('days').innerText = String(d).padStart(2, '0');
                document.getElementById('hours').innerText = String(h).padStart(2, '0');
                document.getElementById('mins').innerText = String(m).padStart(2, '0');
                document.getElementById('secs').innerText = String(s).padStart(2, '0');
            }, 1000);
        }

        // Initialize App
        window.onload = function() {
            renderProducts();
            startTimer();
        };
    </script>
</body>
</html>
