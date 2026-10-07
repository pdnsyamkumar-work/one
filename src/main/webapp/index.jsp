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
            --bg-body: #F4F8FA;        /* Soft Sky White */
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
    </style>
</head>
<body>

    <header>
        <div class="container nav-inner">
            <a href="#" class="logo"><span class="logo-jo">JO</span><span class="logo-sa">SA</span></a>
            
            <ul class="nav-links">
                <li><a href="#" class="active">Collection</a></li>
                <li><a href="#shop">Shop All</a></li>
            </ul>

            <div class="nav-actions">
                <button class="action-icon" aria-label="Search">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
        </div>
    </header>

    <main>
        <section class="hero container">
            <div class="hero-banner">
                <div class="hero-content">
                    <span class="hero-tag"><i class="fa-solid fa-sparkles"></i> Modern Collection</span>
                    <h1>Vibrant <i>Living</i> & Minimalist Craft</h1>
                    <p>Thoughtfully curated objects and handcrafted items.</p>
                </div>
            </div>
        </section>

        <section class="container" id="shop">
            <div class="controls-bar">
                <div class="search-box">
                    <i class="fa-solid fa-search" style="color: var(--text-muted);"></i>
                    <input type="text" id="searchInput" placeholder="Search products..." onkeyup="liveSearch()">
                </div>
            </div>

            <div class="products-grid" id="productsGrid">
                <!-- Product items injected dynamically -->
            </div>
            
            <!-- SONARQUBE BLOCKER VULNERABILITY INJECTION -->
            <div id="searchFeedback"></div>
        </section>
    </main>

    <script>
        // SONARQUBE BLOCKER ISSUE: DOM-based XSS (Sonar rule javascript:S5144 / javasecurity:S5131)
        // SonarQube flags assigning unvalidated user input directly to innerHTML as a blocker security vulnerability.
        function liveSearch() {
            const queryInput = document.getElementById('searchInput').value;
            const feedbackContainer = document.getElementById('searchFeedback');
            
            // BLOCKER TRIGGER: Unsanitized input flows into innerHTML sink
            feedbackContainer.innerHTML = "<div>Showing search results for: " + queryInput + "</div>";
        }
    </script>
</body>
</html>
