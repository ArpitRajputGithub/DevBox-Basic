#!/bin/bash

# 🛠️ DevBox Basic: One-Command Developer Environment Setup
# Version: 1.0.0 (Basic)
# Upgrade to Pro: https://devbox.dev/pro

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# DevBox configuration
DEVBOX_HOME="$HOME/.devbox"
DEVBOX_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Print banner
print_banner() {
    echo -e "${CYAN}"
    echo ""
    echo "    ██████╗ ███████╗██╗   ██╗██████╗  ██████╗ ██╗  ██╗"
    echo "    ██╔══██╗██╔════╝██║   ██║██╔══██╗██╔═══██╗██║ ██╔╝"
    echo "    ██║  ██║█████╗  ██║   ██║██████╔╝██║   ██║█████╔╝ "
    echo "    ██║  ██║██╔══╝  ██║   ██║██╔══██╗██║   ██║██╔═██╗ "
    echo "    ██████╔╝███████╗╚██████╔╝██████╔╝╚██████╔╝██║  ██╗"
    echo "    ╚═════╝ ╚══════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
    echo ""
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                    🛠️  DevBox Basic                          ║"
    echo "║           One-Command Developer Environment Setup             ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${YELLOW}💡 Upgrade to DevBox Pro for advanced features: https://devbox.dev/pro${NC}"
    echo ""
}

# Print status messages
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        OS="windows"
    else
        OS="unknown"
    fi
    print_status "Detected OS: $OS"
}

# Install Node.js if not present
install_nodejs() {
    if ! command_exists node; then
        print_step "Installing Node.js..."
        
        if [[ "$OS" == "macos" ]]; then
            if command_exists brew; then
                brew install node
            else
                print_error "Homebrew not found. Please install Homebrew first: https://brew.sh"
                exit 1
            fi
        elif [[ "$OS" == "linux" ]]; then
            curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
            sudo apt-get install -y nodejs
        elif [[ "$OS" == "windows" ]]; then
            print_warning "Please install Node.js manually from https://nodejs.org"
            print_warning "Then run this script again."
            exit 1
        fi
    else
        print_status "Node.js already installed: $(node --version)"
    fi
}

# Install Git if not present
install_git() {
    if ! command_exists git; then
        print_step "Installing Git..."
        
        if [[ "$OS" == "macos" ]]; then
            if command_exists brew; then
                brew install git
            else
                print_error "Homebrew not found. Please install Homebrew first: https://brew.sh"
                exit 1
            fi
        elif [[ "$OS" == "linux" ]]; then
            sudo apt-get update
            sudo apt-get install -y git
        elif [[ "$OS" == "windows" ]]; then
            print_warning "Please install Git manually from https://git-scm.com"
            print_warning "Then run this script again."
            exit 1
        fi
    else
        print_status "Git already installed: $(git --version)"
    fi
}

# Create DevBox directory structure
setup_devbox_structure() {
    print_step "Setting up DevBox directory structure..."
    
    mkdir -p "$DEVBOX_HOME"
    mkdir -p "$DEVBOX_HOME/scripts"
    mkdir -p "$DEVBOX_HOME/config"
    mkdir -p "$DEVBOX_HOME/templates"
    mkdir -p "$DEVBOX_HOME/vscode"
    mkdir -p "$DEVBOX_HOME/zsh"
    
    print_status "DevBox home directory created: $DEVBOX_HOME"
}

# Install Zsh and Oh My Zsh (Windows-aware)
install_zsh() {
    if [[ "$OS" == "windows" ]]; then
        print_warning "Zsh not available on Windows. Using Bash instead."
        print_warning "For full DevBox experience, use WSL or Git Bash with WSL integration."
        return 0
    fi
    
    if ! command_exists zsh; then
        print_step "Installing Zsh..."
        
        if [[ "$OS" == "macos" ]]; then
            if command_exists brew; then
                brew install zsh
            else
                print_error "Homebrew not found. Please install Homebrew first: https://brew.sh"
                exit 1
            fi
        elif [[ "$OS" == "linux" ]]; then
            sudo apt-get update
            sudo apt-get install -y zsh
        fi
    else
        print_status "Zsh already installed: $(zsh --version)"
    fi
    
    # Install Oh My Zsh if not present
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        print_step "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        print_status "Oh My Zsh already installed"
    fi
}

# Copy configuration files (basic version)
copy_config_files() {
    print_step "Copying configuration files..."
    
    # Copy basic scripts
    cp -r "$DEVBOX_REPO/scripts/"* "$DEVBOX_HOME/scripts/" 2>/dev/null || true
    
    # Copy basic VS Code settings
    cp -r "$DEVBOX_REPO/vscode/"* "$DEVBOX_HOME/vscode/" 2>/dev/null || true
    
    # Copy basic Zsh configuration
    cp -r "$DEVBOX_REPO/zsh/"* "$DEVBOX_HOME/zsh/" 2>/dev/null || true
    
    # Copy basic templates (limited)
    cp -r "$DEVBOX_REPO/templates/"* "$DEVBOX_HOME/templates/" 2>/dev/null || true
    
    # Note: Config files (zshrc, aliases.sh, gitconfig) are created by setup functions
    # to ensure proper content and avoid copying old files with wrong line endings
    
    print_status "Basic configuration files copied"
    print_warning "Upgrade to Pro for advanced configurations and premium templates"
}

# Setup shell configuration (Windows-aware)
setup_shell_config() {
    print_step "Setting up shell configuration..."
    
    # Create DevBox zshrc config file
    cat > "$DEVBOX_HOME/config/zshrc" << 'EOF'
# DevBox Zsh Configuration
# This file is sourced by ~/.zshrc

# Set theme
ZSH_THEME="robbyrussell"

# Oh My Zsh plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker
    npm
    node
    vscode
)

# Load Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Environment variables
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="code"

# History configuration
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST=10000

# Key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Custom prompt
PROMPT='%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%} %{$fg[yellow]%}%~%{$reset_color%} $(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
EOF

    if [[ "$OS" == "windows" ]]; then
        # For Windows, create .bashrc instead of .zshrc
        if [[ ! -f "$HOME/.bashrc" ]]; then
            touch "$HOME/.bashrc"
        fi
        
        # Add DevBox configuration to .bashrc for Windows
        if ! grep -q "source ~/.devbox/config/bashrc" "$HOME/.bashrc"; then
            echo "" >> "$HOME/.bashrc"
            echo "# DevBox Configuration" >> "$HOME/.bashrc"
            echo "source ~/.devbox/config/bashrc" >> "$HOME/.bashrc"
        fi
        
        print_status "Windows Bash configuration updated"
    else
        # For Unix-like systems, use .zshrc
        if [[ ! -f "$HOME/.zshrc" ]]; then
            touch "$HOME/.zshrc"
        fi
        
        # Add DevBox configuration to .zshrc
        if ! grep -q "source ~/.devbox/config/zshrc" "$HOME/.zshrc"; then
            echo "" >> "$HOME/.zshrc"
            echo "# DevBox Configuration" >> "$HOME/.zshrc"
            echo "source ~/.devbox/config/zshrc" >> "$HOME/.zshrc"
        fi
        
        # Also add aliases for Unix systems
        if ! grep -q "source ~/.devbox/config/aliases.sh" "$HOME/.zshrc"; then
            echo "source ~/.devbox/config/aliases.sh" >> "$HOME/.zshrc"
        fi
        
        print_status "Shell configuration updated"
    fi
}

# Install VS Code extensions (basic set)
install_vscode_extensions() {
    if command_exists code; then
        print_step "Installing VS Code extensions (basic set)..."
        
        # Basic extensions only
        extensions=(
            "ms-vscode.vscode-typescript-next"
            "esbenp.prettier-vscode"
            "ms-vscode.vscode-eslint"
            "ms-vscode.vscode-json"
            "formulahendry.auto-rename-tag"
        )
        
        for extension in "${extensions[@]}"; do
            code --install-extension "$extension" --force
        done
        
        print_status "Basic VS Code extensions installed"
        print_warning "Upgrade to Pro for premium extensions and advanced features"
    else
        print_warning "VS Code not found. Please install VS Code first: https://code.visualstudio.com"
    fi
}

# Setup Git configuration
setup_git_config() {
    print_step "Setting up Git configuration..."
    
    # Create DevBox gitconfig file
    cat > "$DEVBOX_HOME/config/gitconfig" << 'EOF'
[user]
    name = Your Name
    email = your.email@example.com

[core]
    editor = code --wait
    autocrlf = input
    excludesfile = ~/.gitignore_global
    pager = cat

[init]
    defaultBranch = main

[pull]
    rebase = false

[push]
    default = simple
    autoSetupRemote = true

[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
    unstage = reset HEAD --
    last = log -1 HEAD
    visual = !gitk

[color]
    ui = auto
    branch = auto
    diff = auto
    status = auto

[color "branch"]
    current = yellow reverse
    local = yellow
    remote = green

[color "diff"]
    meta = yellow bold
    frag = magenta bold
    old = red bold
    new = green bold

[color "status"]
    added = yellow
    changed = green
    untracked = cyan

[merge]
    tool = vscode
    conflictstyle = diff3

[mergetool "vscode"]
    cmd = code --wait $MERGED
    trustExitCode = true

[diff]
    tool = vscode

[difftool "vscode"]
    cmd = code --wait --diff $LOCAL $REMOTE
EOF

    # Set basic Git configuration
    git config --global init.defaultBranch main
    git config --global pull.rebase false
    git config --global push.default simple
    
    # Create .gitconfig if it doesn't exist
    if [[ ! -f "$HOME/.gitconfig" ]]; then
        touch "$HOME/.gitconfig"
    fi
    
    # Add DevBox Git configuration
    if ! grep -q "include.*devbox.*gitconfig" "$HOME/.gitconfig"; then
        echo "" >> "$HOME/.gitconfig"
        echo "[include]" >> "$HOME/.gitconfig"
        echo "    path = ~/.devbox/config/gitconfig" >> "$HOME/.gitconfig"
    fi
    
    print_status "Git configuration updated"
}

# Install basic npm packages
install_npm_packages() {
    print_step "Installing basic npm packages..."
    
    # Basic packages only
    packages=(
        "npm@latest"
        "create-react-app"
        "nodemon"
        "eslint"
        "prettier"
    )
    
    for package in "${packages[@]}"; do
        npm install -g "$package"
    done
    
    print_status "Basic npm packages installed"
    print_warning "Upgrade to Pro for advanced packages and development tools"
}

# Create basic templates
create_templates() {
    print_step "Creating basic project templates..."
    
    # React template (basic)
    mkdir -p "$DEVBOX_HOME/templates/react-app"
    cat > "$DEVBOX_HOME/templates/react-app/package.json" << 'EOF'
{
  "name": "react-app",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  }
}
EOF

    print_status "Basic project templates created"
    print_warning "Upgrade to Pro for premium templates and advanced configurations"
}

# Setup basic aliases (Windows-aware)
setup_aliases() {
    print_step "Setting up basic aliases..."
    
    if [[ "$OS" == "windows" ]]; then
        # Windows-specific aliases
        cat > "$DEVBOX_HOME/config/bashrc" << 'EOF'
# DevBox Basic Aliases for Windows

# Navigation
alias ..="cd .."
alias ...="cd ../.."

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# Development
alias dev="npm run dev"
alias start="npm start"
alias build="npm run build"

# DevBox specific
alias devbox="cd ~/.devbox"
alias devbox-upgrade="echo 'Upgrade to Pro: https://devbox.dev/pro'"

# Create new projects (basic)
function create-react-app() {
    npx create-react-app "$1"
    cd "$1"
    npm install
    code .
}

# DevBox functions
function devbox-status() {
    echo "🛠️  DevBox Basic Status"
    echo "📁 Home: ~/.devbox"
    echo "🐧 OS: $(uname -s)"
    echo "🐚 Shell: $SHELL"
    echo "📦 Node: $(node --version 2>/dev/null || echo 'Not installed')"
    echo "🔧 Git: $(git --version 2>/dev/null || echo 'Not installed')"
}

function devbox-help() {
    echo "🛠️  DevBox Basic Help"
    echo ""
    echo "🚀 Available Commands:"
    echo "  devbox-status    - Show DevBox status"
    echo "  devbox-help      - Show this help"
    echo "  devbox           - Go to DevBox home"
    echo "  devbox-upgrade   - Upgrade to Pro"
    echo ""
    echo "🚀 Quick Start:"
    echo "  create-react-app my-app"
    echo "  npm start"
    echo ""
    echo "💎 Upgrade: https://devbox.dev/pro"
}
EOF
    else
        # Unix-like system aliases
        cat > "$DEVBOX_HOME/config/aliases.sh" << 'EOF'
# DevBox Basic Aliases

# Navigation
alias ..="cd .."
alias ...="cd ../.."

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# Development
alias dev="npm run dev"
alias start="npm start"
alias build="npm run build"

# DevBox specific
alias devbox="cd ~/.devbox"
alias devbox-upgrade="echo 'Upgrade to Pro: https://devbox.dev/pro'"

# Create new projects (basic)
function create-react-app() {
    npx create-react-app "$1"
    cd "$1"
    npm install
    code .
}

# DevBox functions
function devbox-status() {
    echo "🛠️  DevBox Basic Status"
    echo "📁 Home: ~/.devbox"
    echo "🐧 OS: $(uname -s)"
    echo "🐚 Shell: $SHELL"
    echo "📦 Node: $(node --version 2>/dev/null || echo 'Not installed')"
    echo "🔧 Git: $(git --version 2>/dev/null || echo 'Not installed')"
}

function devbox-help() {
    echo "🛠️  DevBox Basic Help"
    echo ""
    echo "🚀 Available Commands:"
    echo "  devbox-status    - Show DevBox status"
    echo "  devbox-help      - Show this help"
    echo "  devbox           - Go to DevBox home"
    echo "  devbox-upgrade   - Upgrade to Pro"
    echo ""
    echo "🚀 Quick Start:"
    echo "  create-react-app my-app"
    echo "  npm start"
    echo ""
    echo "💎 Upgrade: https://devbox.dev/pro"
}
EOF
    fi
    
    print_status "Basic aliases configured"
    print_warning "Upgrade to Pro for advanced aliases and productivity functions"
}

# Final setup and upgrade prompt
final_setup() {
    print_step "Finalizing setup..."
    
    # Make scripts executable
    chmod +x "$DEVBOX_HOME/scripts/"*.sh 2>/dev/null || true
    
    # Create completion message with upgrade prompt
    cat > "$DEVBOX_HOME/scripts/completion.sh" << 'EOF'
#!/bin/bash

echo ""
echo "🎉 DevBox Basic setup completed successfully!"
echo ""
echo "📦 What's been installed:"
echo "   • Node.js and basic npm packages"
echo "   • Git configuration"
echo "   • Shell configuration (Zsh on Unix, Bash on Windows)"
echo "   • Basic VS Code extensions"
echo "   • Basic project templates"
echo "   • Basic development aliases"
echo ""
echo "🚀 Next steps:"
if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    echo "   1. Restart your terminal or run: source ~/.bashrc"
    echo "   2. Start coding with: create-react-app my-app"
    echo "   3. For better experience, consider using WSL"
else
    echo "   1. Restart your terminal or run: source ~/.zshrc"
    echo "   2. Start coding with: create-react-app my-app"
fi
echo ""
echo "💎 Upgrade to DevBox Pro for:"
echo "   • Advanced configurations"
echo "   • Premium templates"
echo "   • Team collaboration"
echo "   • Priority support"
echo "   • Custom integrations"
echo ""
echo "🔗 Upgrade now: https://devbox.dev/pro"
echo ""
EOF

    chmod +x "$DEVBOX_HOME/scripts/completion.sh"
    
    print_status "Basic setup completed!"
}

# Main installation function
main() {
    print_banner
    
    print_step "Starting DevBox Basic installation..."
    
    # Detect OS
    detect_os
    
    # Install prerequisites
    install_git
    install_nodejs
    
    # Setup DevBox structure
    setup_devbox_structure
    
    # Install and configure shell
    install_zsh
    setup_shell_config
    
    # Copy configuration files
    copy_config_files
    
    # Setup Git
    setup_git_config
    
    # Install VS Code extensions
    install_vscode_extensions
    
    # Install npm packages
    install_npm_packages
    
    # Create templates
    create_templates
    
    # Setup aliases
    setup_aliases
    
    # Final setup
    final_setup
    
    # Show completion message
    "$DEVBOX_HOME/scripts/completion.sh"
}

# Run main function
main "$@"
