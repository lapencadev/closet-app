# Closet App – Mobile

Flutter app for managing your personal wardrobe with a **local-first** approach: everything works offline, with optional sync to the backend.

## Architecture

```
Flutter App
 ├── SQLite (Drift)     ← all structured data
 ├── Local filesystem   ← images in app documents directory
 └── HTTP (optional)    ← sync / export to Spring Boot backend
```

The app is fully functional without a network connection. Backend sync is a user-triggered, opt-in feature.

### Image strategy

When the user picks or takes a photo, the app **copies it into its own documents directory** (`getApplicationDocumentsDirectory()/closet/items/`). The SQLite record stores this internal path. This means:

- Images survive gallery deletions
- Images travel with the app backup
- On sync, the file is uploaded to the backend alongside the item data

## Tech Stack

- **Flutter** / Dart
- **Drift** (SQLite wrapper with type-safe queries)
- **path_provider** – resolves the app's documents directory
- **image_picker** *(planned)* – camera and gallery access
- **GitHub Actions** – CI (analyze, test, Android build)

## Project Structure

```
lib/
 ├── main.dart
 ├── app.dart
 ├── models/          # UI models (ItemModel, LoanModel)
 ├── screens/         # Page-level widgets
 ├── widgets/         # Reusable components
 ├── services/        # Drift database definition and queries
 ├── providers/       # State management
 └── utils/           # Theme, colours, constants, API config
```

## Getting Started

### Prerequisites

- Flutter SDK (latest stable)
- Dart SDK

### Setup

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Run

```bash
flutter run
```

### Tests

```bash
flutter test
```

## CI/CD

GitHub Actions runs on every push:

- `flutter analyze` – static analysis
- `flutter test` – unit tests
- Android build verification

Config: `.github/workflows/ci.yml`

## Planned Features

- [ ] Item image picker with internal copy
- [ ] Wardrobe screen (group items by wardrobe)
- [ ] Loan tracking UI
- [ ] Optional backend sync
- [ ] Export / backup
