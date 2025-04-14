import 'package:flutter/material.dart';
import 'package:success_assistant/core/locator.dart';
import 'package:success_assistant/services/file_service.dart';

class FileServiceTestScreen extends StatefulWidget {
  const FileServiceTestScreen({Key? key}) : super(key: key);

  @override
  State<FileServiceTestScreen> createState() => _FileServiceTestScreenState();
}

class _FileServiceTestScreenState extends State<FileServiceTestScreen> {
  final TextEditingController _controller = TextEditingController();
  final String _fileName = 'test_file.txt';
  String _output = '';

  final FileService _fileService = locator<FileService>();

  void _saveToFile() async {
    await _fileService.writeToFile(_fileName, _controller.text);
    setState(() {
      _output = 'Saved to file.';
    });
  }

  void _readFromFile() async {
    final content = await _fileService.readFromFile(_fileName);
    setState(() {
      _output = content ?? 'File not found.';
    });
  }

  void _deleteFile() async {
    await _fileService.deleteFile(_fileName);
    setState(() {
      _output = 'File deleted.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FileService Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter text to save'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveToFile, child: const Text('Save')),
            ElevatedButton(onPressed: _readFromFile, child: const Text('Read')),
            ElevatedButton(onPressed: _deleteFile, child: const Text('Delete')),
            const SizedBox(height: 20),
            Text('Output:'),
            Text(_output, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}