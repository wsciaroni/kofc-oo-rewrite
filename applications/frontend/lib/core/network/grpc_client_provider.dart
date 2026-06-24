import 'package:grpc/grpc.dart';
import '../../src/generated/membership.pbgrpc.dart';
import '../../src/generated/finance.pbgrpc.dart';
import '../../src/generated/activity.pbgrpc.dart';

class GrpcClientProvider {
  static final GrpcClientProvider _instance = GrpcClientProvider._internal();

  factory GrpcClientProvider() => _instance;

  late ClientChannel _channel;
  late MembershipServiceClient membershipClient;
  late FinanceServiceClient financeClient;
  late ActivityServiceClient activityClient;

  GrpcClientProvider._internal() {
    // Connect to local backend.
    // Port 5000 is used for HTTP/2 insecure, and 5001/5081 for HTTPS.
    // We configure the channel to point to 127.0.0.1:5000.
    _channel = ClientChannel(
      '127.0.0.1',
      port: 5000,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        idleTimeout: Duration(minutes: 1),
      ),
    );

    membershipClient = MembershipServiceClient(_channel);
    financeClient = FinanceServiceClient(_channel);
    activityClient = ActivityServiceClient(_channel);
  }

  void configure({required String host, required int port, bool secure = false}) {
    _channel.shutdown();
    _channel = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials: secure ? const ChannelCredentials.secure() : const ChannelCredentials.insecure(),
        idleTimeout: const Duration(minutes: 1),
      ),
    );
    membershipClient = MembershipServiceClient(_channel);
    financeClient = FinanceServiceClient(_channel);
    activityClient = ActivityServiceClient(_channel);
  }
}
