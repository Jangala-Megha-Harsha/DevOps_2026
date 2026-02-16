# Finance CI Integration - Git Setup Script (Windows PowerShell)
# Run this script from project root after installing Git
# Usage: .\setup-git.ps1

write-Host "🚀 Finance CI Integration - Git Setup" -ForegroundColor Cyan
write-Host "======================================" -ForegroundColor Cyan
write-Host ""

# Check if Git is installed
try {
    $gitVersion = git --version
    write-Host "✓ Git found: $gitVersion" -ForegroundColor Green
} catch {
    write-Host "❌ Git is not installed!" -ForegroundColor Red
    write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}
write-Host ""

# Initialize repository
write-Host "📁 Initializing git repository..." -ForegroundColor Yellow
git init
write-Host "✓ Repository initialized" -ForegroundColor Green
write-Host ""

# Configure Git (optional)
write-Host "📝 Configure Git (optional)" -ForegroundColor Yellow
$gituser = Read-Host "Enter your Git username (or press Enter to skip)"
if ($gituser) {
    git config --global user.name "$gituser"
    write-Host "✓ Git user configured: $gituser" -ForegroundColor Green
}

$gitemail = Read-Host "Enter your Git email (or press Enter to skip)"
if ($gitemail) {
    git config --global user.email "$gitemail"
    write-Host "✓ Git email configured: $gitemail" -ForegroundColor Green
}
write-Host ""

# Add all files
write-Host "📦 Adding files to staging area..." -ForegroundColor Yellow
git add .
write-Host "✓ All files staged" -ForegroundColor Green
write-Host ""

# Create initial commit
write-Host "💾 Creating initial commit..." -ForegroundColor Yellow
git commit -m "Add backend APIs + integration tests + CI workflow"
write-Host "✓ Commit created" -ForegroundColor Green
write-Host ""

# Rename branch to main
write-Host "🌳 Setting main branch..." -ForegroundColor Yellow
git branch -M main
write-Host "✓ Branch renamed to main" -ForegroundColor Green
write-Host ""

# Add remote
write-Host "🔗 Configure GitHub remote" -ForegroundColor Yellow
$ghuser = Read-Host "Enter your GitHub username"
$ghrepo = Read-Host "Enter your repository name"

$remoteUrl = "https://github.com/$ghuser/$ghrepo.git"
git remote add origin "$remoteUrl"
write-Host "✓ Remote configured: $remoteUrl" -ForegroundColor Green
write-Host ""

# Push to GitHub
write-Host "📤 Pushing to GitHub..." -ForegroundColor Yellow
write-Host "You may be prompted to authenticate. Use your GitHub credentials." -ForegroundColor Cyan
write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    write-Host ""
    write-Host "✅ SUCCESS! Code pushed to GitHub!" -ForegroundColor Green
    write-Host ""
    write-Host "📊 View CI Status:" -ForegroundColor Cyan
    write-Host "   → https://github.com/$ghuser/$ghrepo/actions" -ForegroundColor Yellow
    write-Host ""
    write-Host "📚 Repository:" -ForegroundColor Cyan
    write-Host "   → https://github.com/$ghuser/$ghrepo" -ForegroundColor Yellow
    write-Host ""
} else {
    write-Host ""
    write-Host "⚠️  Push failed. Check your GitHub credentials and try again." -ForegroundColor Yellow
    write-Host ""
    write-Host "Try pushing manually:" -ForegroundColor Cyan
    write-Host "   git push -u origin main" -ForegroundColor Yellow
}

write-Host ""
write-Host "✨ Setup complete!" -ForegroundColor Green
