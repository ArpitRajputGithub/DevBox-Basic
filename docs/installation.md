# DevBox Installation Guide

## Prerequisites

Before installing DevBox, ensure you have the following prerequisites:

### Required Software
- **Git**: Version 2.0 or higher
- **Node.js**: Version 16 or higher (will be installed if missing)
- **Terminal**: A Unix-like terminal (Git Bash on Windows)

### System Requirements
- **Operating System**: Linux, macOS, or Windows (via WSL)
- **RAM**: Minimum 4GB, recommended 8GB+
- **Storage**: At least 2GB free space
- **Internet**: Stable connection for downloading packages

## Installation Methods

### Method 1: Quick Install (Recommended)

```bash
# Clone DevBox
git clone https://github.com/yourusername/devbox.git
cd devbox

# Run the installer
./install.sh
```

### Method 2: One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/devbox/main/install.sh | bash
```

### Method 3: Manual Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/devbox.git
cd devbox

# Make install script executable
chmod +x install.sh

# Run installation
./install.sh
```

## Installation Process

The installation process takes approximately 60 seconds and includes:

1. **System Detection**: Automatically detects your operating system
2. **Prerequisites Check**: Verifies and installs required software
3. **DevBox Setup**: Creates the DevBox directory structure
4. **Shell Configuration**: Installs and configures Zsh with Oh My Zsh
5. **Development Tools**: Installs Node.js, npm packages, and VS Code extensions
6. **Git Configuration**: Sets up Git with professional defaults
7. **Project Templates**: Creates ready-to-use project templates
8. **Aliases & Functions**: Configures productivity shortcuts

## Post-Installation Steps

### 1. Restart Your Terminal

After installation, restart your terminal or run:

```bash
source ~/.zshrc
```

### 2. Verify Installation

Check that everything is working:

```bash
devbox-status
```

### 3. Configure Git (Optional)

Update your Git configuration:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 4. Install VS Code (If Not Already Installed)

Download and install VS Code from [code.visualstudio.com](https://code.visualstudio.com)

## Platform-Specific Instructions

### Linux (Ubuntu/Debian)

```bash
# Update package list
sudo apt update

# Install required packages
sudo apt install -y curl git zsh

# Clone and install DevBox
git clone https://github.com/yourusername/devbox.git
cd devbox
./install.sh
```

### macOS

```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required packages
brew install git zsh

# Clone and install DevBox
git clone https://github.com/yourusername/devbox.git
cd devbox
./install.sh
```

### Windows (WSL)

```bash
# Install WSL if not already installed
wsl --install

# Open WSL terminal and run
sudo apt update
sudo apt install -y curl git zsh

# Clone and install DevBox
git clone https://github.com/yourusername/devbox.git
cd devbox
./install.sh
```

## Troubleshooting

### Common Issues

#### 1. Permission Denied Error

```bash
# Make script executable
chmod +x install.sh
```

#### 2. Node.js Installation Fails

```bash
# Install Node.js manually
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
```

#### 3. Zsh Not Found

```bash
# Install Zsh manually
sudo apt install zsh  # Ubuntu/Debian
brew install zsh      # macOS
```

#### 4. VS Code Extensions Not Installing

```bash
# Install VS Code CLI
code --install-extension ms-vscode.vscode-typescript-next
```

### Getting Help

If you encounter issues:

1. **Check the logs**: Look for error messages in the terminal output
2. **Verify prerequisites**: Ensure all required software is installed
3. **Check permissions**: Make sure you have write permissions to your home directory
4. **Contact support**: Email support@devbox.dev or create an issue on GitHub

## Uninstallation

To remove DevBox:

```bash
# Remove DevBox files
rm -rf ~/.devbox

# Remove from .zshrc (optional)
# Edit ~/.zshrc and remove the DevBox source line
```

## Next Steps

After successful installation:

1. **Start Coding**: Use `create-react-app my-app` to create your first project
2. **Explore Templates**: Check out the templates in `~/.devbox/templates`
3. **Customize**: Modify settings in `~/.devbox/config`
4. **Learn More**: Read the [customization guide](customization.md)

## Support

- 📧 Email: support@devbox.dev
- 💬 Discord: [Join our community](https://discord.gg/devbox)
- 📖 Documentation: [docs.devbox.dev](https://docs.devbox.dev)
- 🐛 Issues: [GitHub Issues](https://github.com/yourusername/devbox/issues) 