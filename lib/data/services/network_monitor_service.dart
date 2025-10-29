import 'dart:async';

import '../models/network_event.dart';

/// Exposes a simplified API for monitoring device level network activity.
class NetworkMonitorService {
  NetworkMonitorService();

  final StreamController<NetworkEvent> _controller =
      StreamController<NetworkEvent>.broadcast();

  /// Public stream of network events used by UI widgets and analytics.
  Stream<NetworkEvent> get events => _controller.stream;

  /// Simulates network monitoring. Real implementation would leverage
  /// platform specific APIs using MethodChannels.
  Future<void> startMonitoring() async {
    // TODO: Integrate with platform specific network capture APIs.
  }

  Future<void> stopMonitoring() async {
    await _controller.close();
  }
}
