import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/network_event.dart';
import '../../../data/services/network_monitor_service.dart';

final Provider<NetworkMonitorService> networkMonitorServiceProvider =
    Provider<NetworkMonitorService>((ProviderRef<NetworkMonitorService> ref) {
  final NetworkMonitorService service = NetworkMonitorService();
  ref.onDispose(() {
    unawaited(service.stopMonitoring());
  });
  return service;
});

final StreamProvider<NetworkEvent> liveNetworkEventsProvider =
    StreamProvider<NetworkEvent>((StreamProviderRef<NetworkEvent> ref) {
  final NetworkMonitorService service = ref.watch(networkMonitorServiceProvider);
  return service.events;
});
