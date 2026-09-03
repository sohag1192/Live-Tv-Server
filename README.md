# 📺 Live TV Server & Web Streaming Platform

<div align="center">

![Live TV Banner](https://placehold.co/1200x400/0c0d14/a855f7?text=📺+Live+TV+Streaming+Platform&font=montserrat)

[![Live Demo](https://img.shields.io/badge/Live-Demo-7c3aed?style=for-the-badge&logo=googlechrome&logoColor=white)](https://sohag1192.github.io/Live-Tv-Server/)
[![Channels](https://img.shields.io/badge/Channels-54%2B%20Live%20HD-ef4444?style=for-the-badge&logo=youtube&logoColor=white)](https://sohag1192.github.io/Live-Tv-Server/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)
[![Visitor Count](https://hitscounter.dev/api/hit?url=https%3A%2F%2Fgithub.com%2Fsohag1192%2FLive-Tv-Server&label=Visitors&icon=github&color=%237c3aed&message=&style=for-the-badge&tz=UTC)](https://github.com/sohag1192/Live-Tv-Server)

A modern, responsive, and high-performance web-based Live TV streaming platform featuring **54+ Bangladeshi and International HD TV channels**. Built with support for **HLS (`.m3u8`)** via Hls.js and **MPEG-DASH (`.mpd`) + Widevine DRM** via Google Shaka Player, wrapped in an encrypted stream security vault.

[Explore Features](#-key-features) • [Quick Start & Deployment](#-quick-start--server-deployment) • [Nginx Setup](#2-nginx-production-server) • [Apache2 Setup](#3-apache2-production-server) • [Keyboard Shortcuts](#-keyboard-shortcuts) • [Security](#-stream-security--encryption)

</div>

---

## ✨ Key Features

- 🛰️ **54+ Live HD Channels**: Complete lineup spanning **News, Sports, Entertainment, Movies, Kids, Music, and Infotainment**.
- 🛡️ **Encrypted Stream Vault**: Stream URLs (`.m3u8`, `.mpd`) and Widevine DRM licenses are fully encrypted into an obfuscated payload with dynamic in-memory decryption. Zero raw stream links are exposed in plain HTML.
- ⚙️ **Video Quality Selector**: Built-in resolution switcher (**Auto, 1080p, 720p, 480p, 360p**) with dynamic bitrate detection.
- ❤️ **Favorites & Recent History**: Mark favorite channels with 1 click and automatically track recently watched channels (saved to `localStorage`).
- ⚡ **Dual Streaming Engines**:
  - **HLS.js**: Low-latency HLS manifest parsing and adaptive bitrate playback.
  - **Google Shaka Player**: MPEG-DASH manifest parser with hardware-accelerated Widevine DRM decryption.
- 🔍 **Instant Search & Category Filtering**: Real-time filtering by channel name, channel number, or category with live channel count badges.
- 🌓 **Dynamic Theme Switcher**:
  - **Standard Player**: Ambient Glassmorphism Dark & Clean High-Contrast Light mode with persistent `localStorage` memory.
  - **Cinema Player**: Multi-theme support (**Netflix Dark**, **Light Blue**, **Cyber Green**, **Synth Purple**).
- 🎮 **Full Player Controls**: Play/Pause, Next/Previous Channel, Reload Stream, Picture-in-Picture (PiP), Fullscreen, and Volume slider with memory.
- 📺 **Smart TV D-Pad Remote Navigation**: Smooth arrow-key navigation with glowing focus borders optimized for Android TV / Smart TV browsers.
- 📱 **100% Mobile & Smart TV Responsive**: Optimized touch UI, sticky player modes, and adaptable channel grids.

---

## 🎛️ Player Views

| Player View | Path | Description |
| :--- | :--- | :--- |
| **Primary Web TV Player** | [`index.html`](index.html) | Glassmorphic interface with full player controls, channel grid list, search, category chips, and dark/light mode. |
| **Cinema / Netflix Mode** | [`Web Tv-V1/index.html`](Web%20Tv-V1/index.html) | Netflix-inspired cinematic layout with sticky 16:9 player, multi-theme selector, and channel catalog. |
| **TV Guide View** | [`Web Tv-V2/index.html`](Web%20Tv-V2/index.html) | Multi-channel TV guide view with quick preview switching. |
| **Standalone Stream Players** | [`Web Tv-V2/tv1.html`](Web%20Tv-V2/tv1.html) ... `tv12.html` | Minimalist dedicated channel players for embeds and iframe integration. |

---

## 🚀 Quick Start & Server Deployment

You can deploy and run **Live TV Server** locally or on any production web server (**Nginx, Apache2, Docker, or Node/Python**).

### 1. Local Development (Quick Test)

First, clone the repository:
```bash
git clone https://github.com/sohag1192/Live-Tv-Server.git
cd Live-Tv-Server
```

Run a lightweight static server using one of the following:

```bash
# Option A: Using Python 3 (Recommended for quick testing)
python -m http.server 8080

# Option B: Using Node.js (npx serve)
npx serve . -p 8080

# Option C: Using PHP Built-in Server
php -S localhost:8080
```

Open your browser and navigate to **`http://localhost:8080`**.

---

### 2. Nginx Production Server

Nginx provides high throughput, low memory usage, and robust streaming delivery.

#### Step 1: Install Nginx on Ubuntu / Debian
```bash
sudo apt update
sudo apt install nginx git -y
```

#### Step 2: Clone the Project to Web Root
```bash
sudo git clone https://github.com/sohag1192/Live-Tv-Server.git /var/www/livetv
sudo chown -R www-data:www-data /var/www/livetv
sudo chmod -R 755 /var/www/livetv
```

#### Step 3: Create Nginx Virtual Host Configuration
Create a new server block file:
```bash
sudo nano /etc/nginx/sites-available/livetv.conf
```

Paste the following optimized Nginx configuration:
```nginx
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com; # Or your server IP

    root /var/www/livetv;
    index index.html;

    # Gzip Compression for fast delivery
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

    # CORS Headers for Video Streaming Manifests
    location / {
        try_files $uri $uri/ /index.html;

        add_header Access-Control-Allow-Origin * always;
        add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS' always;
        add_header Access-Control-Allow-Headers 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range' always;
        add_header Access-Control-Expose-Headers 'Content-Length,Content-Range' always;
    }

    # Static Assets & Video Caching
    location ~* \.(m3u8|mpd|ts|m4s|mp4|webm)$ {
        add_header Access-Control-Allow-Origin * always;
        add_header Cache-Control "no-cache";
        expires -1;
    }

    location ~* \.(jpg|jpeg|png|gif|ico|css|js|svg|woff|woff2)$ {
        expires 7d;
        add_header Cache-Control "public, no-transform";
    }
}
```

#### Step 4: Enable Site & Restart Nginx
```bash
sudo ln -s /etc/nginx/sites-available/livetv.conf /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

#### Step 5: (Optional) Enable Free HTTPS with SSL (Certbot)
```bash
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d yourdomain.com
```

---

### 3. Apache2 Production Server

If you prefer Apache2 on Ubuntu, Debian, or CentOS:

#### Step 1: Install Apache2
```bash
sudo apt update
sudo apt install apache2 git -y
```

#### Step 2: Enable Required Apache Modules
```bash
sudo a2enmod rewrite headers expires ssl
sudo systemctl restart apache2
```

#### Step 3: Clone Project to `/var/www/livetv`
```bash
sudo git clone https://github.com/sohag1192/Live-Tv-Server.git /var/www/livetv
sudo chown -R www-data:www-data /var/www/livetv
sudo chmod -R 755 /var/www/livetv
```

#### Step 4: Create Apache VirtualHost Configuration
```bash
sudo nano /etc/apache2/sites-available/livetv.conf
```

Add the following VirtualHost configuration:
```apache
<VirtualHost *:80>
    ServerName yourdomain.com
    ServerAlias www.yourdomain.com
    DocumentRoot /var/www/livetv

    <Directory /var/www/livetv>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted

        # Enable CORS for Streams
        Header set Access-Control-Allow-Origin "*"
        Header set Access-Control-Allow-Methods "GET, POST, OPTIONS"
        Header set Access-Control-Allow-Headers "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range"
    </Directory>

    # Custom MIME types for HLS and DASH streaming
    AddType application/vnd.apple.mpegurl .m3u8
    AddType video/mp2t .ts
    AddType application/dash+xml .mpd
    AddType video/iso.segment .m4s

    ErrorLog ${APACHE_LOG_DIR}/livetv_error.log
    CustomLog ${APACHE_LOG_DIR}/livetv_access.log combined
</VirtualHost>
```

#### Step 5: Enable Site & Restart Apache
```bash
sudo a2ensite livetv.conf
sudo a2dissite 000-default.conf
sudo apache2ctl configtest
sudo systemctl restart apache2
```

#### Step 6: (Optional) SSL Certificate for Apache2
```bash
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache -d yourdomain.com
```

---

### 4. Docker Deployment (1-Line Run)

Deploy instantly in an isolated Nginx container:

```bash
docker run -d \
  --name livetv-server \
  -p 80:80 \
  -v $(pwd):/usr/share/nginx/html:ro \
  nginx:alpine
```

Or with `docker-compose.yml`:
```yaml
version: '3.8'
services:
  livetv:
    image: nginx:alpine
    container_name: livetv-server
    restart: always
    ports:
      - "8080:80"
    volumes:
      - ./:/usr/share/nginx/html:ro
```
Run `docker compose up -d` to start.

---

## ⌨️ Keyboard Shortcuts

| Shortcut | Action |
| :---: | :--- |
| <kbd>↑</kbd> / <kbd>←</kbd> | Previous Channel |
| <kbd>↓</kbd> / <kbd>→</kbd> | Next Channel |
| <kbd>Enter</kbd> / <kbd>OK</kbd> | Select / Play Focused Channel (Smart TV) |
| <kbd>Space</kbd> | Play / Pause Stream |
| <kbd>M</kbd> | Mute / Unmute Audio |
| <kbd>F</kbd> | Toggle Fullscreen Mode |
| <kbd>P</kbd> | Toggle Picture-in-Picture (PiP) |
| <kbd>/</kbd> | Focus Instant Search Bar |
| <kbd>Esc</kbd> | Exit Search / Exit Fullscreen |

---

## 🔒 Stream Security & Encryption

To prevent stream scraping and safeguard media sources:
- All `.m3u8` and `.mpd` endpoints along with Widevine DRM license configurations are encoded with a **multi-round stream cipher and Base64 vault**.
- Decryption happens **in-memory at runtime** in the browser right before attaching to the player instance.
- DOM attributes do not expose raw stream URLs.

---

## 📁 Repository Structure

```text
Live-Tv-Server/
├── index.html              # Primary Web TV Player (Glassmorphic UI + Full Controls)
├── README.md               # Project documentation & server deployment guide
├── upload.bat              # Quick Git deployment script
├── Web Tv-V1/
│   └── index.html          # Cinema / Netflix-style player with multi-theme switcher
└── Web Tv-V2/
    ├── index.html          # Interactive TV Guide player
    ├── test.html           # Standalone stream tester
    ├── tv1.html            # ATN News standalone player
    ├── tv2.html            # ATN Bangla standalone player
    ├── tv3.html            # Banglavision standalone player
    ├── tv4.html            # BTV standalone player
    ├── tv5.html            # Channel I standalone player
    ├── tv6.html            # Channel 24 standalone player
    ├── tv7.html            # Deepto TV standalone player
    ├── tv8.html            # Ekattor TV standalone player
    ├── tv9.html            # Independent TV standalone player
    ├── tv10.html           # Jamuna TV standalone player
    ├── tv11.html           # NTV standalone player
    └── tv12.html           # News 24 standalone player
```

---

## 🛠️ Built With

- **HTML5 / CSS3 / JavaScript (ES6+)**
- [**Hls.js**](https://github.com/video-dev/hls.js) – JavaScript HLS client
- [**Google Shaka Player**](https://github.com/shaka-project/shaka-player) – JavaScript DASH/DRM player
- [**Bootstrap 5**](https://getbootstrap.com/) – Responsive grid layout
- [**Font Awesome 6**](https://fontawesome.com/) – Icons
- [**Google Fonts**](https://fonts.google.com/) – *Plus Jakarta Sans* typography

---

## 🌟 Support by Starring

Hello Viewers! 🌟  
If you find this project helpful or enjoy using the Live TV streaming platform, please consider giving a **Star ⭐** to the repository! Your support motivates continuous updates, new channel additions, and feature enhancements.

<div align="center">

[![GitHub stars](https://img.shields.io/github/stars/sohag1192/Live-Tv-Server?style=for-the-badge&logo=github&color=ffd700&label=Star%20This%20Repo)](https://github.com/sohag1192/Live-Tv-Server/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/sohag1192/Live-Tv-Server?style=for-the-badge&logo=github&color=7c3aed&label=Fork)](https://github.com/sohag1192/Live-Tv-Server/fork)

</div>

---

## 👤 Author & Support

- **Developer**: **Md Sohag Rana**
- **Telegram**: [@MdSohagRana](https://t.me/MdSohagRana)
- **GitHub**: [@sohag1192](https://github.com/sohag1192)

---

<div align="center">

Made with ❤️ by **Md Sohag Rana** • &copy; 2026 Live TV Server

</div>

