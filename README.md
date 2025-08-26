# 🛠️ DevBox Basic: One-Command Developer Environment Setup

> **Transform any machine into a professional development environment in under 60 seconds**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Windows-blue.svg)](https://github.com/ArpitRajputGithub/DevBox-Basic)
[![Stars](https://img.shields.io/github/stars/ArpitRajputGithub/DevBox-Basic)](https://github.com/ArpitRajputGithub/DevBox-Basic/stargazers)

## 🚀 What is DevBox Basic?

DevBox Basic is the free version of our developer environment setup tool. It provides essential tools and configurations to get you coding quickly, with the option to upgrade to **DevBox Pro** for advanced features.

### ✨ Basic Features

- **⚡ Lightning Fast**: Setup complete in under 60 seconds
- **🔄 Cross-Platform**: Works on Linux, macOS, and Windows (via WSL)
- **🎯 MERN Ready**: Basic configuration for web development
- **🛠️ Essential Tools**: VS Code, ESLint, Prettier, Git included
- **🔧 Simple Setup**: Easy to use and customize

## 💎 Upgrade to DevBox Pro

**DevBox Pro** includes advanced features not available in the basic version:

- **Advanced Configurations**: Professional-grade settings and optimizations
- **Premium Templates**: 20+ project templates (React, Vue, Angular, Node.js, Python, etc.)
- **Team Collaboration**: Shared configurations and team management
- **Priority Support**: Direct support and custom assistance
- **Custom Integrations**: Database setups, deployment tools, monitoring
- **Advanced Aliases**: 50+ productivity shortcuts and functions
- **Premium VS Code Extensions**: Advanced extensions and themes
- **Git Hooks**: Pre-commit hooks and automated workflows

**[Upgrade to Pro Now](https://devbox.dev/pro)** - Only $29/month

## 🎯 Perfect For

- **Individual Developers** getting started
- **Students** learning web development
- **Hobbyists** building personal projects
- **Small Teams** needing basic setup

## 🚀 Quick Start

### Prerequisites
- **Git** (will be installed if missing)
- **Node.js** (will be installed if missing)
- **Terminal**: Git Bash, WSL, or native terminal

### Installation

#### **Option 1: One-Command Install (Recommended)**
```bash
# Clone and install in one go
curl -fsSL https://raw.githubusercontent.com/ArpitRajputGithub/DevBox-Basic/main/install.sh | bash
```

#### **Option 2: Manual Install**
```bash
# Clone DevBox Basic
git clone https://github.com/ArpitRajputGithub/DevBox-Basic.git
cd DevBox-Basic

# Run the basic setup
./install.sh
```

## 🖥️ Platform-Specific Instructions

### **🐧 Linux & macOS**
```bash
# Make script executable and run
chmod +x install.sh
./install.sh
```

### **🪟 Windows**
#### **Option A: Git Bash (Recommended)**
```bash
# Open Git Bash and run
./install.sh
```

#### **Option B: WSL (Best Experience)**
```bash
# Install WSL first, then run
wsl --install
wsl
./install.sh
```

#### **Option C: PowerShell (Basic Support)**
```bash
# Run with bash
bash install.sh
```

### **⚠️ Windows Troubleshooting**
- **Git Bash**: Works out of the box
- **WSL**: Full Zsh experience with all features
- **PowerShell**: Basic support, consider WSL for full features
- **Line Endings**: Script automatically handles Windows line endings

## 🔧 Post-Installation

### **For Unix/Linux/macOS:**
```bash
# Restart terminal or reload config
source ~/.zshrc

# Test DevBox
devbox-status
devbox-help
```

### **For Windows:**
```bash
# Restart terminal or reload config
source ~/.bashrc

# Test DevBox
devbox-status
devbox-help
```

That's it! Your basic development environment is now ready.

## 📦 What's Included (Basic)

### 🛠️ Development Tools
- **Node.js & npm**: Latest LTS versions
- **Git**: Configured with sensible defaults
- **VS Code**: Basic extensions and settings
- **ESLint & Prettier**: Code formatting and linting

### 🎨 Editor Configuration
- **VS Code Settings**: Basic configuration for web development
- **Extensions**: Essential extensions pre-installed
- **Keybindings**: Standard shortcuts

### 🔧 Shell & Terminal
- **Zsh**: Modern shell with Oh My Zsh (Linux/macOS)
- **Bash**: Optimized for Windows users
- **Basic Aliases**: Common shortcuts for all platforms
- **Prompt**: Simple terminal prompt

### 📚 Project Templates
- **React App**: Basic React template
- **Node.js API**: Simple Express.js starter

## 🎨 Customization

DevBox Basic is designed to be easily customizable:

### **For Linux/macOS Users:**
```bash
# Edit your preferences
nano ~/.devbox/config/zshrc

# Add custom aliases
nano ~/.devbox/config/aliases.sh

# Modify VS Code settings
nano ~/.devbox/vscode/settings.json
```

### **For Windows Users:**
```bash
# Edit your preferences (Git Bash)
nano ~/.devbox/config/bashrc

# Add custom aliases
nano ~/.devbox/config/bashrc

# Modify VS Code settings
nano ~/.devbox/vscode/settings.json
```

### **Cross-Platform Customization:**
- **Git Configuration**: Edit `~/.devbox/config/gitconfig`
- **VS Code Settings**: Edit `~/.devbox/vscode/settings.json`
- **Project Templates**: Modify `~/.devbox/templates/`
- **Custom Scripts**: Add to `~/.devbox/scripts/`

## 💰 Pricing

### Free Tier (This Version)
- Basic setup with core tools
- Community support
- 3 standard templates
- Basic configurations

### Pro Tier ($29/month)
- Advanced configurations
- Priority support
- 20+ premium templates
- Team collaboration features
- Premium VS Code extensions
- Advanced aliases and functions
- Custom integrations
- Git hooks and automation

### Enterprise Tier (Custom pricing)
- White-label solutions
- Custom integrations
- Dedicated support
- On-premise deployment
- Team management dashboard

## 🔧 Troubleshooting

### **Common Issues & Solutions**

#### **Script Permission Denied**
```bash
# Fix: Make script executable
chmod +x install.sh
```

#### **Line Ending Issues (Windows)**
```bash
# Fix: Use dos2unix or run in WSL
dos2unix install.sh
# OR run in WSL where line endings are handled automatically
```

#### **Zsh Not Found (Windows)**
- **Git Bash**: Script automatically uses Bash instead
- **WSL**: Install WSL for full Zsh experience
- **PowerShell**: Use `bash install.sh` command

#### **VS Code Extensions Not Installing**
- Ensure VS Code is installed and in PATH
- Restart terminal after VS Code installation
- Run script again after VS Code setup

#### **Git Configuration Issues**
```bash
# Fix: Set your Git identity
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

#### **Node.js Installation Fails**
```bash
# Linux: Use package manager
sudo apt update && sudo apt install nodejs npm

# macOS: Use Homebrew
brew install node

# Windows: Download from https://nodejs.org
```

### **Platform-Specific Solutions**

#### **Windows Users**
- **Git Bash**: Best compatibility, runs natively
- **WSL**: Full Linux experience, recommended for developers
- **PowerShell**: Basic support, limited features

#### **Linux Users**
- **Ubuntu/Debian**: Script handles dependencies automatically
- **Arch/Manjaro**: May need manual package installation
- **WSL**: Full compatibility with all features

#### **macOS Users**
- **Homebrew**: Required for package management
- **Terminal**: Native support, no additional setup needed

## 🤝 Support

- 📧 Email: support@devbox.dev
- 💬 Discord: [Join our community](https://discord.gg/devbox)
- 📖 Docs: [docs.devbox.dev](https://docs.devbox.dev)
- 🐛 Issues: [GitHub Issues](https://github.com/ArpitRajputGithub/DevBox-Basic/issues)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by the dotfiles community
- Built with ❤️ for developers everywhere
- Special thanks to all contributors

---

**Ready to upgrade your development workflow?** [Get started with Basic](https://github.com/ArpitRajputGithub/DevBox-Basic) or [upgrade to Pro](https://devbox.dev/pro) for advanced features.
