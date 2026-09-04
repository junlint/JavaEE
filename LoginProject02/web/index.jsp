<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>现代首页 · 玻璃美学</title>
    <!-- Font Awesome 6 (免费) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* ----- 全局重置 & 字体 ----- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(145deg, #0b1120 0%, #1b2a3f 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
            position: relative;
            overflow-x: hidden;
        }

        /* ----- 动态光晕 (背景装饰) ----- */
        .glow-orb {
            position: fixed;
            border-radius: 50%;
            filter: blur(120px);
            opacity: 0.4;
            pointer-events: none;
            z-index: 0;
        }

        .glow-orb--pink {
            width: 450px;
            height: 450px;
            background: radial-gradient(circle, #f472b6, #ec4899);
            top: -150px;
            right: -100px;
            animation: floatGlow 14s infinite alternate ease-in-out;
        }

        .glow-orb--blue {
            width: 550px;
            height: 550px;
            background: radial-gradient(circle, #60a5fa, #3b82f6);
            bottom: -200px;
            left: -120px;
            animation: floatGlow 18s infinite alternate-reverse ease-in-out;
        }

        .glow-orb--purple {
            width: 380px;
            height: 380px;
            background: radial-gradient(circle, #a78bfa, #8b5cf6);
            top: 30%;
            left: 25%;
            opacity: 0.25;
            animation: floatGlow 20s infinite alternate ease-in-out;
        }

        @keyframes floatGlow {
            0% { transform: translate(0, 0) scale(1); }
            100% { transform: translate(50px, 40px) scale(1.25); }
        }

        /* ----- 主卡片 (毛玻璃) ----- */
        .dashboard-card {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 1100px;
            background: rgba(255, 255, 255, 0.06);
            backdrop-filter: blur(20px) saturate(180%);
            -webkit-backdrop-filter: blur(20px) saturate(180%);
            border-radius: 56px;
            padding: 2.8rem 2.8rem 3.2rem;
            border: 1px solid rgba(255, 255, 255, 0.08);
            box-shadow: 0 30px 60px -16px rgba(0, 0, 0, 0.7), 0 0 0 1px rgba(255, 255, 255, 0.04) inset;
            transition: box-shadow 0.3s ease;
        }

        .dashboard-card:hover {
            box-shadow: 0 40px 72px -20px rgba(0, 0, 0, 0.8), 0 0 0 1px rgba(255, 255, 255, 0.08) inset;
        }

        /* ----- 顶部导航 / 头部 ----- */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1.2rem 1.8rem;
            margin-bottom: 3.2rem;
        }

        .logo-area {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .logo-icon {
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            width: 44px;
            height: 44px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.6rem;
            color: #0b1120;
            box-shadow: 0 8px 20px rgba(245, 158, 11, 0.25);
        }

        .logo-text {
            color: #fff;
            font-weight: 600;
            font-size: 1.5rem;
            letter-spacing: -0.3px;
        }

        .logo-text span {
            color: #fbbf24;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 2rem;
            list-style: none;
            color: rgba(255, 255, 255, 0.6);
            font-weight: 450;
            font-size: 0.98rem;
        }

        .nav-links li {
            cursor: default;
            transition: color 0.2s;
            padding: 6px 0;
            border-bottom: 2px solid transparent;
        }

        .nav-links li.active {
            color: #ffffff;
            border-bottom-color: #fbbf24;
        }

        .nav-links li:not(.active):hover {
            color: #fff;
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .nav-actions .avatar {
            width: 44px;
            height: 44px;
            border-radius: 40px;
            background: linear-gradient(135deg, #818cf8, #6366f1);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-weight: 600;
            font-size: 1.1rem;
            box-shadow: 0 6px 14px rgba(99, 102, 241, 0.3);
            border: 2px solid rgba(255, 255, 255, 0.15);
            cursor: pointer;
            transition: 0.2s;
        }

        .nav-actions .avatar:hover {
            transform: scale(1.04);
            border-color: #fbbf24;
        }

        .nav-actions i {
            color: rgba(255, 255, 255, 0.5);
            font-size: 1.2rem;
            cursor: pointer;
            transition: color 0.2s;
        }

        .nav-actions i:hover {
            color: #fff;
        }

        /* ----- 欢迎横幅 ----- */
        .welcome-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 3rem;
            gap: 1.5rem;
        }

        .welcome-text h2 {
            color: #fff;
            font-size: 2.1rem;
            font-weight: 600;
            letter-spacing: -0.3px;
        }

        .welcome-text h2 i {
            color: #fbbf24;
            margin-right: 6px;
        }

        .welcome-text p {
            color: rgba(255, 255, 255, 0.5);
            margin-top: 6px;
            font-size: 1rem;
        }

        .date-badge {
            background: rgba(255, 255, 255, 0.06);
            backdrop-filter: blur(6px);
            padding: 0.6rem 1.6rem;
            border-radius: 60px;
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.9rem;
            border: 1px solid rgba(255, 255, 255, 0.06);
            display: inline-flex;
            align-items: center;
            gap: 10px;
            white-space: nowrap;
        }

        .date-badge i {
            color: #fbbf24;
        }

        /* ----- 统计卡片 (3列) ----- */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3.2rem;
        }

        .stat-item {
            background: rgba(255, 255, 255, 0.04);
            backdrop-filter: blur(8px);
            border-radius: 32px;
            padding: 1.4rem 1.6rem;
            border: 1px solid rgba(255, 255, 255, 0.06);
            transition: all 0.25s ease;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
        }

        .stat-item:hover {
            background: rgba(255, 255, 255, 0.08);
            transform: translateY(-4px);
            border-color: rgba(255, 255, 255, 0.15);
            box-shadow: 0 16px 32px rgba(0, 0, 0, 0.2);
        }

        .stat-label {
            color: rgba(255, 255, 255, 0.5);
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .stat-label i {
            color: #fbbf24;
            font-size: 0.9rem;
        }

        .stat-value {
            color: #fff;
            font-size: 2.2rem;
            font-weight: 600;
            margin-top: 6px;
            letter-spacing: -0.5px;
        }

        .stat-change {
            font-size: 0.75rem;
            color: #4ade80;
            background: rgba(74, 222, 128, 0.15);
            padding: 2px 12px;
            border-radius: 40px;
            display: inline-block;
            margin-top: 8px;
            font-weight: 500;
        }

        .stat-change.down {
            color: #f87171;
            background: rgba(248, 113, 113, 0.15);
        }

        /* ----- 内容双列: 活动 & 快速操作 ----- */
        .content-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 2rem;
        }

        @media (max-width: 780px) {
            .content-grid {
                grid-template-columns: 1fr;
                gap: 2.2rem;
            }
        }

        /* 左侧: 最近活动 */
        .activity-panel {
            background: rgba(255, 255, 255, 0.03);
            border-radius: 36px;
            padding: 1.8rem 1.6rem 1.8rem;
            border: 1px solid rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(4px);
        }

        .panel-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.4rem;
        }

        .panel-header h3 {
            color: #fff;
            font-weight: 500;
            font-size: 1.2rem;
        }

        .panel-header a {
            color: rgba(255, 255, 255, 0.35);
            font-size: 0.85rem;
            text-decoration: none;
            transition: color 0.2s;
        }

        .panel-header a:hover {
            color: #fbbf24;
        }

        .activity-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem 0.6rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.04);
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            width: 44px;
            height: 44px;
            min-width: 44px;
            border-radius: 18px;
            background: rgba(255, 255, 255, 0.04);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fbbf24;
            font-size: 1.2rem;
            border: 1px solid rgba(255, 255, 255, 0.04);
        }

        .activity-info {
            flex: 1;
        }

        .activity-info .title {
            color: #fff;
            font-size: 0.95rem;
            font-weight: 450;
        }

        .activity-info .desc {
            color: rgba(255, 255, 255, 0.35);
            font-size: 0.8rem;
            margin-top: 2px;
        }

        .activity-time {
            color: rgba(255, 255, 255, 0.25);
            font-size: 0.7rem;
            white-space: nowrap;
        }

        /* 右侧: 快速操作 + 小工具 */
        .quick-actions {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .quick-card {
            background: rgba(255, 255, 255, 0.03);
            border-radius: 36px;
            padding: 1.6rem 1.5rem;
            border: 1px solid rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(4px);
            transition: 0.2s;
        }

        .quick-card:hover {
            background: rgba(255, 255, 255, 0.06);
        }

        .quick-card h4 {
            color: rgba(255, 255, 255, 0.7);
            font-weight: 450;
            font-size: 0.9rem;
            letter-spacing: 0.3px;
            margin-bottom: 1rem;
        }

        .action-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .action-btn {
            background: rgba(255, 255, 255, 0.04);
            border: 1px solid rgba(255, 255, 255, 0.04);
            border-radius: 60px;
            padding: 0.6rem 0.4rem;
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.8rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            cursor: default;
            transition: all 0.2s;
        }

        .action-btn i {
            color: #fbbf24;
            font-size: 0.9rem;
        }

        .action-btn:hover {
            background: rgba(255, 255, 255, 0.08);
            color: #fff;
            border-color: rgba(255, 255, 255, 0.15);
            transform: scale(0.98);
        }

        .progress-item {
            margin-top: 10px;
        }

        .progress-item .label {
            display: flex;
            justify-content: space-between;
            color: rgba(255, 255, 255, 0.5);
            font-size: 0.8rem;
            margin-bottom: 4px;
        }

        .progress-bar {
            height: 6px;
            background: rgba(255, 255, 255, 0.06);
            border-radius: 20px;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            width: 72%;
            background: linear-gradient(90deg, #fbbf24, #f59e0b);
            border-radius: 20px;
            box-shadow: 0 0 12px rgba(251, 191, 36, 0.2);
        }

        .progress-fill.small {
            width: 48%;
        }

        /* 小响应式修正 */
        @media (max-width: 600px) {
            .dashboard-card {
                padding: 1.8rem 1.2rem;
                border-radius: 36px;
            }

            .navbar {
                flex-direction: column;
                align-items: stretch;
            }

            .nav-links {
                justify-content: space-around;
                flex-wrap: wrap;
                gap: 0.8rem;
            }

            .welcome-text h2 {
                font-size: 1.6rem;
            }

            .stats-grid {
                grid-template-columns: 1fr 1fr;
            }

            .action-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 420px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
        }

        /* 小点缀 */
        .corner-deco {
            position: absolute;
            width: 120px;
            height: 120px;
            background: radial-gradient(circle, rgba(251, 191, 36, 0.03), transparent 70%);
            bottom: -30px;
            right: -20px;
            border-radius: 50%;
            pointer-events: none;
        }
    </style>
</head>
<body>
<!-- 动态背景光晕 -->
<div class="glow-orb glow-orb--pink"></div>
<div class="glow-orb glow-orb--blue"></div>
<div class="glow-orb glow-orb--purple"></div>

<!-- 主卡片 -->
<div class="dashboard-card">
    <!-- 角落装饰 -->
    <div class="corner-deco"></div>

    <!-- 导航栏 -->
    <nav class="navbar">
        <div class="logo-area">
            <div class="logo-icon"><i class="fas fa-bolt"></i></div>
            <div class="logo-text">Nova<span>.</span></div>
        </div>

        <ul class="nav-links">
            <li class="active"><i class="fas fa-home" style="margin-right: 6px;"></i> 首页</li>
            <li><i class="fas fa-chart-simple" style="margin-right: 6px;"></i> 分析</li>
            <li><i class="fas fa-users" style="margin-right: 6px;"></i> 团队</li>
            <li><i class="fas fa-gear" style="margin-right: 6px;"></i> 设置</li>
        </ul>

        <div class="nav-actions">
            <i class="fas fa-search"></i>
            <i class="fas fa-bell"></i>
            <div class="avatar">JD</div>
        </div>
    </nav>

    <!-- 欢迎横幅 -->
    <div class="welcome-section">
        <div class="welcome-text">
            <h2><i class="fas fa-hand-peace"></i> 欢迎回来，J.D.</h2>
            <p>今天你有 3 个任务待处理 · 保持高效</p>
        </div>
        <div class="date-badge">
            <i class="fas fa-calendar-day"></i> 2026年9月2日 · 周三
        </div>
    </div>

    <!-- 统计卡片 -->
    <div class="stats-grid">
        <div class="stat-item">
            <div class="stat-label"><i class="fas fa-eye"></i> 访问量</div>
            <div class="stat-value">24.8K</div>
            <span class="stat-change"><i class="fas fa-arrow-up"></i> +12.5%</span>
        </div>
        <div class="stat-item">
            <div class="stat-label"><i class="fas fa-users"></i> 活跃用户</div>
            <div class="stat-value">1,842</div>
            <span class="stat-change"><i class="fas fa-arrow-up"></i> +8.1%</span>
        </div>
        <div class="stat-item">
            <div class="stat-label"><i class="fas fa-clock"></i> 会话时长</div>
            <div class="stat-value">4.6m</div>
            <span class="stat-change down"><i class="fas fa-arrow-down"></i> -2.3%</span>
        </div>
        <div class="stat-item">
            <div class="stat-label"><i class="fas fa-trophy"></i> 完成率</div>
            <div class="stat-value">87%</div>
            <span class="stat-change"><i class="fas fa-arrow-up"></i> +5.2%</span>
        </div>
    </div>

    <!-- 双列内容 -->
    <div class="content-grid">
        <!-- 左侧：最近活动 -->
        <div class="activity-panel">
            <div class="panel-header">
                <h3><i class="fas fa-bolt" style="color: #fbbf24; margin-right: 8px;"></i>最近活动</h3>
                <a href="#">查看全部 →</a>
            </div>

            <div class="activity-item">
                <div class="activity-icon"><i class="fas fa-file-pen"></i></div>
                <div class="activity-info">
                    <div class="title">更新了项目文档</div>
                    <div class="desc">Nova 设计系统 v2.3</div>
                </div>
                <div class="activity-time">12:30</div>
            </div>

            <div class="activity-item">
                <div class="activity-icon"><i class="fas fa-user-plus"></i></div>
                <div class="activity-info">
                    <div class="title">新成员加入</div>
                    <div class="desc">林晓 加入了「前端」团队</div>
                </div>
                <div class="activity-time">昨天</div>
            </div>

            <div class="activity-item">
                <div class="activity-icon"><i class="fas fa-code"></i></div>
                <div class="activity-info">
                    <div class="title">代码合并请求</div>
                    <div class="desc">#342 修复登录页样式</div>
                </div>
                <div class="activity-time">昨天</div>
            </div>

            <div class="activity-item">
                <div class="activity-icon"><i class="fas fa-envelope"></i></div>
                <div class="activity-info">
                    <div class="title">收到新消息</div>
                    <div class="desc">来自 陈总 关于季度汇报</div>
                </div>
                <div class="activity-time">2天前</div>
            </div>
        </div>

        <!-- 右侧：快速操作 + 进度 -->
        <div class="quick-actions">
            <div class="quick-card">
                <h4><i class="fas fa-rocket" style="color: #fbbf24; margin-right: 6px;"></i> 快速入口</h4>
                <div class="action-grid">
                    <div class="action-btn"><i class="fas fa-plus"></i> 新建</div>
                    <div class="action-btn"><i class="fas fa-upload"></i> 上传</div>
                    <div class="action-btn"><i class="fas fa-users"></i> 邀请</div>
                    <div class="action-btn"><i class="fas fa-calendar"></i> 日程</div>
                </div>
            </div>

            <div class="quick-card">
                <h4><i class="fas fa-chart-line" style="color: #fbbf24; margin-right: 6px;"></i> 项目进度</h4>
                <div class="progress-item">
                    <div class="label"><span>产品设计</span> <span>72%</span></div>
                    <div class="progress-bar"><div class="progress-fill"></div></div>
                </div>
                <div class="progress-item">
                    <div class="label"><span>前端开发</span> <span>48%</span></div>
                    <div class="progress-bar"><div class="progress-fill small"></div></div>
                </div>
                <div class="progress-item" style="margin-bottom: 0;">
                    <div class="label"><span>测试 & 部署</span> <span>23%</span></div>
                    <div class="progress-bar"><div class="progress-fill" style="width: 23%;"></div></div>
                </div>
            </div>

            <!-- 简洁小卡片：天气 / 小提示 (装饰) -->
            <div class="quick-card" style="background: rgba(251, 191, 36, 0.04); border-color: rgba(251, 191, 36, 0.08);">
                <div style="display: flex; align-items: center; gap: 10px; color: rgba(255,255,255,0.7);">
                    <i class="fas fa-cloud-sun" style="font-size: 1.5rem; color: #fbbf24;"></i>
                    <span style="font-weight: 400;">长沙 · 26°C 晴朗</span>
                    <span style="margin-left: auto; font-size: 0.75rem; color: rgba(255,255,255,0.3);">⏳ 更新于今日</span>
                </div>
            </div>
        </div>
    </div>

    <!-- 页脚微提示 (装饰) -->
    <div style="margin-top: 2.8rem; text-align: right; color: rgba(255,255,255,0.12); font-size: 0.7rem; letter-spacing: 0.5px; border-top: 1px solid rgba(255,255,255,0.03); padding-top: 1.2rem;">
        <i class="fas fa-circle" style="color: #4ade80; font-size: 0.4rem; margin-right: 6px;"></i> 系统运行中 · 版本 2.4.0
    </div>
</div>

<!-- 小交互 (控制台彩蛋) -->
<script>
    (function() {
        console.log('🚀 Nova 首页 — 玻璃态设计系统');
    })();
</script>
</body>
</html>