<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>JOSA — Modern Minimalist Store</title>

    <!-- Google Fonts & Font Awesome Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

    <style>
        :root {
            --bg-body: #F4F8FA;          /* Soft Sky White */
            --bg-surface: #EBF3F8;       /* Very Light Sky Tint */
            --bg-card: #FFFFFF;          /* Pure White Card */
            
            /* Mustard Yellow Spectrum */
            --accent-mustard: #D99B00;    /* Rich Deep Mustard */
            --accent-mustard-hover: #B88300;
            --accent-mustard-soft: #FFF5D6;
            
            /* Sky Blue Spectrum */
            --accent-skyblue: #0284C7;    /* Vibrant Sky Blue */
            --accent-skyblue-hover: #0369A1;
            --accent-skyblue-light: #E0F2FE;
            --accent-skyblue-border: #BAE6FD;

            --text-main: #0F172A;        /* Slate Onyx */
            --text-muted: #475569;       /* Muted Slate Gray */
            --border-color: #E2E8F0;
            --border-active: #0284C7;
            
            --radius-main: 24px;
            --radius-card: 16px;
            --radius-button: 999px;
            --transition: all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
            --container: 1280px;
            --shadow-soft: 0 12px 35px rgba(2, 132, 199, 0.06);
            --shadow-float: 0 16px 36px rgba(217, 155, 0, 0.22);
            
            --gradient-accent: linear-gradient(135deg, #D99B00 0%, #0284C7 100%);
            --gradient-subtle: linear-gradient(135deg, rgba(217, 155, 0, 0.12) 0%, rgba(2, 132, 199, 0.12) 100%);
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
            font-family: 'Plus Jakarta Sans', system-ui, -apple-system, sans-serif;
            background-color: var(--bg-body);
            color: var(--text-main);
            line-height: 1.6;
            overflow-x: hidden;
            -webkit-font-smoothing: antialiased;
        }
        h1, h2, h3, h4, .font-serif {
            font-family: 'Playfair Display', Georgia, serif;
            font-weight: 600;
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
            padding: 0 28px;
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: var(--bg-body);
        }
        ::-webkit-scrollbar-thumb {
            background: var(--accent-skyblue-border);
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: var(--accent-mustard);
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 15px 32px;
            border-radius: var(--radius-button);
            font-weight: 700;
            font-size: 13px;
            letter-spacing: 0.8px;
            text-transform: uppercase;
            transition: var(--transition);
        }
        .btn-mustard {
            background-color: var(--accent-mustard);
            color: #FFFFFF;
        }
        .btn-mustard:hover {
            background-color: var(--accent-mustard-hover);
            transform: translateY(-2px);
            box-shadow: var(--shadow-float);
        }
        .btn-skyblue {
            background-color: var(--accent-skyblue);
            color: #FFFFFF;
        }
        .btn-skyblue:hover {
            background-color: var(--accent-skyblue-hover);
            transform: translateY(-2px);
            box-shadow: 0 16px 36px rgba(2, 132, 199, 0.25);
        }
        .btn-outline {
            background: transparent;
            color: var(--text-main);
            border: 1.5px solid var(--text-main);
        }
        .btn-outline:hover {
            background: var(--text-main);
            color: #FFFFFF;
            transform: translateY(-2px);
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 900;
            background: rgba(244, 248, 250, 0.85);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border-color);
        }
        .nav-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 85px;
        }
        .logo {
            font-family: 'Playfair Display', serif;
            font-size: 30px;
            font-weight: 700;
            letter-spacing: -0.5px;
            display: flex;
            align-items: center;
            gap: 1px;
            color: var(--text-main);
        }
        .logo .logo-jo {
            color: var(--accent-mustard);
        }
        .logo .logo-sa {
            color: var(--accent-skyblue);
        }
        .logo .logo-dot {
            color: var(--text-main);
        }

        .nav-links {
            display: flex;
            gap: 36px;
            list-style: none;
        }
        .nav-links a {
            font-size: 14px;
            font-weight: 600;
            color: var(--text-muted);
            transition: var(--transition);
            letter-spacing: 0.3px;
            position: relative;
        }
        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -6px;
            left: 50%;
            width: 0%;
            height: 2px;
            background: var(--accent-skyblue);
            transition: var(--transition);
            transform: translateX(-50%);
        }
        .nav-links a:hover, .nav-links a.active {
            color: var(--text-main);
        }
        .nav-links a:hover::after, .nav-links a.active::after {
            width: 100%;
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 16px;
        }
        .action-icon {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            color: var(--text-main);
            display: grid;
            place-items: center;
            transition: var(--transition);
            position: relative;
        }
        .action-icon:hover {
            border-color: var(--accent-skyblue);
            color: var(--accent-skyblue);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(2, 132, 199, 0.15);
        }
        .badge {
            position: absolute;
            top: -2px;
            right: -2px;
            background: var(--accent-mustard);
            color: #FFF;
            font-weight: 700;
            font-size: 10px;
            width: 19px;
            height: 19px;
            border-radius: 50%;
            display: grid;
            place-items: center;
        }

        .mobile-toggle { display: none; }
        .mobile-drawer {
            position: fixed;
            top: 85px;
            left: 0;
            right: 0;
            background: var(--bg-card);
            border-bottom: 1px solid var(--border-color);
            padding: 28px;
            display: none;
            flex-direction: column;
            gap: 18px;
            z-index: 899;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }
        .mobile-drawer.active { display: flex; }

        .hero {
            padding-top: 135px;
            padding-bottom: 40px;
        }
        .hero-banner {
            background: var(--bg-surface);
            border-radius: var(--radius-main);
            border: 1px solid var(--accent-skyblue-border);
            padding: 70px 60px;
            position: relative;
            overflow: hidden;
            display: grid;
            grid-template-columns: 1.1fr 0.9fr;
            align-items: center;
            gap: 40px;
            box-shadow: var(--shadow-soft);
        }
        .hero-banner::before {
            content: '';
            position: absolute;
            bottom: -20%;
            right: -10%;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(56, 189, 248, 0.25) 0%, rgba(229, 169, 59, 0.15) 50%, transparent 70%);
            pointer-events: none;
        }
        .hero-tag {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 18px;
            background: var(--accent-mustard-soft);
            color: var(--accent-mustard-hover);
            border: 1px solid rgba(217, 155, 0, 0.3);
            border-radius: var(--radius-button);
            font-size: 12px;
            font-weight: 700;
            margin-bottom: 24px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .hero h1 {
            font-size: 56px;
            line-height: 1.1;
            margin-bottom: 22px;
            color: var(--text-main);
            letter-spacing: -1px;
        }
        .hero h1 i {
            font-style: italic;
            color: var(--accent-skyblue);
        }
        .hero p {
            font-size: 17px;
            color: var(--text-muted);
            margin-bottom: 36px;
            max-width: 500px;
        }
        .hero-img-wrapper {
            position: relative;
            width: 100%;
            height: 380px;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: var(--shadow-soft);
            border: 2px solid #FFFFFF;
        }
        .hero-img-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .controls-bar {
            margin: 50px 0 35px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        .filter-tags {
            display: flex;
            gap: 12px;
            overflow-x: auto;
            padding-bottom: 4px;
        }
        .tag-btn {
            padding: 10px 24px;
            border-radius: var(--radius-button);
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            color: var(--text-muted);
            font-size: 13px;
            font-weight: 600;
            white-space: nowrap;
            transition: var(--transition);
        }
        .tag-btn:hover, .tag-btn.active {
            background: var(--accent-skyblue);
            color: #FFFFFF;
            border-color: var(--accent-skyblue);
            box-shadow: 0 8px 20px rgba(2, 132, 199, 0.2);
        }
        .search-box {
            display: flex;
            align-items: center;
            background: #FFFFFF;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-button);
            padding: 0 20px;
            width: 320px;
            transition: var(--transition);
        }
        .search-box:focus-within {
            border-color: var(--accent-mustard);
            box-shadow: 0 0 15px rgba(217, 155, 0, 0.18);
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
            grid-template-columns: repeat(auto-fill, minmax(290px, 1fr));
            gap: 30px;
            margin-bottom: 90px;
            min-height: 300px;
        }
        .product-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-card);
            padding: 18px;
            transition: var(--transition);
            display: flex;
            flex-direction: column;
            position: relative;
            cursor: pointer;
        }
        .product-card:hover {
            transform: translateY(-8px);
            border-color: var(--accent-skyblue-border);
            box-shadow: 0 20px 40px rgba(2, 132, 199, 0.08);
        }
        .image-container {
            width: 100%;
            aspect-ratio: 1;
            background: var(--bg-surface);
            border-radius: 12px;
            overflow: hidden;
            position: relative;
            margin-bottom: 18px;
        }
        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.7s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .product-card:hover .image-container img {
            transform: scale(1.06);
        }
        .card-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: rgba(255, 255, 255, 0.92);
            backdrop-filter: blur(8px);
            border: 1px solid var(--accent-mustard-soft);
            color: var(--accent-mustard-hover);
            font-size: 11px;
            font-weight: 700;
            padding: 4px 12px;
            border-radius: 20px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .like-btn {
            position: absolute;
            top: 12px;
            right: 12px;
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.92);
            backdrop-filter: blur(8px);
            color: var(--text-muted);
            display: grid;
            place-items: center;
            transition: var(--transition);
            z-index: 5;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        .like-btn:hover, .like-btn.liked {
            color: #E11D48;
            background: #FFF;
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
            color: var(--accent-mustard);
        }
        .product-category {
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--accent-skyblue);
            font-weight: 700;
            margin-bottom: 4px;
        }
        .product-title {
            font-size: 19px;
            font-weight: 600;
            margin-bottom: 12px;
            line-height: 1.35;
        }
        .product-bottom {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: auto;
            padding-top: 14px;
            border-top: 1px solid var(--border-color);
        }
        .price {
            font-size: 20px;
            font-weight: 700;
            color: var(--text-main);
        }
        .add-cart-btn {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: var(--accent-mustard-soft);
            border: 1px solid rgba(217, 155, 0, 0.2);
            color: var(--accent-mustard-hover);
            display: grid;
            place-items: center;
            transition: var(--transition);
        }
        .add-cart-btn:hover {
            background: var(--accent-mustard);
            color: #FFFFFF;
            border-color: var(--accent-mustard);
            transform: scale(1.08);
        }

        .no-results {
            grid-column: 1 / -1;
            text-align: center;
            padding: 80px 20px;
            background: var(--bg-surface);
            border: 1px dashed var(--accent-skyblue-border);
            border-radius: var(--radius-main);
            color: var(--text-muted);
        }
        .no-results i {
            font-size: 40px;
            margin-bottom: 16px;
            color: var(--accent-skyblue);
        }

        .promo-section {
            background: linear-gradient(135deg, #E0F2FE 0%, #FFF5D6 100%);
            border: 1px solid var(--accent-skyblue-border);
            border-radius: var(--radius-main);
            padding: 50px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 30px;
            margin-bottom: 90px;
            position: relative;
            box-shadow: var(--shadow-soft);
        }
        .promo-text h2 {
            font-size: 38px;
            margin-bottom: 12px;
            letter-spacing: -0.5px;
        }
        .countdown {
            display: flex;
            gap: 14px;
            margin-top: 24px;
        }
        .time-box {
            background: #FFFFFF;
            border: 1px solid var(--border-color);
            padding: 14px;
            border-radius: 14px;
            min-width: 72px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
        }
        .time-box .num {
            font-size: 24px;
            font-weight: 700;
            color: var(--accent-skyblue);
        }
        .time-box .label {
            font-size: 10px;
            text-transform: uppercase;
            color: var(--text-muted);
            font-weight: 600;
        }

        .promo-input-group {
            display: flex;
            gap: 10px;
            margin-top: 16px;
        }
        .promo-input-group input {
            padding: 12px 18px;
            border-radius: var(--radius-button);
            border: 1px solid var(--border-color);
            outline: none;
            font-family: inherit;
            font-size: 14px;
            width: 180px;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(15, 23, 42, 0.45);
            backdrop-filter: blur(6px);
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
            width: 450px;
            max-width: 100%;
            height: 100%;
            background: #FFFFFF;
            border-left: 1px solid var(--border-color);
            z-index: 1001;
            transform: translateX(100%);
            transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1);
            display: flex;
            flex-direction: column;
            box-shadow: -10px 0 40px rgba(0,0,0,0.08);
        }
        .side-drawer.active {
            transform: translateX(0);
        }

        .drawer-header {
            padding: 26px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .drawer-header h3 {
            font-size: 22px;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .close-btn {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background: var(--bg-surface);
            color: var(--text-muted);
            display: grid;
            place-items: center;
            transition: var(--transition);
        }
        .close-btn:hover {
            color: var(--text-main);
            background: var(--border-color);
        }

        .drawer-body {
            padding: 26px;
            overflow-y: auto;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .cart-item {
            display: flex;
            gap: 16px;
            background: var(--bg-body);
            border: 1px solid var(--border-color);
            padding: 14px;
            border-radius: var(--radius-card);
            align-items: center;
        }
        .cart-item img {
            width: 75px;
            height: 75px;
            object-fit: cover;
            border-radius: 10px;
        }
        .cart-item-details {
            flex-grow: 1;
        }
        .cart-item-title {
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 4px;
        }
        .cart-item-price {
            color: var(--accent-mustard);
            font-weight: 700;
            font-size: 14px;
            margin-bottom: 8px;
        }
        .qty-controls {
            display: flex;
            align-items: center;
            gap: 12px;
            background: #FFFFFF;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            padding: 2px 10px;
            width: fit-content;
        }
        .qty-btn {
            color: var(--text-main);
            font-size: 12px;
            padding: 2px 4px;
        }
        .qty-btn:hover {
            color: var(--accent-skyblue);
        }

        .drawer-footer {
            padding: 26px;
            border-top: 1px solid var(--border-color);
            background: var(--bg-surface);
        }
        .cart-summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 14px;
            color: var(--text-muted);
        }
        .cart-summary-total {
            display: flex;
            justify-content: space-between;
            font-size: 20px;
            font-weight: 700;
            color: var(--text-main);
            margin-bottom: 22px;
            padding-top: 14px;
            border-top: 1px dashed var(--border-color);
        }

        .modal {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0.95);
            width: 90%;
            max-width: 880px;
            background: #FFFFFF;
            border: 1px solid var(--border-color);
            border-radius: var(--radius-main);
            z-index: 1002;
            opacity: 0;
            pointer-events: none;
            transition: var(--transition);
            box-shadow: 0 30px 70px rgba(0,0,0,0.15);
            overflow: hidden;
        }
        .modal.active {
            opacity: 1;
            pointer-events: auto;
            transform: translate(-50%, -50%) scale(1);
        }

        .modal-grid {
            display: grid;
            grid-template-columns: 1fr 1.1fr;
        }
        .modal-image {
            background: var(--bg-surface);
            display: grid;
            place-items: center;
            padding: 30px;
            position: relative;
        }
        .modal-image img {
            max-height: 400px;
            object-fit: contain;
            border-radius: 12px;
        }
        .modal-content {
            padding: 44px;
            display: flex;
            flex-direction: column;
        }
        .modal-close {
            position: absolute;
            top: 18px;
            right: 18px;
            z-index: 10;
        }

        .option-selector {
            margin-bottom: 20px;
        }
        .option-label {
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            font-weight: 700;
            color: var(--text-muted);
            margin-bottom: 8px;
        }
        .color-chips {
            display: flex;
            gap: 10px;
        }
        .chip {
            padding: 8px 16px;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
        }
        .chip.active, .chip:hover {
            border-color: var(--accent-skyblue);
            color: var(--accent-skyblue);
            background: var(--accent-skyblue-light);
        }

        /* Toast Notifications */
        .toast-container {
            position: fixed;
            bottom: 28px;
            right: 28px;
            z-index: 1100;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        .toast {
            background: var(--text-main);
            color: #FFFFFF;
            padding: 16px 24px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            gap: 14px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.15);
            animation: slideIn 0.35s forwards;
            font-size: 14px;
            font-weight: 500;
        }
        @keyframes slideIn {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        footer {
            background: var(--bg-surface);
            border-top: 1px solid var(--border-color);
            padding: 70px 0 35px;
            margin-top: auto;
        }
        .footer-grid {
            display: grid;
            grid-template-columns: 2fr repeat(3, 1fr);
            gap: 40px;
            margin-bottom: 50px;
        }
        .footer-brand p {
            color: var(--text-muted);
            margin-top: 14px;
            max-width: 340px;
            font-size: 14px;
        }
        .footer-col h4 {
            font-size: 16px;
            margin-bottom: 22px;
            color: var(--text-main);
            letter-spacing: 0.5px;
        }
        .footer-col ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        .footer-col a {
            color: var(--text-muted);
            font-size: 14px;
            transition: var(--transition);
        }
        .footer-col a:hover {
            color: var(--accent-skyblue);
        }
        .footer-bottom {
            padding-top: 35px;
            border-top: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: var(--text-muted);
            font-size: 13px;
        }

        /* Responsive Breakpoints */
        @media (max-width: 992px) {
            .hero-banner { grid-template-columns: 1fr; padding: 45px 35px; }
            .hero h1 { font-size: 42px; }
            .hero-img-wrapper { height: 280px; }
            .modal-grid { grid-template-columns: 1fr; }
            .modal-image { display: none; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
            .promo-section { flex-direction: column; text-align: center; }
            .countdown { justify-content: center; }
        }
        @media (max-width: 768px) {
            .nav-links { display: none; }
            .mobile-toggle { display: grid; }
            .hero h1 { font-size: 34px; }
            .controls-bar { flex-direction: column; align-items: stretch; }
            .search-box { width: 100%; }
            .footer-grid { grid-template-columns: 1fr; }
            .footer-bottom { flex-direction: column; gap: 14px; text-align: center; }
            .side-drawer { width: 100%; }
        }
    </style>
</head>
<body>

    <header>
        <div class="container nav-inner">
            <a href="#" class="logo"><span class="logo-jo">JO</span><span class="logo-sa">SA</span><span class="logo-dot">.</span></a>
            
            <ul class="nav-links">
                <li><a href="#" class="active">Collection</a></li>
                <li><a href="#shop">Shop All</a></li>
                <li><a href="#promo">Special Release</a></li>
                <li><a href="#about">Our Story</a></li>
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

        <div class="mobile-drawer" id="mobileDrawer">
            <a href="#" class="active" onclick="toggleMenu()">Collection</a>
            <a href="#shop" onclick="toggleMenu()">Shop All</a>
            <a href="#promo" onclick="toggleMenu()">Special Release</a>
            <a href="#about" onclick="toggleMenu()">Our Story</a>
        </div>
    </header>

    <main>
        <section class="hero container">
            <div class="hero-banner">
                <div class="hero-content">
                    <span class="hero-tag"><i class="fa-solid fa-sparkles"></i> Autumn / Winter Modern Collection</span>
                    <h1>Vibrant <i>Living</i> & Minimalist Craft</h1>
                    <p>Thoughtfully curated objects, handcrafted ceramics, and sculptural lighting crafted with rich mustard warm tones and sky blue reflections.</p>
                    <div style="display: flex; gap: 16px; flex-wrap: wrap;">
                        <a href="#shop" class="btn btn-mustard">Explore Collection <i class="fa-solid fa-arrow-right"></i></a>
                        <a href="#about" class="btn btn-outline">Read Philosophy</a>
                    </div>
                </div>
                <div class="hero-img-wrapper">
                    <img src="https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?auto=format&fit=crop&w=1000&q=80" alt="Modern Minimalist Interior Design">
                </div>
            </div>
        </section>

        <section class="container" id="shop">
            <div class="controls-bar">
                <div class="filter-tags">
                    <button class="tag-btn active" onclick="filterCategory('all', this)">All Objects</button>
                    <button class="tag-btn" onclick="filterCategory('ceramics', this)">Ceramics</button>
                    <button class="tag-btn" onclick="filterCategory('lighting', this)">Lighting</button>
                    <button class="tag-btn" onclick="filterCategory('furniture', this)">Furniture</button>
                </div>
                <div class="search-box">
                    <i class="fa-solid fa-search" style="color: var(--text-muted);"></i>
                    <input type="text" id="searchInput" placeholder="Search collection (e.g. lamp, vase)..." onkeyup="filterProducts()">
                </div>
            </div>

            <div class="products-grid" id="productsGrid">
                <!-- Injected via JS -->
            </div>
        </section>

        <section class="container" id="promo">
            <div class="promo-section">
                <div class="promo-text">
                    <span style="color: var(--accent-mustard); font-weight: 700; text-transform: uppercase; font-size: 12px; letter-spacing: 1px;">
                        <i class="fa-solid fa-star"></i> Artisan Limited Edition
                    </span>
                    <h2 class="font-serif">The Ochre Sculptural Vessel</h2>
                    <p style="color: var(--text-muted); max-width: 480px;">Hand-thrown by Kyoto artisans using rich unglazed ochre clay. Limited edition batch release of 150 authenticated pieces.</p>
                    
                    <div class="countdown">
                        <div class="time-box"><div class="num" id="days">03</div><div class="label">Days</div></div>
                        <div class="time-box"><div class="num" id="hours">11</div><div class="label">Hours</div></div>
                        <div class="time-box"><div class="num" id="mins">24</div><div class="label">Mins</div></div>
                        <div class="time-box"><div class="num" id="secs">18</div><div class="label">Secs</div></div>
                    </div>
                </div>
                <div>
                    <div style="background: #FFF; padding: 28px; border-radius: 16px; border: 1px solid var(--border-color); box-shadow: var(--shadow-soft);">
                        <div style="font-size: 14px; font-weight: 700; margin-bottom: 6px;">Apply Secret Offer</div>
                        <p style="font-size: 13px; color: var(--text-muted); margin-bottom: 14px;">Use code <strong>JOSA10</strong> for 10% off your entire cart.</p>
                        <div class="promo-input-group">
                            <input type="text" id="couponCode" placeholder="Enter coupon...">
                            <button class="btn btn-skyblue" style="padding: 10px 20px;" onclick="applyCoupon()">Apply</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <div class="overlay" id="overlay" onclick="closeAllDrawers()"></div>

    <!-- Side Cart Drawer -->
    <div class="side-drawer" id="cartDrawer">
        <div class="drawer-header">
            <h3><i class="fa-solid fa-bag-shopping" style="color: var(--accent-skyblue);"></i> Shopping Bag</h3>
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
            <div class="cart-summary-row" id="discountRow" style="display: none; color: var(--accent-mustard);">
                <span>Discount (10%)</span>
                <span id="cartDiscount">-$0.00</span>
            </div>
            <div class="cart-summary-row">
                <span>Carbon Neutral Delivery</span>
                <span style="color: var(--accent-skyblue); font-weight: 600;">COMPLIMENTARY</span>
            </div>
            <div class="cart-summary-total">
                <span>Total</span>
                <span id="cartTotal">$0.00</span>
            </div>
            <button class="btn btn-mustard" style="width: 100%;" onclick="checkout()">Checkout Order <i class="fa-solid fa-arrow-right"></i></button>
        </div>
    </div>

    <!-- Side Wishlist Drawer -->
    <div class="side-drawer" id="wishlistDrawer">
        <div class="drawer-header">
            <h3><i class="fa-solid fa-heart" style="color: var(--accent-mustard);"></i> Saved Objects</h3>
            <button class="close-btn" onclick="closeAllDrawers()"><i class="fa-solid fa-xmark"></i></button>
        </div>
        <div class="drawer-body" id="wishlistBody">
            <!-- Dynamic Wishlist Items -->
        </div>
    </div>

    <!-- Quick View Modal -->
    <div class="modal" id="quickViewModal">
        <button class="close-btn modal-close" onclick="closeModal()"><i class="fa-solid fa-xmark"></i></button>
        <div class="modal-grid">
            <div class="modal-image">
                <img id="modalImg" src="" alt="Object Detail">
            </div>
            <div class="modal-content">
                <span id="modalCategory" class="product-category">Category</span>
                <h2 id="modalTitle" class="font-serif" style="font-size: 30px; margin-bottom: 12px;">Object Title</h2>
                <div class="product-rating" style="margin-bottom: 16px;">
                    <div class="stars" id="modalStars"></div>
                    <span id="modalReviews">(0 reviews)</span>
                </div>
                <p id="modalDesc" style="color: var(--text-muted); font-size: 14px; margin-bottom: 20px; line-height: 1.6;">Description details...</p>
                
                <div class="option-selector">
                    <div class="option-label">Finish / Shade</div>
                    <div class="color-chips">
                        <span class="chip active">Mustard Gold</span>
                        <span class="chip">Sky Blue</span>
                        <span class="chip">Onyx Charcoal</span>
                    </div>
                </div>

                <div style="margin-top: auto; padding-top: 20px;">
                    <div style="font-size: 28px; font-weight: 700; color: var(--text-main); margin-bottom: 18px;" id="modalPrice">$0.00</div>
                    <button class="btn btn-mustard" style="width: 100%;" id="modalAddBtn">Add To Bag</button>
                </div>
            </div>
        </div>
    </div>

    <div class="toast-container" id="toastContainer"></div>

    <footer id="about">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <a href="#" class="logo"><span class="logo-jo">JO</span><span class="logo-sa">SA</span><span class="logo-dot">.</span></a>
                    <p>Dedicated to slow living, vibrant tactile materials, and modern minimal decor for contemporary spaces.</p>
                </div>
                <div class="footer-col">
                    <h4>Collections</h4>
                    <ul>
                        <li><a href="#">Ochre Ceramics</a></li>
                        <li><a href="#">Sky Glow Lighting</a></li>
                        <li><a href="#">Walnut Furniture</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Customer Care</h4>
                    <ul>
                        <li><a href="#">Artisan Shipping</a></li>
                        <li><a href="#">Care Instructions</a></li>
                        <li><a href="#">Sustainability Policy</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Studio</h4>
                    <ul>
                        <li><a href="#">Pinterest Gallery</a></li>
                        <li><a href="#">Instagram Journal</a></li>
                        <li><a href="#">Architectural Digest Feature</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 JOSA Studio. All rights reserved.</p>
                <p>Designed with vibrant mustard & sky blue architectural tones.</p>
            </div>
        </div>
    </footer>

    <script>
        // State Management
        const PRODUCTS = [
            {
                id: 'p1',
                title: 'Kyoto Hand-Thrown Ceramic Vase',
                category: 'ceramics',
                price: 185.00,
                rating: 4.9,
                reviews: 84,
                image: 'https://images.unsplash.com/photo-1612196808214-b7e239e5f6b7?auto=format&fit=crop&w=800&q=80',
                badge: 'Artisan Pick',
                desc: 'Handcrafted stoneware clay vessel with a textured mustard matte glaze finish. Perfect as a standalone centerpiece or dried floral holder.'
            },
            {
                id: 'p2',
                title: 'Sky Blue Sculptural Pendant Light',
                category: 'lighting',
                price: 290.00,
                rating: 4.8,
                reviews: 42,
                image: 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?auto=format&fit=crop&w=800&q=80',
                badge: 'Best Seller',
                desc: 'Organic molded paper pulp shade with a subtle sky blue inner tint producing warm ambient illumination.'
            },
            {
                id: 'p3',
                title: 'Solid Walnut Minimalist Dining Chair',
                category: 'furniture',
                price: 420.00,
                rating: 5.0,
                reviews: 29,
                image: 'https://images.unsplash.com/photo-1580481072645-022f9a6d83d0?auto=format&fit=crop&w=800&q=80',
                badge: 'Crafted',
                desc: 'Sustainably sourced American walnut with hand-rubbed organic oil finish and ergonomic curved back support.'
            },
            {
                id: 'p4',
                title: 'Terracotta Fluted Botanical Planter',
                category: 'ceramics',
                price: 115.00,
                rating: 4.7,
                reviews: 96,
                image: 'https://images.unsplash.com/photo-1485955900006-10f4d324d411?auto=format&fit=crop&w=800&q=80',
                badge: 'New Arrival',
                desc: 'Unglazed ochre terracotta planter designed with natural drainage grooves to keep indoor greenery thriving in style.'
            },
            {
                id: 'p5',
                title: 'Architectural Brass & Linen Table Lamp',
                category: 'lighting',
                price: 240.00,
                rating: 4.9,
                reviews: 63,
                image: 'https://images.unsplash.com/photo-1534349762230-e0cadf78f5da?auto=format&fit=crop&w=800&q=80',
                badge: 'Featured',
                desc: 'Brushed brass tripod base paired with a woven natural linen lampshade for serene bedroom or study lighting.'
            },
            {
                id: 'p6',
                title: 'Japandi Low Curved Coffee Table',
                category: 'furniture',
                price: 580.00,
                rating: 4.9,
                reviews: 38,
                image: 'https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?auto=format&fit=crop&w=800&q=80',
                badge: 'Limited',
                desc: 'Smooth curved white oak coffee table celebrating organic fluid silhouetted lines and soft minimalist geometry.'
            }
        ];

        let cart = [];
        let wishlist = [];
        let activeCategory = 'all';
        let discountRate = 0;

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
                        <i class="fa-solid fa-compass"></i>
                        <h3>No Objects Found</h3>
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
                            <h3 class="product-title font-serif">${p.title}</h3>
                            <div class="product-rating">
                                <div class="stars">${'<i class="fa-solid fa-star"></i>'.repeat(Math.floor(p.rating))}</div>
                                <span>${p.rating} (${p.reviews})</span>
                            </div>
                            <div class="product-bottom">
                                <span class="price">$${p.price.toFixed(2)}</span>
                                <button class="add-cart-btn" onclick="event.stopPropagation(); addToCart('${p.id}')" aria-label="Add to bag">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                `;
            }).join('');
        }

        function addToCart(id) {
            const product = PRODUCTS.find(p => p.id === id);
            const existing = cart.find(item => item.id === id);

            if (existing) {
                existing.qty += 1;
            } else {
                cart.push({ ...product, qty: 1 });
            }

            updateCartUI();
            showToast(`Added <strong>${product.title}</strong> to shopping bag.`);
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
                        <i class="fa-solid fa-bag-shopping" style="font-size: 48px; margin-bottom: 16px; opacity: 0.3;"></i>
                        <p>Your shopping bag is empty.</p>
                    </div>
                `;
                document.getElementById('cartSubtotal').innerText = '$0.00';
                document.getElementById('cartTotal').innerText = '$0.00';
                document.getElementById('discountRow').style.display = 'none';
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

            const discountAmount = subtotal * discountRate;
            const finalTotal = subtotal - discountAmount;

            document.getElementById('cartSubtotal').innerText = `$${subtotal.toFixed(2)}`;
            if (discountRate > 0) {
                document.getElementById('discountRow').style.display = 'flex';
                document.getElementById('cartDiscount').innerText = `-$${discountAmount.toFixed(2)}`;
            } else {
                document.getElementById('discountRow').style.display = 'none';
            }
            document.getElementById('cartTotal').innerText = `$${finalTotal.toFixed(2)}`;
        }

        function toggleWishlist(id) {
            const product = PRODUCTS.find(p => p.id === id);
            const idx = wishlist.indexOf(id);

            if (idx > -1) {
                wishlist.splice(idx, 1);
                showToast(`Removed from saved objects.`);
            } else {
                wishlist.push(id);
                showToast(`Saved <strong>${product.title}</strong> to wishlist.`);
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
                        <i class="fa-regular fa-heart" style="font-size: 48px; margin-bottom: 16px; opacity: 0.3;"></i>
                        <p>No saved objects yet.</p>
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
                        <button class="btn btn-skyblue" style="padding: 6px 14px; font-size: 11px; margin-top: 6px;" onclick="addToCart('${p.id}')">
                            Move To Bag
                        </button>
                    </div>
                </div>
            `).join('');
        }

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

        function toggleMenu() {
            document.getElementById('mobileDrawer').classList.toggle('active');
        }
        document.getElementById('menuToggle').addEventListener('click', toggleMenu);

        function showToast(msg) {
            const container = document.getElementById('toastContainer');
            const toast = document.createElement('div');
            toast.className = 'toast';
            toast.innerHTML = `<i class="fa-solid fa-circle-check" style="color: var(--accent-mustard);"></i> <span>${msg}</span>`;
            
            container.appendChild(toast);
            setTimeout(() => {
                toast.style.opacity = '0';
                toast.style.transform = 'translateX(100%)';
                setTimeout(() => toast.remove(), 350);
            }, 3200);
        }

        function applyCoupon() {
            const code = document.getElementById('couponCode').value.trim().toUpperCase();
            if (code === 'JOSA10' || code === 'AURA10') {
                discountRate = 0.10;
                showToast(`Coupon code <strong>${code}</strong> applied (10% OFF)!`);
                updateCartUI();
            } else {
                showToast('Invalid coupon code. Try <strong>JOSA10</strong>.');
            }
        }

        function checkout() {
            if (cart.length === 0) {
                showToast('Please add items to your bag first.');
                return;
            }
            showToast('Order confirmed! Processing carbon-neutral shipment.');
            cart = [];
            discountRate = 0;
            updateCartUI();
            closeAllDrawers();
        }

        function startTimer() {
            let totalSeconds = 3 * 86400 + 11 * 3600 + 24 * 60 + 18;
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

        window.onload = function() {
            renderProducts();
            startTimer();
        };
    </script>
</body>
</html>
