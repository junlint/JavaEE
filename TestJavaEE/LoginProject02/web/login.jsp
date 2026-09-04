<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>Glassmorphism 登录</title>
    <!-- Font Awesome 5 (免费图标库) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* 全局重置 & 字体 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(145deg, #0b1120 0%, #1b2a3f 100%);
            /* 动态流光背景 */
            position: relative;
            overflow: hidden;
            padding: 1.5rem;
        }

        /* 装饰性动态光晕 (两个大球) */
        .glow-orb {
            position: absolute;
            border-radius: 50%;
            filter: blur(100px);
            opacity: 0.5;
            pointer-events: none;
            z-index: 0;
        }

        .glow-orb--pink {
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, #f472b6, #ec4899);
            top: -120px;
            right: -80px;
            animation: floatGlow 12s infinite alternate ease-in-out;
        }

        .glow-orb--blue {
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, #60a5fa, #3b82f6);
            bottom: -180px;
            left: -100px;
            animation: floatGlow 15s infinite alternate-reverse ease-in-out;
        }

        .glow-orb--purple {
            width: 350px;
            height: 350px;
            background: radial-gradient(circle, #a78bfa, #8b5cf6);
            top: 40%;
            left: 30%;
            opacity: 0.3;
            animation: floatGlow 18s infinite alternate ease-in-out;
        }

        @keyframes floatGlow {
            0% { transform: translate(0, 0) scale(1); }
            100% { transform: translate(40px, 30px) scale(1.2); }
        }

        /* 主卡片 — 毛玻璃效果 */
        .login-card {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 420px;
            padding: 2.8rem 2.2rem 2.8rem 2.2rem;
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(18px) saturate(180%);
            -webkit-backdrop-filter: blur(18px) saturate(180%);
            border-radius: 48px;
            box-shadow: 0 25px 50px -8px rgba(0, 0, 0, 0.6), 0 0 0 1px rgba(255, 255, 255, 0.05) inset;
            border: 1px solid rgba(255, 255, 255, 0.15);
            transition: box-shadow 0.3s ease;
        }

        .login-card:hover {
            box-shadow: 0 35px 60px -12px rgba(0, 0, 0, 0.8), 0 0 0 1px rgba(255, 255, 255, 0.1) inset;
        }

        /* 头部 */
        .login-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .login-header h1 {
            color: #ffffff;
            font-size: 2.2rem;
            font-weight: 600;
            letter-spacing: -0.5px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .login-header h1 i {
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            font-size: 2rem;
        }

        .login-header p {
            color: rgba(255, 255, 255, 0.6);
            font-weight: 400;
            font-size: 0.95rem;
            margin-top: 6px;
            letter-spacing: 0.3px;
        }

        /* 表单 */
        .login-form {
            display: flex;
            flex-direction: column;
            gap: 1.6rem;
        }

        .input-group {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-group i {
            position: absolute;
            left: 18px;
            color: rgba(255, 255, 255, 0.4);
            font-size: 1.2rem;
            transition: color 0.2s ease;
            pointer-events: none;
        }

        .input-group input {
            width: 100%;
            padding: 1rem 1rem 1rem 3.2rem;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 40px;
            font-size: 1rem;
            color: #fff;
            outline: none;
            transition: all 0.25s ease;
            box-shadow: inset 0 4px 8px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(4px);
        }

        .input-group input::placeholder {
            color: rgba(255, 255, 255, 0.35);
            font-weight: 300;
            letter-spacing: 0.2px;
        }

        .input-group input:focus {
            background: rgba(255, 255, 255, 0.12);
            border-color: rgba(255, 255, 255, 0.5);
            box-shadow: 0 0 0 4px rgba(255, 255, 255, 0.08), inset 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .input-group input:focus + i,
        .input-group input:focus ~ i {
            color: #ffffff;
        }

        /* 额外选项: 记住我 & 忘记密码 */
        .login-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: rgba(255, 255, 255, 0.6);
            font-size: 0.9rem;
            padding: 0 6px;
        }

        .login-options label {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            transition: color 0.2s;
        }

        .login-options label:hover {
            color: #fff;
        }

        .login-options input[type="checkbox"] {
            appearance: none;
            -webkit-appearance: none;
            width: 18px;
            height: 18px;
            border-radius: 6px;
            border: 1.5px solid rgba(255, 255, 255, 0.3);
            background: rgba(255, 255, 255, 0.04);
            transition: all 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            flex-shrink: 0;
        }

        .login-options input[type="checkbox"]:checked {
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            border-color: #fbbf24;
            box-shadow: 0 0 12px rgba(251, 191, 36, 0.3);
        }

        .login-options input[type="checkbox"]:checked::after {
            content: "\f00c";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            font-size: 11px;
            color: #0b1120;
        }

        .login-options a {
            color: rgba(255, 255, 255, 0.5);
            text-decoration: none;
            transition: color 0.2s;
            font-weight: 400;
            border-bottom: 1px solid transparent;
        }

        .login-options a:hover {
            color: #fbbf24;
            border-bottom-color: #fbbf24;
        }

        /* 登录按钮 */
        .btn-login {
            margin-top: 0.6rem;
            padding: 1rem 0;
            border: none;
            border-radius: 40px;
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            color: #0b1120;
            font-weight: 600;
            font-size: 1.1rem;
            letter-spacing: 0.3px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            cursor: pointer;
            transition: all 0.25s ease;
            box-shadow: 0 8px 24px rgba(245, 158, 11, 0.25);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .btn-login i {
            font-size: 1rem;
            transition: transform 0.25s ease;
        }

        .btn-login:hover {
            transform: scale(1.02) translateY(-2px);
            box-shadow: 0 14px 32px rgba(245, 158, 11, 0.4);
            background: linear-gradient(135deg, #fcd34d, #f59e0b);
        }

        .btn-login:active {
            transform: scale(0.97);
        }

        .btn-login:hover i {
            transform: translateX(6px);
        }

        /* 注册链接 */
        .signup-link {
            text-align: center;
            margin-top: 1.8rem;
            color: rgba(255, 255, 255, 0.45);
            font-size: 0.95rem;
        }

        .signup-link a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            font-weight: 500;
            border-bottom: 1px solid transparent;
            transition: all 0.2s;
        }

        .signup-link a:hover {
            color: #fbbf24;
            border-bottom-color: #fbbf24;
        }

        /* 响应式适配 */
        @media (max-width: 480px) {
            .login-card {
                padding: 2rem 1.5rem;
                border-radius: 32px;
            }

            .login-header h1 {
                font-size: 1.9rem;
            }

            .input-group input {
                padding: 0.9rem 1rem 0.9rem 3rem;
                font-size: 0.95rem;
            }

            .btn-login {
                font-size: 1rem;
                padding: 0.9rem 0;
            }
        }

        /* 小点缀：角落光晕 */
        .corner-glow {
            position: absolute;
            width: 150px;
            height: 150px;
            background: radial-gradient(circle, rgba(251, 191, 36, 0.08), transparent 70%);
            border-radius: 50%;
            bottom: -40px;
            right: -40px;
            pointer-events: none;
        }

        /* 自定义滚动条 (可选) */
        ::-webkit-scrollbar {
            width: 6px;
        }
        ::-webkit-scrollbar-track {
            background: rgba(0,0,0,0.1);
        }
        ::-webkit-scrollbar-thumb {
            background: #f59e0b;
            border-radius: 12px;
        }
    </style>
</head>
<body>
<!-- 装饰动态光晕 -->
<div class="glow-orb glow-orb--pink"></div>
<div class="glow-orb glow-orb--blue"></div>
<div class="glow-orb glow-orb--purple"></div>

<!-- 主登录卡片 -->
<div class="login-card">
    <div class="login-header">
        <h1>
            <i class="fas fa-key"></i> 登录
        </h1>
        <p>欢迎回来，请登录您的账户</p>
    </div>

    <img src="images/sh.png" />

    <form class="login-form" action="loginServlet" method="post">
        <!-- 用户名 / 邮箱 -->
        <div class="input-group">
            <input type="text" id="username" name="uname" placeholder="用户名或邮箱" required autofocus>
            <i class="fas fa-user"></i>
        </div>

        <!-- 密码 -->
        <div class="input-group">
            <input type="password" id="password" name="pwd" placeholder="密码" required>
            <i class="fas fa-lock"></i>
        </div>

        <!-- 选项 -->
        <div class="login-options">
            <label for="remember">
                <input type="checkbox" id="remember" checked>
                记住我
            </label>
            <a href="#">忘记密码？</a>
        </div>

        <!-- 登录按钮 -->
        <button type="submit" class="btn-login">
            登 录
            <i class="fas fa-arrow-right"></i>
        </button>
    </form>
    <!-- 放在 form 标签下方 -->
    <c:if test="${not empty failmsg}">
        <div class="error-box">
            <i class="fas fa-exclamation-circle"></i>
            <span>${failmsg}</span>
        </div>
    </c:if>

    <style>
        /* 简单的错误提示框样式 */
        .error-box {
            margin-top: 15px;
            padding: 12px 15px;
            background-color: #ffebee; /* 浅红色背景 */
            color: #c62828;           /* 深红色文字 */
            border: 1px solid #ef9a9a;/* 边框 */
            border-radius: 5px;       /* 圆角 */
            font-size: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: shake 0.3s;    /* 加个小抖动特效 */
        }

        .error-box i {
            margin-right: 8px;        /* 图标和文字的间距 */
        }

        /* 抖动动画（让报错看起来更有反馈感） */
        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
            100% { transform: translateX(0); }
        }
    </style>


    <div class="signup-link">
        还没有账户？ <a href="#">立即注册</a>
    </div>

    <!-- 装饰小光晕 (卡片内) -->
    <div class="corner-glow"></div>
</div>

<!-- 可选: 加入一点JS让交互更细腻 (仅为视觉点缀) -->
<script>
    (function() {
        // 简单的输入框聚焦效果 (已有css focus)
        // 可增加控制台提醒，但无实际作用，保持干净
        console.log('✨ Glassmorphism 登录界面 — 欢迎使用');
    })();
</script>
</body>
</html>