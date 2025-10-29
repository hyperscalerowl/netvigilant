import 'package:flutter_test/flutter_test.dart';
import 'package:netguard/analytics/analytics_engine.dart';
import 'package:netguard/data/models/network_event.dart';

void main() {
  group('AnalyticsEngine', () {
    const AnalyticsEngine engine = AnalyticsEngine();

    final List<NetworkEvent> sampleEvents = <NetworkEvent>[
      NetworkEvent(
        appName: 'Browser',
        timestamp: DateTime(2024, 01, 01, 12),
        direction: TrafficDirection.outgoing,
        bytesTransferred: 100,
        remoteAddress: '8.8.8.8',
        protocol: 'HTTPS',
      ),
      NetworkEvent(
        appName: 'Browser',
        timestamp: DateTime(2024, 01, 01, 12, 01),
        direction: TrafficDirection.incoming,
        bytesTransferred: 200,
        remoteAddress: '8.8.8.8',
        protocol: 'HTTPS',
      ),
      NetworkEvent(
        appName: 'Messenger',
        timestamp: DateTime(2024, 01, 01, 13),
        direction: TrafficDirection.outgoing,
        bytesTransferred: 50,
        remoteAddress: '1.1.1.1',
        protocol: 'HTTPS',
      ),
    ];

    test('calculates top applications', () {
      final Map<String, int> result = engine.topApplications(sampleEvents, take: 1);

      expect(result.length, 1);
      expect(result.keys.first, 'Browser');
      expect(result.values.first, 300);
    });

    test('calculates total data transferred', () {
      expect(engine.totalDataTransferred(sampleEvents), 350);
    });
  });
}
