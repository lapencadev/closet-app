# Closet App – Mobile

A modern wardrobe manager built with Flutter, focusing on a **local-first** experience.

## 🚀 Features (Current & Planned)

- **Wardrobe Management**: Store and organize clothing items.
- **Local-First Architecture**: Fully functional offline using SQLite.
- **Loan Tracking**: Keep track of who borrowed your items.
- **Modern UI**: Clean, minimalist design with a centralized theme.

## 🧱 Architecture

The project follows a simplified **MVVM (Model-View-ViewModel)** architecture:

- `lib/screens/`: UI screens and page layouts.
- `lib/widgets/`: Reusable UI components.
- `lib/models/`: Data models and DTOs.
- `lib/services/`: Business logic and database services (Drift).
- `lib/providers/`: State management.
- `lib/utils/`: Constants, theme, and helper functions.

## 🛠️ Tech Stack

- **Frontend**: Flutter
- **Database**: [Drift](https://drift.simonbinder.eu/) (SQLite)
- **CI/CD**: GitHub Actions (using centralized templates)

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK (latest stable)
- Dart SDK

### Setup

1. Clone the repository.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Generate database code:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

### Running Tests

Execute the unit test suite:
```bash
flutter test
```

## 🤖 CI/CD

This project uses GitHub Actions to automate:
- Static analysis (`flutter analyze`)
- Unit testing (`flutter test`)
- Android build verification

The CI configuration is located in `.github/workflows/ci.yml`.
