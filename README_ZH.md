# Simple Chat - 跨平台AI助手对话工具

[English](README.md) | [简体中文](README_ZH.md)

[![Flutter Version](https://img.shields.io/badge/Flutter-^3.29.0-blue.svg)](https://flutter.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-0.0.5-orange.svg)](https://github.com/yh4922/simple-chat)

一个使用Flutter开发的简洁、高效的AI助手对话工具，支持多种大语言模型，可在桌面端和Web客户端使用。Simple Chat让您能够轻松与各种先进的AI模型进行对话，支持自定义对话参数和多种交互模式。

![应用预览图](assets/images/preview.png)

## 功能特性

- 跨平台支持：同时支持Windows、macOS、Linux桌面端和Web浏览器
- 即时聊天：基于现代化的消息传递机制
- AI对话助手：支持与多种大语言模型交互
   - 支持OpenAI、Anthropic、Google Gemini、火山引擎和DeepSeek等多种AI模型供应商
   - 默认集成GPT-4o-mini等高质量模型
   - 支持自定义对话参数（温度、创意度、思维开放度等）
   - 提供多种对话模式：聊天模式、文档模式、代码模式
   - 智能话题管理：自动创建新话题并提供上下文总结功能
- 高级AI对话特性：
   - 自定义角色设定与预输入模板
   - 可调节的推理强度与响应风格
   - 自动历史对话管理与总结
- 主题定制：支持深色/浅色模式切换
- 多语言支持：内置国际化框架
- 数据本地存储：使用drift (moor)数据库确保聊天记录本地安全存储

## 快速开始

### 前置要求

- Flutter SDK >= 3.29.0
- Dart SDK >= 3.0.0
- Node.js (用于运行package.json中的命令)
- 用于开发的IDE（推荐使用VS Code或Android Studio）

### 安装步骤

1. 克隆仓库到本地

```bash
git clone https://github.com/yh4922/simple-chat.git
cd simple_chat
```

2. 安装依赖

```bash
flutter pub get
```

3. 运行应用

```bash
# 开发环境运行
npm run dev

# 在Web浏览器中运行
npm run dev:web
```

### 构建应用

本项目使用 [flutter_distributor](https://pub.dev/packages/flutter_distributor) 进行应用构建和打包。

#### 安装 flutter_distributor

```bash
# 全局安装 flutter_distributor
dart pub global activate flutter_distributor
```

#### 手动构建

```bash
# 构建Android APK
flutter_distributor package --platform android --targets apk --flutter-build-args=dart-define=INIT_ENV=prod --flutter-build-args=release

# 构建Windows应用（EXE安装包）
flutter_distributor package --platform windows --targets exe --flutter-build-args=dart-define=INIT_ENV=prod

# 构建Linux应用（DEB包）
flutter_distributor package --platform linux --targets deb --flutter-build-args=dart-define=INIT_ENV=prod

# 构建macOS应用（DMG镜像）
flutter_distributor package --platform macos --targets dmg --flutter-build-args=dart-define=INIT_ENV=prod

# 构建Web应用
flutter build web --release --dart-define=INIT_ENV=prod --dart-define=FLUTTER_WEB_CANVASKIT_URL=canvaskit
```

#### 使用预定义npm脚本

项目在package.json中也定义了一些快捷命令用于构建：

```bash
# 构建Android APK
npm run build-apk

# 构建iOS应用
npm run build-ios

# 构建Web应用
npm run build-web

# 构建Windows应用
npm run build-windows

# 构建Linux应用
npm run build-linux

# 构建macOS应用
npm run build-macos
```

#### 自动构建与发布

项目使用GitHub Actions自动构建和发布流程。当推送新的版本标签（如 `v0.0.5+5`）到仓库时，会自动触发多平台构建并创建发布包。

```bash
# 创建新版本标签并推送，触发构建
npm run tag:demo  # 或自定义标签: git tag v版本号 && git push origin v版本号
```

## 开发工具

```bash
# 生成国际化文件
npm run i18n
npm run i18n:dart

# 生成App图标
npm run app:icon

# 生成代码
npm run code

# 监听代码变化并自动生成
npm run code:watch
```

## 项目结构

```
lib/
├── consts/         # 常量定义
├── database/       # 数据库配置和操作
├── i18n/           # 国际化资源
├── layout/         # 布局组件
├── models/         # 数据模型
├── router/         # 路由管理
├── states/         # 状态管理（使用Riverpod）
├── theme/          # 主题配置
├── utils/          # 工具函数
├── views/          # 页面视图
│   ├── chat/       # 聊天相关页面
│   ├── demo/       # 示例页面
│   └── home/       # 主页
├── widgets/        # 可复用组件
└── main.dart       # 应用入口
```

## 技术栈

- **Framework**: Flutter
- **State Management**: Flutter Riverpod
- **Routing**: auto_route
- **Database**: drift (SQLite ORM)
- **Internationalization**: intl
- **Desktop Support**: window_manager
- **UI Notifications**: bot_toast

## 配置与定制

### 主题定制

在 `lib/theme/` 目录下修改主题相关配置。

### 多语言支持

应用支持国际化，可在 `lib/i18n/` 目录下添加或修改多语言资源。

生成语言文件：

```bash
flutter pub run intl_utils:generate
```

### AI模型配置

Simple Chat支持多种AI模型提供商和配置选项，您可以根据需要进行定制：

#### 支持的AI模型提供商

- OpenAI（默认）
- Anthropic
- Google Gemini
- 火山引擎
- DeepSeek

#### 自定义助手参数

可在应用中自定义多种AI助手参数，包括：

- **温度**：控制回答的创意性和严谨性（0-2之间）
- **思维开放度**：控制模型考虑多少种可能性（0-1之间）
- **表述发散度**：控制避免概念重复的程度（-2至2之间）
- **词汇丰富度**：控制用词丰富程度（-2至2之间）
- **最大Token限制**：控制单次交互的最大Token数
- **推理强度**：可选low（低）、medium（中）、high（高）

#### 话题管理设置

- **自动创建话题**：当超过指定对话历史数量时自动创建新话题
- **对话历史上限**：设置触发新话题创建的对话数量门槛
- **自动总结**：启用后，模型会对历史消息进行总结，以保持上下文连贯性

#### 示例配置

可在代码中设置助手配置，例如：

```dart
Assistant assistant = Assistant(
  id: 1,
  name: "ChatGPT助手",
)
```

## 贡献指南

1. Fork 项目
2. 创建特性分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add some amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 创建Pull Request

## 许可证

本项目采用 MIT 许可证 - 详情请查看 [LICENSE](LICENSE) 文件

## 联系方式

如有任何问题或建议，请通过以下方式联系我们：

- GitHub Issues: [https://github.com/yh4922/simple-chat/issues](https://github.com/yh4922/simple-chat/issues)
- Email: [your-email@example.com](mailto:your-email@example.com)

---

**Simple Chat** - 让聊天回归简单 2025
