import '../data/models/network_event.dart';

/// Aggregates raw network events into digestible insights for the UI.
class AnalyticsEngine {
  const AnalyticsEngine();

  Map<String, int> topApplications(Iterable<NetworkEvent> events, {int take = 5}) {
    if (take <= 0) {
      return <String, int>{};
    }

    final Map<String, int> grouped = <String, int>{};
    final Map<String, String> displayNames = <String, String>{};

    for (final NetworkEvent event in events) {
      if (event.bytesTransferred <= 0) {
        continue;
      }

      final String trimmedName = event.appName.trim();
      if (trimmedName.isEmpty) {
        continue;
      }

      final String normalizedKey = trimmedName.toLowerCase();
      displayNames.putIfAbsent(normalizedKey, () => trimmedName);

      grouped.update(normalizedKey, (int value) => value + event.bytesTransferred,
          ifAbsent: () => event.bytesTransferred);
    }

    final List<MapEntry<String, int>> sorted = grouped.entries.toList()
      ..sort((MapEntry<String, int> a, MapEntry<String, int> b) {
        final int valueComparison = b.value.compareTo(a.value);
        if (valueComparison != 0) {
          return valueComparison;
        }

        final String aName = displayNames[a.key]!;
        final String bName = displayNames[b.key]!;
        return aName.toLowerCase().compareTo(bName.toLowerCase());
      });

    final Iterable<MapEntry<String, int>> limited = sorted.take(take);

    return Map<String, int>.fromEntries(limited.map(
      (MapEntry<String, int> entry) => MapEntry<String, int>(
        displayNames[entry.key]!,
        entry.value,
      ),
    ));
  }

  int totalDataTransferred(Iterable<NetworkEvent> events) => events.fold<int>(
        0,
        (int total, NetworkEvent event) => event.bytesTransferred > 0
            ? total + event.bytesTransferred
            : total,
      );
}
