#!/usr/bin/env bash
set -euo pipefail

flutter pub get
flutter create . --platforms android,ios,linux,macos,windows,web

case "$(uname -s)" in
  Linux)
    flutter build apk --release
    flutter build appbundle --release
    flutter build linux --release
    flutter build web --release
    ;;
  Darwin)
    flutter build ios --no-codesign
    flutter build macos --release
    ;;
  MINGW*|MSYS*|CYGWIN*)
    flutter build windows --release
    ;;
  *)
    echo "Unknown platform: $(uname -s)" >&2
    ;;
esac
