import 'package:get_it/get_it.dart';
import '../services/shared_preferences_service.dart';
import '../services/file_service.dart';
import '../services/uuid_service.dart';
import '../services/hive_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<SharedPreferencesService>(() => SharedPreferencesService());
  locator.registerLazySingleton<FileService>(() => FileService());
  locator.registerLazySingleton<UuidService>(() => UuidService());

  final hiveService = HiveService();
  await hiveService.init();
  locator.registerSingleton<HiveService>(hiveService);
}