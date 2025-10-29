# Architecture Overview

NetGuard follows a feature-first architecture layered into **core**, **data**, **analytics**, and **presentation** modules. Riverpod providers mediate dependencies and expose streams/state to the UI layer.

Key decisions:
- **Fat Client**: All monitoring and analytics run locally. Platform channels will bridge to native packet-capture code when implemented.
- **Riverpod**: Provides robust dependency injection, state management, and testability.
- **SQLite + Secure Storage**: Ensures offline-first persistence with encryption support.
- **CI/CD via GitHub Actions**: Multi-platform builds, security scanning, release automation, and container publishing keep the SDLC auditable.

Refer to [`storyboard.md`](storyboard.md) for the agile backlog traceability.
