# 双人情侣默契度测试游戏 - 部署包

## 项目说明
这是一个优化后的部署包，包含双人情侣默契度测试游戏的所有必要文件。

## 文件结构
```
couple-game-deploy/
├── public/              # 静态文件目录
│   ├── index.html      # 主页面
│   ├── assets/         # CSS和JS文件
│   ├── favicon.svg     # 网站图标
│   └── _redirects      # Netlify重定向配置
├── vercel.json         # Vercel部署配置
├── netlify.toml        # Netlify部署配置
├── package.json        # 项目配置
└── README.md           # 说明文档
```

## 部署方式

### 方式一：Vercel 手动部署
1. 访问 [vercel.com](https://vercel.com)
2. 登录或注册账号
3. 点击 "New Project"
4. 将此文件夹拖拽到部署区域
5. 点击 "Deploy"

### 方式二：Vercel CLI 部署
```bash
npx vercel --prod
```

### 方式三：Netlify 部署
1. 访问 [netlify.com](https://netlify.com)
2. 登录账号
3. 将此文件夹拖拽到部署区域

### 方式四：其他静态托管平台
- 上传 `public/` 目录中的所有文件
- 确保将 `index.html` 设置为默认页面
- 配置SPA重定向规则（所有路由指向 index.html）

## 项目特性
- ✅ 真正的双人测试系统
- ✅ 邀请码机制
- ✅ 实时答案对比
- ✅ 搞笑匹配度分析
- ✅ 移动端友好设计
- ✅ 优化后的小体积包（< 1MB）

## 技术栈
- React + TypeScript
- Vite
- Tailwind CSS
- 本地存储

部署包大小：944KB
符合所有主流平台的部署要求。