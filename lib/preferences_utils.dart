import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class InitializePreferences {
  static Future<Map<String, Object?>> initialize() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    List<String> selectedFilePaths = await getSelectedFilePaths(preferences);
    List<File> loadedPdfFiles = [];
    List<String> loadedPdfFileNames = [];

    for (String filePath in selectedFilePaths) {
      File pdfFile = File(filePath);
      loadedPdfFiles.add(pdfFile);
      loadedPdfFileNames.add(path.basename(pdfFile.path));
    }

    return {
      'pdfFiles': loadedPdfFiles,
      'pdfFileNames': loadedPdfFileNames,
      'currentPdfFile': loadedPdfFiles.isNotEmpty ? loadedPdfFiles.first : null,
    };
  }

  static Future<List<String>> getSelectedFilePaths(
      SharedPreferences preferences) async {
    return preferences.getStringList('selectedFilePaths') ?? [];
  }
}
