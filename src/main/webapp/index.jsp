<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>AURA — Modern Minimalist Store</title>

    <!-- Google Fonts & Font Awesome Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&family=Syne:wght@700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

    <style>
        /* ========== COLOR PALETTE & SYSTEM VARIABLES ========== */
        :root {
            --bg-body: #0d0f12;
            --bg-surface: #16191e;
            --bg-card: #1e2229;
            --accent-lime: #ccff00;
            --accent-lime-hover: #b3e600;
            --text-main: #f3f4f6;
            --text-muted: #9ca3af;
            --border-color: rgba(255, 255, 255, 0.08);
            --border-active: rgba(204, 255, 0, 0.4);
            --radius-main: 20px;
            --radius-button: 999px;
            --transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            --container: 1280px;
        }

        /* ========== BASE STYLES ========== */
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

        /* ========== BUTTON STYLES ========== */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 14px 28px;
            border-radius: var(--radius-button);
            font-weight: 700;
            font-size: 14px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            transition: var(--transition);
        }
        .btn-lime {
            background-color: var(--accent-lime);
            color: #000;
        }
        .btn-lime:hover {
            background-color: var(--accent-lime-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 25px -5px rgba(204, 255, 0, 0.3);
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

        /* ========== NAVIGATION ========== */
        header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background: rgba(13, 15, 18, 0.8);
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
        }

        .nav-links {
            display: flex;
            gap: 32px;
            list-style: none;
        }
        .nav-links a {
            font-size: 15px;
            font-weight: 500;
            color: var(--text-muted);
            transition: var(--transition);
        }
        .nav-links a:hover, .nav-links a.active {
            color: var(--accent-lime);
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
        }

        /* Mobile Drawer */
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
        }
        .mobile-drawer.active { display: flex; }

        /* ========== HERO SECTION ========== */
        .hero {
            padding-top: 140px;
            padding-bottom: 60px;
        }
        .hero-banner {
            background: linear-gradient(135deg, var(--bg-surface) 0%, var(--bg-card) 100%);
            border-radius: var(--radius-main);
            border: 1px solid var(--border-color);
            padding: 60px;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            min-height: 480px;
        }
        .hero-banner::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 600px;
            height: 600px;
            background: radial-gradient(circle, rgba(204, 255, 0, 0.12) 0%, transparent 70%);
            pointer-events: none;
        }
        .hero-content {
            max-width: 600px;
            z-index: 2;
        }
        .hero-tag {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 6px 16px;
            background: rgba(204, 255, 0, 0.1);
            border: 1px solid var(--border-active);
            color: var(--accent-lime);
            border-radius: var(--radius-button);
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 24px;
            text-transform: uppercase;
        }
        .hero h1 {
            font-size: 56px;
            line-height: 1.05;
            margin-bottom: 20px;
            letter-spacing: -1px;
        }
        .hero p {
            font-size: 18px;
            color: var(--text-muted);
            margin-bottom: 32px;
        }

        /* ========== FILTER & SEARCH BAR ========== */
        .controls-bar {
            margin: 40px 0;
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
            padding: 10px 20px;
            border-radius: var(--radius-button);
            background: var(--bg-surface);
            border: 1px solid var(--border-color);
            color: var(--text-muted);
            font-size: 14px;
            font-weight: 600;
            white-space: nowrap;
            transition: var(--transition);
        }
        .tag-btn:hover, .tag-btn.active {
            background: var(--accent-lime);
            color: #000;
            border-color: var(--accent-lime);
        }
        .search-box {
            display: flex;
            align-items: center;
            background: var(--bg-surface);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-button);
            padding: 0 18px;
            width: 300px;
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
        }

        /* ========== PRODUCT GRID ========== */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 24px;
            margin-bottom: 80px;
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
        }
        .product-card:hover {
            transform: translateY(-6px);
            border-color: var(--border-active);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
        }
        .image-container {
            width: 100%;
            aspect-ratio: 1;
            background: var(--bg-card);
            border-radius: calc(var(--radius-main) - 6px);
            overflow: hidden;
            position: relative;
            margin-bottom: 16px;
        }
        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        .product-card:hover .image-container img {
            transform: scale(1.08);
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
        }
        .like-btn:hover, .like-btn.liked {
            color: #ff4757;
            background: #fff;
        }

        .product-info {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }
        .product-category {
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--text-muted);
            margin-bottom: 4px;
        }
        .product-title {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 12px;
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
        }

        /* ========== PROMO BANNER ========== */
        .promo-section {
            background: var(--bg-surface);
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
        }
        .promo-text h2 {
            font-size: 36px;
            margin-bottom: 12px;
        }
        .countdown {
            display: flex;
            gap: 16px;
            margin-top: 20px;
        }
        .time-box {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            padding: 12px;
            border-radius: 12px;
            min-width: 64px;
            text-align: center;
        }
        .time-box .num {
            font-size: 22px;
            font-weight: 800;
            color: var(--accent-lime);
        }
        .time-box .label {
            font-size: 10px;
            text-transform: uppercase;
            color: var(--text-muted);
        }

        /* ========== FOOTER ========== */
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
            max-width: 300px;
        }
        .footer-col h4 {
            font-size: 16px;
            margin-bottom: 20px;
            color: var(--text-main);
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
            font-size: 14px;
        }

        /* ========== RESPONSIVE DESIGN ========== */
        @media (max-width: 992px) {
            .hero h1 { font-size: 42px; }
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
        }
    </style>
</head>
<body>

    <!-- NAVIGATION -->
    <header>
        <div class="container nav-inner">
            <a href="#" class="logo">AURA<span>.</span></a>
            
            <ul class="nav-links">
                <li><a href="#" class="active">Discover</a></li>
                <li><a href="#shop">Shop All</a></li>
                <li><a href="#categories">Categories</a></li>
                <li><a href="#about">About</a></li>
            </ul>

            <div class="nav-actions">
                <button class="action-icon" aria-label="Search">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
                <button class="action-icon" aria-label="Wishlist">
                    <i class="fa-regular fa-heart"></i>
                </button>
                <button class="action-icon" aria-label="Cart">
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
            <a href="#" class="active">Discover</a>
            <a href="#shop">Shop All</a>
            <a href="#categories">Categories</a>
            <a href="#about">About</a>
        </div>
    </header>

    <!-- MAIN CONTENT -->
    <main>
        <!-- HERO SECTION -->
        <section class="hero container">
            <div class="hero-banner">
                <div class="hero-content">
                    <span class="hero-tag"><i class="fa-solid fa-bolt"></i> Cyber Edition Drop</span>
                    <h1>Next-Gen Gear For Digital Natives</h1>
                    <p>Upgrade your aesthetic with high-performance minimalist technology and modern industrial apparel.</p>
                    <div style="display: flex; gap: 16px; flex-wrap: wrap;">
                        <a href="#shop" class="btn btn-lime">Explore Drop <i class="fa-solid fa-arrow-right"></i></a>
                        <a href="#promo" class="btn btn-glass">View Deals</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- PRODUCT SECTION -->
        <section class="container" id="shop">
            <!-- Controls Bar -->
            <div class="controls-bar">
                <div class="filter-tags">
                    <button class="tag-btn active" onclick="filterCategory('all', this)">All Items</button>
                    <button class="tag-btn" onclick="filterCategory('tech', this)">Cyberware</button>
                    <button class="tag-btn" onclick="filterCategory('apparel', this)">Apparel</button>
                    <button class="tag-btn" onclick="filterCategory('audio', this)">Audio</button>
                </div>
                <div class="search-box">
                    <i class="fa-solid fa-search" style="color: var(--text-muted);"></i>
                    <input type="text" id="searchInput" placeholder="Search gear..." onkeyup="searchProducts()">
                </div>
            </div>

            <!-- Grid -->
            <div class="products-grid" id="productsGrid">
                <!-- Product 1 -->
                <div class="product-card" data-category="audio" data-title="Aura ANC Headphones">
                    <div class="image-container">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80" alt="Headphones">
                        <button class="like-btn" onclick="toggleLike(this)" aria-label="Wishlist"><i class="fa-regular fa-heart"></i></button>
                    </div>
                    <div class="product-info">
                        <span class="product-category">Audio</span>
                        <h3 class="product-title">Aura ANC Headphones</h3>
                        <div class="product-bottom">
                            <span class="price">$349.00</span>
                            <button class="add-cart-btn" onclick="addToCart()" aria-label="Add to cart"><i class="fa-solid fa-plus"></i></button>
                        </div>
                    </div>
                </div>

                <!-- Product 2 -->
                <div class="product-card" data-category="tech" data-title="Chronos Smart Ring">
                    <div class="image-container">
                        <img src="https://images.unsplash.com/photo-1605100804763-247f67b3557e?auto=format&fit=crop&w=600&q=80" alt="Smart Ring">
                        <button class="like-btn" onclick="toggleLike(this)" aria-label="Wishlist"><i class="fa-regular fa-heart"></i></button>
                    </div>
                    <div class="product-info">
                        <span class="product-category">Cyberware</span>
                        <h3 class="product-title">Chronos Smart Ring</h3>
                        <div class="product-bottom">
                            <span class="price">$199.00</span>
                        </div>
                        <div class="product-bottom">
                            <span class="price">$199.00</span>
                            <button class="add-cart-btn" onclick="addToCart()" aria-label="Add to cart"><i class="fa-solid fa-plus"></i></button>
                        </div>
                    </div>
                </div>

                <!-- Product 3 -->
                <div class="product-card" data-category="tech" data-title="CyberDeck Wireless Board">
                    <div class="image-container">
                        <img src="https://images.unsplash.com/photo-1587829741301-dc798b83add3?auto=format&fit=crop&w=600&q=80" alt="Keyboard">
                        <button class="like-btn" onclick="toggleLike(this)" aria-label="Wishlist"><i class="fa-regular fa-heart"></i></button>
                    </div>
                    <div class="product-info">
                        <span class="product-category">Cyberware</span>
                        <h3 class="product-title">CyberDeck Mechanical Board</h3>
                        <div class="product-bottom">
                            <span class="price">$159.00</span>
                            <button class="add-cart-btn" onclick="addToCart()" aria-label="Add to cart"><i class="fa-solid fa-plus"></i></button>
                        </div>
                    </div>
                </div>

                <!-- Product 4 -->
                <div class="product-card" data-category="apparel" data-title="Modular Utility Vest">
                    <div class="image-container">
                        <img src="https://images.unsplash.com/photo-1551028719-00167b16eac5?auto=format&fit=crop&w=600&q=80" alt="Jacket">
                        <button class="like-btn" onclick="toggleLike(this)" aria-label="Wishlist"><i class="fa-regular fa-heart"></i></button>
                    </div>
                    <div class="product-info">
                        <span class="product-category">Apparel</span>
                        <h3 class="product-title">Modular Technical Jacket</h3>
                        <div class="product-bottom">
                            <span class="price">$280.00</span>
                            <button class="add-cart-btn" onclick="addToCart()" aria-label="Add to cart"><i class="fa-solid fa-plus"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- PROMO BANNER -->
        <section class="container" id="promo">
            <div class="promo-section">
                <div class="promo-text">
                    <span style="color: var(--accent-lime); font-weight: 700; text-transform: uppercase; font-size: 12px; letter-spacing: 1px;">Limited Drop</span>
                    <h2>Cyberpunk Matte Obsidian Watch</h2>
                    <p style="color: var(--text-muted); max-width: 450px;">Exclusive titanium casing with sapphire glass crystal. Limited run of 500 units globally.</p>
                    <div class="countdown">
                        <div class="time-box"><div class="num" id="days">01</div><div class="label">Days</div></div>
                        <div class="time-box"><div class="num" id="hours">08</div><div class="label">Hours</div></div>
                        <div class="time-box"><div class="num" id="mins">42</div><div class="label">Mins</div></div>
                        <div class="time-box"><div class="num" id="secs">19</div><div class="label">Secs</div></div>
                    </div>
                </div>
                <div>
                    <button class="btn btn-lime" onclick="addToCart()" style="padding: 20px 40px; font-size: 16px;">Claim Pre-Order — $450</button>
                </div>
            </div>
        </section>
    </main>

    <!-- FOOTER -->
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <a href="#" class="logo">AURA<span>.</span></a>
                    <p>Next-generation lifestyle artifacts designed for speed, utility, and modern aesthetic elegance.</p>
                </div>
                <div class="footer-col">
                    <h4>Navigation</h4>
                    <ul>
                        <li><a href="#">Drop History</a></li>
                        <li><a href="#">Latest Hardware</a></li>
                        <li><a href="#">Lookbook</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Support</h4>
                    <ul>
                        <li><a href="#">Order Tracking</a></li>
                        <li><a href="#">Warranty Policy</a></li>
                        <li><a href="#">Contact Desk</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Social</h4>
                    <ul>
                        <li><a href="#">Instagram</a></li>
                        <li><a href="#">Twitter / X</a></li>
                        <li><a href="#">Discord Community</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 AURA Inc. Built for the modern aesthetic.</p>
                <p>Designed with High Density Dark Systems.</p>
            </div>
        </div>
    </footer>

    <!-- INTERACTIVE SCRIPTS -->
    <script>
        // Mobile Navigation Toggle
        const menuToggle = document.getElementById('menuToggle');
        const mobileDrawer = document.getElementById('mobileDrawer');

        menuToggle.addEventListener('click', () => {
            mobileDrawer.classList.toggle('active');
        });

        // Add to Cart Counter
        let cartCount = 0;
        function addToCart() {
            cartCount++;
            document.getElementById('cartBadge').innerText = cartCount;
        }

        // Toggle Wishlist Like Buttons
        function toggleLike(btn) {
            btn.classList.toggle('liked');
            const icon = btn.querySelector('i');
            if (btn.classList.contains('liked')) {
                icon.className = 'fa-solid fa-heart';
            } else {
                icon.className = 'fa-regular fa-heart';
            }
        }

        // Category Filter
        function filterCategory(category, element) {
            const buttons = document.querySelectorAll('.tag-btn');
            buttons.forEach(btn => btn.classList.remove('active'));
            element.classList.add('active');

            const products = document.querySelectorAll('.product-card');
            products.forEach(product => {
                const prodCat = product.getAttribute('data-category');
                if (category === 'all' || prodCat === category) {
                    product.style.display = 'flex';
                } else {
                    product.style.display = 'none';
                }
            });
        }

        // Search Filter
        function searchProducts() {
            const query = document.getElementById('searchInput').value.toLowerCase();
            const products = document.querySelectorAll('.product-card');

            products.forEach(product => {
                const title = product.getAttribute('data-title').toLowerCase();
                if (title.includes(query)) {
                    product.style.display = 'flex';
                } else {
                    product.style.display = 'none';
                }
            });
        }

        // Timer Simulation
        setInterval(() => {
            const secs = document.getElementById('secs');
            let current = parseInt(secs.innerText);
            if (current > 0) {
                secs.innerText = String(current - 1).padStart(2, '0');
            } else {
                secs.innerText = '59';
            }
        }, 1000);
    </script>
</body>
</html>
