import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive box
  sl.registerSingletonAsync<Box>(() async {
    return await Hive.openBox('appBox');
  });

  // You can add other services like API clients here in the future
}