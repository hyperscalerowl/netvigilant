#!/usr/bin/env bash
set -euo pipefail

flutter pub get
flutter test --coverage
flutter pub run dart_code_metrics:metrics analyze lib
