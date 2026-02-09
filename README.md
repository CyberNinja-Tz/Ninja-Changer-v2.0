# 🥷 Ninja-Changer v2.0
> **"Control is an illusion." — Fsociety**

Ninja-Changer is a powerful, lightweight Bash-based automation tool designed for **Kali Linux**. It allows penetration testers to stay under the radar by rapidly spoofing network identities and system credentials.

[![Ninja-Website](https://img.shields.io/badge/Visit-Ninja_Sanctuary-red?style=for-the-badge&logo=ghost)](https://cyberninja255.vercel.app)

---

## 🚀 Installation & Usage

Run these commands in your terminal to enter the Matrix:


💻 Options Overview

    Ghost Mode: Shuts down your interface, randomizes the MAC, and brings it back up.

    Spoof IP: Assigns a manual static IP to your current interface.

    DNS Hijack: Overwrites /etc/resolv.conf with privacy-focused DNS.

    Change Pass/User: Directly modifies system account names and passwords.

    Panic Button: Restarts NetworkManager to default settings.

**⚠️ Disclaimer**

**This tool is for educational and ethical security testing purposes only. Using this tool for unauthorized activities is strictly prohibited. The author is not responsible for any misuse or damage caused by this script.**

**🤝 Connect with Me**

**Check out more elite tools and resources at my sanctuary: 👉 https://cyberninja255.vercel.app**

**Goodbye, Friend.**

```bash
# Install dependencies
sudo apt update && sudo apt install macchanger -y

# Clone the sanctuary
git clone https://github.com/CyberNinja-Tz/Ninja-Changer-v2.0
cd Ninja-Changer-v2.0

# Give execution permission
chmod +x ninja_changer.sh

# Start the tool
sudo ./ninja_changer.sh
