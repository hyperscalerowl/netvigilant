import 'package:equatable/equatable.dart';

/// Represents a single network activity entry captured by the monitor engine.
class NetworkEvent extends Equatable {
  const NetworkEvent({
    required this.appName,
    required this.timestamp,
    required this.direction,
    required this.bytesTransferred,
    required this.remoteAddress,
    required this.protocol,
  });

  final String appName;
  final DateTime timestamp;
  final TrafficDirection direction;
  final int bytesTransferred;
  final String remoteAddress;
  final String protocol;

  @override
  List<Object?> get props => <Object?>[
        appName,
        timestamp,
        direction,
        bytesTransferred,
        remoteAddress,
        protocol,
      ];
}

/// Direction of the observed traffic.
enum TrafficDirection { incoming, outgoing }
