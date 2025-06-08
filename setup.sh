#!/bin/bash

# 🚀 Script setup dự án Send Jira Deployment Action
# Tạo bởi: Fordeer Development Team

set -e  # Exit on any error

echo "🎯 Setting up Send Jira Deployment Action project..."

# Định nghĩa đường dẫn
SOURCE_DIR="/projects/send-jira-deployment-action"
TARGET_DIR="/Users/alex/Apps/Fordeer/send-jira-deployment-action"

# Kiểm tra thư mục nguồn
if [ ! -d "$SOURCE_DIR" ]; then
    echo "❌ Source directory not found: $SOURCE_DIR"
    exit 1
fi

# Tạo thư mục đích nếu chưa có
echo "📁 Creating target directory: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# Copy toàn bộ nội dung
echo "📋 Copying project files..."
cp -r "$SOURCE_DIR"/* "$TARGET_DIR/"
cp -r "$SOURCE_DIR"/.github "$TARGET_DIR/"
cp "$SOURCE_DIR"/.gitignore "$TARGET_DIR/"

# Di chuyển vào thư mục đích
cd "$TARGET_DIR"

# Khởi tạo Git repository
echo "🔧 Initializing Git repository..."
git init

# Set Git config (tùy chọn)
echo "⚙️ Configuring Git..."
git config user.name "Fordeer Development Team"
git config user.email "dev@fordeer.io"

# Add và commit files
echo "📝 Making initial commit..."
git add .
git commit -S -m "feat: initial release of Jira deployment notifier

- Smart Jira key extraction from PR titles
- Customizable message templates
- Flexible project prefix support (FC, DEV, PROJ, etc.)
- Robust error handling and logging
- GitHub Marketplace ready structure"

echo ""
echo "✅ Project setup completed successfully!"
echo ""
echo "📍 Project location: $TARGET_DIR"
echo ""
echo "🚀 Next steps:"
echo "   1. cd $TARGET_DIR"
echo "   2. Create GitHub repository:"
echo "      gh repo create fordeer/send-jira-deployment-action --public"
echo "   3. Add remote and push:"
echo "      git remote add origin https://github.com/fordeer/send-jira-deployment-action.git"
echo "      git push -u origin main"
echo "   4. Create release tags:"
echo "      git tag -a v1.0.0 -m 'v1.0.0: Initial release'"
echo "      git push origin v1.0.0"
echo "      git tag -a v1 -m 'v1: Major version'"
echo "      git push origin v1"
echo ""
echo "🎯 Ready to publish to GitHub Marketplace!"
