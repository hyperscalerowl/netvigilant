import 'package:collection/collection.dart';

import '../data/models/network_event.dart';

/// Aggregates raw network events into digestible insights for the UI.
class AnalyticsEngine {
  const AnalyticsEngine();

  Map<String, int> topApplications(Iterable<NetworkEvent> events, {int take = 5}) {
    final Map<String, int> grouped = <String, int>{};
    for (final NetworkEvent event in events) {
      grouped.update(event.appName, (int value) => value + event.bytesTransferred,
          ifAbsent: () => event.bytesTransferred);
    }
    final List<MapEntry<String, int>> sorted = grouped.entries.toList()
      ..sort((MapEntry<String, int> a, MapEntry<String, int> b) => b.value.compareTo(a.value));
    return Map<String, int>.fromEntries(sorted.take(take));
  }

  int totalDataTransferred(Iterable<NetworkEvent> events) =>
      events.map((NetworkEvent event) => event.bytesTransferred).sum;
}
