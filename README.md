# NetGuard – Network Monitoring & Data Transparency App

![NetGuard Banner](docs/images/logo.png)

[![CI](https://github.com/your-org/netvigilant/actions/workflows/ci.yml/badge.svg)](https://github.com/your-org/netvigilant/actions/workflows/ci.yml)
[![Security](https://github.com/your-org/netvigilant/actions/workflows/security.yml/badge.svg)](https://github.com/your-org/netvigilant/actions/workflows/security.yml)
[![Container](https://github.com/your-org/netvigilant/actions/workflows/container.yml/badge.svg)](https://github.com/your-org/netvigilant/actions/workflows/container.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> Empower yourself with complete transparency and control over your device's network activity.

---

## 📖 Overview

**NetGuard** is a fully client-side Flutter application for iOS and Android that captures, analyses, and visualises device network activity in real time. It brings enterprise-grade observability and security insights to privacy-conscious mobile users without relying on a remote backend.

### Why NetGuard?
- **Transparency** – See which apps are sending or receiving data, including protocols and remote endpoints.
- **Privacy** – All processing happens on-device; no third-party servers.
- **Security** – Flag suspicious patterns, unknown IP addresses, or insecure protocols.
- **Control** – Export, import, or report on your network history at any time.

---

## ✨ Feature Highlights

### Core Network Monitoring
- Real-time packet capture via platform APIs (Network Extension / VpnService)
- App-level attribution with timestamps and traffic direction
- Data volume aggregation and protocol detection

### Dashboards & Visualisations
- Real-time monitoring widgets with trend indicators
- Data usage charts (line, bar, pie, heatmap, topology)
- Security alerts, quick stats, and top app usage summaries

### Data Management
- Local SQLite persistence with encryption support
- Flexible filtering, search, grouping, and pagination
- Export/import to CSV, JSON, and PDF with share integrations

### Security & Analytics
- Usage analytics engine with forecasts and comparisons
- Suspicious activity detection and alerting
- Configurable retention, privacy, and notification settings

### Support & Guidance
- Guided onboarding and permission education
- In-app support centre with chatbot, FAQs, and documentation
- Contextual help surfaced throughout the experience

---

## 🧱 Architecture

- **Framework**: Flutter 3.24+, Dart 3.3+
- **State Management**: Riverpod
- **Storage**: SQLite (`sqflite`) + secure keychain storage
- **Visualisations**: `fl_chart`, `pdf`, `printing`
- **CI/CD**: GitHub Actions with build matrix, security scans, releases, and container publishing

```
lib/
├── analytics/                 # Insight & aggregation engines
├── core/                      # Theme, constants, utilities
├── data/                      # Models, repositories, services
├── features/                  # Feature-first presentation & domain logic
├── widgets/                   # Shared UI components
└── main.dart                  # Entry point
```

Additional documentation lives in [`docs/`](docs/) and covers architecture decisions, API references, and the user guide.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.24.0+
- Dart 3.3+
- Xcode 15+ (iOS) / Android Studio or command-line tools (Android)

### Bootstrap the project
```bash
# Install dependencies
dart pub global activate melos # optional helper
git clone https://github.com/your-org/netvigilant.git
cd netvigilant
flutter pub get

# Optionally (re)generate platform folders
flutter create . --platforms android,ios,macos,linux,windows,web
```

### Useful commands
```bash
flutter run                           # Launch debug build
flutter test                          # Execute unit & widget tests
flutter test --coverage               # Generate coverage report
flutter pub run dart_code_metrics:metrics analyze lib
./scripts/build.sh                    # Build distributables for all platforms
./scripts/test.sh                     # Lint, metrics, and test bundle
```

Docker-based workflows are also available:
```bash
docker compose run --rm app flutter test
docker compose run --rm app ./scripts/build.sh
```

---

## 🧪 Testing Strategy
- **Unit tests** for analytics, services, and utilities (target ≥80% coverage)
- **Widget tests** for major screens and shared components
- **Integration tests** for onboarding → dashboard → history journeys
- **Performance checks** leveraging Flutter profile tooling

CI enforces:
1. Formatting & linting via `flutter analyze` and `dart_code_metrics`
2. Unit/widget tests with coverage upload
3. Static application security testing (SAST) and software composition analysis (SCA)
4. Multi-platform build verification (Android, iOS, macOS, Windows, Linux, Web)

---

## 🔐 Security & Privacy
- Pure client-side architecture – no outbound telemetry
- Encrypted persistence using `flutter_secure_storage`
- Permission guidance and rationale for all sensitive capabilities
- Automated static & dependency scanning (Code Metrics + Trivy)
- Coordinated disclosure outlined in [SECURITY.md](SECURITY.md)

---

## 🛠️ DevOps & Automation

| Workflow | Purpose |
| --- | --- |
| [`ci.yml`](.github/workflows/ci.yml) | Linting, testing, coverage, and multi-platform builds |
| [`security.yml`](.github/workflows/security.yml) | SAST (`dart_code_metrics`) and SCA (Trivy filesystem scan) |
| [`container.yml`](.github/workflows/container.yml) | Builds and publishes development container images to GHCR |
| [`release.yml`](.github/workflows/release.yml) | Tag-driven release builds, changelog extraction, artifacts, GH release |
| [`renovate.json`](renovate.json) | Automated dependency update bot configuration |

Each pipeline is designed to support an end-to-end SDLC: plan → code → build → test → secure → release.

---

## 🤝 Contributing
We welcome contributions from privacy and security enthusiasts.

1. Fork and create a branch using Conventional Commit prefixes (e.g. `feat/`, `fix/`)
2. Run `./scripts/test.sh`
3. Submit a PR referencing relevant issues/epics

See [CONTRIBUTING.md](CONTRIBUTING.md), [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md), and [SECURITY.md](SECURITY.md) for details.

---

## 🗺️ Roadmap Snapshot
- Sprint 0: Foundation & DevOps setup ✅
- Sprint 1: Core monitoring services 🚧
- Sprint 2: Data persistence & history 📅
- Sprint 3: Dashboards & visualisations 🎨
- Sprint 4: Analytics & security 🔍
- Sprint 5: Support, export/import 📨
- Sprint 6: Polish, performance, release 🚀

Detailed agile storyboard is available in [`docs/architecture/storyboard.md`](docs/architecture/storyboard.md).

---

## 📝 License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

---

## 📬 Support
- Issues: [GitHub Issues](https://github.com/your-org/netvigilant/issues)
- Email: support@netguard.app
- Community: Discord invite coming soon

> Made with ❤️ for privacy-conscious users everywhere.
