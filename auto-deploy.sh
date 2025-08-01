#!/bin/bash

# 完全自动化部署脚本 - 情侣恶搞游戏
# 使用GitHub CLI实现一键部署

echo "🚀 开始完全自动化部署..."

# 检查是否在正确目录
if [ ! -f "package.json" ]; then
    echo "❌ 请在 couple-game-deploy 目录下运行此脚本"
    exit 1
fi

# 检查并安装GitHub CLI
if ! command -v gh &> /dev/null; then
    echo "📦 正在安装 GitHub CLI..."
    if command -v brew &> /dev/null; then
        brew install gh
    else
        echo "❌ 请先安装 Homebrew 或手动安装 GitHub CLI"
        echo "   安装 Homebrew: /bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
fi

# 检查GitHub CLI登录状态
if ! gh auth status &> /dev/null; then
    echo "🔐 请登录 GitHub CLI..."
    gh auth login
fi

# 初始化git仓库
echo "📦 初始化项目..."
git init
git add .
git commit -m "Initial commit: Couple prank game for deployment"

# 创建GitHub仓库并推送
echo "🔗 创建 GitHub 仓库并推送代码..."
gh repo create couple-prank-game --public --source=. --remote=origin --push

if [ $? -eq 0 ]; then
    echo "✅ GitHub 仓库创建成功！"
    
    # 获取仓库URL
    repo_url=$(gh repo view --json url --jq .url)
    echo "📁 仓库地址: $repo_url"
    
    echo ""
    echo "🌐 现在自动打开 Vercel 部署页面..."
    echo "请按照以下步骤完成部署："
    echo "1. 在打开的 Vercel 页面中点击 'New Project'"
    echo "2. 选择 'Import Git Repository'"
    echo "3. 找到 'couple-prank-game' 仓库并点击 'Import'"
    echo "4. 保持默认设置，点击 'Deploy'"
    echo ""
    
    # 自动打开Vercel
    open "https://vercel.com/new"
    
    echo "🎉 部署完成后，您将获得游戏访问链接！"
else
    echo "❌ 创建仓库失败，请检查网络连接和GitHub登录状态"
    exit 1
fi