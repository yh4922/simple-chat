# Simple Chat - Cross-Platform AI Assistant Dialogue Tool

[English](README.md) | [简体中文](README_ZH.md)

[![Flutter Version](https://img.shields.io/badge/Flutter-^3.29.0-blue.svg)](https://flutter.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-0.0.5-orange.svg)](https://github.com/yh4922/simple-chat)

A concise and efficient AI assistant dialogue tool developed with Flutter, supporting various large language models and available on desktop and web clients. Simple Chat enables you to easily converse with various advanced AI models, customize dialogue parameters, and use multiple interaction modes.

![Application Preview](assets/images/preview.png)

## Features

- Cross-Platform Support: Compatible with Windows, macOS, Linux desktop clients, and web browsers
- Instant Messaging: Based on modern messaging mechanisms
- AI Dialogue Assistant: Interact with various large language models
   - Support for multiple AI model providers including OpenAI, Anthropic, Google Gemini, Volcano Engine, and DeepSeek
   - Default integration with high-quality models like GPT-4o-mini
   - Customizable dialogue parameters (temperature, creativity, thought openness, etc.)
   - Multiple conversation modes: chat mode, document mode, code mode
   - Intelligent topic management: automatically creates new topics and provides context summaries
- Advanced AI Dialogue Features:
   - Custom role settings and pre-input templates
   - Adjustable reasoning intensity and response style
   - Automatic conversation history management and summarization
- Theme Customization: Support for dark/light mode switching
- Multilingual Support: Built-in internationalization framework
- Local Data Storage: Secure local storage of chat records using drift (moor) database

## Quick Start

### Prerequisites

- Flutter SDK >= 3.29.0
- Dart SDK >= 3.0.0
- Node.js (for running commands in package.json)
- Development IDE (VS Code or Android Studio recommended)

### Installation Steps

1. Clone the repository

```bash
git clone https://github.com/yh4922/simple-chat.git
cd simple_chat
```

2. Install dependencies

```bash
flutter pub get
```

3. Run the application

```bash
# Run in development environment
npm run dev

# Run in web browser
npm run dev:web
```

### Building the Application

This project uses [flutter_distributor](https://pub.dev/packages/flutter_distributor) for building and packaging.

#### Install flutter_distributor

```bash
# Global installation of flutter_distributor
dart pub global activate flutter_distributor
```

#### Manual Building

```bash
# Build Android APK
flutter_distributor package --platform android --targets apk --flutter-build-args=dart-define=INIT_ENV=prod --flutter-build-args=release

# Build Windows application (EXE installer)
flutter_distributor package --platform windows --targets exe --flutter-build-args=dart-define=INIT_ENV=prod

# Build Linux application (DEB package)
flutter_distributor package --platform linux --targets deb --flutter-build-args=dart-define=INIT_ENV=prod

# Build macOS application (DMG image)
flutter_distributor package --platform macos --targets dmg --flutter-build-args=dart-define=INIT_ENV=prod

# Build Web application
flutter build web --release --dart-define=INIT_ENV=prod --dart-define=FLUTTER_WEB_CANVASKIT_URL=canvaskit
```

#### Using Predefined npm Scripts

The project also defines some shortcut commands for building in package.json:

```bash
# Build Android APK
npm run build-apk

# Build iOS application
npm run build-ios

# Build Web application
npm run build-web

# Build Windows application
npm run build-windows

# Build Linux application
npm run build-linux

# Build macOS application
npm run build-macos
```

#### Automated Building and Publishing

The project uses GitHub Actions for automated building and release processes. When a new version tag (e.g., `v0.0.5+5`) is pushed to the repository, it automatically triggers multi-platform builds and creates release packages.

```bash
# Create and push a new version tag to trigger the build
npm run tag:demo  # or custom tag: git tag v[version_number] && git push origin v[version_number]
```

## Development Tools

```bash
# Generate internationalization files
npm run i18n
npm run i18n:dart

# Generate App icons
npm run app:icon

# Generate code
npm run code

# Watch for code changes and auto-generate
npm run code:watch
```

## Project Structure

```
lib/
├── consts/         # Constants definition
├── database/       # Database configuration and operations
├── i18n/           # Internationalization resources
├── layout/         # Layout components
├── models/         # Data models
├── router/         # Routing management
├── states/         # State management (using Riverpod)
├── theme/          # Theme configuration
├── utils/          # Utility functions
├── views/          # Page views
│   ├── chat/       # Chat-related pages
│   ├── demo/       # Example pages
│   └── home/       # Homepage
├── widgets/        # Reusable components
└── main.dart       # Application entry point
```

## Technology Stack

- **Framework**: Flutter
- **State Management**: Flutter Riverpod
- **Routing**: auto_route
- **Database**: drift (SQLite ORM)
- **Internationalization**: intl
- **Desktop Support**: window_manager
- **UI Notifications**: bot_toast

## Configuration and Customization

### Theme Customization

Modify theme-related configurations in the `lib/theme/` directory.

### Multilingual Support

The application supports internationalization. You can add or modify multilingual resources in the `lib/i18n/` directory.

Generate language files:

```bash
flutter pub run intl_utils:generate
```

### AI Model Configuration

Simple Chat supports multiple AI model providers and configuration options that you can customize according to your needs:

#### Supported AI Model Providers

- OpenAI (default)
- Anthropic
- Google Gemini
- Volcano Engine
- DeepSeek

#### Custom Assistant Parameters

You can customize various AI assistant parameters in the application, including:

- **Temperature**: Controls the creativity and rigor of responses (between 0-2)
- **Top P**: Controls how many possibilities the model considers (between 0-1)
- **Presence Penalty**: Controls the degree of concept repetition avoidance (between -2 and 2)
- **Frequency Penalty**: Controls vocabulary richness (between -2 and 2)
- **Max Tokens**: Controls the maximum number of tokens per interaction
- **Reasoning Effort**: Options include low, medium, and high

#### Topic Management Settings

- **Auto Create Topic**: Automatically creates a new topic when exceeding the specified conversation history count
- **Max Topic History**: Sets the threshold for triggering new topic creation
- **Auto Summary**: When enabled, the model summarizes historical messages to maintain context coherence

#### Example Configuration

You can set assistant configurations in code, for example:

```dart
Assistant assistant = Assistant(
  id: 1,
  name: "ChatGPT Assistant",
)
```

## Contribution Guidelines

1. Fork the project
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Contact

For any questions or suggestions, please contact us through:

- GitHub Issues: [https://github.com/yh4922/simple-chat/issues](https://github.com/yh4922/simple-chat/issues)
- Email: [your-email@example.com](mailto:your-email@example.com)

---

**Simple Chat** - Making chat simple again 2025