# 📺 Live TV Server & Web Streaming Platform

<div align="center">

![Live TV Banner](https://placehold.co/1200x400/0c0d14/a855f7?text=📺+Live+TV+Streaming+Platform&font=montserrat)

[![Live Demo](https://img.shields.io/badge/Live-Demo-7c3aed?style=for-the-badge&logo=googlechrome&logoColor=white)](https://sohag1192.github.io/Live-Tv-Server/)
[![Channels](https://img.shields.io/badge/Channels-54%2B%20Live%20HD-ef4444?style=for-the-badge&logo=youtube&logoColor=white)](https://sohag1192.github.io/Live-Tv-Server/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)
[![Visitor Count](https://hitscounter.dev/api/hit?url=https%3A%2F%2Fgithub.com%2Fsohag1192%2FLive-Tv-Server&label=Visitors&icon=github&color=%237c3aed&message=&style=for-the-badge&tz=UTC)](https://github.com/sohag1192/Live-Tv-Server)

A modern, responsive, and high-performance web-based Live TV streaming platform featuring **54+ Bangladeshi and International HD TV channels**. Built with support for **HLS (`.m3u8`)** via Hls.js and **MPEG-DASH (`.mpd`) + Widevine DRM** via Google Shaka Player, wrapped in an encrypted stream security vault.

[Explore Features](#-key-features) • [Quick Start](#-quick-start) • [Player Views](#-player-views) • [Keyboard Shortcuts](#-keyboard-shortcuts) • [Security](#-stream-security--encryption)

</div>

---

## ✨ Key Features

- 🛰️ **54+ Live HD Channels**: Complete lineup spanning **News, Sports, Entertainment, Movies, Kids, Music, and Infotainment**.
- 🛡️ **Encrypted Stream Vault**: Stream URLs (`.m3u8`, `.mpd`) and Widevine DRM licenses are fully encrypted into an obfuscated payload with dynamic in-memory decryption. Zero raw stream links are exposed in plain HTML.
- ⚡ **Dual Streaming Engines**:
  - **HLS.js**: Low-latency HLS manifest parsing and adaptive bitrate playback.
  - **Google Shaka Player**: MPEG-DASH manifest parser with hardware-accelerated Widevine DRM decryption.
- 🔍 **Instant Search & Category Filtering**: Real-time filtering by channel name, channel number, or category with live channel count badges.
- 🌓 **Dynamic Theme Switcher**:
  - **Standard Player**: Ambient Glassmorphism Dark & Clean High-Contrast Light mode with persistent `localStorage` memory.
  - **Cinema Player**: Multi-theme support (**Netflix Dark**, **Light Blue**, **Cyber Green**, **Synth Purple**).
- 🎮 **Full Player Controls**: Play/Pause, Next/Previous Channel, Reload Stream, Picture-in-Picture (PiP), Fullscreen, and Volume slider with memory.
- ⌨️ **Global Keyboard Shortcuts**: Control your TV experience seamlessly using your keyboard.
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

## ⌨️ Keyboard Shortcuts

| Shortcut | Action |
| :---: | :--- |
| <kbd>↑</kbd> / <kbd>←</kbd> | Previous Channel |
| <kbd>↓</kbd> / <kbd>→</kbd> | Next Channel |
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

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/sohag1192/Live-Tv-Server.git
cd Live-Tv-Server
```

### 2. Run Locally
You can open `index.html` directly in any modern browser, or run a local static server:

```bash
# Using Python
python -m http.server 8080

# Using Node.js (npx)
npx serve .
```

Visit `http://localhost:8080` in your web browser.

---

## 📁 Repository Structure

```text
Live-Tv-Server/
├── index.html              # Primary Web TV Player (Glassmorphic UI + Full Controls)
├── README.md               # Project documentation & guide
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

## 👤 Author & Support

- **Developer**: **Md Sohag Rana**
- **Telegram**: [@MdSohagRana](https://t.me/MdSohagRana)
- **GitHub**: [@sohag1192](https://github.com/sohag1192)

---

<div align="center">

Made with ❤️ by **Md Sohag Rana** • &copy; 2026 Live TV Server

</div>
