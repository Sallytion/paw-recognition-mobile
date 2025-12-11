# 🐾 Paw Recognition Mobile App

A modern Flutter mobile application for identifying dog breeds from paw images using AI-powered recognition.

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

</div>

## ✨ Features

- 📷 **Camera Integration** - Take photos directly from your camera
- 🖼️ **Gallery Picker** - Select images from your device gallery
- 🤖 **AI-Powered Recognition** - Accurate paw breed identification using machine learning
- 📊 **Confidence Scores** - Visual representation of prediction confidence
- 🎨 **Modern UI** - Clean Material Design 3 interface
- ⚡ **Real-time Processing** - Fast prediction results
- 🌐 **Cloud API Integration** - Connected to production backend

## 📱 Screenshots

> Add screenshots of your app here

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / Xcode (for platform-specific builds)
- An Android/iOS device or emulator

### Installation

1. Clone the repository
```bash
git clone https://github.com/Sallytion/paw-recognition-mobile.git
cd paw-recognition-mobile
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 🏗️ Build

### Android APK
```bash
flutter build apk --release
```
The APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle (for Play Store)
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 🔧 Configuration

The app connects to a production API. The configuration is located in:
```dart
lib/services/paw_recognition_service.dart
```

## 📦 Dependencies

- **image_picker** - For camera and gallery access
- **http** - For API communication
- **flutter/material** - Material Design UI components

## 🏛️ Architecture

```
lib/
├── main.dart                          # App entry point
├── models/
│   └── prediction.dart               # Data models for API responses
└── services/
    └── paw_recognition_service.dart  # API service layer
```

## 🌐 API Integration

The app communicates with a RESTful API for paw recognition:
- **Endpoint**: `https://paw-recognition-c6208b7f2ea2.herokuapp.com`
- **Authentication**: API key-based
- **Rate Limit**: 100 requests per hour

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Sallytion** - [GitHub Profile](https://github.com/Sallytion)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for the beautiful UI components
- Backend API team for the recognition service

## 📞 Support

If you have any questions or issues, please open an issue on GitHub.

---

<div align="center">
Made with ❤️ using Flutter
</div>
