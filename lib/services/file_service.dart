import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileService {
  // Get the path to the app's documents directory
  Future<String> get _documentsPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Write string content to a file
  Future<void> writeToFile(String fileName, String content) async {
    final path = await _documentsPath;
    final file = File('\$path/\$fileName');
    await file.writeAsString(content);
  }

  // Read string content from a file
  Future<String?> readFromFile(String fileName) async {
    try {
      final path = await _documentsPath;
      final file = File('\$path/\$fileName');
      if (await file.exists()) {
        return await file.readAsString();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Delete a file
  Future<void> deleteFile(String fileName) async {
    final path = await _documentsPath;
    final file = File('\$path/\$fileName');
    if (await file.exists()) {
      await file.delete();
    }
  }
}