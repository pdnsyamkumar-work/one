<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>NexusShop — Premium Modern E‑Commerce</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Playfair+Display:ital,wght@0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

    <style>
        /* ========== ROOT VARIABLES ========== */
        :root {
            --bg: #f8f9fa;
            --bg-card: #ffffff;
            --primary: #0f172a;
            --primary-light: #1e293b;
            --accent: #6366f1;
            --accent-hover: #4f46e5;
            --accent-light: #e0e7ff;
            --accent-glow: rgba(99, 102, 241, 0.15);
            --text-dark: #0f172a;
            --muted: #64748b;
            --muted-light: #94a3b8;
            --surface: #f1f5f9;
            --border: #e2e8f0;
            --success: #10b981;
            --warning: #f59e0b;
            --radius: 16px;
            --radius-sm: 10px;
            --shadow: 0 4px 20px -2px rgba(15, 23, 42, 0.05);
            --shadow-hover: 0 20px 25px -5px rgba(15, 23, 42, 0.1), 0 8px 10px -6px rgba(15, 23, 42, 0.05);
            --transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            --container: 1240px;
        }

        /* ========== RESET & BASE ========== */
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
            background: var(--bg);
            color: var(--text-dark);
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
        }
        a {
            color: inherit;
            text-decoration: none;
        }
        img {
            display: block;
            max-width: 100%;
        }
        button {
            cursor: pointer;
            font-family: inherit;
            border: none;
            background: none;
            color: inherit;
        }
        input {
            font-family: inherit;
        }

        .container {
            width: 100%;
            max-width: var(--container);
            margin: 0 auto;
            padding: 0 24px;
        }

        /* ========== BUTTONS ========== */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 24px;
            border-radius: 999px;
            font-weight: 600;
            font-size: 14px;
            transition: var(--transition);
            border: 1px solid transparent;
        }
        .btn-primary {
            background: var(--accent);
            color: #fff;
        }
        .btn-primary:hover {
            background: var(--accent-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px var(--accent-glow);
        }
        .btn-secondary {
            background: var(--primary);
            color: #fff;
        }
        .btn-secondary:hover {
            background: var(--primary-light);
            transform: translateY(-2px);
        }
        .btn-outline {
            background: transparent;
            color: var(--text-dark);
            border-color: var(--border);
        }
        .btn-outline:hover {
            background: var(--surface);
            border-color: var(--muted-light);
        }

        /* ========== HEADER ========== */
        header {
            position: sticky;
            top: 0;
            z-index: 100;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(16px);
            border-bottom: 1px solid var(--border);
        }
        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            padding: 16px 0;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 800;
            font-size: 22px;
            letter-spacing: -0.5px;
            color: var(--primary);
        }
        .brand i {
            font-size: 24px;
            color: var(--accent);
        }

        nav.main-nav ul {
            display: flex;
            gap: 8px;
            list-style: none;
        }
        nav.main-nav li a {
            padding: 8px 16px;
            border-radius: 999px;
            font-weight: 600;
            font-size: 14px;
            color: var(--muted);
            transition: var(--transition);
        }
        nav.main-nav li a:hover,
        nav.main-nav li a.active {
            background: var(--accent-light);
            color: var(--accent);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        
        .search-wrap {
            display: flex;
            align-items: center;
            background: var(--surface);
            border-radius: 999px;
            padding: 0 16px;
            border: 1px solid transparent;
            transition: var(--transition);
            width: 240px;
        }
        .search-wrap:focus-within {
            border-color: var(--accent);
            background: #fff;
            box-shadow: 0 0 0 4px var(--accent-glow);
            width: 280px;
        }
        .search-wrap input {
            border: 0;
            background: transparent;
            outline: none;
            width: 100%;
            padding: 10px 0;
            font-size: 14px;
        }

        .icon-btn {
            width: 40px;
            height: 40px;
            display: grid;
            place-items: center;
            border-radius: 50%;
            font-size: 16px;
            color: var(--text-dark);
            background: var(--surface);
            transition: var(--transition);
            position: relative;
        }
        .icon-btn:hover {
            background: var(--accent-light);
            color: var(--accent);
        }

        .cart-count {
            position: absolute;
            top: -2px;
            right: -2px;
            background: var(--accent);
            color: #fff;
            font-size: 10px;
            font-weight: 800;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            display: grid;
            place-items: center;
            border: 2px solid #fff;
        }

        .mobile-toggle {
            display: none;
        }

        #mobileMenu {
            display: none;
            background: #fff;
            border-bottom: 1px solid var(--border);
            padding: 16px 24px;
        }
        #mobileMenu.open {
            display: block;
        }
        #mobileMenu ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        #mobileMenu a {
            display: block;
            padding: 10px 0;
            font-weight: 600;
            color: var(--text-dark);
        }

        /* ========== HERO ========== */
        .hero {
            margin: 24px 0 0;
            border-radius: 24px;
            background: linear-gradient(135deg, #0f172a 0%, #1e1b4b 100%);
            color: #fff;
            padding: 80px 0;
            position: relative;
            overflow: hidden;
        }
        .hero::after {
            content: '';
            position: absolute;
            right: -10%;
            bottom: -20%;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, var(--accent) 0%, transparent 70%);
            opacity: 0.2;
            pointer-events: none;
        }
        .hero .badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            color: var(--accent-light);
            padding: 6px 16px;
            border-radius: 999px;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 20px;
        }
        .hero h1 {
            font-family: 'Playfair Display', serif;
            font-size: 56px;
            line-height: 1.1;
            max-width: 600px;
            margin-bottom: 20px;
        }
        .hero p {
            color: var(--muted-light);
            font-size: 18px;
            max-width: 480px;
            margin-bottom: 32px;
        }

        /* ========== SECTION ========== */
        .section {
            padding: 60px 0;
        }
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 32px;
        }
        .section-header h2 {
            font-size: 30px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        /* ========== CATEGORIES ========== */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 16px;
        }
        .cat-card {
            background: var(--bg-card);
            border-radius: var(--radius);
            padding: 24px 16px;
            text-align: center;
            border: 1px solid var(--border);
            transition: var(--transition);
        }
        .cat-card:hover {
            transform: translateY(-4px);
            border-color: var(--accent);
            box-shadow: var(--shadow-hover);
        }
        .cat-card .icon-wrap {
            width: 52px;
            height: 52px;
            border-radius: 16px;
            background: var(--surface);
            display: grid;
            place-items: center;
            margin: 0 auto 12px;
            font-size: 20px;
            color: var(--accent);
            transition: var(--transition);
        }
        .cat-card:hover .icon-wrap {
            background: var(--accent);
            color: #fff;
        }

        /* ========== PRODUCTS ========== */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
        }
        .product-card {
            background: var(--bg-card);
            border-radius: var(--radius);
            border: 1px solid var(--border);
            overflow: hidden;
            transition: var(--transition);
            display: flex;
            flex-direction: column;
            position: relative;
        }
        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-hover);
            border-color: rgba(99, 102, 241, 0.3);
        }
        .product-card .img-wrap {
            position: relative;
            aspect-ratio: 1;
            background: var(--surface);
            overflow: hidden;
        }
        .product-card .img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }
        .product-card:hover .img-wrap img {
            transform: scale(1.05);
        }
        .product-card .wish-btn {
            position: absolute;
            top: 12px;
            right: 12px;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(4px);
            display: grid;
            place-items: center;
            transition: var(--transition);
        }
        .product-card .wish-btn:hover {
            background: #fff;
            color: #ef4444;
        }
        .product-card .wish-btn.active {
            color: #ef4444;
        }
        .product-card .body {
            padding: 16px;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }
        .product-card .category-tag {
            font-size: 12px;
            color: var(--muted);
            font-weight: 600;
            text-transform: uppercase;
        }
        .product-card h3 {
            font-size: 16px;
            font-weight: 700;
            margin: 4px 0 8px;
        }
        .product-card .price-row {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: auto;
            padding-top: 12px;
        }
        .product-card .price {
            font-size: 18px;
            font-weight: 800;
        }
        .product-card .add-btn {
            width: 100%;
            margin-top: 12px;
            padding: 10px;
            border-radius: var(--radius-sm);
            background: var(--surface);
            font-weight: 600;
            font-size: 14px;
            transition: var(--transition);
        }
        .product-card .add-btn:hover {
            background: var(--accent);
            color: #fff;
        }

        /* ========== DEAL ========== */
        .deal-wrap {
            background: var(--bg-card);
            border-radius: 24px;
            border: 1px solid var(--border);
            display: flex;
            overflow: hidden;
        }
        .deal-img {
            flex: 1;
            min-height: 350px;
        }
        .deal-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .deal-content {
            flex: 1;
            padding: 48px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .timer-grid {
            display: flex;
            gap: 12px;
            margin: 20px 0;
        }
        .timer-box {
            background: var(--surface);
            padding: 12px 16px;
            border-radius: var(--radius-sm);
            text-align: center;
            min-width: 64px;
        }
        .timer-box .num {
            font-size: 20px;
            font-weight: 800;
        }
        .timer-box .label {
            font-size: 11px;
            color: var(--muted);
            text-transform: uppercase;
        }

        /* ========== TESTIMONIALS ========== */
        .testimonials-scroll {
            display: flex;
            gap: 20px;
            overflow-x: auto;
            padding-bottom: 12px;
        }
        .testimonial-card {
            flex: 0 0 320px;
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 24px;
        }

        /* ========== NEWSLETTER ========== */
        .newsletter-wrap {
            background: var(--primary);
            color: #fff;
            border-radius: 24px;
            padding: 48px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 24px;
        }
        .newsletter-wrap form {
            display: flex;
            gap: 12px;
            flex: 1;
            max-width: 440px;
        }
        .newsletter-wrap input {
            flex: 1;
            padding: 12px 20px;
            border-radius: 999px;
            border: 0;
            outline: none;
        }

        /* ========== FOOTER ========== */
        footer {
            border-top: 1px solid var(--border);
            padding: 40px 0;
            margin-top: 40px;
            color: var(--muted);
            font-size: 14px;
        }

        /* ========== RESPONSIVE ========== */
        @media (max-width: 1024px) {
            .products-grid { grid-template-columns: repeat(3, 1fr); }
            .categories-grid { grid-template-columns: repeat(3, 1fr); }
        }
        @media (max-width: 768px) {
            nav.main-nav { display: none; }
            .mobile-toggle { display: grid; }
            .products-grid { grid-template-columns: repeat(2, 1fr); }
            .deal-wrap { flex-direction: column; }
            .newsletter-wrap { flex-direction: column; text-align: center; }
            .newsletter-wrap form { width: 100%; }
            .hero h1 { font-size: 36px; }
            .search-wrap { display: none; }
        }
        @media (max-width: 480px) {
            .products-grid { grid-template-columns: 1fr; }
            .categories-grid { grid-template-columns: repeat(2, 1fr); }
        }
    </style>
</head>
<body>

    <header>
        <div class="container header-inner">
            <a href="#" class="brand">
                <i class="fa-solid fa-cube"></i>
                NexusShop
            </a>

            <nav class="main-nav">
                <ul>
                    <li><a href="#" class="active">Home</a></li>
                    <li><a href="#categories">Categories</a></li>
                    <li><a href="#products">Shop</a></li>
                    <li><a href="#deals">Deals</a></li>
                </ul>
            </nav>

            <div class="header-actions">
                <div class="search-wrap">
                    <i class="fa-solid fa-magnifying-glass muted"></i>
                    <input type="text" id="searchInput" placeholder="Search products..." onkeyup="filterProducts()">
                </div>
                <button class="icon-btn" aria-label="Wishlist">
                    <i class="fa-regular fa-heart"></i>
                </button>
                <button class="icon-btn" aria-label="Cart">
                    <i class="fa-solid fa-bag-shopping"></i>
                    <span class="cart-count" id="cartCount">0</span>
                </button>
                <button class="icon-btn mobile-toggle" id="menuToggle" onclick="toggleMenu()" aria-label="Toggle Menu">
                    <i class="fa-solid fa-bars"></i>
                </button>
            </div>
        </div>

        <div id="mobileMenu">
            <ul>
                <li><a href="#" onclick="toggleMenu()">Home</a></li>
                <li><a href="#categories" onclick="toggleMenu()">Categories</a></li>
                <li><a href="#products" onclick="toggleMenu()">Shop</a></li>
                <li><a href="#deals" onclick="toggleMenu()">Deals</a></li>
            </ul>
        </div>
    </header>

    <div class="container">
        <section class="hero">
            <div class="container">
                <span class="badge"><i class="fa-solid fa-bolt"></i> New Arrival Collection</span>
                <h1>Elevate Your Lifestyle Essentials</h1>
                <p>Discover a curated lineup of premium minimalism designed for modern daily living.</p>
                <div style="display: flex; gap: 12px;">
                    <a href="#products" class="btn btn-primary">Shop Collection</a>
                    <a href="#deals" class="btn btn-outline" style="color: #fff; border-color: rgba(255,255,255,0.3)">Explore Deals</a>
                </div>
            </div>
        </section>
    </div>

    <section class="section container" id="categories">
        <div class="section-header">
            <div>
                <h2>Categories</h2>
                <p class="muted">Browse by collection</p>
            </div>
        </div>
        <div class="categories-grid">
            <div class="cat-card">
                <div class="icon-wrap"><i class="fa-solid fa-laptop"></i></div>
                <h4>Tech</h4>
            </div>
            <div class="cat-card">
                <div class="icon-wrap"><i class="fa-solid fa-shirt"></i></div>
                <h4>Apparel</h4>
            </div>
            <div class="cat-card">
                <div class="icon-wrap"><i class="fa-solid fa-couch"></i></div>
                <h4>Home</h4>
            </div>
            <div class="cat-card">
                <div class="icon-wrap"><i class="fa-solid fa-clock"></i></div>
                <h4>Watches</h4>
            </div>
            <div class="cat-card">
                <div class="icon-wrap"><i class="fa-solid fa-headphones"></i></div>
                <h4>Audio</h4>
            </div>
            <div class="cat-card">
                <div class="icon-wrap"><i class="fa-solid fa-glasses"></i></div>
                <h4>Accessories</h4>
            </div>
        </div>
    </section>

    <section class="section container" id="products">
        <div class="section-header">
            <div>
                <h2>Featured Products</h2>
                <p class="muted">Hand-selected items for quality and design</p>
            </div>
        </div>
        <div class="products-grid" id="productsGrid">
            <div class="product-card" data-title="Wireless Noise-Canceling Headphones">
                <div class="img-wrap">
                    <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80" alt="Headphones">
                    <button class="wish-btn" onclick="toggleWish(this)" aria-label="Add to Wishlist"><i class="fa-regular fa-heart"></i></button>
                </div>
                <div class="body">
                    <span class="category-tag">Audio</span>
                    <h3>Wireless Noise-Canceling Headphones</h3>
                    <div class="price-row">
                        <span class="price">$299.00</span>
                    </div>
                    <button class="add-btn" onclick="addToCart()"><i class="fa-solid fa-cart-plus"></i> Add to Cart</button>
                </div>
            </div>

            <div class="product-card" data-title="Minimalist Leather Watch">
                <div class="img-wrap">
                    <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=600&q=80" alt="Watch">
                    <button class="wish-btn" onclick="toggleWish(this)" aria-label="Add to Wishlist"><i class="fa-regular fa-heart"></i></button>
                </div>
                <div class="body">
                    <span class="category-tag">Accessories</span>
                    <h3>Minimalist Leather Watch</h3>
                    <div class="price-row">
                        <span class="price">$149.00</span>
                    </div>
                    <button class="add-btn" onclick="addToCart()"><i class="fa-solid fa-cart-plus"></i> Add to Cart</button>
                </div>
            </div>

            <div class="product-card" data-title="Smart Fitness Watch">
                <div class="img-wrap">
                    <img src="https://images.unsplash.com/photo-1546868871-7041f2a55e12?auto=format&fit=crop&w=600&q=80" alt="Smart Watch">
                    <button class="wish-btn" onclick="toggleWish(this)" aria-label="Add to Wishlist"><i class="fa-regular fa-heart"></i></button>
                </div>
                <div class="body">
                    <span class="category-tag">Tech</span>
                    <h3>Smart Fitness Watch</h3>
                    <div class="price-row">
                        <span class="price">$199.00</span>
                    </div>
                    <button class="add-btn" onclick="addToCart()"><i class="fa-solid fa-cart-plus"></i> Add to Cart</button>
                </div>
            </div>

            <div class="product-card" data-title="Premium Ergonomic Chair">
                <div class="img-wrap">
                    <img src="https://images.unsplash.com/photo-1580481072645-022f9a6d1270?auto=format&fit=crop&w=600&q=80" alt="Chair">
                    <button class="wish-btn" onclick="toggleWish(this)" aria-label="Add to Wishlist"><i class="fa-regular fa-heart"></i></button>
                </div>
                <div class="body">
                    <span class="category-tag">Furniture</span>
                    <h3>Premium Ergonomic Chair</h3>
                    <div class="price-row">
                        <span class="price">$349.00</span>
                    </div>
                    <button class="add-btn" onclick="addToCart()"><i class="fa-solid fa-cart-plus"></i> Add to Cart</button>
                </div>
            </div>
        </div>
    </section>

    <section class="section container" id="deals">
        <div class="deal-wrap">
            <div class="deal-img">
                <img src="https://images.unsplash.com/photo-1608231387042-66d1773070a5?auto=format&fit=crop&w=800&q=80" alt="Deal Product">
            </div>
            <div class="deal-content">
                <span class="category-tag" style="color: var(--accent);">Deal Of The Week</span>
                <h3 style="font-size: 32px; font-weight: 800; margin: 8px 0;">Premium Wireless Speaker</h3>
                <p class="muted">Experience room-filling acoustic performance in a compact, portable design.</p>
                <div class="timer-grid">
                    <div class="timer-box"><div class="num" id="days">02</div><div class="label">Days</div></div>
                    <div class="timer-box"><div class="num" id="hours">14</div><div class="label">Hours</div></div>
                    <div class="timer-box"><div class="num" id="mins">35</div><div class="label">Mins</div></div>
                    <div class="timer-box"><div class="num" id="secs">10</div><div class="label">Secs</div></div>
                </div>
                <div>
                    <button class="btn btn-primary" onclick="addToCart()">Claim Deal — $129.00</button>
                </div>
            </div>
        </div>
    </section>

    <section class="section container">
        <div class="section-header">
            <h2>What Our Customers Say</h2>
        </div>
        <div class="testimonials-scroll">
            <div class="testimonial-card">
                <p style="margin-bottom: 16px;">"Exceptionally fast shipping and clean minimal packaging. The product surpassed my expectations!"</p>
                <strong>— Alex Rivera</strong>
            </div>
            <div class="testimonial-card">
                <p style="margin-bottom: 16px;">"Simple, clear interface and seamless checkout process. Highly recommended."</p>
                <strong>— Sarah Jenkins</strong>
            </div>
            <div class="testimonial-card">
                <p style="margin-bottom: 16px;">"Customer support resolved my issue within minutes. Top notch quality and service."</p>
                <strong>— David Chen</strong>
            </div>
        </div>
    </section>

    <section class="section container">
        <div class="newsletter-wrap">
            <div>
                <h3 style="font-size: 24px; font-weight: 800;">Join the Nexus Club</h3>
                <p style="color: var(--muted-light);">Subscribe to receive exclusive offers and early product drops.</p>
            </div>
            <form onsubmit="event.preventDefault(); alert('Subscribed successfully!');">
                <input type="email" placeholder="Enter your email" required>
                <button type="submit" class="btn btn-primary">Subscribe</button>
            </form>
        </div>
    </section>

    <footer class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 16px;">
            <div class="brand">
                <i class="fa-solid fa-cube"></i> NexusShop
            </div>
            <p>&copy; 2026 NexusShop Inc. All rights reserved.</p>
        </div>
    </footer>

    <script>
        // Mobile Menu Toggle
        function toggleMenu() {
            const menu = document.getElementById('mobileMenu');
            menu.classList.toggle('open');
        }

        // Cart Count Incrementor
        let cartCount = 0;
        function addToCart() {
            cartCount++;
            document.getElementById('cartCount').innerText = cartCount;
        }

        // Wishlist Toggle
        function toggleWish(btn) {
            btn.classList.toggle('active');
            const icon = btn.querySelector('i');
            if (btn.classList.contains('active')) {
                icon.className = 'fa-solid fa-heart';
            } else {
                icon.className = 'fa-regular fa-heart';
            }
        }

        // Real-Time Product Filtering
        function filterProducts() {
            const query = document.getElementById('searchInput').value.toLowerCase();
            const products = document.querySelectorAll('#productsGrid .product-card');

            products.forEach(product => {
                const title = product.getAttribute('data-title').toLowerCase();
                if (title.includes(query)) {
                    product.style.display = 'flex';
                } else {
                    product.style.display = 'none';
                }
            });
        }

        // Countdown Timer Mock logic
        setInterval(() => {
            const secs = document.getElementById('secs');
            let currentSecs = parseInt(secs.innerText);
            if (currentSecs > 0) {
                secs.innerText = String(currentSecs - 1).padStart(2, '0');
            } else {
                secs.innerText = '59';
            }
        }, 1000);
    </script>
</body>
</html>
