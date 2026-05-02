# Closet App

A personal wardrobe manager with a **local-first, hybrid architecture**: everything works offline on the device, with an optional backend for sync, backup, and export.

## Project Structure

```
closet-app/
├── mobile/     # Flutter app (local-first, SQLite via Drift)
└── backend/    # Spring Boot REST API (optional sync layer)
```

## Architecture Overview

```
Flutter App
 ├── SQLite (Drift)     ← primary storage, always available
 ├── Local file system  ← images stored in app documents directory
 └── Spring Boot API    ← optional: sync · backup · export
```

### How it works

| Mode | Behaviour |
|------|-----------|
| **Default (offline)** | All data and images stored locally on the device |
| **Optional sync** | User can push data to the backend when connected |
| **Export / Backup** | User-triggered: export to file or upload to server |

### Image handling

Images are **copied into the app's own document directory** when added, so they are never lost if the user deletes the original from their gallery. The SQLite record stores the internal path; on sync, the file is uploaded to the backend.

## Modules

| Module | Tech | README |
|--------|------|--------|
| `mobile/` | Flutter · Dart · Drift (SQLite) | [mobile/README.md](mobile/README.md) |
| `backend/` | Java 23 · Spring Boot 3 · PostgreSQL | [backend/README.md](backend/README.md) |

## Getting Started

See the individual READMEs for setup instructions for each module. The Flutter app runs fully standalone — the backend is not required to use the app.
