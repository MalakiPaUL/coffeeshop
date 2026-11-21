# Gertrudes Cafe — Coffee Shop & Delivery

A responsive coffee shop website with menu browsing, shopping cart, checkout, sign-in/sign-up, and contact form. Built with HTML, CSS, and vanilla JavaScript, running on XAMPP (Apache + MariaDB).

## Live Site

https://MalakiPaUL.github.io/coffeeshop/

## Local Access (XAMPP)

1. Start Apache and MySQL in the XAMPP Control Panel.
2. Place this folder in `C:\xampp\htdocs\coffee_shop\`.
3. Open: `http://localhost/coffee_shop/`

## Database Setup

1. Open phpMyAdmin: `http://localhost/phpmyadmin`
2. Create a new database named **`coffeedb`**.
3. Import the file `coffeedb.sql` from this project.
4. Connection config is in `db.php` (host: `127.0.0.1`, port: `3306`, user: `root`, no password).

## Project Structure

```
coffee_shop/
├── index.html          # Home page
├── menu.html           # Menu + cart + checkout
├── about.html          # About page (mission, vision, values)
├── contact.html        # Contact form
├── signin.html         # Customer / rider sign-in
├── signup.html         # Registration
├── style.css           # Styles (responsive)
├── main.js             # Cart, validation, auth logic
├── db.php              # PDO database connection
├── coffeedb.sql        # Database schema + seed data
└── assets/             # Images (brand, products, decor, hero)
```

## Features

- Responsive navigation (mobile toggle)
- Product catalog with search/filter
- Shopping cart with add/remove/adjust quantity
- Checkout with delivery fee and order confirmation
- Customer / Delivery Rider sign-in & sign-up
- Form validation (email, phone, password)

## Notes

This is a front-end school-project demo. Orders are stored in `localStorage`, not sent to a real backend. Connect `db.php` to your `coffeedb` database to persist users and orders.
