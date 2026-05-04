# Closet App – Mobile

Flutter app for managing your personal wardrobe. Works offline-first with optional sync to the Spring Boot backend.

## Architecture

```
Flutter App
 ├── Firebase Auth      ← authentication (email/password + Google)
 ├── SQLite (Drift)     ← all structured data, local-first
 ├── Local filesystem   ← images stored in app documents directory
 └── ApiClient (HTTP)   ← authenticated requests to Spring Boot backend
```

The app works fully offline. Backend sync is used for persistent storage and multi-device support.

### Auth flow

1. User logs in via Firebase Auth (email/password or Google)
2. `AuthWrapper` listens to `authStateChanges()` and navigates to home or login accordingly
3. `ApiClient` fetches the Firebase ID token on every request and sends it as `Authorization: Bearer <token>`
4. The backend validates the token and creates the user record on first request (lazy, via `findOrCreate`)
5. On logout, `FirebaseAuth.signOut()` triggers `AuthWrapper` to redirect back to login

### Image strategy

When the user picks or takes a photo, the image is stored in the app's documents directory (`closet/items/`). The SQLite record stores the internal path, so images survive gallery deletions and travel with the app backup.

## Tech Stack

- **Flutter** / Dart
- **Firebase Auth** – authentication (email/password + Google Sign-In)
- **Drift** – type-safe SQLite wrapper
- **http** – HTTP client for backend API calls
- **image_picker** – camera and gallery access
- **google_generative_ai** – official Gemini SDK for AI clothing analysis from photos
- **drift_db_viewer** – in-app SQLite browser (debug builds only)
- **GitHub Actions** – CI (analyze, test, Android build)

## Project Structure

```
lib/
 ├── main.dart
 ├── app.dart
 ├── config/          # secrets (API keys, gitignored)
 ├── models/          # data models (ItemModel, LoanModel)
 ├── screens/         # page-level widgets
 │    ├── auth_wrapper.dart
 │    ├── login_screen.dart
 │    ├── register_screen.dart
 │    ├── home_screen.dart
 │    └── add_item_screen.dart
 ├── services/        # database, API client, AI service
 │    ├── api_client.dart       ← authenticated HTTP client
 │    ├── gemini_service.dart   ← Gemini AI clothing analysis
 │    └── closet_database.dart  ← Drift SQLite database
 └── utils/           # theme, colours, API constants
```

## Getting Started

### Prerequisites

- Flutter SDK (latest stable)
- A `lib/config/secrets.dart` file with your Gemini API key (copy from `secrets.template.dart`)
- `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) from Firebase console

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

## Current Features

- [x] Firebase authentication (email/password + Google Sign-In + password reset)
- [x] Add clothing items with photo (camera or gallery)
- [x] AI auto-fill from photo via Gemini (`gemini-3.1-flash-lite-preview`, official SDK)
- [x] Local SQLite storage (Drift)
- [x] Authenticated HTTP client (`ApiClient`) ready for backend sync
- [x] In-app SQLite browser (`drift_db_viewer`, debug builds only — tap the database icon in the AppBar)

## Planned

- [ ] Load items from backend
- [ ] Wardrobe screen (group items)
- [ ] Loan tracking UI
- [ ] Export / backup