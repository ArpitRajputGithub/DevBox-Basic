# DevBox Customization Guide

## Overview

DevBox is designed to be highly customizable. This guide will help you personalize your development environment to match your workflow and preferences.

## Directory Structure

After installation, DevBox creates the following structure in your home directory:

```
~/.devbox/
├── config/          # Configuration files
│   ├── zshrc       # Zsh configuration
│   ├── gitconfig   # Git configuration
│   └── aliases.sh  # Custom aliases
├── scripts/         # Utility scripts
├── templates/       # Project templates
├── vscode/         # VS Code settings
└── zsh/           # Zsh-specific files
```

## Customizing Your Shell

### Adding Custom Aliases

Edit the aliases file:

```bash
nano ~/.devbox/config/aliases.sh
```

Add your custom aliases:

```bash
# Custom aliases
alias myproject="cd ~/projects/myproject"
alias server="python3 -m http.server 8000"
alias ports="netstat -tulpn | grep LISTEN"
alias weather="curl wttr.in"
```

### Modifying Zsh Configuration

Edit the main Zsh configuration:

```bash
nano ~/.devbox/config/zshrc
```

Common customizations:

```bash
# Change theme
ZSH_THEME="agnoster"

# Add plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker
    npm
    node
    vscode
    # Add your custom plugins here
)

# Custom environment variables
export MY_CUSTOM_VAR="value"
export PATH="$HOME/bin:$PATH"
```

### Adding Custom Functions

Create a new file for your functions:

```bash
nano ~/.devbox/config/functions.sh
```

Add your functions:

```bash
# Custom functions
function mkcd() {
    mkdir -p "$1" && cd "$1"
}

function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
```

Then source it in your zshrc:

```bash
# Add to ~/.devbox/config/zshrc
source ~/.devbox/config/functions.sh
```

## Customizing VS Code

### Modifying Settings

Edit the VS Code settings:

```bash
nano ~/.devbox/vscode/settings.json
```

Common customizations:

```json
{
  "editor.fontSize": 16,
  "editor.fontFamily": "'JetBrains Mono', 'Fira Code', monospace",
  "workbench.colorTheme": "Dracula",
  "editor.tabSize": 4,
  "prettier.printWidth": 100
}
```

### Adding Extensions

Install additional extensions:

```bash
# Install extensions via CLI
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension bradlc.vscode-tailwindcss
code --install-extension esbenp.prettier-vscode
```

### Custom Keybindings

Create custom keybindings:

```bash
nano ~/.devbox/vscode/keybindings.json
```

Example keybindings:

```json
[
  {
    "key": "ctrl+shift+r",
    "command": "workbench.action.terminal.sendSequence",
    "args": {
      "text": "npm run dev\n"
    }
  },
  {
    "key": "ctrl+shift+t",
    "command": "workbench.action.terminal.sendSequence",
    "args": {
      "text": "npm test\n"
    }
  }
]
```

## Customizing Git

### Modifying Git Configuration

Edit the Git configuration:

```bash
nano ~/.devbox/config/gitconfig
```

Common customizations:

```ini
[user]
    name = Your Name
    email = your.email@example.com

[core]
    editor = code --wait
    autocrlf = input

[alias]
    # Add your custom aliases
    st = status
    co = checkout
    br = branch
    ci = commit
    lg = log --oneline --graph --decorate
```

### Adding Git Hooks

Create custom Git hooks:

```bash
mkdir -p ~/.devbox/git-hooks
nano ~/.devbox/git-hooks/pre-commit
```

Example pre-commit hook:

```bash
#!/bin/bash
# Pre-commit hook to run linting

echo "Running pre-commit checks..."

# Run ESLint
npm run lint
if [ $? -ne 0 ]; then
    echo "ESLint failed. Please fix the issues before committing."
    exit 1
fi

# Run tests
npm test
if [ $? -ne 0 ]; then
    echo "Tests failed. Please fix the issues before committing."
    exit 1
fi

echo "Pre-commit checks passed!"
```

Make it executable:

```bash
chmod +x ~/.devbox/git-hooks/pre-commit
```

## Creating Custom Templates

### Adding Project Templates

Create a new template:

```bash
mkdir -p ~/.devbox/templates/my-template
cd ~/.devbox/templates/my-template
```

Create the template structure:

```
my-template/
├── package.json
├── README.md
├── src/
│   ├── index.js
│   └── styles.css
└── .gitignore
```

### Template Variables

Use variables in your templates:

```json
{
  "name": "{{PROJECT_NAME}}",
  "version": "1.0.0",
  "description": "{{PROJECT_DESCRIPTION}}",
  "author": "{{AUTHOR_NAME}}"
}
```

## Environment-Specific Configuration

### Development vs Production

Create environment-specific configurations:

```bash
# Development environment
export NODE_ENV=development
export DEBUG=true
export API_URL=http://localhost:3000

# Production environment
export NODE_ENV=production
export DEBUG=false
export API_URL=https://api.yourapp.com
```

### Platform-Specific Settings

Add platform-specific configurations:

```bash
# In ~/.devbox/config/zshrc
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS specific settings
    export PATH="/usr/local/bin:$PATH"
    alias open="open"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux specific settings
    alias open="xdg-open"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    # Windows specific settings
    alias open="start"
fi
```

## Advanced Customization

### Custom Scripts

Create utility scripts:

```bash
nano ~/.devbox/scripts/deploy.sh
```

Example deployment script:

```bash
#!/bin/bash

echo "🚀 Deploying application..."

# Build the application
npm run build

# Run tests
npm test

# Deploy to production
echo "Deploying to production..."
# Add your deployment logic here

echo "✅ Deployment completed!"
```

Make it executable:

```bash
chmod +x ~/.devbox/scripts/deploy.sh
```

### Custom Prompts

Create a custom prompt:

```bash
# In ~/.devbox/config/zshrc
setopt PROMPT_SUBST

# Custom prompt function
prompt_custom() {
    local git_branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
    local git_status=""
    
    if [ -n "$git_branch" ]; then
        if [ -n "$(git status --porcelain)" ]; then
            git_status=" %F{red}✗%f"
        else
            git_status=" %F{green}✓%f"
        fi
    fi
    
    PROMPT="%F{cyan}%n%f@%F{green}%m%f:%F{blue}%~%f${git_status} %F{yellow}❯%f "
}

# Set the prompt
prompt_custom
```

## Sharing Your Configuration

### Creating a Backup

Backup your customizations:

```bash
# Create a backup
tar -czf devbox-backup-$(date +%Y%m%d).tar.gz ~/.devbox

# Or use git to version control your config
cd ~/.devbox
git init
git add .
git commit -m "Initial DevBox configuration"
```

### Sharing with Team

Create a team configuration:

```bash
# Create team config directory
mkdir -p ~/.devbox/team-config

# Add team-specific settings
nano ~/.devbox/team-config/team-aliases.sh
```

## Troubleshooting Customizations

### Reloading Configuration

After making changes, reload your configuration:

```bash
# Reload Zsh configuration
source ~/.zshrc

# Or restart your terminal
```

### Debugging Issues

Enable debug mode:

```bash
# Add to ~/.devbox/config/zshrc
set -x  # Enable debug mode
```

### Resetting to Defaults

Reset to default configuration:

```bash
# Backup current config
cp -r ~/.devbox ~/.devbox-backup

# Reinstall DevBox
cd /path/to/devbox
./install.sh
```

## Best Practices

1. **Version Control**: Keep your customizations in version control
2. **Documentation**: Document your customizations for team members
3. **Modularity**: Keep customizations modular and organized
4. **Testing**: Test customizations on different platforms
5. **Backup**: Regularly backup your customizations

## Support

For help with customization:

- 📧 Email: support@devbox.dev
- 💬 Discord: [Join our community](https://discord.gg/devbox)
- 📖 Documentation: [docs.devbox.dev](https://docs.devbox.dev) 