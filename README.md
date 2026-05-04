# Closet App

A personal wardrobe management app built with Flutter (frontend) and Spring Boot (optional backend).

## 🧠 Philosophy

This project follows a **local-first architecture**:

- Works completely offline
- Stores data locally (SQLite + file system)
- Optional cloud sync

## 🚀 Features

- Add clothing items with images
- Organize wardrobe
- Filter items
- Track loans
- Export/import backups

## 🧱 Tech Stack

- Flutter / Dart
- Firebase Auth (email/password + Google Sign-In)
- SQLite (Drift) – local-first storage
- Spring Boot – REST backend
- PostgreSQL – backend database
- Gemini API – AI clothing analysis
- Docker / Docker Compose

## 📦 Project Structure

```
closet-app/
├── mobile/    # Flutter app
└── backend/   # Spring Boot API
```

## 🛠️ Development Roadmap

1. ✅ MVP (local storage + item creation)
2. ✅ AI clothing analysis (Gemini)
3. ✅ Firebase authentication + email verification + backend user sync
4. ✅ Platform-adaptive UI (Material + Cupertino) with glass morphism design
5. Load wardrobe items from backend
6. Filters, search & loan tracking
7. Backup / export

## 🔐 Privacy

User data is stored locally first and only sent to the backend when authenticated.

## 📌 Status

🚧 In active development
