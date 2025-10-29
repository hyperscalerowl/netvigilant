import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/network_event.dart';
import '../../../data/services/network_monitor_service.dart';

final Provider<NetworkMonitorService> networkMonitorServiceProvider =
    Provider<NetworkMonitorService>((Ref ref) {
  final NetworkMonitorService service = NetworkMonitorService();
  ref.onDispose(() {
    unawaited(service.stopMonitoring());
  });
  return service;
});

final StreamProvider<NetworkEvent> liveNetworkEventsProvider =
    StreamProvider<NetworkEvent>((Ref ref) {
  final NetworkMonitorService service = ref.watch(networkMonitorServiceProvider);
  return service.events;
});
