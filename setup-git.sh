#!/bin/bash
# Finance CI Integration - Git Setup Script
# Run this script from project root after installing Git

echo "🚀 Finance CI Integration - Git Setup"
echo "======================================"
echo ""

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed!"
    echo "Please install Git from: https://git-scm.com/download/win"
    exit 1
fi

echo "✓ Git found: $(git --version)"
echo ""

# Initialize repository
echo "📁 Initializing git repository..."
git init
echo "✓ Repository initialized"
echo ""

# Configure Git (optional - prompts user)
echo "📝 Configure Git (optional)"
read -p "Enter your Git username (or press Enter to skip): " gituser
if [ ! -z "$gituser" ]; then
    git config --global user.name "$gituser"
    echo "✓ Git user configured: $gituser"
fi

read -p "Enter your Git email (or press Enter to skip): " gitemail
if [ ! -z "$gitemail" ]; then
    git config --global user.email "$gitemail"
    echo "✓ Git email configured: $gitemail"
fi
echo ""

# Add all files
echo "📦 Adding files to staging area..."
git add .
echo "✓ All files staged"
echo ""

# Create initial commit
echo "💾 Creating initial commit..."
git commit -m "Add backend APIs + integration tests + CI workflow"
echo "✓ Commit created"
echo ""

# Rename branch to main
echo "🌳 Setting main branch..."
git branch -M main
echo "✓ Branch renamed to main"
echo ""

# Add remote
echo "🔗 Configure GitHub remote"
read -p "Enter your GitHub username: " ghuser
read -p "Enter your repository name: " ghrepo

git remote add origin "https://github.com/${ghuser}/${ghrepo}.git"
echo "✓ Remote configured: https://github.com/${ghuser}/${ghrepo}.git"
echo ""

# Push to GitHub
echo "📤 Pushing to GitHub..."
echo "You may be prompted to authenticate. Use your GitHub credentials."
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ SUCCESS! Code pushed to GitHub!"
    echo ""
    echo "📊 View CI Status:"
    echo "   → https://github.com/${ghuser}/${ghrepo}/actions"
    echo ""
    echo "📚 Repository:"
    echo "   → https://github.com/${ghuser}/${ghrepo}"
    echo ""
else
    echo ""
    echo "⚠️  Push failed. Check your GitHub credentials and try again."
    echo ""
    echo "Try pushing manually:"
    echo "   git push -u origin main"
fi

echo ""
echo "✨ Setup complete!"
