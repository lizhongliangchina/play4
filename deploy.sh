#!/bin/bash

# 自动部署脚本 - 情侣恶搞游戏
# 使用方法：在终端运行 bash deploy.sh

echo "🚀 开始自动部署情侣恶搞游戏..."
echo "📁 当前目录: $(pwd)"

# 检查是否在正确的目录
if [ ! -f "package.json" ]; then
    echo "❌ 错误：请在 couple-game-deploy 目录下运行此脚本"
    exit 1
fi

# 检查git是否已安装
if ! command -v git &> /dev/null; then
    echo "❌ 错误：请先安装 Git"
    exit 1
fi

# 初始化git仓库
echo "📦 初始化 Git 仓库..."
git init

# 添加所有文件
echo "📝 添加项目文件..."
git add .

# 提交代码
echo "💾 提交代码..."
git commit -m "Initial commit: Couple prank game deployment"

# 创建GitHub仓库的说明
echo ""
echo "🔗 接下来需要创建 GitHub 仓库："
echo "1. 打开 https://github.com/new"
echo "2. 仓库名称输入: couple-prank-game"
echo "3. 设置为 Public（公开）"
echo "4. 不要勾选 'Add a README file'（因为我们已经有了）"
echo "5. 点击 'Create repository'"
echo ""
echo "⏳ 请完成上述步骤后，按任意键继续..."
read -n 1 -s

# 获取用户的GitHub用户名
echo ""
echo "👤 请输入您的 GitHub 用户名:"
read github_username

if [ -z "$github_username" ]; then
    echo "❌ 错误：GitHub 用户名不能为空"
    exit 1
fi

# 添加远程仓库
echo "🔗 连接到 GitHub 仓库..."
git remote add origin https://github.com/$github_username/couple-prank-game.git

# 推送代码到GitHub
echo "⬆️ 推送代码到 GitHub..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ 代码已成功推送到 GitHub!"
else
    echo "❌ 推送失败，请检查："
    echo "   - GitHub 用户名是否正确"
    echo "   - 是否已创建仓库"
    echo "   - 网络连接是否正常"
    exit 1
fi

# Vercel部署说明
echo ""
echo "🌐 现在进行 Vercel 部署："
echo "1. 打开 https://vercel.com/dashboard"
echo "2. 点击 'New Project'"
echo "3. 选择 'Import Git Repository'"
echo "4. 找到并选择 'couple-prank-game' 仓库"
echo "5. 点击 'Import'"
echo "6. 保持默认设置，点击 'Deploy'"
echo ""
echo "🎉 部署完成后，您将获得一个可访问的网址！"
echo ""
echo "📱 您的游戏链接格式将是: https://couple-prank-game-xxx.vercel.app"
echo "🔗 GitHub 仓库: https://github.com/$github_username/couple-prank-game"
echo ""
echo "✨ 恭喜！您的情侣恶搞游戏已成功部署！"