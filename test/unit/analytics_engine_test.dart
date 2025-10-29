import 'package:flutter_test/flutter_test.dart';
import 'package:netguard/analytics/analytics_engine.dart';
import 'package:netguard/data/models/network_event.dart';

void main() {
  group('AnalyticsEngine', () {
    const AnalyticsEngine engine = AnalyticsEngine();

    final List<NetworkEvent> sampleEvents = <NetworkEvent>[
      NetworkEvent(
        appName: 'Browser',
        timestamp: DateTime.utc(2024, 1, 1, 12),
        direction: TrafficDirection.outgoing,
        bytesTransferred: 100,
        remoteAddress: '8.8.8.8',
        protocol: 'HTTPS',
      ),
      NetworkEvent(
        appName: 'Browser',
        timestamp: DateTime.utc(2024, 1, 1, 12, 1),
        direction: TrafficDirection.incoming,
        bytesTransferred: 200,
        remoteAddress: '8.8.8.8',
        protocol: 'HTTPS',
      ),
      NetworkEvent(
        appName: 'Messenger',
        timestamp: DateTime.utc(2024, 1, 1, 13),
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

    test('normalises application names and ignores invalid events', () {
      final List<NetworkEvent> events = <NetworkEvent>[
        const NetworkEvent(
          appName: '  Browser  ',
          timestamp: DateTime.utc(2024, 1, 1, 12),
          direction: TrafficDirection.outgoing,
          bytesTransferred: 100,
          remoteAddress: '8.8.8.8',
          protocol: 'HTTPS',
        ),
        const NetworkEvent(
          appName: 'browser',
          timestamp: DateTime.utc(2024, 1, 1, 13),
          direction: TrafficDirection.incoming,
          bytesTransferred: 200,
          remoteAddress: '8.8.4.4',
          protocol: 'HTTPS',
        ),
        const NetworkEvent(
          appName: 'Browser',
          timestamp: DateTime.utc(2024, 1, 1, 14),
          direction: TrafficDirection.incoming,
          bytesTransferred: -50,
          remoteAddress: '1.1.1.1',
          protocol: 'HTTPS',
        ),
        const NetworkEvent(
          appName: 'Messenger',
          timestamp: DateTime.utc(2024, 1, 1, 15),
          direction: TrafficDirection.outgoing,
          bytesTransferred: 150,
          remoteAddress: '1.1.1.1',
          protocol: 'HTTPS',
        ),
      ];

      final Map<String, int> result = engine.topApplications(events, take: 5);

      expect(result.length, 2);
      expect(result['Browser'], 300);
      expect(result['Messenger'], 150);
    });

    test('returns applications deterministically when usage matches', () {
      final List<NetworkEvent> events = <NetworkEvent>[
        const NetworkEvent(
          appName: 'Email',
          timestamp: DateTime.utc(2024, 1, 1, 10),
          direction: TrafficDirection.outgoing,
          bytesTransferred: 100,
          remoteAddress: '9.9.9.9',
          protocol: 'HTTPS',
        ),
        const NetworkEvent(
          appName: 'Browser',
          timestamp: DateTime.utc(2024, 1, 1, 11),
          direction: TrafficDirection.outgoing,
          bytesTransferred: 100,
          remoteAddress: '8.8.8.8',
          protocol: 'HTTPS',
        ),
      ];

      final Map<String, int> result = engine.topApplications(events, take: 5);

      expect(result.keys.first, 'Browser');
      expect(result.keys.last, 'Email');
    });

    test('handles non-positive take values gracefully', () {
      expect(engine.topApplications(sampleEvents, take: 0), isEmpty);
      expect(engine.topApplications(sampleEvents, take: -5), isEmpty);
    });

    test('ignores negative transfers in totals', () {
      final List<NetworkEvent> events = <NetworkEvent>[
        ...sampleEvents,
        const NetworkEvent(
          appName: 'Browser',
          timestamp: DateTime.utc(2024, 1, 1, 14),
          direction: TrafficDirection.incoming,
          bytesTransferred: -20,
          remoteAddress: '8.8.8.8',
          protocol: 'HTTPS',
        ),
      ];

      expect(engine.totalDataTransferred(events), 350);
    });
  });
}
