import 'package:uuid/uuid.dart';

class UuidService {
  final Uuid _uuid = const Uuid();

  /// Generate a version 4 (random) UUID
  String generateV4() {
    return _uuid.v4();
  }

  /// Generate a version 1 (timestamp + MAC address) UUID
  String generateV1() {
    return _uuid.v1();
  }
}